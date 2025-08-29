################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/dma_transport.c \
../Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/it_transport.c 

OBJS += \
./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/dma_transport.o \
./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/it_transport.o 

C_DEPS += \
./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/dma_transport.d \
./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/it_transport.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/%.o Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/%.su Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/%.cyclo: ../Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/%.c Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_DIRECT_SMPS_SUPPLY -DUSE_HAL_DRIVER -DSTM32H7A3xxQ -c -I../Core/Inc -I"/home/exysta/MicroROS_STM32/Code/MicroROS_STM32/Middlewares/micro_ros_stm32cubemx_utils/microros_static_library_ide/libmicroros/include" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-micro_ros_stm32cubemx_utils-2f-extra_sources-2f-microros_transports

clean-Middlewares-2f-micro_ros_stm32cubemx_utils-2f-extra_sources-2f-microros_transports:
	-$(RM) ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/dma_transport.cyclo ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/dma_transport.d ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/dma_transport.o ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/dma_transport.su ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/it_transport.cyclo ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/it_transport.d ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/it_transport.o ./Middlewares/micro_ros_stm32cubemx_utils/extra_sources/microros_transports/it_transport.su

.PHONY: clean-Middlewares-2f-micro_ros_stm32cubemx_utils-2f-extra_sources-2f-microros_transports

