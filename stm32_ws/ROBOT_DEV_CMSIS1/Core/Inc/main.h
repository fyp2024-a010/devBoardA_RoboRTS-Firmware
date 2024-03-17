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
#define SYS_CFG_Pin GPIO_PIN_6
#define SYS_CFG_GPIO_Port GPIOD
#define PIN_Y_Pin GPIO_PIN_7
#define PIN_Y_GPIO_Port GPIOI
#define PIN_X_Pin GPIO_PIN_6
#define PIN_X_GPIO_Port GPIOI
#define PIN_V_Pin GPIO_PIN_5
#define PIN_V_GPIO_Port GPIOI
#define PIN_Z_Pin GPIO_PIN_2
#define PIN_Z_GPIO_Port GPIOI
#define POWER1_CTRL_Pin GPIO_PIN_2
#define POWER1_CTRL_GPIO_Port GPIOH
#define POWER2_CTRL_Pin GPIO_PIN_3
#define POWER2_CTRL_GPIO_Port GPIOH
#define POWER3_CTRL_Pin GPIO_PIN_4
#define POWER3_CTRL_GPIO_Port GPIOH
#define LED_A_Pin GPIO_PIN_8
#define LED_A_GPIO_Port GPIOG
#define POWER4_CTRL_Pin GPIO_PIN_5
#define POWER4_CTRL_GPIO_Port GPIOH
#define LED_B_Pin GPIO_PIN_7
#define LED_B_GPIO_Port GPIOG
#define LED_C_Pin GPIO_PIN_6
#define LED_C_GPIO_Port GPIOG
#define SPI5_NSS_Pin GPIO_PIN_6
#define SPI5_NSS_GPIO_Port GPIOF
#define LED_D_Pin GPIO_PIN_5
#define LED_D_GPIO_Port GPIOG
#define LED_E_Pin GPIO_PIN_4
#define LED_E_GPIO_Port GPIOG
#define LED_F_Pin GPIO_PIN_3
#define LED_F_GPIO_Port GPIOG
#define TRIG_Pin GPIO_PIN_10
#define TRIG_GPIO_Port GPIOF
#define LED_G_Pin GPIO_PIN_2
#define LED_G_GPIO_Port GPIOG
#define KEY_Pin GPIO_PIN_2
#define KEY_GPIO_Port GPIOB
#define LED_H_Pin GPIO_PIN_1
#define LED_H_GPIO_Port GPIOG
#define PIN_YA1_Pin GPIO_PIN_1
#define PIN_YA1_GPIO_Port GPIOA
#define PIN_ZA0_Pin GPIO_PIN_0
#define PIN_ZA0_GPIO_Port GPIOA
#define IO_PROBE_Pin GPIO_PIN_12
#define IO_PROBE_GPIO_Port GPIOD
#define PIN_XA2_Pin GPIO_PIN_2
#define PIN_XA2_GPIO_Port GPIOA
#define LED_R_Pin GPIO_PIN_11
#define LED_R_GPIO_Port GPIOE
#define PIN_W_Pin GPIO_PIN_3
#define PIN_W_GPIO_Port GPIOA
#define LED_GF14_Pin GPIO_PIN_14
#define LED_GF14_GPIO_Port GPIOF

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
