################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../imu/Src/bsp_imu.c \
../imu/Src/drv_imu.c \
../imu/Src/myiic.c 

OBJS += \
./imu/Src/bsp_imu.o \
./imu/Src/drv_imu.o \
./imu/Src/myiic.o 

C_DEPS += \
./imu/Src/bsp_imu.d \
./imu/Src/drv_imu.d \
./imu/Src/myiic.d 


# Each subdirectory must supply rules for building sources it contributes
imu/Src/%.o imu/Src/%.su imu/Src/%.cyclo: ../imu/Src/%.c imu/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../support -I../object -I../modules -I../devices -I../controller -I../algorithm -I../imu/Inc -I../gpio/Inc -I../applications/Inc -I../bsp/Inc -I../protocol/Inc -I../ulog -I../utilities -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-imu-2f-Src

clean-imu-2f-Src:
	-$(RM) ./imu/Src/bsp_imu.cyclo ./imu/Src/bsp_imu.d ./imu/Src/bsp_imu.o ./imu/Src/bsp_imu.su ./imu/Src/drv_imu.cyclo ./imu/Src/drv_imu.d ./imu/Src/drv_imu.o ./imu/Src/drv_imu.su ./imu/Src/myiic.cyclo ./imu/Src/myiic.d ./imu/Src/myiic.o ./imu/Src/myiic.su

.PHONY: clean-imu-2f-Src

