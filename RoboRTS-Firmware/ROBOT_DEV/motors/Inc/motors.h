/*
 * motor.h
 *
 *  Created on: Feb 7, 2024
 *      Author: bentjh01
 */

#ifndef INC_MOTORS_H_
#define INC_MOTORS_H_

#include "cmsis_os.h"
#include "main.h"

void motors_init(void);
void motors_task(void *args);

#endif /* INC_MOTORS_H_ */