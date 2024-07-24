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
	uint8_t ist;
	uint8_t attribs;
	uint16_t offset1;
	uint32_t offset2;
	uint32_t rsvd1;
} _packed idt_entry_t;

extern idtr_t kernel_idtr;
extern idt_entry_t kernel_idt[256];

extern void idt_init(void);
extern void idt_set(int idt_index, void *isr, uint8_t selector, uint8_t ist, uint8_t type_attribs);

#define IDT_ATTRIB_GATE_LONG_INTERUPT 0xe
#define IDT_ATTRIB_GATE_LONG_TRAP 0xf
#define IDT_ATTRIB_DPL_0 (0<<5)
#define IDT_ATTRIB_DPL_1 (1<<5)
#define IDT_ATTRIB_DPL_2 (2<<5)
#define IDT_ATTRIB_DPL_3 (3<<5)
#define IDT_ATTRIB_PRESENT (1<<7)

