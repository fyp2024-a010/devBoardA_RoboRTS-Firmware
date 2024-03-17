/*
 * init.c
 *
 *  Created on: Mar 6, 2024
 *      Author: bentjh01
 */


#include "init.h"

#include "blinky_task.h"

void hw_init(void){

}

osThreadId blinky_task_t;

void task_init(void){
	const osThreadAttr_t blinkyTask_attributes = {
	.name = "BLINKY_1S",
	.stack_size = 128 * 4,
	.priority = (osPriority_t) osPriorityHigh,
	};
	blinky_task_t = osThreadNew(blinky_task, NULL, &blinkyTask_attributes);
}
