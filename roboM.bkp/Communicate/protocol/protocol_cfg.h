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

#ifndef _PROTOCOL_CFG_H_
#define _PROTOCOL_CFG_H_

#include "sys.h"

#define PROTOCOL_VERSION                (0)                 /* Protocol version */

#define PROTOCOL_CMD_MAX_NUM            (50)                /* Maximum number of protocol commands */

#define PROTOCOL_DEV_VERSION            ("V0.0.6")          /* Protocol development version */

#define PROTOCOL_MAX_DATA_LEN           (512)               /* Maximum data length per protocol packet */
#define PROTOCOL_HEADER                 (0xAAu)             /* Protocol packet header */
#define PROTOCOL_INTERFACE_MAX          (5)                 /* Maximum number of protocol interfaces */
#define PROTOCOL_OBJ_NAME_MAX_LEN       (32)                /* Maximum length of protocol interface name string */
#define PROTOCOL_ROUTE_TABLE_MAX_NUM    (254)               /* Maximum number of protocol routing entries (cannot exceed 255) */

#define PROTOCOL_SEND_DBG_PRINTF_SET    PROTOCOL_ENABLE     /* Protocol send debug information output enable */
#define PROTOCOL_SEND_ERR_PRINTF_SET    PROTOCOL_ENABLE     /* Protocol send error information output enable */
#define PROTOCOL_RCV_DBG_PRINTF_SET     PROTOCOL_ENABLE     /* Protocol receive debug information output enable */
#define PROTOCOL_RCV_ERR_PRINTF_SET     PROTOCOL_ENABLE     /* Protocol receive error information output enable */
#define PROTOCOL_ERR_INFO_PRINTF_SET    PROTOCOL_ENABLE     /* Protocol error information output enable */
#define PROTOCOL_OTHER_INFO_PRINTF_SET  PROTOCOL_ENABLE     /* Protocol other information output enable */

#define PROTOCOL_AUTO_LOOKBACK          PROTOCOL_ENABLE     /* Protocol automatic loopback enable */

#define PROTOCOL_ROUTE_FOWARD           PROTOCOL_ENABLE     /* Protocol routing forwarding enable */

#endif /* _PROTOCOL_CFG_H_ */
