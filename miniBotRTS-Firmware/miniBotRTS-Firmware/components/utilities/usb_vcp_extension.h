//File: usbvcp_extension.h
//Description: File extension for custom implementation of usbd_cdc_if.c, so we do not need to keep modifying that file
//To forward receive_fs callback to external function.
//Either support default usbd_cdc_if implementation or using fifo.
//
//Author: hstju. With sample implementation from robomaster
//Last edit: 21 Mar 2024
//Requirement: CMSIS_V1, <fill other component requirement here>

#ifndef __USB_VCP_EXTENSION_H_
#define __USB_VCP_EXTENSION_H_

#include <stdbool.h>
#include "usbd_cdc.h"
#include "usb_device.h"
#include "fifo.h"

#define USB_REC_MAX_NUM 5
//#define APP_RX_DATA_SIZE  2048
#ifndef APP_TX_DATA_SIZE
#define APP_TX_DATA_SIZE  4096
#endif /* APP_TX_DATA_SIZE */

typedef int32_t(*usb_vcp_call_back_f)(uint8_t *buf, uint32_t len);

extern bool _usb_vcp_use_fifo;
extern bool _usb_tx_busy;
extern bool _usb_tx_need_flushing;
extern fifo_s_t usb_tx_fifo;
extern uint8_t usb_tx_fifo_buff[APP_TX_DATA_SIZE];
//static usb_vcp_call_back_f usb_vcp_call_back[USB_REC_MAX_NUM]; // No need to declare static in header
extern USBD_HandleTypeDef hUsbDeviceFS;
extern uint8_t UserTxBufferFS[];

extern void usb_vcp_init(bool use_fifo);
extern void usb_vcp_receive_processing(uint8_t* Buf, uint32_t *Len);
extern uint8_t usb_vcp_transmit_processing(uint8_t* Buf, uint16_t Len);
extern int8_t usb_vcp_transmit_callback_processing(uint8_t *Buf, uint32_t *Len);

extern int32_t usb_vcp_rx_callback_register(usb_vcp_call_back_f fun);
extern int32_t usb_tx_flush(void* argc);
extern int32_t usb_tx_flush_run(void *argc);

extern uint8_t transmit_processing_stm32_default (uint8_t* Buf, uint16_t Len);
extern uint8_t transmit_processing_robomaster_fifo (uint8_t* Buf, uint16_t Len);
extern void usb_vcp_tx_write_fifo(uint8_t* Buf, uint16_t Len);


extern void set_usb_tx_need_flushing (bool value);

// RTOS enablement
#include "main.h"
#include "cmsis_os.h"
extern osThreadId _handle_tx_flush;

extern void tx_flush_init(void);
extern void tx_flush_task(void const *argument);

#endif /* __USB_VCP_EXTENSION_H_ */

