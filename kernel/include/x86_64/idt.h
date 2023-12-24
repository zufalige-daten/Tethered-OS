#pragma once

#include <kernel.h>
#include <stdint.h>

typedef struct{
	uint16_t size;
	uint64_t offset;
} _packed idtr_t;

typedef struct{
	uint16_t offset0;
	uint16_t selector;
	uint8_t ist : 2;
	uint8_t rsvd0 : 5;
	uint8_t gatetype : 4;
	uint8_t rsvd1 : 1;
	uint8_t dpl : 2;
	uint8_t p : 1;
	uint16_t offset1;
	uint32_t offset2;
	uint32_t rsvd2;
} _packed idt_entry_t;

extern idtr_t kernel_idtr;
extern idt_entry_t kernel_idt[256];
