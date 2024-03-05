################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../boards/cubeMX/USB_DEVICE/Target/usbd_conf.c 

OBJS += \
./boards/cubeMX/USB_DEVICE/Target/usbd_conf.o 

C_DEPS += \
./boards/cubeMX/USB_DEVICE/Target/usbd_conf.d 


# Each subdirectory must supply rules for building sources it contributes
boards/cubeMX/USB_DEVICE/Target/%.o boards/cubeMX/USB_DEVICE/Target/%.su boards/cubeMX/USB_DEVICE/Target/%.cyclo: ../boards/cubeMX/USB_DEVICE/Target/%.c boards/cubeMX/USB_DEVICE/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -c -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-boards-2f-cubeMX-2f-USB_DEVICE-2f-Target

clean-boards-2f-cubeMX-2f-USB_DEVICE-2f-Target:
	-$(RM) ./boards/cubeMX/USB_DEVICE/Target/usbd_conf.cyclo ./boards/cubeMX/USB_DEVICE/Target/usbd_conf.d ./boards/cubeMX/USB_DEVICE/Target/usbd_conf.o ./boards/cubeMX/USB_DEVICE/Target/usbd_conf.su

.PHONY: clean-boards-2f-cubeMX-2f-USB_DEVICE-2f-Target

