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

#include "imu.h"

int32_t imu_rate_update(struct imu *imu, float yaw_rate, float pitch_rate, float roll_rate)
{
  if (imu == NULL)
    return -RM_INVAL;

  imu->sensor.rate.yaw_rate = yaw_rate;
  imu->sensor.rate.pitch_rate = pitch_rate;
  imu->sensor.rate.roll_rate = roll_rate;

  return RM_OK;
}

int32_t imu_yaw_gyro_update(struct imu *imu, float yaw)
{
  if (imu == NULL)
    return -RM_INVAL;

  imu->sensor.gyro_angle.yaw = yaw;

  return RM_OK;
}

int32_t imu_pitch_gyro_update(struct imu *imu, float pitch)
{
  if (imu == NULL)
    return -RM_INVAL;

  imu->sensor.gyro_angle.pitch = pitch;

  return RM_OK;
}

int32_t imu_roll_gyro_update(struct imu *imu, float roll)
{
  if (imu == NULL)
    return -RM_INVAL;

  imu->sensor.gyro_angle.roll = roll;

  return RM_OK;
}

int32_t imu_get_info(struct imu *imu, struct imu_info *info)
{
  if (imu == NULL)
    return -RM_INVAL;

  info->yaw_gyro_angle = imu->sensor.gyro_angle.yaw;
  info->pitch_gyro_angle = imu->sensor.gyro_angle.pitch;
  info->roll_gyro_angle = imu->sensor.gyro_angle.roll;
  info->yaw_rate = imu->sensor.rate.yaw_rate;
  info->pitch_rate = imu->sensor.rate.pitch_rate;
  info->roll_rate = imu->sensor.rate.roll_rate;

  return RM_OK;
}

imu_t imu_find(const char *name)
{
  struct object *object;

  object = object_find(name, Object_Class_Imu);

  return (imu_t)object;
}