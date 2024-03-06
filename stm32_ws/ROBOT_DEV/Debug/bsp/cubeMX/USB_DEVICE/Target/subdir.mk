################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/cubeMX/USB_DEVICE/Target/usbd_conf.c 

OBJS += \
./bsp/cubeMX/USB_DEVICE/Target/usbd_conf.o 

C_DEPS += \
./bsp/cubeMX/USB_DEVICE/Target/usbd_conf.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/cubeMX/USB_DEVICE/Target/%.o bsp/cubeMX/USB_DEVICE/Target/%.su bsp/cubeMX/USB_DEVICE/Target/%.cyclo: ../bsp/cubeMX/USB_DEVICE/Target/%.c bsp/cubeMX/USB_DEVICE/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/boards/Inc -I../object/Inc -I../application/Inc -I../bsp/cubeMX/Core/Inc -I../bsp/cubeMX/USB_DEVICE/App -I../bsp/cubeMX/USB_DEVICE/Target -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubeMX/Drivers/CMSIS/Include -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-cubeMX-2f-USB_DEVICE-2f-Target

clean-bsp-2f-cubeMX-2f-USB_DEVICE-2f-Target:
	-$(RM) ./bsp/cubeMX/USB_DEVICE/Target/usbd_conf.cyclo ./bsp/cubeMX/USB_DEVICE/Target/usbd_conf.d ./bsp/cubeMX/USB_DEVICE/Target/usbd_conf.o ./bsp/cubeMX/USB_DEVICE/Target/usbd_conf.su

.PHONY: clean-bsp-2f-cubeMX-2f-USB_DEVICE-2f-Target

