#pragma once

#include <kernel.h>
#include <stdint.h>

extern void interrupts_init(void);
extern void interrupts_enable(void);
extern void interrupts_register_all(void);

#define _interrupt __attribute__((interrupt))

typedef struct{
	uint64_t ip;
	uint64_t cs;
	uint64_t flags;
	uint64_t sp;
	uint64_t ss;
} _packed interrupt_frame_t;

