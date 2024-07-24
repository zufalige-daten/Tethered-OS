#include <x86_64/tss.h>
#include <kernel.h>

tss_t tss[128];
uint64_t tss_count = 0;

void ldtssi(uint16_t tss_i){
	uint16_t gdt_descriptor = (5*0x8)+(tss_i*16);
	asm volatile("ltr ax" :: "a"(gdt_descriptor));
}

