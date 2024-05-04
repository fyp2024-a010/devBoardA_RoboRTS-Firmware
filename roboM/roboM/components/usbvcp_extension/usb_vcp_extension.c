//File: usb_vcp_extension.c
//Description: File extension for custom implementation of usbd_cdc_if.c, so we do not need to keep modifying that file
//To forward receive_fs callback to external function.
//Either support default usbd_cdc_if implementation or using fifo.
//
//Author: hstju. With sample implementation from robomaster
//Last edit: 21 Mar 2024
//Requirement: CMSIS_V1, <fill other component requirement here>

#include "usb_vcp_extension.h"


// Instantiate variables
bool _usb_tx_busy = false;
bool _usb_tx_need_flushing = false;

bool _usb_vcp_use_fifo = true;
fifo_s_t usb_tx_fifo;
uint8_t usb_tx_fifo_buff[APP_TX_DATA_SIZE];
static usb_vcp_call_back_f usb_vcp_call_back[USB_REC_MAX_NUM];

static bool _fifo_flush_running = false;

/**
 * @brief Initializes the USB Virtual COM Port (VCP).
 * 
 * This function initializes the USB VCP by setting up the transmit (TX) FIFO buffer
 * and starting the FIFO thread if it is not already running.
 * 
 * @note This function should be called before using the USB VCP.
 */
void usb_vcp_init(void) {
  if (_usb_vcp_use_fifo) {
    fifo_s_init(&usb_tx_fifo, usb_tx_fifo_buff, 4096);
    if (!_fifo_flush_running) {
    tx_flush_init(); // Run Fifo thread here.
        _fifo_flush_running = true;
    }
  }
}

/**
 * @brief Processes the received USB VCP data.
 *
 * This function is responsible for processing the received USB VCP data. It calls the registered callback functions for each received data packet. It also sets the receive buffer and initiates a new receive packet.
 *
 * @param Buf Pointer to the received data buffer.
 * @param Len Pointer to the length of the received data.
 */
void usb_vcp_receive_processing(uint8_t* Buf, uint32_t *Len) {
  for (int i = 0; i < USB_REC_MAX_NUM; i++) {
    if(usb_vcp_call_back[i] != NULL) {
      (*usb_vcp_call_back[i])(Buf, *Len);
    }
  }

  USBD_CDC_SetRxBuffer(&hUsbDeviceFS, &Buf[0]);
  USBD_CDC_ReceivePacket(&hUsbDeviceFS);
  return;
}


int8_t usb_vcp_transmit_callback_processing(uint8_t *Buf, uint32_t *Len) { // This function may not really work
//  //Untested so commented out to prevent issue.
//  if (_usb_tx_need_flushing) {
//	usb_tx_flush(NULL);
//  }
  return USBD_OK;
}

/**
 * @brief Processes the transmission of data over USB VCP.
 *
 * This function is responsible for processing the transmission of data over USB VCP.
 * It checks if the FIFO is being used and calls the appropriate transmit processing function.
 * If the FIFO is being used, it calls the `transmit_processing_robomaster_fifo` function.
 * If the FIFO is not being used, it calls the `transmit_processing_stm32_default` function.
 *
 * @param Buf Pointer to the buffer containing the data to be transmitted.
 * @param Len Length of the data to be transmitted.
 * @return The status of the transmission process.
 *         - 0: Success.
 *         - Non-zero: Error occurred during transmission.
 */
uint8_t usb_vcp_transmit_processing(uint8_t* Buf, uint16_t Len) {
  if (_usb_vcp_use_fifo) {
	  return transmit_processing_robomaster_fifo(Buf, Len);
  }
  return transmit_processing_stm32_default(Buf, Len); // any other case
}

/**
 * @brief Transmits data over USB Virtual COM Port (VCP).
 *
 * This function is responsible for transmitting data over the USB VCP.
 * It checks if the transmission is already in progress and returns USBD_BUSY if it is.
 * Otherwise, it sets the transmit buffer and length, and calls the USBD_CDC_TransmitPacket function
 * to initiate the transmission.
 *
 * @param Buf Pointer to the data buffer to be transmitted.
 * @param Len Length of the data buffer.
 * @return USBD_OK if the transmission is successful, USBD_BUSY if the transmission is already in progress.
 */
uint8_t transmit_processing_stm32_default (uint8_t* Buf, uint16_t Len) {
  uint8_t result = USBD_OK;
  /* USER CODE BEGIN 7 */
  USBD_CDC_HandleTypeDef *hcdc = (USBD_CDC_HandleTypeDef*)hUsbDeviceFS.pClassData;
  if (hcdc->TxState != 0) {
    return USBD_BUSY;
  }

  USBD_CDC_SetTxBuffer(&hUsbDeviceFS, Buf, Len);
  result = USBD_CDC_TransmitPacket(&hUsbDeviceFS);

  //Tried but no effect
  //PCD_HandleTypeDef *hpcd = hUsbDeviceFS.pData;
  //USB_FlushTxFifo(hpcd->Instance, 0x15U);
  //USB_FlushRxFifo(hpcd->Instance);
  return result;
}


