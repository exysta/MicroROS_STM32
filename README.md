
# Micro-ROS on STM32 for ROS 2 Jazzy

This project provides a simple, working example of a micro-ROS node running on an STM32 microcontroller. It is configured for **ROS 2 Jazzy** and uses **STM32CubeIDE**.

The communication is handled over a **UART/serial connection** using DMA, without relying on the native USB peripheral.

## Prerequisites

Before you begin, ensure you have the following installed and configured:
*   **STM32CubeIDE**: The IDE used to build and flash the firmware.
*   **ROS 2 Jazzy**: A working installation on your host computer (e.g., Ubuntu 24.04).
*   **Docker**: Required to run the micro-ROS static library builder.

---

## Setup Instructions

The setup is divided into two main parts: configuring and flashing the MCU firmware, and building and running the micro-ROS agent on your host PC.

### 1. MCU Firmware Setup (STM32CubeIDE)

1.  **Clone the Repository:**
    Clone this repository and all its submodules. The `--recurse-submodules` flag is essential.
    ```bash
    git clone --recurse-submodules git@github.com:exysta/MicroROS_STM32.git
    ```

2.  **Generate micro-ROS Static Library (Pre-build Step):**
    This step uses Docker to automatically pull and build the correct version of the micro-ROS static library.
    *   In STM32CubeIDE, go to `Project -> Properties -> C/C++ Build -> Settings`.
    *   Navigate to the `Build Steps` tab.
    *   In the `Pre-build steps` command line, add the following:
    ```bash
    docker pull microros/micro_ros_static_library_builder:jazzy && docker run --rm -v ${workspace_loc:/${ProjName}}:/project --env MICROROS_LIBRARY_FOLDER=Middlewares/micro_ros_stm32cubemx_utils/microros_static_library_ide microros/micro_ros_static_library_builder:jazzy
    ```

3.  **Configure Compiler Include Path:**
    *   Navigate to the `Tool Settings` tab -> `MCU GCC Compiler` -> `Include paths`.
    *   Add the following directory: `Middlewares/micro_ros_stm32cubemx_utils/microros_static_library_ide/libmicroros/include`

4.  **Configure Linker Library Path:**
    *   Navigate to `MCU GCC Linker` -> `Libraries`.
    *   In `Library search path (-L)`, add the path to the compiled library. **Tip:** Using a workspace-relative path makes the project more portable.
        ```
        ${workspace_loc:/${ProjName}}/Middlewares/micro_ros_stm32cubemx_utils/microros_static_library_ide/libmicroros
        ```
    *   In `Libraries (-l)`, add `microros`.

5.  **Add Required Source Files:**
    From the `extra_sources` folder provided by the `micro_ros_stm32cubemx_utils` submodule, drag the following files into the `Core/Src` folder in your project explorer:
    *   `microros_allocators.c`
    *   `microros_time.c`
    *   `custom_memory_manager.c`
    *   `microros_transports/dma_transport.c` (or your chosen transport file)

6.  **Increase FreeRTOS Task Stack:**
    The micro-ROS task requires a significant amount of stack space.
    *   Open the `.ioc` file (STM32CubeMX perspective).
    *   Go to `Middleware and Software Packs` -> `FreeRTOS`.
    *   Under the `Tasks and Queues` tab, find the `defaultTask` (or the task running micro-ROS).
    *   Increase its `Stack Size` to at least **3000** words (which equals 12000 bytes).

7.  **Build and Flash:**
    Build the project (`Project -> Build All`) and flash it to your STM32 board.

### 2. Micro-ROS Agent Setup (Host PC)

The agent is the bridge between your STM32 and the ROS 2 network.

1.  **Build the Agent:**
    These commands download the agent packages and build them. You only need to do this once.
    ```bash
    # Navigate to the setup folder in the project
    cd <path_to>/MicroROS_STM32/Code/MicroROS_setup

    # Create the agent workspace and build it
    ros2 run micro_ros_setup create_agent_ws.sh
    ros2 run micro_ros_setup build_agent.sh
    ```

2.  **Run the Agent:**
    You must run this command every time you want to connect to your STM32.
    ```bash
    # Source the agent's workspace
    source install/local_setup.bash

    # Run the agent, connecting it to the STM32's serial port
    ros2 run micro_ros_agent micro_ros_agent serial --dev /dev/ttyACM0 -v6
    ```
    *   **`--dev /dev/ttyACM0`**: Specify the serial port your ST-LINK is connected to. Find it with `ls /dev/tty*` on Linux, or check Device Manager for the "STLink Virtual COM Port" on Windows (e.g., `COM3`).
    *   **`-v6`**: Sets the verbosity level to maximum. This is very helpful for debugging connection issues.

---

### 3. Verification

Once the firmware is running and the agent is launched, you can verify that everything is working.

1.  **Check the Agent Terminal:**
    You should see output indicating a session has been established:
    ```
    [... info] SessionManager.hpp | establish_session | session established | client_key: 0x..., address: 0
    ```

2.  **Check ROS 2 Topics (in a new terminal):**
    First, source your main ROS 2 Jazzy workspace. Then, use the standard ROS 2 tools.
    ```bash
    # See if the node is visible
    ros2 node list
    # Expected output: /cubemx_node

    # See if the topic is being advertised
    ros2 topic list
    # Expected output: /cubemx_publisher

    # Echo the data from the topic
    ros2 topic echo /cubemx_publisher
    # Expected output: A stream of incrementing numbers
    # data: 10
    # ---
    # data: 11
    # ---
    ```

## Important Considerations

*   **Agent Connection:** The micro-ROS node on the STM32 **will not fully initialize** until it successfully connects to a running agent. You must start the agent first, then power on or reset your STM32 board.
*   **Communication Conflict:** The UART channel is used exclusively for the micro-ROS protocol. Standard `printf` debugging will corrupt the data stream and prevent the agent from connecting. For debugging, either use a **separate UART** or wrap `printf` calls in a preprocessor macro that can be disabled.
    ```c
    // In main.c
    #define DEBUG 0 // Set to 1 for debug prints, 0 for micro-ROS operation

    #if DEBUG
    printf("This is a debug message.\r\n");
    #endif
    ```

### Additional Resources
*   [Official micro-ROS for STM32CubeMX Utility](https://github.com/micro-ROS/micro_ros_stm32cubemx_utils/tree/jazzy)
*   [Official micro-ROS Setup Repository](https://github.com/micro-ROS/micro_ros_setup/tree/jazzy)
