################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.c \
../bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.c \
../bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.c 

OBJS += \
./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.o \
./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.o \
./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.o 

C_DEPS += \
./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.d \
./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.d \
./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/%.o bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/%.su bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/%.cyclo: ../bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/%.c bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../applications -I../motors/Inc -I../support/Inc -I../bsp/Core/Inc -I../bsp/USB_DEVICE/App -I../bsp/USB_DEVICE/Target -I../bsp/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../bsp/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-Middlewares-2f-ST-2f-STM32_USB_Device_Library-2f-Core-2f-Src

clean-bsp-2f-Middlewares-2f-ST-2f-STM32_USB_Device_Library-2f-Core-2f-Src:
	-$(RM) ./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.cyclo ./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.d ./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.o ./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.su ./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.cyclo ./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.d ./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.o ./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.su ./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.cyclo ./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.d ./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.o ./bsp/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.su

.PHONY: clean-bsp-2f-Middlewares-2f-ST-2f-STM32_USB_Device_Library-2f-Core-2f-Src

