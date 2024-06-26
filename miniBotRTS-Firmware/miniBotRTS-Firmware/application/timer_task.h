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

#ifndef __TIMER_TASK_H__
#define __TIMER_TASK_H__

#ifdef TIMER_TASK_H_GLOBAL
  #define TIMER_TASK_H_EXTERN 
#else
  #define TIMER_TASK_H_EXTERN extern
#endif


#include "soft_timer.h"
#include "cmsis_os.h"
  
struct soft_timer
{
  uint8_t id;
  uint32_t ticks;
  void *argc;
  int32_t (*soft_timer_callback)(void *argc);
};

int32_t soft_timer_register(int32_t (*soft_timer_callback)(void *argc), void *argc, uint32_t ticks);
void timer_task(void const * argument);

#endif // __TIMER_TASK_H__
