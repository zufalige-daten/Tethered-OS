#pragma once

#include <kernel.h>
#include <stdint.h>

extern void getmsr(uint32_t msr, uint32_t *lo, uint32_t *hi);
extern void setmsr(uint32_t msr, uint32_t lo, uint32_t hi);
