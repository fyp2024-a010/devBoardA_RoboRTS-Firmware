################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/USB_DEVICE/App/usb_device.c \
../bsp/USB_DEVICE/App/usbd_cdc_if.c \
../bsp/USB_DEVICE/App/usbd_desc.c 

OBJS += \
./bsp/USB_DEVICE/App/usb_device.o \
./bsp/USB_DEVICE/App/usbd_cdc_if.o \
./bsp/USB_DEVICE/App/usbd_desc.o 

C_DEPS += \
./bsp/USB_DEVICE/App/usb_device.d \
./bsp/USB_DEVICE/App/usbd_cdc_if.d \
./bsp/USB_DEVICE/App/usbd_desc.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/USB_DEVICE/App/%.o bsp/USB_DEVICE/App/%.su bsp/USB_DEVICE/App/%.cyclo: ../bsp/USB_DEVICE/App/%.c bsp/USB_DEVICE/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../applications -I../motors/Inc -I../support/Inc -I../bsp/Core/Inc -I../bsp/USB_DEVICE/App -I../bsp/USB_DEVICE/Target -I../bsp/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/Drivers/CMSIS/Include -I../protocol -I../support -I../object -I../utilities -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-USB_DEVICE-2f-App

clean-bsp-2f-USB_DEVICE-2f-App:
	-$(RM) ./bsp/USB_DEVICE/App/usb_device.cyclo ./bsp/USB_DEVICE/App/usb_device.d ./bsp/USB_DEVICE/App/usb_device.o ./bsp/USB_DEVICE/App/usb_device.su ./bsp/USB_DEVICE/App/usbd_cdc_if.cyclo ./bsp/USB_DEVICE/App/usbd_cdc_if.d ./bsp/USB_DEVICE/App/usbd_cdc_if.o ./bsp/USB_DEVICE/App/usbd_cdc_if.su ./bsp/USB_DEVICE/App/usbd_desc.cyclo ./bsp/USB_DEVICE/App/usbd_desc.d ./bsp/USB_DEVICE/App/usbd_desc.o ./bsp/USB_DEVICE/App/usbd_desc.su

.PHONY: clean-bsp-2f-USB_DEVICE-2f-App

