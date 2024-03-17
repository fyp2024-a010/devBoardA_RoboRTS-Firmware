#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "skid_steer.h"

#ifndef RADIAN_COEF
  #define RADIAN_COEF 57.3f
#endif

#define MEC_VAL_LIMIT(val, min, max) \
  do                                 \
  {                                  \
    if ((val) <= (min))              \
    {                                \
      (val) = (min);                 \
    }                                \
    else if ((val) >= (max))         \
    {                                \
      (val) = (max);                 \
    }                                \
  } while (0)

/**
  * @brief skid steer glb_chassis velocity decomposition.F:forword; B:backword; L:left; R:right
  * @param input : ccx=+vx(mm/s)  ccw=+vw(deg/s)
  * @param output: every wheel speed(rpm)
  * @note  1=FR 2=FL 3=BL 4=BR
  */
void skid_steer_calculate(struct skid_steer *ss)
{

  MEC_VAL_LIMIT(ss->speed.vx, -MAX_CHASSIS_VX_SPEED, MAX_CHASSIS_VX_SPEED); //mm/s
  MEC_VAL_LIMIT(ss->speed.vw, -MAX_CHASSIS_VW_SPEED, MAX_CHASSIS_VW_SPEED); //deg/s

  float wheel_rpm[4];
  float max = 0;

  // RIGHT
  wheel_rpm[0] = (ss->speed.vx + ss->speed.vw * WHEELTRACK) / RADIUS / M_PI * 60;
  wheel_rpm[3] = wheel_rpm[0];
  // LEFT
  wheel_rpm[1] = (ss->speed.vx - ss->speed.vw * WHEELTRACK) / RADIUS / M_PI * 60;
  wheel_rpm[2] = wheel_rpm[1];
  
  //find max item
  for (uint8_t i = 0; i < 4; i++)
  {
    if (fabs(wheel_rpm[i]) > max)
      max = fabs(wheel_rpm[i]);
  }

  // equal proportion
  if (max > MAX_WHEEL_RPM)
  {
    float rate = MAX_WHEEL_RPM / max;
    for (uint8_t i = 0; i < 4; i++)
      wheel_rpm[i] *= rate;
  }
  
  memcpy(ss->wheel_rpm, wheel_rpm, 4 * sizeof(float));
}

void skid_steer_position_measure(struct skid_steer *ss, struct skid_steer_motor_fdb wheel_fdb[])
{
  static float rpm_ratio;
  static float ecd_ratio;
  static double skid_steer_angle;
  static double last_d_x, last_d_y, last_d_w, d_x, d_y, d_w, diff_d_x, diff_d_y, diff_d_w;
  static double position_x, position_y, angle_w;
  static double v_x, v_y, v_w;

  rpm_ratio = ss->param.wheel_perimeter * MOTOR_DECELE_RATIO / (4 * 60.0f);
  ecd_ratio = ss->param.wheel_perimeter * MOTOR_DECELE_RATIO / (4 * MOTOR_ENCODER_ACCURACY);

  last_d_x = d_x;
  last_d_w = d_w;
  d_x = ecd_ratio * ((wheel_fdb[0].total_ecd + wheel_fdb[1].total_ecd + wheel_fdb[2].total_ecd + wheel_fdb[3].total_ecd)/4);
  d_w = ecd_ratio * ((wheel_fdb[0].total_ecd + wheel_fdb[3].total_ecd)/2 - (wheel_fdb[1].total_ecd + wheel_fdb[2].total_ecd)/2);

  diff_d_x = d_x - last_d_x;
  diff_d_y = d_y - last_d_y;
  diff_d_w = d_w - last_d_w;

  /* use glb_chassis gyro angle data */
  skid_steer_angle = ss->gyro.yaw_gyro_angle / RADIAN_COEF; // [degree]

  position_x += diff_d_x * cos(skid_steer_angle) - diff_d_y * sin(skid_steer_angle);
  position_y += diff_d_x * sin(skid_steer_angle) + diff_d_y * cos(skid_steer_angle);

  angle_w += diff_d_w;

  ss->position.position_x_mm = position_x;        //mm
  ss->position.position_y_mm = position_y;        //mm
  ss->position.angle_deg = angle_w * RADIAN_COEF; //degree

  v_x = rpm_ratio * (wheel_fdb[0].speed_rpm + wheel_fdb[1].speed_rpm + wheel_fdb[2].speed_rpm + wheel_fdb[3].speed_rpm)/4;
  v_w = rpm_ratio * ((wheel_fdb[0].speed_rpm + wheel_fdb[3].speed_rpm)/2 - (wheel_fdb[1].speed_rpm + wheel_fdb[2].speed_rpm)/2);

  ss->position.v_x_mm = v_x;                 //mm/s
  ss->position.rate_deg = v_w * RADIAN_COEF; //degree/s
}

/*
void skid_steer_state_model_update(struct skid_steer *ss){
  static float last_time;
  struct skid_steer predicted_pose; 
    predicted_pose.position.position_x_mm = ss->position.position_x_mm + ss->position.v_x_mm * dt * cos(ss->position.angle_deg);
    predicted_pose.position.position_y_mm = ss->position.position_y_mm + ss->position.v_x_mm * dt * sin(ss->position.angle_deg);
    predicted_pose.position.angle_deg = ss->position.angle_deg + ss->position.rate_deg * dt;
    predicted_pose.speed.vx = ss->speed.vx;
    predicted_pose.speed.vw = ss->speed.vw;
    return predicted_pose;
}

void skid_steer_mimu_update(struct skid_steer *ss){
  struct skid_steer estimated_pose;
  mahony_ahrs_update(struct ahrs_sensor *sensor, struct attitude *atti);
  mahony_ahrs_updateIMU(struct ahrs_sensor *sensor, struct attitude *atti);
  estimated_pose.position.angle_deg = magnetometer_yaw;
  return estimated_pose;
}
*/