/**
 * @brief Writes data to the USB virtual COM port (VCP) transmit FIFO.
 *
 * This function writes the specified data buffer to the transmit FIFO of the USB VCP.
 * If the length of the data is greater than zero, the data is added to the FIFO and the
 * USB transmit flushing flag is set to indicate that the data needs to be flushed.
 *
 * @param Buf Pointer to the data buffer to be written.
 * @param Len Length of the data buffer in bytes.
 */
void usb_vcp_tx_write_fifo(uint8_t* Buf, uint16_t Len) {
  if (Len > 0) {
    fifo_s_puts(&usb_tx_fifo, (char*)Buf, Len);
    set_usb_tx_need_flushing(true);
  }
  return;
}

/**
 * @brief Transmits data from a buffer to the USB virtual COM port (VCP) FIFO.
 * 
 * This function takes a buffer and its length as input and puts the data into the USB transmit FIFO.
 * It then flushes the transmit FIFO to initiate the transmission.
 * 
 * @param Buf Pointer to the buffer containing the data to be transmitted.
 * @param Len Length of the data in the buffer.
 * @return USBD_OK if the transmission is successful.
 */
uint8_t transmit_processing_robomaster_fifo (uint8_t* Buf, uint16_t Len) {
  fifo_s_puts(&usb_tx_fifo, (char*)Buf, Len);
  usb_tx_flush(NULL);
  return USBD_OK;
}

/**
 * @brief Registers a callback function for USB VCP (Virtual COM Port) receive events.
 *
 * This function registers a callback function to be called when data is received through the USB VCP.
 * The callback function should have the following signature: void callback_function(uint8_t *data, uint32_t length).
 * The callback function will be called with the received data and its length as parameters.
 *
 * @param fun The callback function to be registered.
 * @return USBD_OK if the callback function was successfully registered, USBD_FAIL otherwise.
 */
int32_t usb_vcp_rx_callback_register(usb_vcp_call_back_f fun) {
  for (int i = 0; i < USB_REC_MAX_NUM; i++) {
    if(usb_vcp_call_back[i] == NULL) {
      usb_vcp_call_back[i] = fun;
      return USBD_OK;
    }
  }
  return USBD_FAIL;
}

/**
 * @brief Sets the flag indicating whether USB transmission needs flushing.
 *
 * This function sets the internal flag `_usb_tx_need_flushing` to the specified value.
 * The flag is used to determine whether the USB transmission buffer needs to be flushed.
 *
 * @param value The value to set the flag to.
 */
void set_usb_tx_need_flushing (bool value) {
  FIFO_CPU_SR_TYPE cpu_sr = FIFO_GET_CPU_SR(); // todo Change to your own mutex here
  FIFO_ENTER_CRITICAL();
    _usb_tx_need_flushing = value;
  FIFO_RESTORE_CPU_SR(cpu_sr);
}

/**
 * @brief Flushes the USB transmit (Tx) buffer.
 *
 * This function flushes the USB transmit buffer by transmitting the data
 * stored in the buffer to the USB host. If the transmit state is not idle,
 * indicating that a transmission is already in progress, the function returns
 * USBD_BUSY. Otherwise, it retrieves the data from the transmit FIFO, sets the
 * transmit buffer and size, and initiates the transmission using the USB CDC
 * (Communication Device Class) interface.
 *
 * @param argc Pointer to additional arguments (not used in this function).
 * @return USBD_OK if the transmission is initiated successfully, USBD_BUSY if
 * the transmit state is not idle, or an error code if the transmission fails.
 */
int32_t usb_tx_flush(void* argc) {
  uint8_t result = USBD_OK;
  USBD_CDC_HandleTypeDef *hcdc = (USBD_CDC_HandleTypeDef*)hUsbDeviceFS.pClassData;

  if (hcdc->TxState != 0) {
    set_usb_tx_need_flushing(true);
    return USBD_BUSY;
  } else {
    set_usb_tx_need_flushing(false);
    uint32_t send_num;

    FIFO_CPU_SR_TYPE cpu_sr = FIFO_GET_CPU_SR();
    FIFO_ENTER_CRITICAL();
    send_num = usb_tx_fifo.used_num;
    fifo_s_gets_noprotect(&usb_tx_fifo, (char*)UserTxBufferFS, send_num);
    FIFO_RESTORE_CPU_SR(cpu_sr);

    USBD_CDC_SetTxBuffer(&hUsbDeviceFS, UserTxBufferFS, send_num);
    result = USBD_CDC_TransmitPacket(&hUsbDeviceFS);
    return result;
  }
}

/**
 * @brief Initializes the tx_flush task.
 * 
 * This function creates a new thread for the tx_flush_task with the specified priority and stack size.
 * 
 * @note This function should be called before using the tx_flush_task.
 */
osThreadId _handle_tx_flush;

void tx_flush_init(void) {
  osThreadDef(txFlushTask, tx_flush_task, osPriorityLow, 0, 128);
  _handle_tx_flush = osThreadCreate(osThread(txFlushTask), NULL);
}

/**
 * @brief Task function to flush USB transmit buffer.
 * 
 * This task continuously checks if the USB transmit buffer needs flushing and calls the usb_tx_flush() function if necessary.
 * It uses a delay of 10 milliseconds between each check.
 * 
 * @param argument Pointer to the task argument (not used in this function).
 */
void tx_flush_task(void const *argument)
{
  while (1) {
    if (_usb_tx_need_flushing) {
      usb_tx_flush(NULL);
    }
    osDelay(10); //ms
  }
}
