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

/* Includes ------------------------------------------------------------------*/
#include "protocol.h"
#include "protocol_transmit.h"
#include "protocol_cfg.h"
#include "protocol_log.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/

boardcast_object_t boardcast_object;
local_info_t protocol_local_info =
    {
        .is_valid = 0};

/* Private function prototypes -----------------------------------------------*/
/* Exported functions --------------------------------------------------------*/

struct send_cmd_info *protocol_get_send_cmd_info(uint16_t cmd)
{
  for (int i = 0; i < PROTOCOL_CMD_MAX_NUM; i++)
  {
    if ((protocol_local_info.send_cmd_info[i].cmd == cmd) && (protocol_local_info.send_cmd_info[i].used == 1))
    {
      return &protocol_local_info.send_cmd_info[i];
    }
  }
  return NULL;
}

static void protocol_rcv_pack_handle(uint8_t *pack_data, uint16_t cmd, uint8_t session, uint8_t source_add)
{
  protocol_pack_desc_t *pack;
  uint16_t rcv_seq;
  int32_t err;
  rcv_seq = pack->seq_num;
  pack = (protocol_pack_desc_t *)(pack_data);

  for (int i = 0; i < PROTOCOL_CMD_MAX_NUM; i++)
  {
    if ((protocol_local_info.rcv_cmd_info[i].cmd == cmd) && (protocol_local_info.rcv_cmd_info[i].rcv_callback != NULL) && (protocol_local_info.rcv_cmd_info[i].used == 1))
    {
      err = protocol_local_info.rcv_cmd_info[i].rcv_callback(pack->pdata + 2, pack->data_len - PACK_HEADER_TAIL_LEN);
      if (session != 0)
      {
        protocol_ack(source_add, session, &err, sizeof(err), rcv_seq);
      }
    }
  }

  return;
}

int32_t protocol_rcv_cmd_register(uint16_t cmd, rcv_handle_fn_t rcv_callback)
{
  for (int i = 0; i < PROTOCOL_CMD_MAX_NUM; i++)
  {
    if (protocol_local_info.rcv_cmd_info[i].used == 0)
    {
      protocol_local_info.rcv_cmd_info[i].used = 1;
      protocol_local_info.rcv_cmd_info[i].cmd = cmd;
      protocol_local_info.rcv_cmd_info[i].rcv_callback = rcv_callback;
      return 0;
    }
  }
  PROTOCOL_ERR_INFO_PRINTF(PROTOCOL_ERR_REGISTER_FAILED, __FILE__, __LINE__);
  return -1;
}

int32_t protocol_send_cmd_config(uint16_t cmd,
                                 uint8_t resend_times,
                                 uint16_t resend_timeout,
                                 uint8_t ack_enable,
                                 ack_handle_fn_t ack_callback,
                                 no_ack_handle_fn_t no_ack_callback)
{
  for (int i = 0; i < PROTOCOL_CMD_MAX_NUM; i++)
  {
    if (protocol_local_info.send_cmd_info[i].used == 0)
    {
      protocol_local_info.send_cmd_info[i].used = 1;
      protocol_local_info.send_cmd_info[i].cmd = cmd;
      protocol_local_info.send_cmd_info[i].resend_times = resend_times;
      protocol_local_info.send_cmd_info[i].resend_timeout = resend_timeout;
      protocol_local_info.send_cmd_info[i].ack_enable = ack_enable;
      protocol_local_info.send_cmd_info[i].ack_callback = ack_callback;
      protocol_local_info.send_cmd_info[i].no_ack_callback = no_ack_callback;
      return 0;
    }
  }
  PROTOCOL_ERR_INFO_PRINTF(PROTOCOL_ERR_REGISTER_FAILED, __FILE__, __LINE__);
  return -1;
}

int32_t protocol_rcv_cmd_unregister(uint16_t cmd)
{
  for (int i = 0; i < PROTOCOL_CMD_MAX_NUM; i++)
  {
    if ((protocol_local_info.rcv_cmd_info[i].cmd == cmd) && (protocol_local_info.rcv_cmd_info[i].used == 1))
    {
      protocol_local_info.rcv_cmd_info[i].used = 0;
      return 0;
    }
  }
  return -1;
}

