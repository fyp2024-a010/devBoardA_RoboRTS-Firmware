#include "init.h"

osThreadId led_task_t;

void task_init(void){
	osThreadDef(LED_TASK, led_task, osPriorityHigh, 0, 512);
	led_task_t = osThreadCreate(osThread(LED_TASK), NULL);
}
