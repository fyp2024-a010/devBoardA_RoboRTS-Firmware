#include "skid_steer.h"

#ifndef RADIAN_COEF
#define RADIAN_COEF 57.3f
#endif

#define MEC_VAL_LIMIT(val, min, max)                                           \
  do {                                                                         \
    if ((val) <= (min)) {                                                      \
      (val) = (min);                                                           \
    } else if ((val) >= (max)) {                                               \
      (val) = (max);                                                           \
    }                                                                          \
  } while (0)

/**
 * @brief skid steer glb_chassis velocity decomposition.F:forword; B:backword;
 * L:left; R:right
 * @param input : ccx=+vx(mm/s)  ccw=+vw(deg/s)
 * @param output: every wheel speed(rpm)
 * @note  1=FR 2=FL 3=BL 4=BR
 */
void skid_steer_calculate(struct skid_steer *ss) {

  MEC_VAL_LIMIT(ss->speed.vx, -MAX_CHASSIS_VX_SPEED,
                MAX_CHASSIS_VX_SPEED); // mm/s
  MEC_VAL_LIMIT(ss->speed.vw, -MAX_CHASSIS_VW_SPEED,
                MAX_CHASSIS_VW_SPEED); // deg/s

  float wheel_rpm[4];
  float max = 0;

  // RIGHT
  wheel_rpm[0] = ((ss->speed.vx / RADIUS) +
                  (WHEELTRACK * (ss->speed.vw / RADIAN_COEF) / RADIUS)) *
                 (M_PI * 60);
  wheel_rpm[3] = wheel_rpm[0];
  // LEFT
  wheel_rpm[1] = ((ss->speed.vx / RADIUS) -
                  (WHEELTRACK * (ss->speed.vw / RADIAN_COEF) / RADIUS)) *
                 (M_PI * 60);
  wheel_rpm[2] = wheel_rpm[1];

  // find max item
  for (uint8_t i = 0; i < 4; i++) {
    if (fabs(wheel_rpm[i]) > max)
      max = fabs(wheel_rpm[i]);
  }

  // equal proportion
  if (max > MAX_WHEEL_RPM) {
    float rate = MAX_WHEEL_RPM / max;
    for (uint8_t i = 0; i < 4; i++)
      wheel_rpm[i] *= rate;
  }

  memcpy(ss->wheel_rpm, wheel_rpm, 4 * sizeof(float));
}

void skid_steer_position_measure(struct skid_steer *ss,
                                 struct skid_steer_motor_fdb wheel_fdb[]) {
  static float rpm_ratio;
  static float ecd_ratio;

  static double d_x, last_d_x, diff_d_x;         // [mm]
  static double d_w, last_d_w, diff_d_w;         // [radian]
  static double position_x, position_y, angle_w; // [mm] [mm] [radian]
  static double v_x, v_w;                        // [mm/s] [rad/s]

  rpm_ratio = PERIMETER * MOTOR_DECELE_RATIO / 60.0f;
  ecd_ratio = PERIMETER * MOTOR_DECELE_RATIO / MOTOR_ENCODER_ACCURACY;

  last_d_x = d_x;
  last_d_w = d_w;

  float ecd_r = (wheel_fdb[0].total_ecd + wheel_fdb[1].total_ecd) / 2.0;
  float ecd_l = (wheel_fdb[2].total_ecd + wheel_fdb[3].total_ecd) / 2.0;

  d_x = ecd_ratio * (ecd_r + ecd_l) / 2.0f;
  d_w = ecd_ratio * (ecd_r - ecd_l) / WHEELTRACK;

  diff_d_x = d_x - last_d_x;
  diff_d_w = d_w - last_d_w;

  position_x += diff_d_x * cos(angle_w);
  position_y += diff_d_x * sin(angle_w);

  angle_w += diff_d_w;

  ss->position.position_x_mm = position_x;        // mm
  ss->position.position_y_mm = position_y;        // mm
  ss->position.angle_deg = angle_w * RADIAN_COEF; // degree

  float rpmR = (wheel_fdb[0].speed_rpm + wheel_fdb[1].speed_rpm) / 2.0f;
  float rpmL = (wheel_fdb[2].speed_rpm + wheel_fdb[3].speed_rpm) / 2.0f;
  v_x = rpm_ratio * (rpmR + rpmL) / 2.0f;
  v_w = rpm_ratio * (rpmR - rpmL) / WHEELTRACK;

  ss->position.v_x_mm = v_x;                 // mm/s
  ss->position.rate_deg = v_w * RADIAN_COEF; // degree/s
}