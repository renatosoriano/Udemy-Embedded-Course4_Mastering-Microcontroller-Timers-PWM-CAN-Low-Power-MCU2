################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/core_list_join.c \
../Src/core_main.c \
../Src/core_matrix.c \
../Src/core_portme.c \
../Src/core_state.c \
../Src/core_util.c \
../Src/main.c \
../Src/pwr_modes.c \
../Src/stm32f4xx_it.c \
../Src/syscalls.c \
../Src/sysmem.c \
../Src/system_stm32f4xx.c 

OBJS += \
./Src/core_list_join.o \
./Src/core_main.o \
./Src/core_matrix.o \
./Src/core_portme.o \
./Src/core_state.o \
./Src/core_util.o \
./Src/main.o \
./Src/pwr_modes.o \
./Src/stm32f4xx_it.o \
./Src/syscalls.o \
./Src/sysmem.o \
./Src/system_stm32f4xx.o 

C_DEPS += \
./Src/core_list_join.d \
./Src/core_main.d \
./Src/core_matrix.d \
./Src/core_portme.d \
./Src/core_state.d \
./Src/core_util.d \
./Src/main.d \
./Src/pwr_modes.d \
./Src/stm32f4xx_it.d \
./Src/syscalls.d \
./Src/sysmem.d \
./Src/system_stm32f4xx.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o Src/%.su: ../Src/%.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F446RETx -DNUCLEO_F446RE -c -I../Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Src

clean-Src:
	-$(RM) ./Src/core_list_join.d ./Src/core_list_join.o ./Src/core_list_join.su ./Src/core_main.d ./Src/core_main.o ./Src/core_main.su ./Src/core_matrix.d ./Src/core_matrix.o ./Src/core_matrix.su ./Src/core_portme.d ./Src/core_portme.o ./Src/core_portme.su ./Src/core_state.d ./Src/core_state.o ./Src/core_state.su ./Src/core_util.d ./Src/core_util.o ./Src/core_util.su ./Src/main.d ./Src/main.o ./Src/main.su ./Src/pwr_modes.d ./Src/pwr_modes.o ./Src/pwr_modes.su ./Src/stm32f4xx_it.d ./Src/stm32f4xx_it.o ./Src/stm32f4xx_it.su ./Src/syscalls.d ./Src/syscalls.o ./Src/syscalls.su ./Src/sysmem.d ./Src/sysmem.o ./Src/sysmem.su ./Src/system_stm32f4xx.d ./Src/system_stm32f4xx.o ./Src/system_stm32f4xx.su

.PHONY: clean-Src

