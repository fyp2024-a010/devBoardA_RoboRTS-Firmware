################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4F/port.c 

OBJS += \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4F/port.o 

C_DEPS += \
./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4F/port.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4F/%.o bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4F/%.su bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4F/%.cyclo: ../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4F/%.c bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4F/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubemx/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubemx/Drivers/CMSIS/Include -I../bsp/cubemx/USB_DEVICE/App -I../bsp/cubemx/USB_DEVICE/Target -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubemx/Core/Inc -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/include -I../application/protocol -I../application -I../bsp/boards -I../components/algorithm -I../components/controller -I../components/devices -I../components/modules -I../components/object -I../components/support -I../config -I../test -I../utilities -I../utilities/ulog -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-cubemx-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-RVDS-2f-ARM_CM4F

clean-bsp-2f-cubemx-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-RVDS-2f-ARM_CM4F:
	-$(RM) ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4F/port.cyclo ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4F/port.d ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4F/port.o ./bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4F/port.su

.PHONY: clean-bsp-2f-cubemx-2f-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-RVDS-2f-ARM_CM4F
