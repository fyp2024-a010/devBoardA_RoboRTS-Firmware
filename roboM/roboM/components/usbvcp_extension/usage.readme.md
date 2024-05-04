To use this, please modify:

1. Add this line on usbd_cdc_if.h :
#include "usbvcp_extension.h"

2. Replace CDC_Receive_FS and CDC_Transmit_FS implementation on usbd_cdc_if.c, to :

static int8_t CDC_Receive_FS(uint8_t* Buf, uint32_t *Len)
{
  /* USER CODE BEGIN 6 */
  usb_vcp_receive_processing(Buf, Len);
  return (USBD_OK);
  /* USER CODE END 6 */
}

uint8_t CDC_Transmit_FS(uint8_t* Buf, uint16_t Len)
{
  uint8_t result = USBD_OK;
  /* USER CODE BEGIN 7 */
  result = usb_vcp_transmit_processing(Buf, Len);
  /* USER CODE END 7 */
  return result;
}

//original
/* uint8_t CDC_Transmit_FS(uint8_t* Buf, uint16_t Len)
{
  uint8_t result = USBD_OK;
  /* USER CODE BEGIN 7 */
  USBD_CDC_HandleTypeDef *hcdc = (USBD_CDC_HandleTypeDef*)hUsbDeviceFS.pClassData;
  if (hcdc->TxState != 0){
    return USBD_BUSY;
  }
  USBD_CDC_SetTxBuffer(&hUsbDeviceFS, Buf, Len);
  result = USBD_CDC_TransmitPacket(&hUsbDeviceFS);
  /* USER CODE END 7 */
  return result;
}*/


3. Someone has to implement calling for usb_vcp_initialization.
This is not automatically called b CDC_Init_FS because flush_task creation is preferably not called inside interrupt ISR

void test_usb_vcp_init(void) {
  _usb_vcp_use_fifo = true;
  usb_vcp_init();
  usb_vcp_rx_callback_register(usb_rcv_callback_test_echo);
}