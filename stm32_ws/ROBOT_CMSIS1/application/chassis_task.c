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

#include "dbus.h"
#include "chassis_task.h"
#include "timer_task.h"
#include "infantry_cmd.h"

#include "main.h"

static float vx, vy, wz;

float follow_relative_angle;
struct pid pid_follow = {0}; //angle control

/* TESTING */
void toggle_led_E(void *argc)
{
  HAL_GPIO_TogglePin(LED_E_GPIO_Port, LED_E_Pin);
}
/* TESTING */

void chassis_task(void const *argument)
{
  uint32_t period = osKernelSysTick();
  chassis_t pchassis = NULL;
  pchassis = chassis_find("chassis");

  soft_timer_register(chassis_push_info, (void *)pchassis, 100);

  soft_timer_register(toggle_led_E, NULL, 1000); // TESTING

  // pid_struct_init(&pid_follow, MAX_CHASSIS_VW_SPEED, 50, 8.0f, 0.0f, 2.0f);

  while (1)
  {
    chassis_execute(pchassis);
    osDelayUntil(&period, 2);
  }
}

int32_t chassis_set_relative_angle(float angle)
{
  follow_relative_angle = angle;
  return 0;
}
