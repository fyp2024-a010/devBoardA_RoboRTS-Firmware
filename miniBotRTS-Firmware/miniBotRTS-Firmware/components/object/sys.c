#include "sys.h"

uint32_t get_time_us(void) { return TIM5->CNT; }

uint32_t get_time_ms(void) { return HAL_GetTick(); }

float get_time_ms_us(void) { return get_time_ms() + get_time_us() / 1000.0f; }