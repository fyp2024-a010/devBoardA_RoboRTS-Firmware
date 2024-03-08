################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../components/devices/dbus.c \
../components/devices/detect.c \
../components/devices/device.c \
../components/devices/motor.c 

OBJS += \
./components/devices/dbus.o \
./components/devices/detect.o \
./components/devices/device.o \
./components/devices/motor.o 

C_DEPS += \
./components/devices/dbus.d \
./components/devices/detect.d \
./components/devices/device.d \
./components/devices/motor.d 


# Each subdirectory must supply rules for building sources it contributes
components/devices/%.o components/devices/%.su components/devices/%.cyclo: ../components/devices/%.c components/devices/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/cubeMX/Core/Inc -I../bsp/cubeMX/USB_DEVICE/App -I../bsp/cubeMX/USB_DEVICE/Target -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/include -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubeMX/Drivers/CMSIS/Include -I../application -I../application/protocol -I../bsp/boards/ -I../components/algorithm -I../components/controller -I../components/devices -I../components/modules -I../components/object -I../components/support -I../config -I../test -I../utilities -I../utilities/ulog -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-components-2f-devices

clean-components-2f-devices:
	-$(RM) ./components/devices/dbus.cyclo ./components/devices/dbus.d ./components/devices/dbus.o ./components/devices/dbus.su ./components/devices/detect.cyclo ./components/devices/detect.d ./components/devices/detect.o ./components/devices/detect.su ./components/devices/device.cyclo ./components/devices/device.d ./components/devices/device.o ./components/devices/device.su ./components/devices/motor.cyclo ./components/devices/motor.d ./components/devices/motor.o ./components/devices/motor.su

.PHONY: clean-components-2f-devices

