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

#ifndef __IMU_TASK_H__
#define __IMU_TASK_H__

#ifdef IMU_TASK_H_GLOBAL
  #define IMU_TASK_H_EXTERN
#else
  #define IMU_TASK_H_EXTERN extern
#endif

#include "sys.h"

#define CMD_PUSH_IMU_INFO                   (0x0301u)

struct cmd_imu_info
{
  int16_t pitch_gyro_angle;
  int16_t pitch_rate;
  int16_t yaw_gyro_angle;
  int16_t yaw_rate;
  int16_t roll_gyro_angle;
  int16_t roll_rate;
};

void imu_task(void const * argument);

#endif // __IMU_TASK_H__
