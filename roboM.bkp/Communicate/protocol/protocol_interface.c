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

/*
protocol_interface.c is part of a communication protocol interface, which is used to handle data transmission and 
reception. It includes the initialization of the protocol interface, the registration of the protocol interface, the 
sending of data, the reception of data, and the setting of the route. Each protocol interface corresponds to a unique 
protocol interface object, such as a single serial port or a pair of CAN addresses.
*/


#include "protocol.h"
#include "protocol_common.h"
#include "protocol_transmit.h"
#include "protocol_log.h"

extern local_info_t protocol_local_info;

/**
  /**
   * @brief  Protocol interface initialization function. Each actual interface corresponds to a protocol interface object, such as a single serial port or a pair of CAN addresses.
   * @param  interface_idx Interface index, each interface corresponds to a unique interface index, with a maximum value not exceeding PROTOCOL_INTERFACE_MAX.
   *         interface_name Interface name, string length should not exceed PROTOCOL_OBJ_NAME_MAX_LEN.
   *         rcv_buf_size Receive buffer capacity, receive buffer memory is allocated from the heap.
   *         boardcast_output_enable Whether the interface sends broadcast packets.
   *         send_fn Interface send function pointer, refer to send_fn_t.
   * @retval Protocol return status.
  */
int32_t protocol_interface_init(struct perph_interface *perph,
                                char *interface_name,
                                uint8_t boardcast_output_enable,
                                uint16_t rcv_buf_size)
{
  struct perph_interface *interface;

  uint32_t status;
  int32_t idx = PROTOCOL_INTERFACE_MAX;

  status = PROTOCOL_SUCCESS;

  for (int i = 0; i < PROTOCOL_INTERFACE_MAX; i++)
  {
    if (protocol_local_info.interface[i].is_valid == 0)
    {
      idx = i;
      break;
    }
  }

  if (idx == PROTOCOL_INTERFACE_MAX)
  {
    //TODO:Exceed index length
    status = PROTOCOL_ERR_OBJECT_NOT_FOUND;
    PROTOCOL_ERR_INFO_PRINTF(status, __FILE__, __LINE__);
    return status;
  }

  interface = &protocol_local_info.interface[idx];
  
  memcpy(interface, perph, sizeof(struct perph_interface));

  // Initialize the name
  if ((interface_name != NULL) && (strlen(interface_name) < PROTOCOL_OBJ_NAME_MAX_LEN))
  {
    strncpy(interface->object_name, (const char *)interface_name, sizeof(interface->object_name));
    interface->object_name[PROTOCOL_OBJ_NAME_MAX_LEN - 1] = '\0';
  }
  else
  {
    strcpy(interface->object_name, "NULL");
  }

  // Initialize the receive buffer
  uint8_t *rcv_buf = protocol_p_malloc(rcv_buf_size);
  if (rcv_buf == NULL)
  {
    status = PROTOCOL_ERR_NOT_ENOUGH_MEM;
    PROTOCOL_ERR_INFO_PRINTF(status, __FILE__, __LINE__);
    return status;
  }
  fifo_s_init(&interface->rcvd.fifo, rcv_buf, rcv_buf_size);

  // Initialize the send structure
  INIT_LIST_HEAD(&interface->send.normal_list_header);
  INIT_LIST_HEAD(&interface->send.ack_list_header);
  MUTEX_INIT(interface->send.mutex_lock);

  interface->broadcast_output_enable = boardcast_output_enable;
  interface->idx = idx;
  interface->is_valid = 1;

  PROTOCOL_OTHER_INFO_PRINTF("Interface %s[%d] has been initialized.",
                             interface->object_name, interface->idx);

  return status;
}

/*
The protocol_can_interface_register and protocol_uart_interface_register functions are used to register a CAN interface 
and a UART interface respectively. They prepare a perph_interface structure and call the protocol_interface_init 
function to initialize the interface.
*/

int32_t protocol_can_interface_register(char *interface_name,
                                        uint16_t rcv_buf_size,
                                        uint8_t boardcast_output_enable,
                                        uint8_t can_port,
                                        uint32_t can_tx_id,
                                        uint32_t can_rx_id,
                                        int32_t (*can_send_fn)(uint32_t std_id, uint8_t *p_data, uint32_t len))
{
  struct perph_interface interface = {0};
  uint32_t status;
  status = PROTOCOL_SUCCESS;

  interface.type = CAN_PORT;
  interface.send_callback.can_send_fn = can_send_fn;
  interface.user_data.can.can_port = can_port;
  interface.user_data.can.send_id = can_tx_id;
  interface.user_data.can.rcv_id = can_rx_id;

  status = protocol_interface_init(&interface, interface_name, boardcast_output_enable, rcv_buf_size);
  return status;
}

int32_t protocol_uart_interface_register(char *interface_name,
                                        uint16_t rcv_buf_size,
                                        uint8_t boardcast_output_enable,
                                        uint8_t com_port,
                                        int (*com_send_fn)(uint8_t *p_data, uint32_t len))
{
  struct perph_interface interface = {0};
  uint32_t status;
  status = PROTOCOL_SUCCESS;

  interface.type = COM_PORT;
  interface.send_callback.com_send_fn = com_send_fn;
  interface.user_data.com.port = com_port;

  status = protocol_interface_init(&interface, interface_name, boardcast_output_enable, rcv_buf_size);
  return status;
}

