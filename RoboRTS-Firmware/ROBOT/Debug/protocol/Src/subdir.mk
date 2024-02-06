################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../protocol/Src/protocol.c \
../protocol/Src/protocol_common.c \
../protocol/Src/protocol_interface.c \
../protocol/Src/protocol_transmit.c 

OBJS += \
./protocol/Src/protocol.o \
./protocol/Src/protocol_common.o \
./protocol/Src/protocol_interface.o \
./protocol/Src/protocol_transmit.o 

C_DEPS += \
./protocol/Src/protocol.d \
./protocol/Src/protocol_common.d \
./protocol/Src/protocol_interface.d \
./protocol/Src/protocol_transmit.d 


# Each subdirectory must supply rules for building sources it contributes
protocol/Src/%.o protocol/Src/%.su protocol/Src/%.cyclo: ../protocol/Src/%.c protocol/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../support -I../object -I../modules -I../devices -I../controller -I../algorithm -I../imu/Inc -I../gpio/Inc -I../applications/Inc -I../bsp/Inc -I../protocol/Inc -I../ulog -I../utilities -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-protocol-2f-Src

clean-protocol-2f-Src:
	-$(RM) ./protocol/Src/protocol.cyclo ./protocol/Src/protocol.d ./protocol/Src/protocol.o ./protocol/Src/protocol.su ./protocol/Src/protocol_common.cyclo ./protocol/Src/protocol_common.d ./protocol/Src/protocol_common.o ./protocol/Src/protocol_common.su ./protocol/Src/protocol_interface.cyclo ./protocol/Src/protocol_interface.d ./protocol/Src/protocol_interface.o ./protocol/Src/protocol_interface.su ./protocol/Src/protocol_transmit.cyclo ./protocol/Src/protocol_transmit.d ./protocol/Src/protocol_transmit.o ./protocol/Src/protocol_transmit.su

.PHONY: clean-protocol-2f-Src

