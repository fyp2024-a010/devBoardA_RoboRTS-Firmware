#ifndef INIT_H_
#define INIT_H_

#include "main.h"

#include "can.h"

#include "blinky_task.h"
#include "timer_task.h"
#include "mb_protocol_task.h"
#include "imu_task.h"
#include "chassis_task.h"

void task_init();

#endif /* INIT_H_ */
