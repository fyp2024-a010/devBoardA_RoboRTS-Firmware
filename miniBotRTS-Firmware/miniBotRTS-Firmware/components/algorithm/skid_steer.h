#ifndef __SKID_STEER_H__
#define __SKID_STEER_H__

#ifdef SKID_STEER_H_GLOBAL
#define SKID_STEER_H_EXTERN
#else
#define SKID_STEER_H_EXTERN extern
#endif

#include <math.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

/************************ chassis parameter ****************************/
/* the radius of wheel(mm) */
#define RADIUS 76
/* the perimeter of wheel(mm) */
#define PERIMETER 478
/* wheel track distance(mm) */
#define WHEELTRACK 280
/* wheelbase distance(mm) */
#define WHEELBASE 230

/* chassis motor use 3508 */
/* the deceleration ratio of chassis motor */
#define MOTOR_DECELE_RATIO (187.0f / 3591.0f)
/* single 3508 motor maximum speed, unit is rpm */
#define MAX_WHEEL_RPM 8500 //8347rpm = 3500mm/s
/* chassis maximum translation speed, unit is mm/s */
#define MAX_CHASSIS_VX_SPEED 3300 //8000rpm
/* chassis maximum rotation speed, unit is degree/s */
#define MAX_CHASSIS_VW_SPEED 300 //5000rpm

#define MOTOR_ENCODER_ACCURACY 8192.0f

/** 
  * @brief  infantry structure configuration information
  */
struct skid_steer_structure
{
  float wheel_perimeter; /* the perimeter(mm) of wheel */
  float wheeltrack;      /* wheel track distance(mm) */
  float wheelbase;       /* wheelbase distance(mm) */
};

struct skid_steer_position
{
  float v_x_mm;
  float v_y_mm;
  float rate_deg;
  float position_x_mm;
  float position_y_mm;
  float angle_deg;
};

struct skid_steer_speed
{
  float vx; // forward/back
  float vw; // anticlockwise/clockwise
};

struct skid_steer_gyro
{
  float yaw_gyro_angle;
  float yaw_gyro_rate;
};

struct skid_steer
{
  struct skid_steer_structure param;
  struct skid_steer_speed speed;
  struct skid_steer_position position;
  struct skid_steer_gyro gyro;
  float  wheel_rpm[4];
};

struct skid_steer_motor_fdb
{
  float total_ecd;
  float speed_rpm;
};

void skid_steer_calculate(struct skid_steer *ss);
void skid_steer_position_measure(struct skid_steer *ss, struct skid_steer_motor_fdb wheel_fdb[]);

#endif // __SKID_STEER_H__
