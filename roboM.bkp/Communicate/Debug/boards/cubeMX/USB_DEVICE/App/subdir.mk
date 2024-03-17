################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../boards/cubeMX/USB_DEVICE/App/usb_device.c \
../boards/cubeMX/USB_DEVICE/App/usbd_cdc_if.c \
../boards/cubeMX/USB_DEVICE/App/usbd_desc.c 

OBJS += \
./boards/cubeMX/USB_DEVICE/App/usb_device.o \
./boards/cubeMX/USB_DEVICE/App/usbd_cdc_if.o \
./boards/cubeMX/USB_DEVICE/App/usbd_desc.o 

C_DEPS += \
./boards/cubeMX/USB_DEVICE/App/usb_device.d \
./boards/cubeMX/USB_DEVICE/App/usbd_cdc_if.d \
./boards/cubeMX/USB_DEVICE/App/usbd_desc.d 


# Each subdirectory must supply rules for building sources it contributes
boards/cubeMX/USB_DEVICE/App/%.o boards/cubeMX/USB_DEVICE/App/%.su boards/cubeMX/USB_DEVICE/App/%.cyclo: ../boards/cubeMX/USB_DEVICE/App/%.c boards/cubeMX/USB_DEVICE/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -c -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-boards-2f-cubeMX-2f-USB_DEVICE-2f-App

clean-boards-2f-cubeMX-2f-USB_DEVICE-2f-App:
	-$(RM) ./boards/cubeMX/USB_DEVICE/App/usb_device.cyclo ./boards/cubeMX/USB_DEVICE/App/usb_device.d ./boards/cubeMX/USB_DEVICE/App/usb_device.o ./boards/cubeMX/USB_DEVICE/App/usb_device.su ./boards/cubeMX/USB_DEVICE/App/usbd_cdc_if.cyclo ./boards/cubeMX/USB_DEVICE/App/usbd_cdc_if.d ./boards/cubeMX/USB_DEVICE/App/usbd_cdc_if.o ./boards/cubeMX/USB_DEVICE/App/usbd_cdc_if.su ./boards/cubeMX/USB_DEVICE/App/usbd_desc.cyclo ./boards/cubeMX/USB_DEVICE/App/usbd_desc.d ./boards/cubeMX/USB_DEVICE/App/usbd_desc.o ./boards/cubeMX/USB_DEVICE/App/usbd_desc.su

.PHONY: clean-boards-2f-cubeMX-2f-USB_DEVICE-2f-App

