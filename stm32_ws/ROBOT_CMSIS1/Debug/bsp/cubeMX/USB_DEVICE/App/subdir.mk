################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/cubeMX/USB_DEVICE/App/usb_device.c \
../bsp/cubeMX/USB_DEVICE/App/usbd_cdc_if.c \
../bsp/cubeMX/USB_DEVICE/App/usbd_desc.c 

OBJS += \
./bsp/cubeMX/USB_DEVICE/App/usb_device.o \
./bsp/cubeMX/USB_DEVICE/App/usbd_cdc_if.o \
./bsp/cubeMX/USB_DEVICE/App/usbd_desc.o 

C_DEPS += \
./bsp/cubeMX/USB_DEVICE/App/usb_device.d \
./bsp/cubeMX/USB_DEVICE/App/usbd_cdc_if.d \
./bsp/cubeMX/USB_DEVICE/App/usbd_desc.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/cubeMX/USB_DEVICE/App/%.o bsp/cubeMX/USB_DEVICE/App/%.su bsp/cubeMX/USB_DEVICE/App/%.cyclo: ../bsp/cubeMX/USB_DEVICE/App/%.c bsp/cubeMX/USB_DEVICE/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/cubeMX/Core/Inc -I../bsp/cubeMX/USB_DEVICE/App -I../bsp/cubeMX/USB_DEVICE/Target -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubeMX/Drivers/CMSIS/Include -I../application -I../application/protocol -I../bsp/boards/ -I../components/algorithm -I../components/controller -I../components/devices -I../components/modules -I../components/object -I../components/support -I../config -I../test -I../utilities -I../utilities/ulog -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-cubeMX-2f-USB_DEVICE-2f-App

clean-bsp-2f-cubeMX-2f-USB_DEVICE-2f-App:
	-$(RM) ./bsp/cubeMX/USB_DEVICE/App/usb_device.cyclo ./bsp/cubeMX/USB_DEVICE/App/usb_device.d ./bsp/cubeMX/USB_DEVICE/App/usb_device.o ./bsp/cubeMX/USB_DEVICE/App/usb_device.su ./bsp/cubeMX/USB_DEVICE/App/usbd_cdc_if.cyclo ./bsp/cubeMX/USB_DEVICE/App/usbd_cdc_if.d ./bsp/cubeMX/USB_DEVICE/App/usbd_cdc_if.o ./bsp/cubeMX/USB_DEVICE/App/usbd_cdc_if.su ./bsp/cubeMX/USB_DEVICE/App/usbd_desc.cyclo ./bsp/cubeMX/USB_DEVICE/App/usbd_desc.d ./bsp/cubeMX/USB_DEVICE/App/usbd_desc.o ./bsp/cubeMX/USB_DEVICE/App/usbd_desc.su

.PHONY: clean-bsp-2f-cubeMX-2f-USB_DEVICE-2f-App

