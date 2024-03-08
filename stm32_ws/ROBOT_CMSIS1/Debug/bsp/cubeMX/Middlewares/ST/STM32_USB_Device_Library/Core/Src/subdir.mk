################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.c \
../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.c \
../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.c 

OBJS += \
./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.o \
./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.o \
./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.o 

C_DEPS += \
./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.d \
./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.d \
./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/%.o bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/%.su bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/%.cyclo: ../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/%.c bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/cubeMX/Core/Inc -I../bsp/cubeMX/USB_DEVICE/App -I../bsp/cubeMX/USB_DEVICE/Target -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubeMX/Drivers/CMSIS/Include -I../application -I../application/protocol -I../bsp/boards/ -I../components/algorithm -I../components/controller -I../components/devices -I../components/modules -I../components/object -I../components/support -I../config -I../test -I../utilities -I../utilities/ulog -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-cubeMX-2f-Middlewares-2f-ST-2f-STM32_USB_Device_Library-2f-Core-2f-Src

clean-bsp-2f-cubeMX-2f-Middlewares-2f-ST-2f-STM32_USB_Device_Library-2f-Core-2f-Src:
	-$(RM) ./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.cyclo ./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.d ./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.o ./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.su ./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.cyclo ./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.d ./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.o ./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.su ./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.cyclo ./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.d ./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.o ./bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.su

.PHONY: clean-bsp-2f-cubeMX-2f-Middlewares-2f-ST-2f-STM32_USB_Device_Library-2f-Core-2f-Src

