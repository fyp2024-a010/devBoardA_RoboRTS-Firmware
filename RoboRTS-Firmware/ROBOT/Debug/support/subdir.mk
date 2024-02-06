################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../support/fifo.c \
../support/mem_mang4.c \
../support/mf_crc.c 

OBJS += \
./support/fifo.o \
./support/mem_mang4.o \
./support/mf_crc.o 

C_DEPS += \
./support/fifo.d \
./support/mem_mang4.d \
./support/mf_crc.d 


# Each subdirectory must supply rules for building sources it contributes
support/%.o support/%.su support/%.cyclo: ../support/%.c support/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../support -I../object -I../modules -I../devices -I../controller -I../algorithm -I../imu/Inc -I../gpio/Inc -I../applications/Inc -I../bsp/Inc -I../protocol/Inc -I../ulog -I../utilities -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-support

clean-support:
	-$(RM) ./support/fifo.cyclo ./support/fifo.d ./support/fifo.o ./support/fifo.su ./support/mem_mang4.cyclo ./support/mem_mang4.d ./support/mem_mang4.o ./support/mem_mang4.su ./support/mf_crc.cyclo ./support/mf_crc.d ./support/mf_crc.o ./support/mf_crc.su

.PHONY: clean-support

