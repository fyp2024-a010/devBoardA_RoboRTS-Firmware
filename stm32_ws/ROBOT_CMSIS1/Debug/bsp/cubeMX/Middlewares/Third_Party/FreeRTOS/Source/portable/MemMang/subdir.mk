################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.c 

OBJS += \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.o 

C_DEPS += \
./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/%.o bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/%.su bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/%.cyclo: ../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/%.c bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/cubeMX/Core/Inc -I../bsp/cubeMX/USB_DEVICE/App -I../bsp/cubeMX/USB_DEVICE/Target -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubeMX/Drivers/CMSIS/Include -I../application -I../application/protocol -I../bsp/boards/ -I../components/algorithm -I../components/controller -I../components/devices -I../components/modules -I../components/object -I../components/support -I../config -I../test -I../utilities -I../utilities/ulog -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-MemMang

clean-bsp-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-MemMang:
	-$(RM) ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.cyclo ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.d ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.o ./bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.su

.PHONY: clean-bsp-2f-cubeMX-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-MemMang

