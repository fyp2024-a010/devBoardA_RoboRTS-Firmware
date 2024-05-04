#ifndef __MOTOR_TASK_H__
#define __MOTOR_TASK_H__

#ifdef MOTOR_TASK_H_GLOBAL
  #define MOTOR_TASK_H_EXTERN 
#else
  #define MOTOR_TASK_H_EXTERN extern
#endif

#include "motor_cluster.h"

void motor_task(void const * argument);

#endif // __MOTOR_TASK_H__
