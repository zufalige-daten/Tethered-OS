#include <arch/paging.h>
#include <stdint.h>
#include <arch/kernel_string.h>

extern uint64_t kernel_pml4_map[512];

void allocate_page(void *paddr, void *vaddr, uint64_t attributes, uint8_t table_level){
	/*
	steps:
	1. locate virtual address' pml4, pml3, pml2, and pml1 base addresses.
	4. up until the specified level allocate and enable any required pages on the higher levels
	3. based on table_level (0 for pml1, or 1 for pml2, 2 for pml3, 3 for pml4), allocate one page on specified table by oring paddr and attributes together
	*/
	uint64_t pml4_index = ((uint64_t)vaddr) / (512*1024*1024*1024);
	uint64_t pml3_index = (((uint64_t)vaddr) / (1*1024*1024*1024)) - (pml4_index * 512);
	uint64_t pml2_index = (((uint64_t)vaddr) / (2*1024*1024)) - ((pml4_index * 512 * 512) + (pml3_index * 512));
	uint64_t pml1_index = (((uint64_t)vaddr) / (4*1024)) - ((pml4_index * 512 * 512 * 512) + (pml3_index * 512 * 512) + (pml2_index * 512));
	kernel_printf("%u, %u, %u, %u.\n", pml1_index, pml2_index, pml3_index, pml4_index);
}
