#ifndef __BLINKY_TASK_H__
#define __BLINKY_TASK_H__

#ifdef BLINKY_TASK_H_GLOBAL
  #define BLINKY_TASK_H_EXTERN 
#else
  #define BLINKY_TASK_H_EXTERN extern
#endif

#include "sys.h"

void blinky_task(void const * argument);

#endif // __BLINKY_TASK_H__
