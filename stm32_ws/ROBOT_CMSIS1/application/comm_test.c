#include "usbd_cdc_if.h"
#include "timer_task.h"
#include "protocol.h"

#include "comm_test.h"

static void protocol_send_success_callback(void);
static int32_t usb_interface_send(uint8_t *p_data, uint32_t len);

extern osThreadId comm_test_task_t;

static int32_t usb_rcv_callback(uint8_t *buf, uint32_t len)
{
  protocol_uart_rcv_data(PROTOCOL_USB_PORT, buf, len);
  osSignalSet(comm_test_task_t, RECV_PROTOCOL_SIGNAL);
  return len;
}

int32_t report_firmware_version(uint8_t *buff, uint16_t len)
{
  return FIRMWARE_VERSION;
}

/* TESTING */
void toggle_led_C(void* argc)
{
  HAL_GPIO_TogglePin(LED_C_GPIO_Port, LED_C_Pin);
}

int32_t ros_callback(uint8_t *buff, uint16_t len)
{
  HAL_GPIO_TogglePin(LED_G_GPIO_Port, LED_G_Pin);
  return 0;
}
/* TESTING */

void comm_test_task(void const *argument)
{
  protocol_local_init(CHASSIS_ADDRESS);
  protocol_uart_interface_register("manifold2", 2048, 1, PROTOCOL_USB_PORT, usb_interface_send);
  protocol_set_route(MANIFOLD2_ADDRESS, "manifold2");

  protocol_rcv_cmd_register(CMD_REPORT_VERSION, report_firmware_version);

  usb_vcp_rx_callback_register(usb_rcv_callback);
  soft_timer_register(usb_tx_flush, NULL, 1); // Sends data from the buffer
	protocol_send_list_add_callback_reg(protocol_send_success_callback);

  soft_timer_register(toggle_led_C, NULL, 1000); /* TESTING */

  protocol_rcv_cmd_register(CMD_SET_CHASSIS_SPEED, ros_callback); /* TESTING */
/* TESTING */
  chassis_t pchassis = NULL;

  pchassis = chassis_find("chassis");

  soft_timer_register(chassis_push_info, (void *)pchassis, 100);
/* TESTING */
  while (1)
  {
    osEvent event; 
    event = osSignalWait(SEND_PROTOCOL_SIGNAL | RECV_PROTOCOL_SIGNAL, osWaitForever);
    if (event.status == osEventSignal)
    {
      if (event.value.signals & SEND_PROTOCOL_SIGNAL)
      {
       protocol_send_flush();
       HAL_GPIO_WritePin(LED_D_GPIO_Port, LED_D_Pin, GPIO_PIN_SET);
      }

      if (event.value.signals == RECV_PROTOCOL_SIGNAL)
      {
        protocol_unpack_flush();
        HAL_GPIO_WritePin(LED_E_GPIO_Port, LED_E_Pin, GPIO_PIN_SET);
      }
    }
	  osDelay(1);
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