int32_t protocol_send_cmd_unregister(uint16_t cmd)
{
  for (int i = 0; i < PROTOCOL_CMD_MAX_NUM; i++)
  {
    if ((protocol_local_info.send_cmd_info[i].cmd == cmd) && (protocol_local_info.send_cmd_info[i].used == 1))
    {
      protocol_local_info.send_cmd_info[i].used = 0;
      return 0;
    }
  }
  return -1;
}

/**
  /**
    * @brief  Protocol local information initialization function
    * @param  address  Protocol local address, which cannot be changed after initialization. Each device in the same network has a unique address.
    * @retval Protocol return status
    */

uint32_t protocol_local_init(uint8_t address)
{

  uint32_t status;

  status = PROTOCOL_SUCCESS;

  // Check if it is a little-endian machine
  const uint16_t endian_test = 0xAABB;
  if (*((uint8_t *)(&endian_test)) == 0xAA)
  {
    // It is big-endian mode
    status = PROTOCOL_ERR_UNSUPPORT_CPU;
    PROTOCOL_ERR_INFO_PRINTF(status, __FILE__, __LINE__);

    while (1)
      ;
  }

  MUTEX_INIT(protocol_local_info.mutex_lock);
  
  memset(protocol_local_info.route_table, 0xFF, PROTOCOL_ROUTE_TABLE_MAX_NUM);
	
	for(int i; i < PROTOCOL_INTERFACE_MAX; i++)
	{
		/* initalization user data is 0xFF */
		memset(&protocol_local_info.interface[i].user_data, 0xFF, sizeof(union interface_user_data));
	}

  for(int i; i < PROTOCOL_CMD_MAX_NUM; i++)
	{
		/* initalization cmd is 0xFF */
		memset(&protocol_local_info.send_cmd_info[i].cmd, 0xFFFF, 2);
    memset(&protocol_local_info.rcv_cmd_info[i].cmd, 0xFFFF, 2);
	}

  protocol_local_info.address = address;
  protocol_local_info.rcv_nor_callBack = protocol_rcv_pack_handle;

  MUTEX_INIT(boardcast_object.mutex_lock);
  INIT_LIST_HEAD(&boardcast_object.send_list_header);
  boardcast_object.is_valid = 1;
  protocol_local_info.is_valid = 1;
  PROTOCOL_OTHER_INFO_PRINTF("Local info has been initialized.");

  return status;
}

/**
  /**
    * @brief  Protocol sends a normal frame.
    * @param  reciver Receiver device address
    *         session Session number, ranging from 0 to 63. When session is 0, no Ack is required from the receiver, otherwise Ack is required. The same receiver device cannot have two identical session numbers at the same time.
    *         cmd Command value
    *         p_data Pointer to the data to be sent
    *         data_len Length of the data to be sent
    * @retval Protocol return status
    */

uint32_t protocol_send(uint8_t reciver, uint16_t cmd, void *p_data, uint32_t data_len)
{
  uint32_t status;
  uint8_t session = 0;
  uint8_t ack = 0;

  struct send_cmd_info *cmd_info;
  cmd_info = protocol_get_send_cmd_info(cmd);
  
  struct perph_interface *int_obj;
  int_obj = protocol_s_get_route(reciver);
  
  if (cmd_info != NULL)
  {
    ack = cmd_info->ack_enable;
  }

  if (reciver == PROTOCOL_BROADCAST_ADDR)
  {
    status = protocol_s_broadcast_add_node(p_data, data_len, cmd);
  }
  else
  {
    if (ack == 1)
    {
      session = protocol_get_session(int_obj);
    }
    status = protocol_s_add_sendnode(reciver, session, PROTOCOL_PACK_NOR, p_data,
                                     data_len, cmd, 0);
  }
  if (status == PROTOCOL_SUCCESS)
  {
    if (protocol_local_info.send_list_add_callBack != NULL)
    {
      protocol_local_info.send_list_add_callBack();
    }
  }
  else
  {
    if (ack == 1)
    {
      protocol_release_session(int_obj, session);
    }
  }
  return status;
}

/**
  /**
    * @brief  Protocol sends an Ack frame. This function should be called to reply with an Ack after receiving a normal frame with a non-zero session.
    * @param  reciver Receiver device address
    *         session Session number, ranging from 0 to 63. When session is 0, no Ack is required from the receiver, otherwise Ack is required. The same receiver device cannot have two identical session numbers at the same time.
    *         p_data Pointer to the data to be sent
    *         data_len Length of the data to be sent
    *         ack_seq Sequence number of the Ack packet to be sent
    * @retval Protocol return status
  */

