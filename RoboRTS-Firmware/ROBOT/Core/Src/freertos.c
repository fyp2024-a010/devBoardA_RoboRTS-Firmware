/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * File Name          : freertos.c
  * Description        : Code for freertos applications
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

/* Includes ------------------------------------------------------------------*/
#include "FreeRTOS.h"
#include "task.h"
#include "main.h"
#include "cmsis_os.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "../../gpio/Inc/test_sanity.h"
#include "../../imu/Inc/bsp_imu.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN Variables */
uint8_t reading_Z = 0;
uint8_t* p_reading_Z = &reading_Z;
/* USER CODE END Variables */
/* Definitions for defaultTask */
osThreadId_t defaultTaskHandle;
const osThreadAttr_t defaultTask_attributes = {
  .name = "defaultTask",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityNormal,
};
/* Definitions for Blink_LED_A */
osThreadId_t Blink_LED_AHandle;
const osThreadAttr_t Blink_LED_A_attributes = {
  .name = "Blink_LED_A",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityLow,
};
/* Definitions for Blink_LED_B */
osThreadId_t Blink_LED_BHandle;
const osThreadAttr_t Blink_LED_B_attributes = {
  .name = "Blink_LED_B",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityLow,
};
/* Definitions for Blink_LED_C */
osThreadId_t Blink_LED_CHandle;
const osThreadAttr_t Blink_LED_C_attributes = {
  .name = "Blink_LED_C",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityLow,
};
/* Definitions for myTask05 */
osThreadId_t myTask05Handle;
const osThreadAttr_t myTask05_attributes = {
  .name = "myTask05",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityLow,
};

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN FunctionPrototypes */

/* USER CODE END FunctionPrototypes */

void StartDefaultTask(void *argument);
void Blink_LED_A_t(void *argument);
void Blink_LED_B_t(void *argument);
void Blink_LED_C_t(void *argument);
void StartTask05(void *argument);

extern void MX_USB_DEVICE_Init(void);
void MX_FREERTOS_Init(void); /* (MISRA C 2004 rule 8.1) */

/**
  * @brief  FreeRTOS initialization
  * @param  None
  * @retval None
  */
void MX_FREERTOS_Init(void) {
  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* USER CODE BEGIN RTOS_MUTEX */
  /* add mutexes, ... */
  /* USER CODE END RTOS_MUTEX */

  /* USER CODE BEGIN RTOS_SEMAPHORES */
  /* add semaphores, ... */
  /* USER CODE END RTOS_SEMAPHORES */

  /* USER CODE BEGIN RTOS_TIMERS */
  /* start timers, add new ones, ... */
  /* USER CODE END RTOS_TIMERS */

  /* USER CODE BEGIN RTOS_QUEUES */
  /* add queues, ... */
  /* USER CODE END RTOS_QUEUES */

  /* Create the thread(s) */
  /* creation of defaultTask */
  defaultTaskHandle = osThreadNew(StartDefaultTask, NULL, &defaultTask_attributes);

  /* creation of Blink_LED_A */
  Blink_LED_AHandle = osThreadNew(Blink_LED_A_t, NULL, &Blink_LED_A_attributes);

  /* creation of Blink_LED_B */
  Blink_LED_BHandle = osThreadNew(Blink_LED_B_t, NULL, &Blink_LED_B_attributes);

  /* creation of Blink_LED_C */
  Blink_LED_CHandle = osThreadNew(Blink_LED_C_t, NULL, &Blink_LED_C_attributes);

  /* creation of myTask05 */
  myTask05Handle = osThreadNew(StartTask05, NULL, &myTask05_attributes);

  /* USER CODE BEGIN RTOS_THREADS */
  /* add threads, ... */
  /* USER CODE END RTOS_THREADS */

  /* USER CODE BEGIN RTOS_EVENTS */
  /* add events, ... */
  /* USER CODE END RTOS_EVENTS */

}

/* USER CODE BEGIN Header_StartDefaultTask */
/**
  * @brief  Function implementing the defaultTask thread.
  * @param  argument: Not used
  * @retval None
  */
/* USER CODE END Header_StartDefaultTask */
void StartDefaultTask(void *argument)
{
  /* init code for USB_DEVICE */
  MX_USB_DEVICE_Init();
  /* USER CODE BEGIN StartDefaultTask */
  /* Infinite loop */
  for(;;)
  {
    osDelay(1);
  }
  /* USER CODE END StartDefaultTask */
}

/* USER CODE BEGIN Header_Blink_LED_A_t */
/**
* @brief Function implementing the Blink_LED_A thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_Blink_LED_A_t */
void Blink_LED_A_t(void *argument)
{
  /* USER CODE BEGIN Blink_LED_A_t */
  /* Infinite loop */
  for(;;)
  {
	*p_reading_Z = read_pin_Z();
    osDelay(1);
  }
  /* USER CODE END Blink_LED_A_t */
}

/* USER CODE BEGIN Header_Blink_LED_B_t */
/**
* @brief Function implementing the Blink_LED_B thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_Blink_LED_B_t */
void Blink_LED_B_t(void *argument)
{
  /* USER CODE BEGIN Blink_LED_B_t */
  /* Infinite loop */
  for(;;)
  {
	  if (reading_Z == GPIO_PIN_SET){
		  HAL_GPIO_WritePin(LED_A_GPIO_Port, LED_A_Pin, GPIO_PIN_SET);
	  }
	  else {
		  HAL_GPIO_WritePin(LED_A_GPIO_Port, LED_A_Pin, GPIO_PIN_RESET);
	  }
    osDelay(1);
  }
  /* USER CODE END Blink_LED_B_t */
}

/* USER CODE BEGIN Header_Blink_LED_C_t */
/**
* @brief Function implementing the Blink_LED_C thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_Blink_LED_C_t */
void Blink_LED_C_t(void *argument)
{
  /* USER CODE BEGIN Blink_LED_C_t */
	  mpu_device_init();
	  init_quaternion();
  /* Infinite loop */
  for(;;)
  {
	  for (uint16_t i = 0; i < 1000000; i++){
	  	  mpu_get_data();
	  	  imu_ahrs_update();
	  	  imu_attitude_update();
	  	}
  }
  /* USER CODE END Blink_LED_C_t */
}

/* USER CODE BEGIN Header_StartTask05 */
/**
* @brief Function implementing the myTask05 thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_StartTask05 */
void StartTask05(void *argument)
{
  /* USER CODE BEGIN StartTask05 */
  /* Infinite loop */
  for(;;)
  {
    osDelay(1);
  }
  /* USER CODE END StartTask05 */
}

/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */

/* USER CODE END Application */

