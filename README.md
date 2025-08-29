# MicroROS_STM32
This projects aims at creating a simple micro ROS node for ROS2 jazzy. Using STM32cubeIDE software

The main.c file was modified to function over simple uart with no USB.

## How to use

### MCU setup
1.git clone --recurse-submodules git@github.com:exysta/MicroROS_STM32.git

2. Go to `Project -> Settings -> C/C++ Build -> Settings -> Build Steps Tab` and in `Pre-build steps` add:

   ```bash
   docker pull microros/micro_ros_static_library_builder:jazzy && docker run --rm -v ${workspace_loc:/${ProjName}}:/project --env MICROROS_LIBRARY_FOLDER=Middlewares/micro_ros_stm32cubemx_utils/microros_static_library_ide microros/micro_ros_static_library_builder:jazzy
   ```

3. Add micro-ROS include directory. In `Project -> Settings -> C/C++ Build -> Settings -> Tool Settings Tab -> MCU GCC Compiler -> Include paths` add `Middlewares/micro_ros_stm32cubemx_utils/microros_static_library_ide/libmicroros/include`
4. Add the micro-ROS precompiled library. In `Project -> Settings -> C/C++ Build -> Settings -> MCU GCC Linker -> Libraries`
      - add `<ABSOLUTE_PATH_TO>/micro_ros_stm32cubemx_utils/microros_static_library_ide/libmicroros` in `Library search path (-L)`
      - add `microros` in `Libraries (-l)`
5. Add the following source code files to your project, dragging them to source folder:
      - `extra_sources/microros_time.c`
      - `extra_sources/microros_allocators.c`
      - `extra_sources/custom_memory_manager.c`
      - `extra_sources/microros_transports/dma_transport.c` or your transport selection.
6. Make sure that if you are using FreeRTOS, the micro-ROS task **has more than 10 kB of stack**: [Detail](.images/Set_freertos_stack.jpg)
7. Configure the transport interface on the STM32CubeMX project, check the [Transport configuration](#Transport-configuration) section for instructions on the custom transports provided. (i am personally using UART with DMA for my config)
8. Build and run your project

### MicroROS agent setup

### Additionnal instructions
More instructions can  be found at https://github.com/micro-ROS/micro_ros_stm32cubemx_utils/tree/jazzy# and https://github.com/micro-ROS/micro_ros_setup/tree/jazzy

