#include "main.h"

#include "init.h"
#include "blinky_task.h"
#include "timer_task.h"

void hw_init(void)
{
}

osThreadId timer_task_t;
osThreadId blinky_task_t;

void task_init(void)
{
  osThreadDef(TIMER_1MS, timer_task, osPriorityHigh, 0, 512);
  timer_task_t = osThreadCreate(osThread(TIMER_1MS), NULL);

  osThreadDef(BLINKY_TASK, blinky_task, osPriorityLow, 0, 64);
  blinky_task_t = osThreadCreate(osThread(BLINKY_TASK), NULL); 

}
