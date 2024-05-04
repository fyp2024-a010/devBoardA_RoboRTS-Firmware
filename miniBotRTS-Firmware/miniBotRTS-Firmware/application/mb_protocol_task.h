#ifndef APPLICATION_MB_PROTOCOL_TASK_H_
#define APPLICATION_MB_PROTOCOL_TASK_H_

#include <stdint.h>
#include <stdbool.h>

#include "main.h"
#include "timer_task.h"

#include "usbd_cdc_if.h"
#include "usb_vcp_extension.h"
#include "mb_protocol.h"

void mb_protocol_task (void const *argument);


#endif /* APPLICATION_MB_PROTOCOL_TASK_H_ */
