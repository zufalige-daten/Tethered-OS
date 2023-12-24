#include <kernel.h>
#include <arch/serial.h>
#include <filesystem/tufs.h>
#include <stdint.h>
#include <arch/fast_memcpy.h>
#include <stdarg.h>
#include <memory/pmemalloc.h>

extern void *kernel_end;

#define lonybble(byte) (byte & 0x0f)
#define hinybble(byte) (byte >> 4)

// uint64_t dummy = 0;

// uint64_t getpmem(void){
// 	uint64_t ret = 0;
// 	uint64_t current_address = 512*1024*1024;
// 	int got_to_4_GiB = 0;
// 	while(1){
// 		uint64_t ogstor = memget_q(current_address);
// 		const uint64_t magic = 0x7bfd87ceeff;
// 		const uint64_t dm_magic = 0x8e7cee4ccc44ffea;
// 		asm volatile("mov qword ptr [rdi], rax" :: "D" (current_address), "a" (magic));
// 		asm volatile("mov qword ptr [dummy], rax" :: "a" (dm_magic));
// 		asm volatile("wbinvd");
// 		uint64_t new_value = memget_q(current_address);
// 		asm volatile("mov qword ptr [rdi], rax" :: "D" (current_address), "a" (ogstor));
// 		if(new_value != magic && current_address == 0xc0000000){ // avoid pci devices skewing results (starting from 0xc0000000 for 1 GiB is where the pci device address space is existant)
// 			current_address += 1024*1024*1024;
// 			got_to_4_GiB = 1;
// 		}
// 		else if(new_value != magic){
// 			if(got_to_4_GiB){
// 				ret = current_address - (1024*1024*1024);
// 				break;
// 			}
// 			ret = current_address;
// 			break;
// 		}
// 		else{
// 			current_address += 0x1000;
// 		}
// 	}
// 	return ret;
// }

extern void *bss_start;
extern void *bss_end;

#include <memory/bitarray.h>
#include <x86_64/acpi.h>
#include <arch/kernel_string.h>
#include <arch/arch_setup.h>
#include <arch/paging.h>

void kernel_main(void){
	kernel_printf("Successefully booted into kernel (x86_64).\n");
	kernel_header_struct_t volatile kheader = *khs;
	arch_setup(kheader);
	uint64_t lfb_ptr = kheader.lfb;
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
	pmem_max = kheader.mem_size;
	kernel_printf("pmem_max = %u.\n", pmem_max);
	init_pmemalloc();
	test_pmemalloc();
	while(1);
	pmem_lowest_free = 0;
	physalloc(0, (uint64_t)&kernel_end);
	physalloc((uint64_t)&bss_start, (uint64_t)&bss_end - (uint64_t)&bss_start);
	physalloc(mmdevs_region.baseaddr, mmdevs_region.size);
	physalloc(lfb_ptr, (kheader.lfb_width * kheader.lfb_height) * 4);
	physalloc(0xa0000, 0xbffff-0xa0000);
	physalloc(pmem_map_ptr, ((pmem_max/PMEM_PAGE_SIZE)*8)+((pmem_max/PMEM_PAGE_SIZE)/128)+(((pmem_max/PMEM_PAGE_SIZE)/128)/128));
	kernel_printf("[SUCCESS]\n");
	kernel_printf("pmem_map_ptr = 0x%x.\n", pmem_map_ptr);
	uint64_t continguent = getlowestfree(0);
	pmem_lowest_free = continguent;
}
