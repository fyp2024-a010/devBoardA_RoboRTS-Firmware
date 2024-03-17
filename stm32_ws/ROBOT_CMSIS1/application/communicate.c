/****************************************************************************
 *  Copyright (C) 2019 RoboMaster.
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of 
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program. If not, see <http://www.gnu.org/licenses/>.
 ***************************************************************************/

#include "can.h"
#include "board.h"
#include "usbd_cdc_if.h"
#include "dbus.h"
#include "detect.h"
#include "communicate.h"
#include "timer_task.h"
#include "offline_check.h"
#include "init.h"
#include "infantry_cmd.h"
#include "protocol.h"

static void protocol_send_success_callback(void);
static int32_t usb_interface_send(uint8_t *p_data, uint32_t len);

extern osThreadId communicate_task_t;

static int32_t usb_rcv_callback(uint8_t *buf, uint32_t len)
{
  protocol_uart_rcv_data(PROTOCOL_USB_PORT, buf, len);
  osSignalSet(communicate_task_t, RECV_PROTOCOL_SIGNAL);
  return len;
}

int32_t manifold2_heart_package(uint8_t *buff, uint16_t len)
{
  return 0;
}

int32_t report_firmware_version(uint8_t *buff, uint16_t len)
{
  return FIRMWARE_VERSION;
}

void toggle_led_C(void* argc)
{
  HAL_GPIO_TogglePin(LED_C_GPIO_Port, LED_C_Pin);
}

void communicate_task(void const *argument)
{
  // uint8_t app;
  // app = get_sys_cfg();

  protocol_local_init(CHASSIS_ADDRESS);
  // PROBLEM: Was 4096
  // protocol_uart_interface_register("manifold2", 4096, 1, PROTOCOL_USB_PORT, usb_interface_send);
  protocol_uart_interface_register("manifold2", 2048, 1, PROTOCOL_USB_PORT, usb_interface_send);
  protocol_set_route(MANIFOLD2_ADDRESS, "manifold2");

  protocol_rcv_cmd_register(CMD_MANIFOLD2_HEART, manifold2_heart_package);
  protocol_rcv_cmd_register(CMD_REPORT_VERSION, report_firmware_version);

  usb_vcp_rx_callback_register(usb_rcv_callback);
  soft_timer_register(usb_tx_flush, NULL, 1);
	protocol_send_list_add_callback_reg(protocol_send_success_callback);

  soft_timer_register(toggle_led_C, NULL, 1000);

  osEvent event; // moved from inside the while loop

  while (1)
  {
	  // THIS CAUSES THE USB CONNECTION TO BRICK

    osSignalSet(communicate_task_t, SEND_PROTOCOL_SIGNAL);

    event = osSignalWait(SEND_PROTOCOL_SIGNAL | RECV_PROTOCOL_SIGNAL, osWaitForever);

    if (event.status == osEventSignal)
    {
      if (event.value.signals & SEND_PROTOCOL_SIGNAL)
      {
        protocol_send_flush();
      }

      if (event.value.signals & RECV_PROTOCOL_SIGNAL)
      {
        protocol_unpack_flush();
      }
    }
//	  osDelay(1);
  }
}

static int32_t usb_interface_send(uint8_t *p_data, uint32_t len)
{
  CDC_Transmit_FS(p_data, len);
  return 0;
}

static void protocol_send_success_callback(void)
{
  osSignalSet(communicate_task_t, SEND_PROTOCOL_SIGNAL);
}
