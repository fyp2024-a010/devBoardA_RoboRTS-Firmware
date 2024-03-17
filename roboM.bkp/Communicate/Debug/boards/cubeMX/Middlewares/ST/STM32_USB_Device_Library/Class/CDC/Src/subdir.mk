################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.c 

OBJS += \
./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.o 

C_DEPS += \
./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.d 


# Each subdirectory must supply rules for building sources it contributes
boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/%.o boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/%.su boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/%.cyclo: ../boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/%.c boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -c -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-boards-2f-cubeMX-2f-Middlewares-2f-ST-2f-STM32_USB_Device_Library-2f-Class-2f-CDC-2f-Src

clean-boards-2f-cubeMX-2f-Middlewares-2f-ST-2f-STM32_USB_Device_Library-2f-Class-2f-CDC-2f-Src:
	-$(RM) ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.cyclo ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.d ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.o ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.su

.PHONY: clean-boards-2f-cubeMX-2f-Middlewares-2f-ST-2f-STM32_USB_Device_Library-2f-Class-2f-CDC-2f-Src

