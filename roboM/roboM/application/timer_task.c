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

#include "timer_task.h"

struct soft_timer soft_timer[TIMER_ELEMENT_NUM_MAX - 1];

/**
 * @brief Timer task function.
 * 
 * This function is responsible for executing the timer tasks.
 * It checks for expired soft timers and calls their respective callback functions.
 * The function runs in an infinite loop and delays for a specified period.
 * 
 * @param argument Pointer to the task argument (not used in this function).
 */
void timer_task(void const *argument)
{
  uint32_t period = osKernelSysTick();

  while (1)
  {
    TimerISR_Hook();

    for (int i = 0; i < TIMER_ELEMENT_NUM_MAX - 1; i++)
    {
      if ((soft_timer[i].id != 0) && (soft_timer[i].soft_timer_callback != NULL))
      {
        if (soft_timer_check(soft_timer[i].id) == SOFT_TIMER_TIMEOUT)
        {
          soft_timer[i].soft_timer_callback(soft_timer[i].argc);

          soft_timer_update(soft_timer[i].id, soft_timer[i].ticks);
        }
      }
    }

    osDelayUntil(&period, 1);
  }
}

/**
 * Registers a soft timer callback function with the specified ticks.
 *
 * This function registers a soft timer callback function along with the number of ticks
 * after which the callback should be triggered. The callback function will be called
 * asynchronously when the specified number of ticks has elapsed.
 *
 * @param soft_timer_callback The callback function to be registered.
 * @param argc                An optional argument to be passed to the callback function.
 * @param ticks               The number of ticks after which the callback should be triggered.
 *
 * @return                    The index of the registered timer element if successful,
 *                            or -1 if the registration fails (e.g., no available timer element).
 */
int32_t soft_timer_register(int32_t (*soft_timer_callback)(void *argc), void *argc, uint32_t ticks)
{
  for (int i = 0; i < TIMER_ELEMENT_NUM_MAX - 1; i++)
  {
    if (soft_timer[i].id == 0)
    {
      soft_timer[i].id = soft_timer_req(ticks);
      soft_timer[i].ticks = ticks;
      soft_timer[i].argc = argc;
      soft_timer[i].soft_timer_callback = soft_timer_callback;
      return i;
    }
  }
  return -1;
}
