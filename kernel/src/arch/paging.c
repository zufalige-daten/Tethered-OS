#include <kernel.h>
#include <arch/paging.h>
#include <stdint.h>
#include <arch/kernel_string.h>
#include <arch/fast_memcpy.h>
#include <memory/pmemalloc.h>

typedef struct {
	uint64_t pml4_index;
	uint64_t pml3_index;
	uint64_t pml2_index;
	uint64_t pml1_index;
	int success;
	int pagemap_level;
	uint64_t *page_allocator;
} vaddr_traversal_result_t;

extern uint64_t kernel_pml4_map[512]; // utilised as the directory map.

vaddr_traversal_result_t traverse_to_vaddr_absolute(void *vaddr) {
	/*
	 * Traverses to vaddr returning a pointer to the page allocater and the pagemap level that the page allocator is located.

	 * Success:
	 * Pagemap_level is level stopped at,
	 * Page_allocator is for current one.
	 * Failure:
	 * Pagemap_level is level stopped at,
	 * Page_allocator is for previous one.
	*/
	uint64_t pml4_index = (uint64_t)vaddr / (512L*1024L*1024L*1024L);
	uint64_t pml3_index = ((uint64_t)vaddr % (512L*1024L*1024L*1024L)) / (1024L*1024L*1024L);
	uint64_t pml2_index = (((uint64_t)vaddr % (512L*1024L*1024L*1024L)) % (1024L*1024L*1024L)) / (2L * 1024L * 1024L);
	uint64_t pml1_index = ((((uint64_t)vaddr % (512L*1024L*1024L*1024L)) % (1024L*1024L*1024L)) % (2L * 1024L * 1024L)) / (4L * 1024L);
	uint64_t pml4_entry = kernel_pml4_map[pml4_index];
	if((pml4_entry & PML_P) == 0) {
		return (vaddr_traversal_result_t) { .pml4_index = pml4_index, .pml3_index = pml3_index, .pml2_index = pml2_index, .pml1_index = pml1_index, .success = 0, .pagemap_level = 4 };
	}
	if(pml4_entry & PML_PS) {
		return (vaddr_traversal_result_t) { .pml4_index = pml4_index, .pml3_index = pml3_index, .pml2_index = pml2_index, .pml1_index = pml1_index, .success = 1, .pagemap_level = 4, .page_allocator = &kernel_pml4_map[pml4_index] };
	}
	uint64_t *pml3_map = (uint64_t *)(pml4_entry & 0xffffffffffffL);
	uint64_t pml3_entry = pml3_map[pml3_index];
	if((pml3_entry & PML_P) == 0) {
		return (vaddr_traversal_result_t) { .pml4_index = pml4_index, .pml3_index = pml3_index, .pml2_index = pml2_index, .pml1_index = pml1_index, .success = 0, .pagemap_level = 3, .page_allocator = &kernel_pml4_map[pml4_index] };
	}
	if(pml4_entry & PML_PS) {
		return (vaddr_traversal_result_t) { .pml4_index = pml4_index, .pml3_index = pml3_index, .pml2_index = pml2_index, .pml1_index = pml1_index, .success = 1, .pagemap_level = 3, .page_allocator = &pml3_map[pml3_index] };
	}
	uint64_t *pml2_map = (uint64_t *)(pml3_entry & 0xffffffffffffL);
	uint64_t pml2_entry = pml2_map[pml2_index];
	if((pml2_entry & PML_P) == 0) {
		return (vaddr_traversal_result_t) { .pml4_index = pml4_index, .pml3_index = pml3_index, .pml2_index = pml2_index, .pml1_index = pml1_index, .success = 0, .pagemap_level = 2, .page_allocator = &pml3_map[pml3_index] };
	}
	if(pml4_entry & PML_PS) {
		return (vaddr_traversal_result_t) { .pml4_index = pml4_index, .pml3_index = pml3_index, .pml2_index = pml2_index, .pml1_index = pml1_index, .success = 1, .pagemap_level = 2, .page_allocator = &pml2_map[pml2_index] };
	}
	uint64_t *pml1_map = (uint64_t *)(pml2_entry & 0xffffffffffffL);
	uint64_t pml1_entry = pml1_map[pml1_index];
	if((pml1_entry & PML_P) == 0) {
		return (vaddr_traversal_result_t) { .pml4_index = pml4_index, .pml3_index = pml3_index, .pml2_index = pml2_index, .pml1_index = pml1_index, .success = 0, .pagemap_level = 1, .page_allocator = &pml2_map[pml2_index] };
	}
	return (vaddr_traversal_result_t) { .pml4_index = pml4_index, .pml3_index = pml3_index, .pml2_index = pml2_index, .pml1_index = pml1_index, .success = 1, .pagemap_level = 1, .page_allocator = &pml1_map[pml1_index] };
}

