################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.c 

OBJS += \
./bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.o 

C_DEPS += \
./bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/%.o bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/%.su bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/%.cyclo: ../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/%.c bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../applications -I../motors/Inc -I../support/Inc -I../protocol -I../support -I../object -I../utilities -I../bsp/boards -I../bsp/cubemx/Core/Inc -I../bsp/cubemx/USB_DEVICE/App -I../bsp/cubemx/USB_DEVICE/Target -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubemx/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubemx/Drivers/CMSIS/Include -I../utilities/ulog -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-cubemx-2f-Middlewares-2f-ST-2f-STM32_USB_Device_Library-2f-Class-2f-CDC-2f-Src

clean-bsp-2f-cubemx-2f-Middlewares-2f-ST-2f-STM32_USB_Device_Library-2f-Class-2f-CDC-2f-Src:
	-$(RM) ./bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.cyclo ./bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.d ./bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.o ./bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.su

.PHONY: clean-bsp-2f-cubemx-2f-Middlewares-2f-ST-2f-STM32_USB_Device_Library-2f-Class-2f-CDC-2f-Src

