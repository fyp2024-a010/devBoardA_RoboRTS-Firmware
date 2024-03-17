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

#include "main.h"
#include "can.h"
// #include "board.h"
// #include "motor.h"
// #include "dbus.h"
// #include "detect.h"
// #include "test.h"
// #include "chassis.h"

// #include "chassis_task.h"
// #include "gimbal_task.h"
#include "timer_task.h"
// #include "infantry_cmd.h"
#include "imu_task.h"
#include "blinky_task.h"

#include "communicate.h"
#include "init.h"

#include "protocol.h"
#include "ulog.h"
// #include "param.h"
// #include "offline_check.h"

// struct chassis chassis;

//static uint8_t glb_sys_cfg;

//extern int ulog_console_backend_init(void);

//void system_config(void)
//{
//  glb_sys_cfg = HAL_GPIO_ReadPin(SYS_CFG_Port, SYS_CFG_Pin);
//}

//uint8_t get_sys_cfg(void)
//{
//  return glb_sys_cfg;
//}

void hw_init(void)
{
  // cali_param_init();
  board_config();
  // test_init();
  // system_config();
  // ulog_init();
  // ulog_console_backend_init();

  // chassis_pid_register(&chassis, "chassis", DEVICE_CAN1);
  // chassis_disable(&chassis);

  // offline_init();
}

osThreadId timer_task_t;
//osThreadId chassis_task_t;
osThreadId communicate_task_t;
//osThreadId cmd_task_t;
osThreadId imu_task_t;

osThreadId blinky_task_t;

void task_init(void)
{

   /*CMSIS_v2*/
  const osThreadAttr_t timerTask_attributes = {
    .name = "TIMER_1MS",
    .stack_size = 128 * 4,
    .priority = (osPriority_t) osPriorityHigh,
  };

  const osThreadAttr_t communicateTask_attributes = {
    .name = "COMMUNICATE_TASK",
    .stack_size = 128 * 32,
    .priority = (osPriority_t) osPriorityHigh,
  };

  const osThreadAttr_t imuTask_attributes = {
    .name = "IMU_TASK",
    .stack_size = 128 * 32,
    .priority = (osPriority_t) osPriorityNormal,
  };

//  const osThreadAttr_t infantry_cmdTask_attributes = {
//    .name = "CMD_TASK",
//    .stack_size = 128 * 32,
//    .priority = (osPriority_t) osPriorityNormal,
//  };

	const osThreadAttr_t blinkyTask_attributes = {
		.name = "BLINKY_1S",
		.stack_size = 128 * 4,
		.priority = (osPriority_t) osPriorityHigh,
	};

  timer_task_t = osThreadNew(timer_task, NULL, &timerTask_attributes);
//  communicate_task_t = osThreadNew(communicate_task, NULL, &communicateTask_attributes);
//  cmd_task_t = osThreadNew(infantry_cmd_task, NULL, &infantry_cmdTask_attributes);
  imu_task_t = osThreadNew(imu_task, NULL, &imuTask_attributes);

  blinky_task_t = osThreadNew(blinky_task, NULL, &blinkyTask_attributes);

  /*CMSIS_v1*/
//   osThreadDef(TIMER_1MS, timer_task, osPriorityHigh, 0, 512);
//   timer_task_t = osThreadCreate(osThread(TIMER_1MS), NULL);
//
//   osThreadDef(COMMUNICATE_TASK, communicate_task, osPriorityHigh, 0, 4096);
//   communicate_task_t = osThreadCreate(osThread(COMMUNICATE_TASK), NULL);
//
//   osThreadDef(IMU_TASK, imu_task, osPriorityHigh, 0, 4096);
//   communicate_task_t = osThreadCreate(osThread(COMMUNICATE_TASK), NULL);
//
//   osThreadDef(CMD_TASK, infantry_cmd_task, osPriorityNormal, 0, 4096);
//   cmd_task_t = osThreadCreate(osThread(CMD_TASK), NULL);
//
//   osThreadDef(CHASSIS_TASK, chassis_task, osPriorityRealtime, 0, 512);
//   chassis_task_t = osThreadCreate(osThread(CHASSIS_TASK), NULL);
}

//osThreadId blinky_task_t;
//
//void task_init(void){
//	const osThreadAttr_t blinkyTask_attributes = {
//	.name = "BLINKY_1S",
//	.stack_size = 128 * 4,
//	.priority = (osPriority_t) osPriorityHigh,
//	};
//	blinky_task_t = osThreadNew(blinky_task, NULL, &blinkyTask_attributes);
//}

