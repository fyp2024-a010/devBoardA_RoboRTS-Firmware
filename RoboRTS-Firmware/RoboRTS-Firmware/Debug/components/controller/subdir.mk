################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../components/controller/controller.c \
../components/controller/pid_controller.c 

OBJS += \
./components/controller/controller.o \
./components/controller/pid_controller.o 

C_DEPS += \
./components/controller/controller.d \
./components/controller/pid_controller.d 


# Each subdirectory must supply rules for building sources it contributes
components/controller/%.o components/controller/%.su components/controller/%.cyclo: ../components/controller/%.c components/controller/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubemx/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubemx/Drivers/CMSIS/Include -I../bsp/cubemx/Core/Inc -I../application -I../application/protocol -I../bsp/boards -I../components/algorithm -I../components/devices -I../components/controller -I../components/modules -I../components/object -I../components/support -I../test -I../utilities -I../utilities/ulog -I../config -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubemx/USB_DEVICE/App -I../bsp/cubemx/USB_DEVICE/Target -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-components-2f-controller

clean-components-2f-controller:
	-$(RM) ./components/controller/controller.cyclo ./components/controller/controller.d ./components/controller/controller.o ./components/controller/controller.su ./components/controller/pid_controller.cyclo ./components/controller/pid_controller.d ./components/controller/pid_controller.o ./components/controller/pid_controller.su

.PHONY: clean-components-2f-controller
