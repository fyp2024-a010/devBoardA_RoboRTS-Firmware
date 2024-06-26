#include "chassis.h"

static int32_t motor_pid_input_convert(struct controller *ctrl, void *input);

int32_t chassis_pid_register(struct chassis *chassis, const char *name,
                             enum device_can can) {
  char motor_name[4][OBJECT_NAME_MAX_LEN] = {0};
  uint8_t name_len;

  int32_t err;

  if (chassis == NULL)
    return -RM_INVAL;
  if (chassis_find(name) != NULL)
    return -RM_EXISTED;

  object_init(&(chassis->parent), Object_Class_Chassis, name);

  name_len = strlen(name);

  if (name_len > OBJECT_NAME_MAX_LEN / 2) {
    name_len = OBJECT_NAME_MAX_LEN / 2;
  }

  for (int i = 0; i < 4; i++) {
    memcpy(&motor_name[i], name, name_len);
    chassis->motor[i].can_periph = can;
    chassis->motor[i].can_id = 0x201 + i;
    chassis->motor[i].init_offset_f = 1;

    chassis->ctrl[i].convert_feedback = motor_pid_input_convert;
    pid_struct_init(&chassis->motor_pid[i], 15000, 500, 6.5f, 0.1, 0);
  }

  chassis->skid_steer.param.wheel_perimeter = PERIMETER;
  chassis->skid_steer.param.wheeltrack = WHEELTRACK;
  chassis->skid_steer.param.wheelbase = WHEELBASE;

  memcpy(&motor_name[0][name_len], "_FR\0", 4);
  memcpy(&motor_name[1][name_len], "_FL\0", 4);
  memcpy(&motor_name[2][name_len], "_BL\0", 4);
  memcpy(&motor_name[3][name_len], "_BR\0", 4);

  for (int i = 0; i < 4; i++) {
    err = motor_device_register(&(chassis->motor[i]), motor_name[i], 0);
    if (err != RM_OK)
      goto end;
  }

  memcpy(&motor_name[0][name_len], "_CTLFR\0", 7);
  memcpy(&motor_name[1][name_len], "_CTLFL\0", 7);
  memcpy(&motor_name[2][name_len], "_CTLBL\0", 7);
  memcpy(&motor_name[3][name_len], "_CTLBR\0", 7);

  for (int i = 0; i < 4; i++) {
    err = pid_controller_register(&(chassis->ctrl[i]), motor_name[i],
                                  &(chassis->motor_pid[i]),
                                  &(chassis->motor_feedback[i]), 1);
    if (err != RM_OK)
      goto end;
  }

  return RM_OK;
end:
  object_detach(&(chassis->parent));

  return err;
}

int32_t chassis_execute(struct chassis *chassis) {
  float motor_out;
  struct motor_data *pdata;
  struct skid_steer_motor_fdb wheel_fdb[4];

  static uint8_t init_f = 0;
  static float last_time, period;

  if (chassis == NULL)
    return -RM_INVAL;

  period = get_time_ms_us() - last_time;

  if (!init_f) {
    period = 0;
    last_time = get_time_ms_us();
    init_f = 1;
  } else {
    last_time = get_time_ms_us();
  }

  skid_steer_calculate(&(chassis->skid_steer));

  for (int i = 0; i < 4; i++) {
    pdata = motor_device_get_data(&(chassis->motor[i]));

    wheel_fdb[i].total_ecd = pdata->total_ecd;
    wheel_fdb[i].speed_rpm = pdata->speed_rpm;

    controller_set_input(&chassis->ctrl[i], chassis->skid_steer.wheel_rpm[i]);
    controller_execute(&chassis->ctrl[i], (void *)pdata);
    controller_get_output(&chassis->ctrl[i], &motor_out);

    motor_device_set_current(&chassis->motor[i], (int16_t)motor_out);
  }

  skid_steer_position_measure(&(chassis->skid_steer), wheel_fdb);

  return RM_OK;
}

int32_t chassis_set_speed(struct chassis *chassis, float vx, float vw) {
  if (chassis == NULL)
    return -RM_INVAL;
  chassis->skid_steer.speed.vx = vx;
  chassis->skid_steer.speed.vw = vw;
  return RM_OK;
}

int32_t chassis_get_info(struct chassis *chassis, struct chassis_info *info) {
  if (chassis == NULL)
    return NULL;

  memcpy(info, &(chassis->skid_steer.position),
         sizeof(struct skid_steer_position));
  ANGLE_LIMIT_360(info->angle_deg, chassis->skid_steer.position.angle_deg);
  ANGLE_LIMIT_360_TO_180(info->angle_deg);

  for (int i = 0; i < 4; i++) {
    info->wheel_rpm[i] = chassis->skid_steer.wheel_rpm[i] * MOTOR_DECELE_RATIO;
  }

  return RM_OK;
}

chassis_t chassis_find(const char *name) {
  struct object *object;

  object = object_find(name, Object_Class_Chassis);

  return (chassis_t)object;
}

int32_t chassis_enable(struct chassis *chassis) {
  if (chassis == NULL)
    return -RM_INVAL;

  for (int i = 0; i < 4; i++) {
    controller_enable(&(chassis->ctrl[i]));
  }

  return RM_OK;
}

int32_t chassis_disable(struct chassis *chassis) {
  if (chassis == NULL)
    return -RM_INVAL;

  for (int i = 0; i < 4; i++) {
    controller_disable(&(chassis->ctrl[i]));
  }

  return RM_OK;
}

static int32_t motor_pid_input_convert(struct controller *ctrl, void *input) {
  pid_feedback_t pid_fdb = (pid_feedback_t)(ctrl->feedback);
  motor_data_t data = (motor_data_t)input;
  pid_fdb->feedback = data->speed_rpm;

  return RM_OK;
}
