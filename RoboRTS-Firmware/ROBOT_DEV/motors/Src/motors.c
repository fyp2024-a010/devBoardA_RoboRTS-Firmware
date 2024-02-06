/*
 * motor.c
 *
 *  Created on: Feb 7, 2024
 *      Author: bentjh01
 */

#include "motors.h"

osThreadId_t motorsTaskHandle;
const osThreadAttr_t motorTask_attributes = {
  .name = "motorTask",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityNormal,
};

void motors_init(void){
	motorsTaskHandle = osThreadNew(motors_task, NULL, &motorTask_attributes);
}

void motors_task(void *arguments){
  for(;;)
  {
	HAL_GPIO_TogglePin(LED_A_GPIO_Port, LED_A_Pin);
	osDelay(1000);
  }
}