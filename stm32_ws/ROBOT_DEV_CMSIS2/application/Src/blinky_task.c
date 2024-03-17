/*
 * blinky.c
 *
 *  Created on: Mar 6, 2024
 *      Author: bentjh01
 */

#include "blinky_task.h"

#include "drv_blinky.h"

void blinky_task (void const *argument){
	uint32_t period = 100;
	while(1){
		uint32_t t = osKernelGetTickCount();

		HAL_GPIO_TogglePin(LED_A_GPIO_Port, LED_A_Pin);
		osDelayUntil(t+period*1);

		HAL_GPIO_TogglePin(LED_B_GPIO_Port, LED_B_Pin);
		osDelayUntil(t+period*2);

		HAL_GPIO_TogglePin(LED_C_GPIO_Port, LED_C_Pin);
		osDelayUntil(t+period*3);

		HAL_GPIO_TogglePin(LED_D_GPIO_Port, LED_D_Pin);
		osDelayUntil(t+period*4);

		HAL_GPIO_TogglePin(LED_E_GPIO_Port, LED_E_Pin);
		osDelayUntil(t+period*5);

		HAL_GPIO_TogglePin(LED_F_GPIO_Port, LED_F_Pin);
		osDelayUntil(t+period*6);

		HAL_GPIO_TogglePin(LED_G_GPIO_Port, LED_G_Pin);
		osDelayUntil(t+period*7);

		HAL_GPIO_TogglePin(LED_H_GPIO_Port, LED_H_Pin);
		osDelayUntil(t+period*8);
	}
}
