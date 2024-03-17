/*
 * blinky_task.h
 *
 *  Created on: Mar 7, 2024
 *      Author: bentjh01
 */

#ifndef BLINKY_TASK_H_
#define BLINKY_TASK_H_

#include "stm32f4xx_hal.h"
#include "FreeRTOS.h"
#include "cmsis_os.h"

#include "main.h"

void blinky_task (void const *argument);

#endif /* BLINKY_TASK_H_ */
