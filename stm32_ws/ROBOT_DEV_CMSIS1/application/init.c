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
#include "blinky_task.h"
#include "init.h"

static uint8_t glb_sys_cfg;

extern int ulog_console_backend_init(void);

void system_config(void)
{
  glb_sys_cfg = HAL_GPIO_ReadPin(SYS_CFG_GPIO_Port, SYS_CFG_Pin);
}

uint8_t get_sys_cfg(void)
{
  return glb_sys_cfg;
}

void hw_init(void)
{

}

osThreadId blinky_task_t;

void task_init(void)
{
  osThreadDef(BLINKY_TASK, blinky_task, osPriorityRealtime, 0, 512);
  blinky_task_t = osThreadCreate(osThread(BLINKY_TASK), NULL);
}
