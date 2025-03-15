
# Mastering Microcontroller: Timers, PWM, CAN, Low Power (MCU2)

This repo contains notes and programming assignments for the Udemy's "[Mastering Microcontroller: Timers, PWM, CAN, Low Power (MCU2)](https://www.udemy.com/course/microcontroller-programming-stm32-timers-pwm-can-bus-protocol/)" course by FastBit Embedded Brain Academy.

Date: August, 2019.
Date Updated (STM32CubeIDE): January, 2024.

- The course is instructed by Engineer Kiran Nayak.

- The [**Certificate**](https://github.com/renatosoriano/Udemy-Embedded-Course4_Mastering-Microcontroller-Timers-PWM-CAN-Low-Power-MCU2/blob/main/Certificate.pdf) is available. 

- The [**Coding Exercises**](https://github.com/renatosoriano/Udemy-Embedded-Course4_Mastering-Microcontroller-Timers-PWM-CAN-Low-Power-MCU2/tree/main/Target_Workspace) are available. 

## Descriptions

In this course we are going to learn and master Timers , PWM, CAN, RTC, Low Power modes of STM32F4x Micro-controller with step by step guidance, with various real-time exercises which help to master every peripheral covered in this course and covers both theory and practical aspects of Timers, PWM, CAN, RTC, Low Power modes of STM32F4x Micro-controller.

In Timer Section the course covers:
1. Simple time-based generation using the basic timer in both polling and interrupt mode.
2. Timer interrupts and IRQ numbers, ISR implementation, callbacks, etc.
3. General-purpose timer.
4. Working with Input Capture channels of General-purpose timer.
5. Interrupts, IRQs, ISRs, callbacks related to Input Capture engine of the general purpose timer.
6. Working with output capture channels of the General purpose timer.
7. Interrupts, IRQs, ISRs, callbacks related to Output Capture engine of the general purpose timer.
8. PWM generation using output capture modes.
9. PWM Exercises.
10. Step by Step code development process will help you to master the TIMER peripheral.

In CAN Section the course covers:
1. Introduction to the CAN protocol.
2. CAN frame formats.
3. Understanding a CAN node.
4. CAN signaling (single-ended signals vs differential signals).
5. CAN Bus recessive state and dominant state.
6. CAN Bit timing Calculation.
7. CAN network with Transceivers.
8. Exploring inside view of CAN transceivers.
9. CAN Self-test modes such as LOOPBACK, SILENT LOOPBACK, etc with code exercises.
10. Exploring STM32 bXCAN peripheral.
11. self-testing of bxCAN peripheral with exercises.
12. bXCAN block diagram.
13. Tx/Rx path of the bxCAN Peripheral.
14. CAN frame filtering and executrices.
15. CAN in Normal Mode.
16. Communicating between 2 boards over CAN.
17. Code exercises.

In the Power Controller Section the course covers:
1. ARM Cortex Mx Low Power Modes Normals Vs DeepSleep.
2. STM32 SLEEP mode.
3. STOP mode.
4. STANDBY mode.
5. Current measurement with different submode.
6. Waking up MCU by using wakeup pins, EXTI, RTC, etc.
7. Backup SRAM.
8. Step by Step coverage with lots of code exercises.

In RTC Section the course covers:
1. RTC functional block diagram.
2. RTC clock management.
3. RTC calendar unit.
4. RTC Alarm unit.
5. RTC wake-up unit.
6. RTC Time Stamp Unit.
7. waking up MCU using RTC events.
8. RTC interrupts.
9. and lots of other details with step by step code exercises.

STM32 Device HAL framework:
1. STM32 Device Hal framework details.
2. APIs details.
3. Interrupt handling.
4. Callback implementation.
5. Peripheral Handling and configurations.
6. Step by Step explanation with code exercises.

## Requirements

**[STM32 Nucleo-F446RE Development Board](https://www.st.com/en/evaluation-tools/nucleo-f446re.html#overview)** - Board used in this course but any board with Arm Cortex-M0/3/4 core will work, just modifying the target board and configuring with the respective datasheet. \
**[Eclipse-based STM32CubeIDE](https://www.st.com/en/development-tools/stm32cubeide.html)** - C/C++ development platform with peripheral configuration, code generation, code compilation, and debug features for STM32 microcontrollers and microprocessors. Works on Windows/Linux/Mac and is free.

## Notes
* #### FPU warning fix
    Right click on the project -> properties -> expand C/C++ build -> Settings -> Tool settings -> MCU settings
  * `Floating-point unit: None`
  * `Floating-point ABI: Software implementation ( -mfloat-abi=soft )`

![FPU_warning.png](https://github.com/renatosoriano/Udemy-Embedded-Course4_Mastering-Microcontroller-Timers-PWM-CAN-Low-Power-MCU2/blob/main/Images/FPU_warning.png)

* #### Setting up SWV ITM Data Console

Open *syscalls.c* file and paste following code bellow *Includes*

```c
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//           Implementation of printf like feature using ARM Cortex M3/M4/ ITM functionality
//           This function will not work for ARM Cortex M0/M0+
//           If you are using Cortex M0, then you can use semihosting feature of openOCD
/////////////////////////////////////////////////////////////////////////////////////////////////////////


//Debug Exception and Monitor Control Register base address
#define DEMCR                   *((volatile uint32_t*) 0xE000EDFCU )

/* ITM register addresses */
#define ITM_STIMULUS_PORT0   	*((volatile uint32_t*) 0xE0000000 )
#define ITM_TRACE_EN          	*((volatile uint32_t*) 0xE0000E00 )

void ITM_SendChar(uint8_t ch)
{

	//Enable TRCENA
	DEMCR |= ( 1 << 24);

	//enable stimulus port 0
	ITM_TRACE_EN |= ( 1 << 0);

	// read FIFO status in bit [0]:
	while(!(ITM_STIMULUS_PORT0 & 1));

	//Write to ITM stimulus port0
	ITM_STIMULUS_PORT0 = ch;
}
```


After that find function *_write* and replace `__io_putchar(*ptr++)` with `ITM_SendChar(*ptr++)` like in code snippet below
```c
__attribute__((weak)) int _write(int file, char *ptr, int len)
{
	int DataIdx;

	for (DataIdx = 0; DataIdx < len; DataIdx++)
	{
		//__io_putchar(*ptr++);
		ITM_SendChar(*ptr++);
	}
	return len;
}
```

After these steps navigate to Debug configuration and check `Serial Wire Viewer (SWV)` check box like on snapshot below

![Debugger.png](https://github.com/renatosoriano/Udemy-Embedded-Course4_Mastering-Microcontroller-Timers-PWM-CAN-Low-Power-MCU2/blob/main/Images/Debugger.png)

Once you enter *Debug* mode, go to `Window -> Show View -> SWV -> Select SWV ITM Data Console`. On this way `ITM Data Console` will be shown in *Debug* session.


In `SWV ITM Data Console Settings` in section `ITM Stimulus Ports` enable port 0, so that you can see `printf` data.