int vallocate_page_4k(void *paddr, void *vaddr, uint64_t attributes) {
	/*
	 * Allocates a page of virtual memory set to some physical address paddr with attributes at level table_level.
	 * Do note:
	 * Must allocate physical memory for use as a page map level accordingly, each page map must be 512 * 8 bytes long.
	 * Must be able to traverse the virtual memory paging mapping.
	*/
	vaddr_traversal_result_t traversal_result = traverse_to_vaddr_absolute(vaddr);
	if(traversal_result.success) {
		return 0;
	}
	if(traversal_result.pagemap_level != 4) {
		traversal_result.page_allocator = (void *)((uint64_t)traversal_result.page_allocator & 0xffffffffffffL);
	}
	if(traversal_result.pagemap_level == 4) {
		palloc_state_t state;
		state.pagespanscompleted = 0;
		pagespan_t pml3_map = palloc(4096, &state);
		fast_memset_q(pml3_map.address, 512, 0);
		kernel_pml4_map[traversal_result.pml4_index] = (uint64_t)pml3_map.address | PML_P | attributes;
		traversal_result.pagemap_level = 3;
		traversal_result.page_allocator = &kernel_pml4_map[traversal_result.pml4_index];
	}
	if(traversal_result.pagemap_level == 3) {
		palloc_state_t state;
		state.pagespanscompleted = 0;
		uint64_t *pml3_map = (uint64_t *)((uint64_t)&traversal_result.page_allocator[traversal_result.pml4_index] & 0xffffffffffffL);
		pagespan_t pml2_map = palloc(4096, &state);
		fast_memset_q(pml2_map.address, 512, 0);
		pml3_map[traversal_result.pml3_index] = (uint64_t)pml2_map.address | PML_P | attributes;
		traversal_result.pagemap_level = 2;
		traversal_result.page_allocator = &pml3_map[traversal_result.pml3_index];
	}
	if(traversal_result.pagemap_level == 2) {
		palloc_state_t state;
		state.pagespanscompleted = 0;
		uint64_t *pml2_map = (uint64_t *)((uint64_t)&traversal_result.page_allocator[traversal_result.pml3_index] & 0xffffffffffffL);
		pagespan_t pml1_map = palloc(4096, &state);
		fast_memset_q(pml1_map.address, 512, 0);
		pml2_map[traversal_result.pml2_index] = (uint64_t)pml1_map.address | PML_P | attributes;
		traversal_result.pagemap_level = 1;
		traversal_result.page_allocator = &pml2_map[traversal_result.pml2_index];
	}
	if(traversal_result.pagemap_level == 1) {
		uint64_t *pml1_map = (uint64_t *)((uint64_t)&traversal_result.page_allocator[traversal_result.pml2_index] & 0xffffffffffffL);
		pml1_map[traversal_result.pml1_index] = (uint64_t)paddr | PML_P | attributes;
	}
	return 1;
}