uint32_t protocol_ack(uint8_t reciver, uint8_t session, void *p_data, uint32_t data_len, uint16_t ack_seq)
{
  uint32_t status;
  status = protocol_s_add_sendnode(reciver, session, PROTOCOL_PACK_ACK, p_data,
                                   data_len, 0, ack_seq);
  if (status == PROTOCOL_SUCCESS)
  {
    if (protocol_local_info.send_list_add_callBack != NULL)
    {
      protocol_local_info.send_list_add_callBack();
    }
  }
  return status;
}

/**
  /**
    * @brief Flushes the send list, calling this function will send the data in the send list. Call after calling protocol_send or protocol_ack, or call periodically.
    * @param void
    * @retval Protocol return status
  */

uint32_t protocol_send_flush(void)
{
  for (uint8_t i = 0; i < PROTOCOL_INTERFACE_MAX; i++)
  {
    if (protocol_local_info.interface[i].is_valid)
    {
      if (protocol_local_info.interface[i].send.normal_node_num > 0)
      {
        protocol_s_interface_normal_send_flush(protocol_local_info.interface + i);
      }
      if (protocol_local_info.interface[i].send.ack_node_num > 0)
      {
        protocol_s_interface_ack_send_flush(protocol_local_info.interface + i);
      }
    }
  }

  if (boardcast_object.is_valid)
  {
    if (boardcast_object.send_node_num > 0)
    {
      protocol_s_broadcast_send_flush();
    }
  }
  return 0;
}

/**
  /**
    * @brief  Protocol flushes the receive buffer, calling this function will unpack the data in the receive buffer. Call after receiving data or periodically.
    * @param  void
    * @retval Protocol return status
    */

uint32_t protocol_unpack_flush(void)
{
  for (uint8_t i = 0; i < PROTOCOL_INTERFACE_MAX; i++)
  {
    if (protocol_local_info.interface[i].is_valid)
    {
      protocol_s_extract(&(protocol_local_info.interface[i]));
    }
  }
  return 0;
}

/**
  /**
    * @brief  Protocol receives data, used when receiving data, such as in interrupt functions for serial communication.
    * @param  p_data Pointer to the received data
    *         data_len Length of the received data
    *         interface Interface index, specify the index of the interface where the data is received
    * @retval Protocol return status
    */

uint32_t protocol_rcv_data(void *p_data, uint32_t data_len, struct perph_interface *perph)
{
  FIFO_CPU_SR_TYPE cpu_sr;
  struct perph_interface *obj;
  uint32_t rcv_length;
  uint32_t status;

  //Interrupt Off;
  cpu_sr = FIFO_GET_CPU_SR();
  FIFO_ENTER_CRITICAL();
  
  status = PROTOCOL_SUCCESS;

  if (protocol_local_info.is_valid == 0)
  {
    status = PROTOCOL_ERR_PROTOCOL_NOT_INIT;
    //Interrupt On
    FIFO_RESTORE_CPU_SR(cpu_sr);
    return status;
  }

  obj = &(protocol_local_info.interface[perph->idx]);

  //TODO: remove the protection here because its considered that this function is not reentrant for the same protocol interface, and it requires careful consideration.
  //Adding protection, high-speed transmission may still have nested reentry.
  rcv_length = fifo_s_puts_noprotect(&(obj->rcvd.fifo), p_data, data_len);

  if (rcv_length < data_len)
  {
    status = PROTOCOL_ERR_FIFO_FULL;
    PROTOCOL_ERR_INFO_PRINTF(status, __FILE__, __LINE__);
  }
  //Interrupt On
  FIFO_RESTORE_CPU_SR(cpu_sr);
  return status;
}

/**
  /**
    * @brief  Protocol registers the callback function for adding the send packet to the send list. This function is called after the protocol data packet is packed and added to the send list.
    * @param  fn Callback function pointer, format refers to pack_handle_fn_t
    * @retval 0
    */
   
uint32_t protocol_send_list_add_callback_reg(void_fn_t fn)
{
  protocol_local_info.send_list_add_callBack = fn;
  return 0;
}
