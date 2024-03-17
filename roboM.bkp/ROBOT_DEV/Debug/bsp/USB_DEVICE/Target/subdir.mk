################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/USB_DEVICE/Target/usbd_conf.c 

OBJS += \
./bsp/USB_DEVICE/Target/usbd_conf.o 

C_DEPS += \
./bsp/USB_DEVICE/Target/usbd_conf.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/USB_DEVICE/Target/%.o bsp/USB_DEVICE/Target/%.su bsp/USB_DEVICE/Target/%.cyclo: ../bsp/USB_DEVICE/Target/%.c bsp/USB_DEVICE/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../applications -I../motors/Inc -I../support/Inc -I../bsp/Core/Inc -I../bsp/USB_DEVICE/App -I../bsp/USB_DEVICE/Target -I../bsp/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/Drivers/CMSIS/Include -I../protocol -I../support -I../object -I../utilities -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-USB_DEVICE-2f-Target

clean-bsp-2f-USB_DEVICE-2f-Target:
	-$(RM) ./bsp/USB_DEVICE/Target/usbd_conf.cyclo ./bsp/USB_DEVICE/Target/usbd_conf.d ./bsp/USB_DEVICE/Target/usbd_conf.o ./bsp/USB_DEVICE/Target/usbd_conf.su

.PHONY: clean-bsp-2f-USB_DEVICE-2f-Target