int vallocate_page_2M(void *paddr, void *vaddr, uint64_t attributes) {
	/*
	 * Allocates a page of virtual memory set to some physical address paddr with attributes at level table_level.
	 * Do note:
	 * Must allocate physical memory for use as a page map level accordingly, each page map must be 512 * 8 bytes long.
	 * Must be able to traverse the virtual memory paging mapping.
	*/
	vaddr_traversal_result_t traversal_result = traverse_to_vaddr_absolute(vaddr);
	if(traversal_result.success) {
		return 0;
	}
	if(traversal_result.pagemap_level != 4) {
		traversal_result.page_allocator = (void *)((uint64_t)traversal_result.page_allocator & 0xffffffffffffL);
	}
	if(traversal_result.pagemap_level == 4) {
		palloc_state_t state;
		state.pagespanscompleted = 0;
		pagespan_t pml3_map = palloc(4096, &state);
		fast_memset_q(pml3_map.address, 512, 0);
		kernel_pml4_map[traversal_result.pml4_index] = (uint64_t)pml3_map.address | PML_P | attributes;
		traversal_result.pagemap_level = 3;
		traversal_result.page_allocator = &kernel_pml4_map[traversal_result.pml4_index];
	}
	if(traversal_result.pagemap_level == 3) {
		palloc_state_t state;
		state.pagespanscompleted = 0;
		uint64_t *pml3_map = (uint64_t *)((uint64_t)&traversal_result.page_allocator[traversal_result.pml4_index] & 0xffffffffffffL);
		pagespan_t pml2_map = palloc(4096, &state);
		fast_memset_q(pml2_map.address, 512, 0);
		pml3_map[traversal_result.pml3_index] = (uint64_t)pml2_map.address | PML_P | attributes;
		traversal_result.pagemap_level = 2;
		traversal_result.page_allocator = &pml3_map[traversal_result.pml3_index];
	}
	if(traversal_result.pagemap_level == 2) {
		uint64_t *pml2_map = (uint64_t *)((uint64_t)&traversal_result.page_allocator[traversal_result.pml3_index] & 0xffffffffffffL);
		pml2_map[traversal_result.pml2_index] = (uint64_t)paddr | PML_P | PML_PS | attributes;
	}
	return 1;
}

int vallocate_page_1G(void *paddr, void *vaddr, uint64_t attributes) {
	/*
	 * Allocates a page of virtual memory set to some physical address paddr with attributes at level table_level.
	 * Do note:
	 * Must allocate physical memory for use as a page map level accordingly, each page map must be 512 * 8 bytes long.
	 * Must be able to traverse the virtual memory paging mapping.
	*/
	vaddr_traversal_result_t traversal_result = traverse_to_vaddr_absolute(vaddr);
	if(traversal_result.success) {
		return 0;
	}
	if(traversal_result.pagemap_level != 4) {
		traversal_result.page_allocator = (void *)((uint64_t)traversal_result.page_allocator & 0xffffffffffffL);
	}
	if(traversal_result.pagemap_level == 4) {
		palloc_state_t state;
		state.pagespanscompleted = 0;
		pagespan_t pml3_map = palloc(4096, &state);
		fast_memset_q(pml3_map.address, 512, 0);
		kernel_pml4_map[traversal_result.pml4_index] = (uint64_t)pml3_map.address | PML_P | attributes;
		traversal_result.pagemap_level = 3;
		traversal_result.page_allocator = &kernel_pml4_map[traversal_result.pml4_index];
	}
	if(traversal_result.pagemap_level == 3) {
		uint64_t *pml3_map = (uint64_t *)((uint64_t)&traversal_result.page_allocator[traversal_result.pml4_index] & 0xffffffffffffL);
		pml3_map[traversal_result.pml3_index] = (uint64_t)paddr | PML_P | PML_PS | attributes;
	}
	return 1;
}

int vdeallocate_page(void *vaddr) {
	vaddr_traversal_result_t traversal_result = traverse_to_vaddr_absolute(vaddr);
	if(traversal_result.success == 0) {
		return 0;
	}
	*traversal_result.page_allocator = 0;
	return 1;
}

