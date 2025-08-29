################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/micro_ros_stm32cubemx_utils/extra_sources/custom_memory_manager.c \
../Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_allocators.c \
../Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_time.c 

OBJS += \
./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/custom_memory_manager.o \
./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_allocators.o \
./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_time.o 

C_DEPS += \
./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/custom_memory_manager.d \
./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_allocators.d \
./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_time.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/micro_ros_stm32cubemx_utils/extra_sources/%.o Middlewares/micro_ros_stm32cubemx_utils/extra_sources/%.su Middlewares/micro_ros_stm32cubemx_utils/extra_sources/%.cyclo: ../Middlewares/micro_ros_stm32cubemx_utils/extra_sources/%.c Middlewares/micro_ros_stm32cubemx_utils/extra_sources/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_DIRECT_SMPS_SUPPLY -DUSE_HAL_DRIVER -DSTM32H7A3xxQ -c -I../Core/Inc -I"/home/exysta/MicroROS_STM32/Code/MicroROS_STM32/Middlewares/micro_ros_stm32cubemx_utils/microros_static_library_ide/libmicroros/include" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-micro_ros_stm32cubemx_utils-2f-extra_sources

clean-Middlewares-2f-micro_ros_stm32cubemx_utils-2f-extra_sources:
	-$(RM) ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/custom_memory_manager.cyclo ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/custom_memory_manager.d ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/custom_memory_manager.o ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/custom_memory_manager.su ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_allocators.cyclo ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_allocators.d ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_allocators.o ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_allocators.su ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_time.cyclo ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_time.d ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_time.o ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_time.su

.PHONY: clean-Middlewares-2f-micro_ros_stm32cubemx_utils-2f-extra_sources

