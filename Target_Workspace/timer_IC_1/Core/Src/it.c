/*
 * it.c
 *
 *  Created on: Aug 11, 2023
 *      Author: renatosoriano
 */

#include "main_app.h"

extern TIM_HandleTypeDef htimer2;
extern TIM_HandleTypeDef htimer6;

void SysTick_Handler (void)
{
	HAL_IncTick();
	HAL_SYSTICK_IRQHandler();
}

void TIM2_IRQHandler(void)
{
	HAL_TIM_IRQHandler(&htimer2);
}

void TIM6_DAC_IRQHandler(void)
{
	HAL_GPIO_TogglePin(GPIOA,GPIO_PIN_5);
	HAL_TIM_IRQHandler(&htimer6);
}
