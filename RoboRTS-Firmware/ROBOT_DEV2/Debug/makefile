################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include bsp/cubeMX/USB_DEVICE/Target/subdir.mk
-include bsp/cubeMX/USB_DEVICE/App/subdir.mk
-include bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/subdir.mk
-include bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/subdir.mk
-include bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS/subdir.mk
-include bsp/cubeMX/Middlewares/Third_Party/FreeRTOS/Source/subdir.mk
-include bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Core/Src/subdir.mk
-include bsp/cubeMX/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/subdir.mk
-include bsp/cubeMX/Drivers/STM32F4xx_HAL_Driver/Src/subdir.mk
-include bsp/cubeMX/Core/Startup/subdir.mk
-include bsp/cubeMX/Core/Src/subdir.mk
-include application/Src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := ROBOT_DEV2
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
ROBOT_DEV2.elf \

MAP_FILES += \
ROBOT_DEV2.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
ROBOT_DEV2.list \


# All Target
all: main-build

# Main-build Target
main-build: ROBOT_DEV2.elf secondary-outputs

# Tool invocations
ROBOT_DEV2.elf ROBOT_DEV2.map: $(OBJS) $(USER_OBJS) /Users/bentjh01/Documents/01_NTU/FYP/project/RoboMasterDevBoard/RoboRTS-Firmware/ROBOT_DEV2/STM32F427IIHX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "ROBOT_DEV2.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"/Users/bentjh01/Documents/01_NTU/FYP/project/RoboMasterDevBoard/RoboRTS-Firmware/ROBOT_DEV2/STM32F427IIHX_FLASH.ld" --specs=nosys.specs -Wl,-Map="ROBOT_DEV2.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

ROBOT_DEV2.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "ROBOT_DEV2.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) ROBOT_DEV2.elf ROBOT_DEV2.list ROBOT_DEV2.map default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
