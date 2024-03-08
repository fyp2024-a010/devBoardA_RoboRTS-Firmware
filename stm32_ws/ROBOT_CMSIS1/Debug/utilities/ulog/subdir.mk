################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../utilities/ulog/ulog.c \
../utilities/ulog/ulog_console.c 

OBJS += \
./utilities/ulog/ulog.o \
./utilities/ulog/ulog_console.o 

C_DEPS += \
./utilities/ulog/ulog.d \
./utilities/ulog/ulog_console.d 


# Each subdirectory must supply rules for building sources it contributes
utilities/ulog/%.o utilities/ulog/%.su utilities/ulog/%.cyclo: ../utilities/ulog/%.c utilities/ulog/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/cubeMX/Core/Inc -I../bsp/cubeMX/USB_DEVICE/App -I../bsp/cubeMX/USB_DEVICE/Target -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubeMX/Drivers/CMSIS/Include -I../application -I../application/protocol -I../bsp/boards/ -I../components/algorithm -I../components/controller -I../components/devices -I../components/modules -I../components/object -I../components/support -I../config -I../test -I../utilities -I../utilities/ulog -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-utilities-2f-ulog

clean-utilities-2f-ulog:
	-$(RM) ./utilities/ulog/ulog.cyclo ./utilities/ulog/ulog.d ./utilities/ulog/ulog.o ./utilities/ulog/ulog.su ./utilities/ulog/ulog_console.cyclo ./utilities/ulog/ulog_console.d ./utilities/ulog/ulog_console.o ./utilities/ulog/ulog_console.su

.PHONY: clean-utilities-2f-ulog

