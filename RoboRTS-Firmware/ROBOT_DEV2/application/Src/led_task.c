#include "led_task.h"

void led_task(void const *argument){
	while(1){
		HAL_GPIO_TogglePin(LED_A_GPIO_Port, LED_A_Pin);
		osDelay(1000);
	}
}
