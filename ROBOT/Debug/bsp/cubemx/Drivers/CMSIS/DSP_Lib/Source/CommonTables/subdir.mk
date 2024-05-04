################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_common_tables.c \
../bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_const_structs.c 

OBJS += \
./bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_common_tables.o \
./bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_const_structs.o 

C_DEPS += \
./bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_common_tables.d \
./bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_const_structs.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/%.o bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/%.su bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/%.cyclo: ../bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/%.c bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F427xx -c -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../bsp/cubemx/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../bsp/cubemx/Drivers/CMSIS/Include -I../bsp/cubemx/USB_DEVICE/App -I../bsp/cubemx/USB_DEVICE/Target -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../bsp/cubemx/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../bsp/cubemx/Core/Inc -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc -I../bsp/cubemx/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/include -I../application/protocol -I../application -I../bsp/boards -I../components/algorithm -I../components/controller -I../components/devices -I../components/modules -I../components/object -I../components/support -I../config -I../test -I../utilities -I../utilities/ulog -I../bsp/cubemx/Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-bsp-2f-cubemx-2f-Drivers-2f-CMSIS-2f-DSP_Lib-2f-Source-2f-CommonTables

clean-bsp-2f-cubemx-2f-Drivers-2f-CMSIS-2f-DSP_Lib-2f-Source-2f-CommonTables:
	-$(RM) ./bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_common_tables.cyclo ./bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_common_tables.d ./bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_common_tables.o ./bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_common_tables.su ./bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_const_structs.cyclo ./bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_const_structs.d ./bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_const_structs.o ./bsp/cubemx/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_const_structs.su

.PHONY: clean-bsp-2f-cubemx-2f-Drivers-2f-CMSIS-2f-DSP_Lib-2f-Source-2f-CommonTables

