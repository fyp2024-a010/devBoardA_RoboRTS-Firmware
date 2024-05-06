#include "init.h"

osThreadId timer_task_t;
osThreadId blinky_task_t;
osThreadId usbComm_task_t;
osThreadId imu_task_t;
osThreadId chassis_task_t;

void task_init() {
  osThreadDef(TIMER_1MS, timer_task, osPriorityLow, 0, 512);
  timer_task_t = osThreadCreate(osThread(TIMER_1MS), NULL);

  osThreadDef(BLINKY_TASK, blinky_task, osPriorityIdle, 0, 64);
  blinky_task_t = osThreadCreate(osThread(BLINKY_TASK), NULL);

  osThreadDef(PROTOCOL_TASK, mb_protocol_task, osPriorityNormal, 0, 4096);
  usbComm_task_t = osThreadCreate(osThread(PROTOCOL_TASK), NULL);

  osThreadDef(IMU_TASK, imu_task, osPriorityHigh, 0, 1024);
  imu_task_t = osThreadCreate(osThread(IMU_TASK), NULL);

  osThreadDef(CHASSIS_TASK, chassis_task, osPriorityRealtime, 0, 4096);
  chassis_task_t = osThreadCreate(osThread(CHASSIS_TASK), NULL);
}
