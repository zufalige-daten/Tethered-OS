#include "arch/fast_memcpy.h"
#include <kernel.h>
#include <stddef.h>
#include <stdint.h>
#include <memory/bitarray.h>
#include <memory/pmemalloc.h>
#include <arch/paging.h>
#include <arch/serial.h>
#include <arch/kernel_string.h>

size_t pmem_lowest_free; // lowest index free page.
size_t pmem_max; // maximum number of pages.
size_t pmem_map_size; // total size of palloc_entries array structure in bytes.
palloc_entry_t *palloc_entries; // pointer to palloc_entries array.

/*
 * due to this the virual memory map will be changed accordingly:
 * 256 TiB:
 *  - 16 TiB: kernel space. the space where the kernel's code, data, interrupt handlers, as well as an identity map of physical memory resides.
 *  - 16 TiB: pmem_frames space. the space where the pmem_frames data structure array will be stored as a vector in it's own address space for speed.
 *  - 16 TiB: vmem_mapping space. the space where the vmem_mapping data structures will be stored for mapping of virtual memory for kernel related use.
 *  - 16 TiB: kernel_mmio space. the space where the kernel will selectively map kernel-accessable memory mapped io devices with their own special parameters other than mapping defaults.
 *  - 64 TiB: kernel_object space. the spae where the kernel will store all of it's other variably allocated vector data structures, linked lists, and other data structuers that require memory to be allocated in virtual memory and physical memory (most likely for variably sized data structures) explicitly for them to be used properly.
 *  - 128 TiB: userland_active_proccess space. the space where all code and data as well as allocated objects of the active userland proccess will be mapped to when a proccess is currently executing.
*/

inline size_t phys_linear_search_unallocated(size_t start){
	for(size_t i = start; i < pmem_max; i++){
		if(palloc_entries[i] == 0){
			return i;
		}
	}

	for(size_t i = start; i > 0; i--){
		if(palloc_entries[i] == 0){
			return i;
		}
	}

	return -1;
}

void physalloc(size_t physaddr, size_t r_size_bytes){
	size_t physindex = (physaddr&(~BM_PMEM2S))/PMEM_PAGE_SIZE;
	size_t size_bytes = (r_size_bytes+(physaddr-(physaddr&(~BM_PMEM2S))));
	size_t physsize = (size_bytes/PMEM_PAGE_SIZE)+((size_bytes%PMEM_PAGE_SIZE)?1:0);
	fast_memset_q((uint64_t)(&palloc_entries[physindex]), physsize, size_bytes);
}

void init_pmemalloc(void){
	pmem_lowest_free = 0;
	palloc_entries = (void *)pmem_map_ptr;
	pmem_max = khs->mem_size/PMEM_PAGE_SIZE;
	pmem_map_size = pmem_max*sizeof(palloc_entry_t);
	fast_memset_q(pmem_map_ptr, pmem_map_size, 0);
}

size_t getlowestfree(size_t index){
	return phys_linear_search_unallocated(index);
}

pagespan_t palloc(size_t size_bytes, palloc_state_t *state){ // note: call multiple times until ret.size = 0;
	pagespan_t ret;
	if(state->pagespanscompleted == size_bytes/PMEM_PAGE_SIZE){
		ret.address = 0;
		ret.size = 0;
		return ret;
	}
	size_t physindex = pmem_lowest_free;
	size_t roundallocsize = (size_bytes/PMEM_PAGE_SIZE)-state->pagespanscompleted;
	size_t roundallocsize_size = 0;
	size_t i;
	for(i = 0; palloc_entries[physindex+i] == 0 && i < roundallocsize; i++);
	roundallocsize_size = i*PMEM_PAGE_SIZE;
	for(i = 0; palloc_entries[physindex+i] == 0 && i < roundallocsize; i++){
		palloc_entries[physindex+i] = roundallocsize_size;
	}
	state->pagespanscompleted += i;
	ret.address = physindex*PMEM_PAGE_SIZE;
	ret.size = i*PMEM_PAGE_SIZE;
	pmem_lowest_free = phys_linear_search_unallocated(physindex);
	return ret;
}

size_t allocationsize(size_t address){
	return palloc_entries[address/PMEM_PAGE_SIZE];
}

void delete_pagespan(size_t address){
	size_t span_size = palloc_entries[address/PMEM_PAGE_SIZE]/PMEM_PAGE_SIZE;
	fast_memset_q((uint64_t)(&palloc_entries[address/PMEM_PAGE_SIZE]), span_size*sizeof(palloc_entry_t), 0);
}

void test_pmemalloc(void){
	kernel_printf("pmemalloc test / map_size: %u.\n", pmem_map_size);
	kernel_printf("Mapping @0x0 #%u bytes.\n", PMEM_PAGE_SIZE*1);
	physalloc(0, PMEM_PAGE_SIZE*1);
	kernel_printf("Mapping @0x%x #%u bytes.\n", PMEM_PAGE_SIZE*2, PMEM_PAGE_SIZE*8);
	physalloc(PMEM_PAGE_SIZE*2, PMEM_PAGE_SIZE*8);
	kernel_printf("0x0 mapped size %u.\n", allocationsize(0x0));
	kernel_printf("0x20000 mapped size %u.\n", allocationsize(0x20000));
	kernel_printf("0x%x mapped size %u.\n", PMEM_PAGE_SIZE*2, allocationsize(PMEM_PAGE_SIZE*2));
	kernel_printf("Lowest free index: %u\n", getlowestfree(0));
	pmem_lowest_free = getlowestfree(0);
	palloc_state_t state;
	state.pagespanscompleted = 0;
	pagespan_t span;
	span.address = 1;
	span.size = 1;
	while(span.size != 0){
		span = palloc(654*PMEM_PAGE_SIZE, &state);
		if(span.size != 0){
			kernel_printf("0x%x mapped size %u.\n", span.address, span.size);
		}
	}
	kernel_printf("nice.\n");
}

// kobjmalloc(size_t size) -> void *: mallocates a kernel object in virtual and physical memory to the kernel object memory area
// umemmalloc(uint16_t pid, size_t size) -> void *: mallocates a user mode region of memory for a specified pid, specific size, and does it inside the user memory region
// kobjfree(void *address) -> void: frees a kernel object
// umemfree(uint16_t pid, void *address) -> void: frees a region of user memory for a specific pid

