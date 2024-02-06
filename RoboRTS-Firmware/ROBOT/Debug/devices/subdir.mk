################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../devices/dbus.c \
../devices/detect.c \
../devices/device.c \
../devices/motor.c 

OBJS += \
./devices/dbus.o \
./devices/detect.o \
./devices/device.o \
./devices/motor.o 

C_DEPS += \
./devices/dbus.d \
./devices/detect.d \
./devices/device.d \
./devices/motor.d 


# Each subdirectory must supply rules for building sources it contributes
devices/%.o devices/%.su devices/%.cyclo: ../devices/%.c devices/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../support -I../object -I../modules -I../devices -I../controller -I../algorithm -I../imu/Inc -I../gpio/Inc -I../applications/Inc -I../bsp/Inc -I../protocol/Inc -I../ulog -I../utilities -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-devices

clean-devices:
	-$(RM) ./devices/dbus.cyclo ./devices/dbus.d ./devices/dbus.o ./devices/dbus.su ./devices/detect.cyclo ./devices/detect.d ./devices/detect.o ./devices/detect.su ./devices/device.cyclo ./devices/device.d ./devices/device.o ./devices/device.su ./devices/motor.cyclo ./devices/motor.d ./devices/motor.o ./devices/motor.su

.PHONY: clean-devices

