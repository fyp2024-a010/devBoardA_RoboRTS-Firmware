/*
 * blinky_task.c
 *
 *  Created on: Mar 7, 2024
 *      Author: bentjh01
 */


/*
 * blinky.c
 *
 *  Created on: Mar 6, 2024
 *      Author: bentjh01
 */

#include "blinky_task.h"
 #include "timer_task.h"

void toggle_led_B(void *argc){
	HAL_GPIO_TogglePin(LED_B_GPIO_Port, LED_B_Pin);

}

void blinky_task (void const *argument){
	uint32_t t = osKernelSysTick();
	uint32_t period = 100;

	soft_timer_register(toggle_led_B, NULL, 1000);

	 for(;;){
		// HAL_GPIO_TogglePin(LED_A_GPIO_Port, LED_A_Pin);
		// HAL_GPIO_WritePin(LED_A_GPIO_Port, LED_A_Pin, GPIO_PIN_SET);
		// osDelayUntil(&t, period);

		// HAL_GPIO_TogglePin(LED_B_GPIO_Port, LED_B_Pin);
		// osDelayUntil(&t, period);

		// HAL_GPIO_TogglePin(LED_C_GPIO_Port, LED_C_Pin);
		// osDelayUntil(&t, period);

		// HAL_GPIO_TogglePin(LED_D_GPIO_Port, LED_D_Pin);
		// osDelayUntil(&t, period);

		// HAL_GPIO_TogglePin(LED_E_GPIO_Port, LED_E_Pin);
		// osDelayUntil(&t, period);

		// HAL_GPIO_TogglePin(LED_F_GPIO_Port, LED_F_Pin);
		// osDelayUntil(&t, period);

		// HAL_GPIO_TogglePin(LED_G_GPIO_Port, LED_G_Pin);
		// osDelayUntil(&t, period);

		// HAL_GPIO_TogglePin(LED_H_GPIO_Port, LED_H_Pin);
		// osDelayUntil(&t, period);
		osDelay(1);
	 }
}
