/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2024 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define IST_RESET_Pin GPIO_PIN_2
#define IST_RESET_GPIO_Port GPIOE
#define IMU_PWM_PULSE_Pin GPIO_PIN_5
#define IMU_PWM_PULSE_GPIO_Port GPIOB
#define CHASSIS_CONFIG_Pin GPIO_PIN_6
#define CHASSIS_CONFIG_GPIO_Port GPIOD
#define POWER_OUT1_Pin GPIO_PIN_2
#define POWER_OUT1_GPIO_Port GPIOH
#define POWER_OUT2_Pin GPIO_PIN_3
#define POWER_OUT2_GPIO_Port GPIOH
#define POWER_OUT3_Pin GPIO_PIN_4
#define POWER_OUT3_GPIO_Port GPIOH
#define POWER_OUT4_Pin GPIO_PIN_5
#define POWER_OUT4_GPIO_Port GPIOH
#define SPI5_NSS_Pin GPIO_PIN_6
#define SPI5_NSS_GPIO_Port GPIOF
#define TRIG_Pin GPIO_PIN_10
#define TRIG_GPIO_Port GPIOF
#define TRIG_EXTI_IRQn EXTI15_10_IRQn
#define KEY_Pin GPIO_PIN_2
#define KEY_GPIO_Port GPIOB
#define BEEP_CTRL_Pin GPIO_PIN_6
#define BEEP_CTRL_GPIO_Port GPIOH
#define IO_PROBE_Pin GPIO_PIN_12
#define IO_PROBE_GPIO_Port GPIOD
#define FRICTION_L_Pin GPIO_PIN_9
#define FRICTION_L_GPIO_Port GPIOE
#define LED_R_Pin GPIO_PIN_11
#define LED_R_GPIO_Port GPIOE
#define FRICTION_R_Pin GPIO_PIN_14
#define FRICTION_R_GPIO_Port GPIOE
#define LED_G_Pin GPIO_PIN_14
#define LED_G_GPIO_Port GPIOF

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
