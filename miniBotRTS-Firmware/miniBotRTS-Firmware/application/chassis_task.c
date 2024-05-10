#include "chassis_task.h"

// cmd_twist_msg
extern struct twist_msg cmd_twist;
extern struct odom_msg robot_odom;

// source: init.c
struct chassis chassis;
// source: infantry_cmd_task
struct chassis_info cmd_chassis_info;

int32_t toggle_led_red(void *argc) {
  HAL_GPIO_TogglePin(LED_RED_GPIO_Port, LED_RED_Pin);
  return 0;
}

// soft timer callback
// source: board.c
int32_t motor_can1_output_1ms(void *argc) {
  motor_device_can_output(DEVICE_CAN1); // from motor.c
  return 0;
}

/// sends the can message
int32_t motor_canstd_send(enum device_can can, struct can_msg msg) {
  can_msg_bytes_send(&hcan1, msg.data, 8, msg.id);
  return 0;
}

/// receives the can message
int32_t can1_motor_msg_rec(CAN_RxHeaderTypeDef *header, uint8_t *data) {
  motor_device_data_update(DEVICE_CAN1, header->StdId, data); // from motor.c
  return 0;
}

void chassis_task_init(void) {
  // Enable the motors
  HAL_GPIO_WritePin(POWER1_CTRL_GPIO_Port, POWER1_CTRL_Pin, SET);
  HAL_GPIO_WritePin(POWER2_CTRL_GPIO_Port, POWER2_CTRL_Pin, SET);
  HAL_GPIO_WritePin(POWER3_CTRL_GPIO_Port, POWER3_CTRL_Pin, SET);
  HAL_GPIO_WritePin(POWER4_CTRL_GPIO_Port, POWER4_CTRL_Pin, SET);

  // board.c -> board_config()
  soft_timer_init();
  can_manage_init();
  soft_timer_register(motor_can1_output_1ms, NULL, 1);
  soft_timer_register(toggle_led_red, NULL, 1000);

  motor_device_can_send_register(motor_canstd_send); // from motor.c
  can_fifo0_rx_callback_register(&can1_manage,
                                 can1_motor_msg_rec); // from drv_can.c

  // init.c
  chassis_pid_register(&chassis, "chassis", DEVICE_CAN1);
  chassis_disable(&chassis);
}

// source: chassis_task
void chassis_task(void const *argument) {
  chassis_task_init();
  uint32_t period = osKernelSysTick();
  chassis_t pchassis = NULL;
  pchassis = chassis_find("chassis");

  chassis_enable(pchassis);

  for (;;) {
    float linear_x = cmd_twist.linear.x * 1000.0f;
    float angular_z = cmd_twist.angular.z * 1000.0f;

    chassis_set_speed(pchassis, linear_x, angular_z);

    chassis_execute(pchassis);
    robot_odom.point.x = pchassis->skid_steer.position.position_x_mm / 1000.0f;
    robot_odom.point.y = pchassis->skid_steer.position.position_y_mm / 1000.0f;

    float yaw = pchassis->skid_steer.position.angle_deg / RADIAN_COEF;
    float pitch = 0.0;
    float roll = 0.0;
    float cy = cos(yaw * 0.5);
    float sy = sin(yaw * 0.5);
    float cp = cos(pitch * 0.5);
    float sp = sin(pitch * 0.5);
    float cr = cos(roll * 0.5);
    float sr = sin(roll * 0.5);
    float qx = sr * cp * cy - cr * sp * sy;
    float qy = cr * sp * cy + sr * cp * sy;
    float qz = cr * cp * sy - sr * sp * cy;
    float qw = cr * cp * cy + sr * sp * sy;
    robot_odom.quaternion.x = qx;
    robot_odom.quaternion.y = qy;
    robot_odom.quaternion.z = qz;
    robot_odom.quaternion.w = qw;

    robot_odom.linear.x = pchassis->skid_steer.position.v_x_mm / 1000.0f;
    robot_odom.angular.z = pchassis->skid_steer.position.rate_deg / RADIAN_COEF;

    osDelayUntil(&period, 1);
  }
}
