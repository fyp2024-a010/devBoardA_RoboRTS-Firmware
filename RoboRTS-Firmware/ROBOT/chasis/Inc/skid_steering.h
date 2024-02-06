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

#ifndef __SKID_STEER_H__
#define __SKID_STEER_H__

#ifdef SKID_STEER_H_GLOBAL
#define SKID_STEER_H_EXTERN
#else
#define SKID_STEER_H_EXTERN extern
#endif

/**
  * @brief  infantry structure configuration information
  */
struct skid_steer_structure
{
  float wheel_perimeter; /* the perimeter(mm) of wheel */
  float wheeltrack;      /* wheel track distance(mm) */
  float wheelbase;       /* wheelbase distance(mm) */
  float rotate_x_offset; /* rotate offset(mm) relative to the x-axis of the chassis center */
  float rotate_y_offset; /* rotate offset(mm) relative to the y-axis of the chassis center */
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
  float vy; // left/right
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

#endif // __SKID_STEER_H__
