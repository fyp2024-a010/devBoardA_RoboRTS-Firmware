/*
 * drv_blinky.h
 *
 *  Created on: Mar 6, 2024
 *      Author: bentjh01
 */

#ifndef BOARDS_INC_DRV_BLINKY_H_
#define BOARDS_INC_DRV_BLINKY_H_

#include "stm32f4xx_hal.h"
#include "main.h"

#define LED_G_TOGGLE()  HAL_GPIO_TogglePin(LED_G_GPIO_Port, LED_G_Pin)

int32_t led_toggle_1000ms(void);

#endif /* BOARDS_INC_DRV_BLINKY_H_ */
