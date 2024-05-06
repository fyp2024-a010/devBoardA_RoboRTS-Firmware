// File: usb_vcp_extension.c
// Description: File extension for custom implementation of usbd_cdc_if.c, so we
// do not need to keep modifying that file To forward receive_fs callback to
// external function. Either support default usbd_cdc_if implementation or using
// fifo.
//
// Author: hstju. With sample implementation from robomaster
// Last edit: 21 Mar 2024
// Requirement: CMSIS_V1, <fill other component requirement here>

#include "usb_vcp_extension.h"

// Instantiate variables
bool _usb_tx_busy = false;
bool _usb_tx_need_flushing = false;

bool _usb_vcp_use_fifo = true;
fifo_s_t usb_tx_fifo;
uint8_t usb_tx_fifo_buff[APP_TX_DATA_SIZE];
static usb_vcp_call_back_f usb_vcp_call_back[USB_REC_MAX_NUM];

static bool _fifo_flush_running = false;

void usb_vcp_init(bool use_fifo) {
  if (use_fifo) {
    _usb_vcp_use_fifo = true;
  } else {
    _usb_vcp_use_fifo = false;
  }
  if (_usb_vcp_use_fifo) {
    fifo_s_init(&usb_tx_fifo, usb_tx_fifo_buff, 4096);
    if (!_fifo_flush_running) {
      // tx_flush_init(); // Run Fifo thread here.
      _fifo_flush_running = true;
    }
  }
}

void usb_vcp_receive_processing(uint8_t *Buf, uint32_t *Len) {
  for (int i = 0; i < USB_REC_MAX_NUM; i++) {
    if (usb_vcp_call_back[i] != NULL) {
      (*usb_vcp_call_back[i])(Buf, *Len);
    }
  }
  USBD_CDC_SetRxBuffer(&hUsbDeviceFS, &Buf[0]);
  USBD_CDC_ReceivePacket(&hUsbDeviceFS);
  return;
}

int8_t usb_vcp_transmit_callback_processing(
    uint8_t *Buf, uint32_t *Len) { // This function may not really work
  //  //Untested so commented out to prevent issue.
  //  if (_usb_tx_need_flushing) {
  //	usb_tx_flush(NULL);
  //  }
  return USBD_OK;
}

uint8_t usb_vcp_transmit_processing(uint8_t *Buf, uint16_t Len) {
  if (_usb_vcp_use_fifo) {
    return transmit_processing_robomaster_fifo(Buf, Len);
  }
  return transmit_processing_stm32_default(Buf, Len); // any other case
}

uint8_t transmit_processing_stm32_default(uint8_t *Buf, uint16_t Len) {
  uint8_t result = USBD_OK;
  USBD_CDC_HandleTypeDef *hcdc =
      (USBD_CDC_HandleTypeDef *)hUsbDeviceFS.pClassData;
  if (hcdc->TxState != 0) {
    return USBD_BUSY;
  }
  USBD_CDC_SetTxBuffer(&hUsbDeviceFS, Buf, Len);
  result = USBD_CDC_TransmitPacket(&hUsbDeviceFS);
  return result;
}

void usb_vcp_tx_write_fifo(uint8_t *Buf, uint16_t Len) {
  if (Len > 0) {
    fifo_s_puts(&usb_tx_fifo, (char *)Buf, Len);
    set_usb_tx_need_flushing(true);
  }
  return;
}

uint8_t transmit_processing_robomaster_fifo(uint8_t *Buf, uint16_t Len) {
  fifo_s_puts(&usb_tx_fifo, (char *)Buf, Len);
  usb_tx_flush(NULL);
  return USBD_OK;
}

int32_t usb_vcp_rx_callback_register(usb_vcp_call_back_f fun) {
  for (int i = 0; i < USB_REC_MAX_NUM; i++) {
    if (usb_vcp_call_back[i] == NULL) {
      usb_vcp_call_back[i] = fun;
      return USBD_OK;
    }
  }
  return USBD_FAIL;
}

void set_usb_tx_need_flushing(bool value) {
  FIFO_CPU_SR_TYPE cpu_sr =
      FIFO_GET_CPU_SR(); // todo Change to your own mutex here
  FIFO_ENTER_CRITICAL();
  _usb_tx_need_flushing = value;
  FIFO_RESTORE_CPU_SR(cpu_sr);
}

int32_t usb_tx_flush(void *argc) {
  uint8_t result = USBD_OK;
  USBD_CDC_HandleTypeDef *hcdc =
      (USBD_CDC_HandleTypeDef *)hUsbDeviceFS.pClassData;

  if (hcdc->TxState != 0) {
    set_usb_tx_need_flushing(true);
    return USBD_BUSY;
  } else {
    set_usb_tx_need_flushing(false);
    uint32_t send_num;

    FIFO_CPU_SR_TYPE cpu_sr = FIFO_GET_CPU_SR();
    FIFO_ENTER_CRITICAL();
    send_num = usb_tx_fifo.used_num;
    fifo_s_gets_noprotect(&usb_tx_fifo, (char *)UserTxBufferFS, send_num);
    FIFO_RESTORE_CPU_SR(cpu_sr);

    USBD_CDC_SetTxBuffer(&hUsbDeviceFS, UserTxBufferFS, send_num);
    result = USBD_CDC_TransmitPacket(&hUsbDeviceFS);
    return result;
  }
}

int32_t usb_tx_flush_run(void *argc) {
  if (_usb_tx_need_flushing) {
    usb_tx_flush(NULL);
  }
  return 0;
}

void force_send(uint8_t *Buf, uint16_t Len) {
  USBD_CDC_HandleTypeDef *hcdc =
      (USBD_CDC_HandleTypeDef *)hUsbDeviceFS.pClassData;
  USBD_CDC_SetTxBuffer(&hUsbDeviceFS, Buf, Len);
  USBD_CDC_TransmitPacket(&hUsbDeviceFS);
}

// osThreadId _handle_tx_flush;
// void tx_flush_init(void) {
//   osThreadDef(txFlushTask, tx_flush_task, osPriorityLow, 0, 128);
//   _handle_tx_flush = osThreadCreate(osThread(txFlushTask), NULL);
// }

// // Follow tasks function signature
// void tx_flush_task(void const *argument) {
//   while (1) {
//     if (_usb_tx_need_flushing) {
//       usb_tx_flush(NULL);
//     }
//     osDelay(10); // ms
//   }
// }
