################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/micro_ros_stm32cubemx_utils/sample_main.c \
../Middlewares/micro_ros_stm32cubemx_utils/sample_main_embeddedrtps.c \
../Middlewares/micro_ros_stm32cubemx_utils/sample_main_udp.c 

OBJS += \
./Middlewares/micro_ros_stm32cubemx_utils/sample_main.o \
./Middlewares/micro_ros_stm32cubemx_utils/sample_main_embeddedrtps.o \
./Middlewares/micro_ros_stm32cubemx_utils/sample_main_udp.o 

C_DEPS += \
./Middlewares/micro_ros_stm32cubemx_utils/sample_main.d \
./Middlewares/micro_ros_stm32cubemx_utils/sample_main_embeddedrtps.d \
./Middlewares/micro_ros_stm32cubemx_utils/sample_main_udp.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/micro_ros_stm32cubemx_utils/%.o Middlewares/micro_ros_stm32cubemx_utils/%.su Middlewares/micro_ros_stm32cubemx_utils/%.cyclo: ../Middlewares/micro_ros_stm32cubemx_utils/%.c Middlewares/micro_ros_stm32cubemx_utils/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_DIRECT_SMPS_SUPPLY -DUSE_HAL_DRIVER -DSTM32H7A3xxQ -c -I../Core/Inc -I"/home/exysta/MicroROS_STM32/Code/MicroROS_STM32/Middlewares/micro_ros_stm32cubemx_utils/microros_static_library_ide/libmicroros/include" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-micro_ros_stm32cubemx_utils

clean-Middlewares-2f-micro_ros_stm32cubemx_utils:
	-$(RM) ./Middlewares/micro_ros_stm32cubemx_utils/sample_main.cyclo ./Middlewares/micro_ros_stm32cubemx_utils/sample_main.d ./Middlewares/micro_ros_stm32cubemx_utils/sample_main.o ./Middlewares/micro_ros_stm32cubemx_utils/sample_main.su ./Middlewares/micro_ros_stm32cubemx_utils/sample_main_embeddedrtps.cyclo ./Middlewares/micro_ros_stm32cubemx_utils/sample_main_embeddedrtps.d ./Middlewares/micro_ros_stm32cubemx_utils/sample_main_embeddedrtps.o ./Middlewares/micro_ros_stm32cubemx_utils/sample_main_embeddedrtps.su ./Middlewares/micro_ros_stm32cubemx_utils/sample_main_udp.cyclo ./Middlewares/micro_ros_stm32cubemx_utils/sample_main_udp.d ./Middlewares/micro_ros_stm32cubemx_utils/sample_main_udp.o ./Middlewares/micro_ros_stm32cubemx_utils/sample_main_udp.su

.PHONY: clean-Middlewares-2f-micro_ros_stm32cubemx_utils