/*
The protocol_interface_send_data function is used to send data through a protocol interface. It checks the type of the 
interface and calls the corresponding send function.
*/

int32_t protocol_interface_send_data(struct perph_interface *perph, uint8_t *buff, uint16_t len)
{
  uint32_t status;
  status = PROTOCOL_SUCCESS;

  if (perph == NULL)
  {
    status = PROTOCOL_ERR_INTER_NOT_FOUND;
    PROTOCOL_ERR_INFO_PRINTF(status, __FILE__, __LINE__);
    return status;
  }

  if (perph->type == CAN_PORT)
  {
    if (perph->send_callback.can_send_fn != NULL)
    {
      perph->send_callback.can_send_fn(perph->user_data.can.send_id, buff, len);
    }
    else
    {
      status = PROTOCOL_ERR_INTER_NOT_FOUND;
      PROTOCOL_ERR_INFO_PRINTF(status, __FILE__, __LINE__);
    }
  }
  else if (perph->type == COM_PORT)
  {
    if (perph->send_callback.com_send_fn != NULL)
    {
      perph->send_callback.com_send_fn(buff, len);
    }
    else
    {
      status = PROTOCOL_ERR_INTER_NOT_FOUND;
      PROTOCOL_ERR_INFO_PRINTF(status, __FILE__, __LINE__);
    }
  }
  return status;
}

/*
The protocol_can_rcv_data and protocol_uart_rcv_data functions are used to receive data from a CAN interface and a UART 
interface respectively. They iterate through all the interfaces and call protocol_rcv_data for the matching interface.
*/

uint32_t protocol_can_rcv_data(uint8_t can_port, uint32_t rcv_id, void *p_data, uint32_t data_len)
{
  uint32_t status =PROTOCOL_SUCCESS;

  for (int i = 0; i< PROTOCOL_INTERFACE_MAX; i++)
  {
    if((protocol_local_info.interface[i].type == CAN_PORT)
     &&(protocol_local_info.interface[i].user_data.can.rcv_id == rcv_id)
     &&(protocol_local_info.interface[i].user_data.can.can_port == can_port))
    {
      protocol_rcv_data(p_data, data_len, &protocol_local_info.interface[i]);
    }
  } 
  return status;
}

uint32_t protocol_uart_rcv_data(uint8_t com_port, void *p_data, uint32_t data_len)
{
  uint32_t status =PROTOCOL_SUCCESS;

  for (int i = 0; i< PROTOCOL_INTERFACE_MAX; i++)
  {
    if((protocol_local_info.interface[i].type == COM_PORT)
     &&(protocol_local_info.interface[i].user_data.com.port == com_port))
    {
      protocol_rcv_data(p_data, data_len, &protocol_local_info.interface[i]);
    }
  }
  return status;
}

/**
  /**
    * @brief  Protocol set route, sets the next-hop interface for the specified address
    * @param  tar_add Target address
    *         interface Next-hop interface serial number for the target address
    * @retval Protocol return status
  */
int32_t protocol_set_route(uint8_t tar_add, const char *name)
{
  uint32_t status;
  struct perph_interface *perph;
  perph = protocol_get_interface(name);

  status = PROTOCOL_SUCCESS;
  if (perph == NULL)
  {
    status = PROTOCOL_ERR_INTER_NOT_FOUND;
    PROTOCOL_ERR_INFO_PRINTF(status, __FILE__, __LINE__);
    return status;
  }
  if (tar_add >= PROTOCOL_ROUTE_TABLE_MAX_NUM)
  {
    status = PROTOCOL_ERR_ROUTEU_SET_BEYOND;
    PROTOCOL_ERR_INFO_PRINTF(status, __FILE__, __LINE__);
    return status;
  }

  if (perph->is_valid == 0)
  {
    status = PROTOCOL_ERR_INTER_NOT_FOUND;
    PROTOCOL_ERR_INFO_PRINTF(status, __FILE__, __LINE__);
    return status;
  }

  protocol_local_info.route_table[tar_add] = perph->idx;

  PROTOCOL_OTHER_INFO_PRINTF("Route has been set, Address 0x%02X next jump is %s[%d].",
                             tar_add, perph->object_name, perph->idx);

  return status;
}


/*
The protocol_get_interface function is used to get the interface with a given name. It iterates through all the 
interfaces and returns the one with the matching name. It uses enter_critical and exit_critical to ensure thread safety.
*/
struct perph_interface *protocol_get_interface(const char *name)
{
  var_cpu_sr();
  enter_critical();
  for (int i = 0; i < PROTOCOL_INTERFACE_MAX; i++)
  {
    if (strncmp(protocol_local_info.interface[i].object_name, name, PROTOCOL_OBJ_NAME_MAX_LEN) == 0)
    {
      exit_critical();
      return &protocol_local_info.interface[i];
    }
  }
  exit_critical();
  return NULL;
}

