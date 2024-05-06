################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../miniBotRTS-Firmware/components/algorithm/madgwick_ahrs.c \
../miniBotRTS-Firmware/components/algorithm/mahony_ahrs.c \
../miniBotRTS-Firmware/components/algorithm/mecanum.c \
../miniBotRTS-Firmware/components/algorithm/pid.c \
../miniBotRTS-Firmware/components/algorithm/skid_steer.c 

OBJS += \
./miniBotRTS-Firmware/components/algorithm/madgwick_ahrs.o \
./miniBotRTS-Firmware/components/algorithm/mahony_ahrs.o \
./miniBotRTS-Firmware/components/algorithm/mecanum.o \
./miniBotRTS-Firmware/components/algorithm/pid.o \
./miniBotRTS-Firmware/components/algorithm/skid_steer.o 

C_DEPS += \
./miniBotRTS-Firmware/components/algorithm/madgwick_ahrs.d \
./miniBotRTS-Firmware/components/algorithm/mahony_ahrs.d \
./miniBotRTS-Firmware/components/algorithm/mecanum.d \
./miniBotRTS-Firmware/components/algorithm/pid.d \
./miniBotRTS-Firmware/components/algorithm/skid_steer.d 


# Each subdirectory must supply rules for building sources it contributes
miniBotRTS-Firmware/components/algorithm/%.o miniBotRTS-Firmware/components/algorithm/%.su miniBotRTS-Firmware/components/algorithm/%.cyclo: ../miniBotRTS-Firmware/components/algorithm/%.c miniBotRTS-Firmware/components/algorithm/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../Core/Inc -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../miniBotRTS-Firmware/application/mb_protocol -I../miniBotRTS-Firmware/application -I../miniBotRTS-Firmware/boards -I../miniBotRTS-Firmware/components/algorithms -I../miniBotRTS-Firmware/components/controller -I../miniBotRTS-Firmware/components/devices -I../miniBotRTS-Firmware/components/modules -I../miniBotRTS-Firmware/components/object -I../miniBotRTS-Firmware/components/support -I../miniBotRTS-Firmware/components/algorithm -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-miniBotRTS-2d-Firmware-2f-components-2f-algorithm

clean-miniBotRTS-2d-Firmware-2f-components-2f-algorithm:
	-$(RM) ./miniBotRTS-Firmware/components/algorithm/madgwick_ahrs.cyclo ./miniBotRTS-Firmware/components/algorithm/madgwick_ahrs.d ./miniBotRTS-Firmware/components/algorithm/madgwick_ahrs.o ./miniBotRTS-Firmware/components/algorithm/madgwick_ahrs.su ./miniBotRTS-Firmware/components/algorithm/mahony_ahrs.cyclo ./miniBotRTS-Firmware/components/algorithm/mahony_ahrs.d ./miniBotRTS-Firmware/components/algorithm/mahony_ahrs.o ./miniBotRTS-Firmware/components/algorithm/mahony_ahrs.su ./miniBotRTS-Firmware/components/algorithm/mecanum.cyclo ./miniBotRTS-Firmware/components/algorithm/mecanum.d ./miniBotRTS-Firmware/components/algorithm/mecanum.o ./miniBotRTS-Firmware/components/algorithm/mecanum.su ./miniBotRTS-Firmware/components/algorithm/pid.cyclo ./miniBotRTS-Firmware/components/algorithm/pid.d ./miniBotRTS-Firmware/components/algorithm/pid.o ./miniBotRTS-Firmware/components/algorithm/pid.su ./miniBotRTS-Firmware/components/algorithm/skid_steer.cyclo ./miniBotRTS-Firmware/components/algorithm/skid_steer.d ./miniBotRTS-Firmware/components/algorithm/skid_steer.o ./miniBotRTS-Firmware/components/algorithm/skid_steer.su

.PHONY: clean-miniBotRTS-2d-Firmware-2f-components-2f-algorithm

