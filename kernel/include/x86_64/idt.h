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
	uint8_t ist: 3;
	uint8_t rsvd1: 5;
	uint8_t gate_type: 4;
	uint8_t rsvd2: 1;
	uint8_t dpl: 2;
	uint8_t present: 1;
	uint16_t offset1;
	uint32_t offset2;
	uint32_t rsvd3;
} _packed idt_entry_t;

extern idtr_t kernel_idtr;
extern idt_entry_t kernel_idt[256];

extern void idt_init(void);
extern void idt_set(int idt_index, void *isr, uint8_t selector, uint8_t ist, uint8_t gate_type, uint8_t dpl, uint8_t present);

#define IDT_ATTRIB_GATE_LONG_INTERUPT 0xe
#define IDT_ATTRIB_GATE_LONG_TRAP 0xf

