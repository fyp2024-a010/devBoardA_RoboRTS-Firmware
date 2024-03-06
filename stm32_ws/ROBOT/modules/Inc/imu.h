/****************************************************************************
 *  Copyright (C) 2024 Benjamin Teh Jhen Hing.
 *  benjamintehjh01@gmail.com
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

#ifndef __IMU_H__
#define __IMU_H__

#ifdef IMU_H_GLOBAL
  #define IMU_H_EXTERN 
#else
  #define IMU_H_EXTERN extern
#endif

#include "object.h"
#include "errno.h"

#define RAD_TO_DEG 57.3f

// #include "single_gyro.h"
#include "pid_controller.h"

typedef struct imu *imu_t;

struct imu_p_y_r
{
  /* unit: degree */
  float yaw;
  float pitch;  
  float roll;
};

struct imu_rate
{
  /* unit: degree/s */
  float yaw_rate;
  float pitch_rate;  
  float roll_rate;
};

struct imu_sensor
{
  struct imu_p_y_r gyro_angle;
  struct imu_rate rate;
};

struct imu
{
  struct object parent;

  struct imu_sensor sensor;  
  struct imu_p_y_r imu_angle;
};

struct imu_info
{
  float yaw_gyro_angle;
  float pitch_gyro_angle;
  float roll_gyro_angle;
  float yaw_rate;
  float pitch_rate;
  float roll_rate;
};

imu_t imu_find(const char *name);

int32_t imu_yaw_gyro_update(struct imu *imu, float yaw);
int32_t imu_pitch_gyro_update(struct imu *imu, float pitch);
int32_t imu_roll_gyro_update(struct imu *imu, float roll);
int32_t imu_rate_update(struct imu *imu, float yaw_rate, float pitch_rate, float roll_rate);

int32_t imu_get_info(struct imu *imu, struct imu_info *info);

#endif // __IMU_H__
