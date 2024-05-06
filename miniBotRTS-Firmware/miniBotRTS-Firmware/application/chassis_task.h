#ifndef __MOTOR_TASK_H__
#define __MOTOR_TASK_H__

#ifdef MOTOR_TASK_H_GLOBAL
  #define MOTOR_TASK_H_EXTERN 
#else
  #define MOTOR_TASK_H_EXTERN extern
#endif

#include <stdint.h>

#include "can.h"

#include "drv_can.h"
#include "motor.h"
#include "device.h"

#include "chassis.h"
#include "skid_steer.h"
#include "mb_protocol.h"

#include "timer_task.h"
#include "mb_protocol_task.h"

void chassis_task_init(void);
void chassis_task(void const * argument);

#endif // __CHASSIS_TASK_H__
