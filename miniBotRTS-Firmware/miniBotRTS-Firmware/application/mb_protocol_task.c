#include "mb_protocol_task.h"
#include "mb_protocol/mb_protocol.h"
#include <stdint.h>

uint8_t waiting4master = 1;

void usb_send(int32_t data) {
  uint8_t buf[4];
  int32_to_bytes(data, buf, 0);
  force_send(buf, 4);
  // usb_vcp_tx_write_fifo(buf, sizeof(buf));
}

static int32_t usb_rcv_callback(uint8_t *buf, uint32_t len) {
  if (waiting4master == 1) {
    waiting4master = 0;
    process_request(buf);
  }
  return 0;
}

void mb_protocol_task(void const *argument) {
  usb_vcp_init(true);
  usb_vcp_rx_callback_register(usb_rcv_callback);
  // soft_timer_register(usb_tx_flush_run, NULL, 1);

  for (;;) {
    if (waiting4master == 0) {
      usb_send(get_response());
      waiting4master = 1;
    } else {
      osDelay(1);
    }
  }
}