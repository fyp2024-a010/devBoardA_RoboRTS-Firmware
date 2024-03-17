################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../protocol/protocol.c \
../protocol/protocol_common.c \
../protocol/protocol_interface.c \
../protocol/protocol_transmit.c 

OBJS += \
./protocol/protocol.o \
./protocol/protocol_common.o \
./protocol/protocol_interface.o \
./protocol/protocol_transmit.o 

C_DEPS += \
./protocol/protocol.d \
./protocol/protocol_common.d \
./protocol/protocol_interface.d \
./protocol/protocol_transmit.d 


# Each subdirectory must supply rules for building sources it contributes
protocol/%.o protocol/%.su protocol/%.cyclo: ../protocol/%.c protocol/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../applications -I../motors/Inc -I../support/Inc -I../protocol -I../support -I../object -I../utilities -I../bsp/boards -I../bsp/cubemx/Core/Inc -I../bsp/cubemx/USB_DEVICE/App -I../bsp/cubemx/USB_DEVICE/Target -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubemx/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubemx/Drivers/CMSIS/Include -I../utilities/ulog -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-protocol

clean-protocol:
	-$(RM) ./protocol/protocol.cyclo ./protocol/protocol.d ./protocol/protocol.o ./protocol/protocol.su ./protocol/protocol_common.cyclo ./protocol/protocol_common.d ./protocol/protocol_common.o ./protocol/protocol_common.su ./protocol/protocol_interface.cyclo ./protocol/protocol_interface.d ./protocol/protocol_interface.o ./protocol/protocol_interface.su ./protocol/protocol_transmit.cyclo ./protocol/protocol_transmit.d ./protocol/protocol_transmit.o ./protocol/protocol_transmit.su

.PHONY: clean-protocol

