################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../components/algorithm/madgwick_ahrs.c \
../components/algorithm/mahony_ahrs.c \
../components/algorithm/mecanum.c \
../components/algorithm/pid.c \
../components/algorithm/ramp.c 

OBJS += \
./components/algorithm/madgwick_ahrs.o \
./components/algorithm/mahony_ahrs.o \
./components/algorithm/mecanum.o \
./components/algorithm/pid.o \
./components/algorithm/ramp.o 

C_DEPS += \
./components/algorithm/madgwick_ahrs.d \
./components/algorithm/mahony_ahrs.d \
./components/algorithm/mecanum.d \
./components/algorithm/pid.d \
./components/algorithm/ramp.d 


# Each subdirectory must supply rules for building sources it contributes
components/algorithm/%.o components/algorithm/%.su components/algorithm/%.cyclo: ../components/algorithm/%.c components/algorithm/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/cubeMX/Core/Inc -I../bsp/cubeMX/USB_DEVICE/App -I../bsp/cubeMX/USB_DEVICE/Target -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubeMX/Drivers/CMSIS/Include -I../application -I../application/protocol -I../bsp/boards/ -I../components/algorithm -I../components/controller -I../components/devices -I../components/modules -I../components/object -I../components/support -I../config -I../test -I../utilities -I../utilities/ulog -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-components-2f-algorithm

clean-components-2f-algorithm:
	-$(RM) ./components/algorithm/madgwick_ahrs.cyclo ./components/algorithm/madgwick_ahrs.d ./components/algorithm/madgwick_ahrs.o ./components/algorithm/madgwick_ahrs.su ./components/algorithm/mahony_ahrs.cyclo ./components/algorithm/mahony_ahrs.d ./components/algorithm/mahony_ahrs.o ./components/algorithm/mahony_ahrs.su ./components/algorithm/mecanum.cyclo ./components/algorithm/mecanum.d ./components/algorithm/mecanum.o ./components/algorithm/mecanum.su ./components/algorithm/pid.cyclo ./components/algorithm/pid.d ./components/algorithm/pid.o ./components/algorithm/pid.su ./components/algorithm/ramp.cyclo ./components/algorithm/ramp.d ./components/algorithm/ramp.o ./components/algorithm/ramp.su

.PHONY: clean-components-2f-algorithm

