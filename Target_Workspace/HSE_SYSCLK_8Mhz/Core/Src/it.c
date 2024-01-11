/*
 * it.c
 *
 *  Created on: Aug 11, 2023
 *      Author: renatosoriano
 */

#include "main_app.h"

void SysTick_Handler (void)
{
	HAL_IncTick();
	HAL_SYSTICK_IRQHandler();
}

