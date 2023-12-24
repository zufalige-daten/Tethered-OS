#pragma once

#include <kernel.h>
#include <stdint.h>

typedef struct{
	uint16_t limit1;
	uint16_t base1;
	uint8_t base2;
	uint8_t access_byte;
	uint8_t flaglimit2;
	uint8_t base3;
	uint32_t base4;
	uint32_t reserved;
} _packed long_system_segment_descriptor_t;

typedef struct{
	uint16_t limit1;
	uint16_t base1;
	uint8_t base2;
	uint8_t access_byte;
	uint8_t flaglimit2;
	uint8_t base3;
} _packed segment_descriptor_t;

typedef struct{
	uint64_t null;
	segment_descriptor_t k_code;
	segment_descriptor_t k_data;
	segment_descriptor_t u_code;
	segment_descriptor_t u_data;
	long_system_segment_descriptor_t tss[128]; // 1 tss per core (gdtr_t.size = ((5*8)+(cpu_core_count*8)) - 1)
	// note
	// no ldts since paging is enough for that sort of thing (memory protection) and also not to mention all the bases for segment descriptors (gdt and ldt) are ignored anyways in 64 bit mode including the sizes so in terms of protection there wouldn't be much of a point implementing ldts.
} _packed gdt_t;

typedef struct{
	uint16_t size;
	gdt_t *gdt;
} _packed gdtr_t;

extern void reload_gdt(gdtr_t *gdtr);
