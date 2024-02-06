/* Includes ------------------------------------------------------------------*/
#include "../../applications/Inc/init.h"

#include "FreeRTOS.h"
#include "task.h"
#include "main.h"
#include "cmsis_os.h"

osThreadId_t imuHandle;
const osThreadAttr_t imu_attributes = {
  .name = "some",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityNormal,
};

void app_init(void);

/* Code Begins*/

void app_init(void) {
  osThreadDef(IMU_TASK, imu_task, osPriorityNormal, 0, 4096);
  osThreadCreate(IMU_TASK, NULL);
}



void imu_t(void *argument);

void imu_t(void *argument)
{
  for(;;)
  {
	  HAL_GPIO_TogglePin(LED_B_GPIO_Port, LED_B_Pin);
    osDelay(1000);
  }
}


