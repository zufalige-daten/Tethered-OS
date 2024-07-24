#include <arch/paging.h>
#include <stdint.h>
#include <arch/kernel_string.h>

extern uint64_t kernel_pml4_map[512];

void allocate_page(void *paddr, void *vaddr, uint64_t attributes, uint8_t table_level){
	/*
	steps:
	*/
}

