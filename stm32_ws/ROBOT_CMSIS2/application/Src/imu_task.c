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

#include "can.h"
#include "board.h"
#include "dbus.h"
#include "timer_task.h"
#include "infantry_cmd.h"

#include "protocol.h"

#include "imu.h"
#include "imu_task.h"

#define DEFAULT_IMU_TEMP 50

struct cmd_imu_info cmd_imu_info;

static void imu_temp_ctrl_init(void);
static int32_t imu_update(void *argc);
static int32_t imu_temp_keep(void *argc);

int32_t imu_push_info(void *argc)
{
  struct imu_info info;
  imu_t pimu = (imu_t)argc;
  imu_get_info(pimu, &info);

  cmd_imu_info.pitch_gyro_angle = info.pitch_gyro_angle * 10;
  cmd_imu_info.pitch_rate = info.pitch_rate * 10;

  cmd_imu_info.yaw_gyro_angle = info.yaw_gyro_angle * 10;
  cmd_imu_info.yaw_rate = info.yaw_rate * 10;

  cmd_imu_info.roll_gyro_angle = info.roll_gyro_angle * 10;
  cmd_imu_info.roll_rate = info.roll_rate * 10;

  protocol_send(PROTOCOL_BROADCAST_ADDR, CMD_PUSH_IMU_INFO, &cmd_imu_info, sizeof(cmd_imu_info));

  return 0;
}

void imu_task(void const *argument)
{
  uint32_t period = 2;
  imu_t pimu = NULL;

  soft_timer_register(imu_temp_keep, (void *)pimu, 5);
  soft_timer_register(imu_push_info, (void *)pimu, 10);

  imu_temp_ctrl_init();

  while (1)
  {
	uint32_t t =  osKernelGetTickCount();

    imu_update(pimu);

//    osDelayUntil(&period, 2); CMSIS_v1
    osDelayUntil(t+period);
  }
}

static int32_t imu_update(void *argc)
{
  struct ahrs_sensor mpu_sensor;
  struct attitude mahony_attitude;
  imu_t pimu = (imu_t)argc;
  mpu_get_data(&mpu_sensor);
  mahony_ahrs_updateIMU(&mpu_sensor, &mahony_attitude);

  imu_yaw_gyro_update(pimu, mahony_attitude.yaw);
  imu_pitch_gyro_update(pimu, mahony_attitude.pitch);
  imu_roll_gyro_update(pimu, mahony_attitude.roll);

  imu_rate_update(pimu, mpu_sensor.wz * RAD_TO_DEG, mpu_sensor.wy * RAD_TO_DEG, mpu_sensor.wx * RAD_TO_DEG);
  return 0;
}

struct pid pid_imu_tmp;

static void imu_temp_ctrl_init(void)
{
  pid_struct_init(&pid_imu_tmp, 2000, 500, 1100, 10, 0);
}

static int32_t imu_temp_keep(void *argc)
{
  float temp;
  mpu_get_temp(&temp);
  pid_calculate(&pid_imu_tmp, temp, DEFAULT_IMU_TEMP);
  mpu_heat_output(pid_imu_tmp.out);
  return 0;
}
