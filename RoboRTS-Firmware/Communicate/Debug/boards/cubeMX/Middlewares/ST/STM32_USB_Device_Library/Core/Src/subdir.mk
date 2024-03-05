################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.c \
../boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.c \
../boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.c 

OBJS += \
./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.o \
./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.o \
./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.o 

C_DEPS += \
./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.d \
./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.d \
./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.d 


# Each subdirectory must supply rules for building sources it contributes
boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/%.o boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/%.su boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/%.cyclo: ../boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/%.c boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -c -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-boards-2f-cubeMX-2f-Middlewares-2f-ST-2f-STM32_USB_Device_Library-2f-Core-2f-Src

clean-boards-2f-cubeMX-2f-Middlewares-2f-ST-2f-STM32_USB_Device_Library-2f-Core-2f-Src:
	-$(RM) ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.cyclo ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.d ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.o ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.su ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.cyclo ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.d ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.o ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.su ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.cyclo ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.d ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.o ./boards/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.su

.PHONY: clean-boards-2f-cubeMX-2f-Middlewares-2f-ST-2f-STM32_USB_Device_Library-2f-Core-2f-Src

