/*
 * drv_blinky.c
 *
 *  Created on: Mar 6, 2024
 *      Author: bentjh01
 */
#include "drv_blinky.h"

int32_t led_toggle_1000ms(void)
{
//  static uint32_t led_tick;

//  if (HAL_GetTick() - led_tick > 1000)
//  {
    LED_G_TOGGLE();
//    led_tick = HAL_GetTick();
//  }

  return 0;
}
