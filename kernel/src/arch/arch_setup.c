#include <flags.h>
#include <kernel.h>
#include <arch/serial.h>
#include <x86_64/gdt.h>
#include <x86_64/x86io.h>
#include <filesystem/tufs.h>
#include <stdint.h>
#include <arch/paging.h>
#include <x86_64/msr.h>
#include <arch/fast_memcpy.h>
#include <stdarg.h>
#include <memory/pmemalloc.h>
#include <arch/kernel_string.h>
#include <arch/arch_setup.h>
#include <memory/bitarray.h>
#include <x86_64/acpi.h>
#include <x86_64/tss.h>

gdt_t gdt;
gdtr_t gdtr;

extern uint64_t kernel_pml4_map[512]; // the kernel's main pml4 map root map
extern uint64_t kernel_pml3_map_n[256*512]; // id map 1 GiB pages

void set_tss_des(long_system_segment_descriptor_t *tss_des, uint64_t base, uint64_t limit, uint8_t access_byte, uint8_t flags){
	tss_des->access_byte = access_byte;
	tss_des->limit1 = limit & 0xffff;
	tss_des->flaglimit2 = ((limit & 0x0000f) << 16) | (flags << 4);
	tss_des->base1 = base & 0xffff;
	tss_des->base2 = (base & 0x0000ff) << 16;
	tss_des->base3 = (base & 0x000000ff) << 24;
	tss_des->base4 = (base & 0x00000000ffffffff) << 32;
	tss_des->reserved = 0;
}

void arch_setup(kernel_header_struct_t kheader){
	kernel_printf("Setting up paging... ");
	// set up pat
	uint64_t pat__ = kernel_pat;
	uint32_t *pat_ptr__ = (uint32_t *)(&pat__);
	setmsr(0x277, pat_ptr__[0], pat_ptr__[1]);
	// note before anything
	// identity map the first 16 TiB of memory
	// clear the pml4 and pml3 tables
	// allocate all of the specific addresses
	for(uint64_t i = 0; i < 16 * 2; i++){
		kernel_pml4_map[i] = ((uint64_t)(&kernel_pml3_map_n[i * 512])) | PML_P | PML_RW;
	}
	for(uint64_t i = 0; i < 16 * 2 * 512; i++){
		kernel_pml3_map_n[i] = (i * (1024*1024*1024)) | PML_P | PML_RW | PML_PS;
	}
	asm volatile(
		"mov cr3, rax\n"
		::
		"a" ((uint64_t)(&kernel_pml4_map[0]))
	);
	kernel_printf("[SUCCESS]\n");
	kernel_printf("Setting up ACPI... ");
	acpi_init();
	kernel_printf("[SUCCESS]\n");
	kernel_printf("Getting CPU Core Count... ");
	acpi_walk_madt();
	uint16_t cpu_core_count = cpucorecount;
#ifndef TSS_MONO
	tss_count = cpu_core_count;
#endif
#ifdef TSS_MONO
	tss_count = 1;
#endif
	kernel_printf("[SUCCESS]\n");
	kernel_printf("Setting up new GDT... ");
	gdtr.gdt = &gdt;
	gdtr.size = ((5*8)+(tss_count*8)) - 1;
	gdt.null = 0;
	gdt.k_code.base1 = 0;
	gdt.k_code.base2 = 0;
	gdt.k_code.base3 = 0;
	gdt.k_code.limit1 = 0xffff;
	gdt.k_code.flaglimit2 = 0b10101111;
	gdt.k_code.access_byte = 0b10011010;
	gdt.u_code = gdt.k_code;
	gdt.u_code.access_byte = 0b11111010;
	gdt.k_data = gdt.k_code;
	gdt.k_data.flaglimit2 = 0b11001111;
	gdt.k_data.access_byte = 0b10010010;
	gdt.u_data = gdt.k_data;
	gdt.u_data.access_byte = 0b11110010;
	for(uint64_t i = 0; i < tss_count; i++){
		set_tss_des((long_system_segment_descriptor_t *)(&gdt.tss[i]), (uint64_t)(&tss[i]), sizeof(tss_t) - 1, 0b10001001, 0b0000);
		tss[i].iopb = sizeof(tss[i]);
		tss[i].rsp0 = ((uint64_t)&stack_top) - (65536 * i);
	}
	reload_gdt(&gdtr);
	kernel_printf("[SUCCESS]\n");
}

