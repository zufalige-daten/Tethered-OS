#include <kernel.h>
#include <arch/serial.h>
#include <filesystem/tufs.h>
#include <stdint.h>
#include <arch/fast_memcpy.h>
#include <stdarg.h>
#include <memory/pmemalloc.h>

extern void *kernel_end;
extern void *bss_start;
extern void *bss_end;

#include <memory/bitarray.h>
#include <x86_64/acpi.h>
#include <arch/kernel_string.h>
#include <arch/arch_setup.h>
#include <arch/paging.h>
#include <arch/interrupts.h>
#include <arch/tasksw.h>

void kernel_main(void){
	kernel_printf("Successefully booted into kernel (x86_64).\n");
	kernel_header_struct_t volatile kheader = *khs;
	arch_setup(kheader);
	size_t lfb_ptr = kheader.lfb;
	// note before memory allocation
	// programs are linked such that they are flat binaries with their origin of execution at 128 TiB because before that is the kernel identity map region where it is one large kernel level data segment with the entire identity map and that when a program is to be executed the only thing that needs to be done is to load their local pml4 (full table where lower 128 TiB is identity mapped / reserved as kernel data that is executable) as entry 2 in the pml4 table to then have it's execution continued
	fast_memset_q(lfb_ptr, (kheader.lfb_height*kheader.lfb_width)/2, 0x0000000000000000);
	kernel_printf("kheader.mem_size = %u MiB.\n", (kheader.mem_size / (1024 * 1024)));
	kernel_printf("LFB addr = 0x%x.\n", kheader.lfb);
	// extra avoidences
	boot_mmap_entry_t mmdevs_region; // note: starts at 0xc0000000
	mmdevs_region.baseaddr = 0xc0000000;
	mmdevs_region.size = 1024*1024*1024;
	kernel_printf("Setting up physical memory allocator... ");
	init_pmemalloc();
	kernel_printf("pmem_map_ptr = 0x%x.\n", pmem_map_ptr);
	kernel_printf("pmem_map_size = %u.\n", pmem_map_size);
	kernel_printf("pmem_max = %u.\n", pmem_max);
	// test_pmemalloc();
	physalloc(0, (uint64_t)&kernel_end);
	physalloc((uint64_t)&bss_start, (uint64_t)&bss_end - (uint64_t)&bss_start);
	physalloc(mmdevs_region.baseaddr, mmdevs_region.size);
	physalloc(lfb_ptr, (kheader.lfb_width * kheader.lfb_height) * 4);
	physalloc(0xa0000, 0xbffff-0xa0000);
	physalloc(pmem_map_ptr, pmem_map_size);
	kernel_printf("[SUCCESS]\n");
	uint64_t continguent = getlowestfree(0);
	pmem_lowest_free = continguent;
	// interrupts :: int 0x80 : system call to procedure provided by the system.
	kernel_printf("Setting up interrupts... ");
	interrupts_init();
	interrupts_register_all();
	kernel_printf("[SUCCESS]\n");
	asm volatile("int 0x80" :: "b"(8L));
	asm volatile("int 0x80" :: "b"(0L));
	// next TODO :: attempt to switch to a usermode piece of code after setting up the tss, implement task switching.
	test_usermode();
	while(1);
}

