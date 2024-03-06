################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../components/modules/chassis.c \
../components/modules/gimbal.c \
../components/modules/shoot.c \
../components/modules/single_gyro.c 

OBJS += \
./components/modules/chassis.o \
./components/modules/gimbal.o \
./components/modules/shoot.o \
./components/modules/single_gyro.o 

C_DEPS += \
./components/modules/chassis.d \
./components/modules/gimbal.d \
./components/modules/shoot.d \
./components/modules/single_gyro.d 


# Each subdirectory must supply rules for building sources it contributes
components/modules/%.o components/modules/%.su components/modules/%.cyclo: ../components/modules/%.c components/modules/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubemx/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubemx/Drivers/CMSIS/Include -I../bsp/cubemx/Core/Inc -I../application -I../application/protocol -I../bsp/boards -I../components/algorithm -I../components/devices -I../components/controller -I../components/modules -I../components/object -I../components/support -I../test -I../utilities -I../utilities/ulog -I../config -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubemx/USB_DEVICE/App -I../bsp/cubemx/USB_DEVICE/Target -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-components-2f-modules

clean-components-2f-modules:
	-$(RM) ./components/modules/chassis.cyclo ./components/modules/chassis.d ./components/modules/chassis.o ./components/modules/chassis.su ./components/modules/gimbal.cyclo ./components/modules/gimbal.d ./components/modules/gimbal.o ./components/modules/gimbal.su ./components/modules/shoot.cyclo ./components/modules/shoot.d ./components/modules/shoot.o ./components/modules/shoot.su ./components/modules/single_gyro.cyclo ./components/modules/single_gyro.d ./components/modules/single_gyro.o ./components/modules/single_gyro.su

.PHONY: clean-components-2f-modules

