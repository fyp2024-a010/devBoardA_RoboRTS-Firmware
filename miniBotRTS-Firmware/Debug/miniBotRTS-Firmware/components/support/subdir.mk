################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../miniBotRTS-Firmware/components/support/fifo.c \
../miniBotRTS-Firmware/components/support/mem_mang4.c \
../miniBotRTS-Firmware/components/support/mf_crc.c \
../miniBotRTS-Firmware/components/support/period.c \
../miniBotRTS-Firmware/components/support/soft_timer.c \
../miniBotRTS-Firmware/components/support/usb_vcp_extension.c 

OBJS += \
./miniBotRTS-Firmware/components/support/fifo.o \
./miniBotRTS-Firmware/components/support/mem_mang4.o \
./miniBotRTS-Firmware/components/support/mf_crc.o \
./miniBotRTS-Firmware/components/support/period.o \
./miniBotRTS-Firmware/components/support/soft_timer.o \
./miniBotRTS-Firmware/components/support/usb_vcp_extension.o 

C_DEPS += \
./miniBotRTS-Firmware/components/support/fifo.d \
./miniBotRTS-Firmware/components/support/mem_mang4.d \
./miniBotRTS-Firmware/components/support/mf_crc.d \
./miniBotRTS-Firmware/components/support/period.d \
./miniBotRTS-Firmware/components/support/soft_timer.d \
./miniBotRTS-Firmware/components/support/usb_vcp_extension.d 


# Each subdirectory must supply rules for building sources it contributes
miniBotRTS-Firmware/components/support/%.o miniBotRTS-Firmware/components/support/%.su miniBotRTS-Firmware/components/support/%.cyclo: ../miniBotRTS-Firmware/components/support/%.c miniBotRTS-Firmware/components/support/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../Core/Inc -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../miniBotRTS-Firmware/application/mb_protocol -I../miniBotRTS-Firmware/application -I../miniBotRTS-Firmware/boards -I../miniBotRTS-Firmware/components/algorithms -I../miniBotRTS-Firmware/components/controller -I../miniBotRTS-Firmware/components/devices -I../miniBotRTS-Firmware/components/modules -I../miniBotRTS-Firmware/components/object -I../miniBotRTS-Firmware/components/support -I../miniBotRTS-Firmware/components/algorithm -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-miniBotRTS-2d-Firmware-2f-components-2f-support

clean-miniBotRTS-2d-Firmware-2f-components-2f-support:
	-$(RM) ./miniBotRTS-Firmware/components/support/fifo.cyclo ./miniBotRTS-Firmware/components/support/fifo.d ./miniBotRTS-Firmware/components/support/fifo.o ./miniBotRTS-Firmware/components/support/fifo.su ./miniBotRTS-Firmware/components/support/mem_mang4.cyclo ./miniBotRTS-Firmware/components/support/mem_mang4.d ./miniBotRTS-Firmware/components/support/mem_mang4.o ./miniBotRTS-Firmware/components/support/mem_mang4.su ./miniBotRTS-Firmware/components/support/mf_crc.cyclo ./miniBotRTS-Firmware/components/support/mf_crc.d ./miniBotRTS-Firmware/components/support/mf_crc.o ./miniBotRTS-Firmware/components/support/mf_crc.su ./miniBotRTS-Firmware/components/support/period.cyclo ./miniBotRTS-Firmware/components/support/period.d ./miniBotRTS-Firmware/components/support/period.o ./miniBotRTS-Firmware/components/support/period.su ./miniBotRTS-Firmware/components/support/soft_timer.cyclo ./miniBotRTS-Firmware/components/support/soft_timer.d ./miniBotRTS-Firmware/components/support/soft_timer.o ./miniBotRTS-Firmware/components/support/soft_timer.su ./miniBotRTS-Firmware/components/support/usb_vcp_extension.cyclo ./miniBotRTS-Firmware/components/support/usb_vcp_extension.d ./miniBotRTS-Firmware/components/support/usb_vcp_extension.o ./miniBotRTS-Firmware/components/support/usb_vcp_extension.su

.PHONY: clean-miniBotRTS-2d-Firmware-2f-components-2f-support

