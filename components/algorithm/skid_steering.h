/****************************************************************************
 *  Copyright (C) 2019 RoboMaster.
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of 
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program. If not, see <http://www.gnu.org/licenses/>.
 ***************************************************************************/

#ifndef __SKID_STEERING_H__
#define __SKID_STEERING_H__

#ifdef SKID_STEERING_H_GLOBAL
#define SKID_STEERING_H_EXTERN
#else
#define SKID_STEERING_H_EXTERN extern
#endif

/************************ chassis parameter ****************************/
/* the radius of wheel(mm) */
#define RADIUS 76
/* the perimeter of wheel(mm) */
#define PERIMETER 478
/* wheel track distance(mm) */
#define WHEELTRACK 394
/* wheelbase distance(mm) */
#define WHEELBASE 415

/* gimbal is relative to chassis center x axis offset(mm) */
#define ROTATE_X_OFFSET 7
/* gimbal is relative to chassis center y axis offset(mm) */
#define ROTATE_Y_OFFSET 0

/* chassis motor use 3508 */
/* the deceleration ratio of chassis motor */
#define MOTOR_DECELE_RATIO (1.0f / 19.0f)
/* single 3508 motor maximum speed, unit is rpm */
#define MAX_WHEEL_RPM 8500 //8347rpm = 3500mm/s
/* chassis maximum translation speed, unit is mm/s */
#define MAX_CHASSIS_VX_SPEED 3300 //8000rpm
#define MAX_CHASSIS_VY_SPEED 3300
/* chassis maximum rotation speed, unit is degree/s */
#define MAX_CHASSIS_VW_SPEED 300 //5000rpm

#define MOTOR_ENCODER_ACCURACY 8192.0f

/** 
    * @brief  infantry structure configuration information
    */
struct skid_steering_structure
{
    float wheel_perimeter; /* the perimeter(mm) of wheel */
    float wheeltrack;      /* wheel track distance(mm) */
    float wheelbase;       /* wheelbase distance(mm) */
    float rotate_x_offset; /* rotate offset(mm) relative to the x-axis of the chassis center */
    float rotate_y_offset; /* rotate offset(mm) relative to the y-axis of the chassis center */
};

struct skid_steering_position
{
    float v_x_mm;
    float v_y_mm;
    float rate_deg;
    float position_x_mm;
    float position_y_mm;
    float angle_deg;
};

struct skid_steering_speed
{
    float vx; // forward/back
    float vw; // anticlockwise/clockwise
};

struct skid_steering_gyro
{
    float yaw_gyro_angle;
    float yaw_gyro_rate;
};

struct skid_steering
{
    struct skid_steering_structure param;
    struct skid_steering_speed speed;
    struct skid_steering_position position;
    struct skid_steering_gyro gyro;
    float  wheel_rpm[2];
};

struct skid_steering_motor_fdb
{
    float total_ecd;
    float speed_rpm;
};

void skid_steering_calculate(struct skid_steering *skid);
void skid_steering_position_measure(struct skid_steering *skid, struct skid_steering_motor_fdb wheel_fdb[]);

#endif // __SKID_STEERING_H__
