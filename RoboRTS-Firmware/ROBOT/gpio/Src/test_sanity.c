/*
 * test_sanity.c
 *
 *  Created on: Jan 28, 2024
 *      Author: bentjh01
 */

#include "../../gpio/Inc/test_sanity.h"

#include "main.h"

GPIO_PinState read_pin_Z (){
	return HAL_GPIO_ReadPin(PIN_Z_GPIO_Port, PIN_Z_Pin);
}
