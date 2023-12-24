#include <kernel.h>
#include <stdint.h>
#include <memory/bitarray.h>
#include <memory/pmemalloc.h>
#include <arch/serial.h>
#include <arch/kernel_string.h>

uint64_t pmem_lowest_free;
uint64_t pmem_max;
uint64_t pmem_map_end;
uint8_t *pmem_map_l3;
uint8_t *pmem_map_l2;
uint64_t *pmem_map_l1;
uint64_t *pmem_map_lsize;

#define palloc_new palloc
#define physalloc_new physalloc

void physalloc(uint64_t physaddr, uint64_t size_bytes){ // note: do not use outside of kernel initialisation and only use responsibly.
	uint64_t nopages = (size_bytes / PMEM_PAGE_SIZE) + ((size_bytes % PMEM_PAGE_SIZE) ? 1 : 0);
	uint64_t pageno = physaddr / PMEM_PAGE_SIZE;
	pmem_map_lsize[pageno] = nopages;
	for(uint64_t i = 0; i < nopages; i++){
		if(pmem_map_l1[pageno + i] == 0){
			pmem_map_l1[pageno + i] = nopages;
			pmem_map_l2[(pageno + i)/128]++;
			if(pmem_map_l2[(pageno + i)/128] == 128){
				pmem_map_l3[((pageno + i)/128)/128]++;
			}
		}
	}
}

void init_pmemalloc(void){
	uint64_t l1_size = 8*(pmem_max/32768);
	uint64_t l2_size = l1_size/128;
	uint64_t l3_size = l2_size/128;
	uint64_t lsize_size = l1_size;
	pmem_map_l1 = (uint64_t *)pmem_map_ptr;
	pmem_map_l2 = (uint8_t *)(pmem_map_ptr + l1_size);
	pmem_map_l3 = (uint8_t *)(pmem_map_ptr + l1_size + l2_size);
	pmem_map_lsize = (uint64_t *)(pmem_map_ptr + l1_size + l2_size + l3_size);
	pmem_map_end = pmem_map_ptr + l1_size + l2_size + l3_size + lsize_size;
	uint64_t *pmem_clear = (uint64_t *)pmem_map_ptr;
	for(uint64_t i = 0; i < ((pmem_map_end - pmem_map_ptr)/8); i++){
		pmem_clear[i] = 0;
	}
}

uint64_t getlowestfree(uint64_t index){
	uint64_t ret = (uint64_t)-1;
	uint64_t l3_free = (uint64_t)-1;
	for(uint64_t i = (index/128)/128; i < ((pmem_max/PMEM_PAGE_SIZE)/128)/128; i++){
		if(pmem_map_l3[i] != 128){
			l3_free = i;
			break;
		}
	}
	if(l3_free == (uint64_t)-1){
		return (uint64_t)-1;
	}
	uint64_t l2_free = (uint64_t)-1;
	for(uint64_t i = (l3_free*128); i < (pmem_max/PMEM_PAGE_SIZE)/128; i++){
		if(pmem_map_l2[i] != 128){
			l2_free = i;
			break;
		}
	}
	if(l2_free == (uint64_t)-1){
		return (uint64_t)-1;
	}
	for(uint64_t i = (l2_free*128); i < pmem_max/PMEM_PAGE_SIZE; i++){
		if(pmem_map_l1[i] == 0){
			ret = i;
			break;
		}
	}
	return ret;
}

uint64_t getcontingent(uint64_t index, uint64_t size, uint64_t limit){
	uint64_t ret = 0;
	for(uint64_t i = index; i < (index + limit); i++){
		if(pmem_map_l1[i] != size){
			break;
		}
		ret++;
	}
	return ret;
}

pagespan_t palloc(uint64_t size_bytes, palloc_state_t *state){ // note: call multiple times until ret.size = 0;
	pagespan_t ret;
	uint64_t hsize = ((size_bytes / PMEM_PAGE_SIZE) + ((size_bytes % PMEM_PAGE_SIZE) ? 1 : 0));
	ret.address = 0;
	ret.size = 0;
	if(state->pagespanscompleted == hsize){
		return ret;
	}
	ret.address = pmem_lowest_free*PMEM_PAGE_SIZE;
	uint64_t spansize = getcontingent(pmem_lowest_free, 0, hsize - state->pagespanscompleted);
	if(state->pagespanscompleted == 0){
		pmem_map_lsize[pmem_lowest_free] = size_bytes;
	}
	for(uint64_t i = 0; i < (hsize - state->pagespanscompleted) + 1; i++){
		if(pmem_map_l1[pmem_lowest_free + i] != 0 || i == (hsize - state->pagespanscompleted)){
			state->pagespanscompleted += i;
			break;
		}
		pmem_map_l1[pmem_lowest_free + i] = spansize;
		pmem_map_l2[(pmem_lowest_free + i)/128]++;
		if(pmem_map_l2[(pmem_lowest_free + i)/128] == 128){
			pmem_map_l3[((pmem_lowest_free + i)/128)/128]++;
		}
		ret.size += PMEM_PAGE_SIZE;
	}
	pmem_lowest_free = getlowestfree(pmem_lowest_free+(ret.size/PMEM_PAGE_SIZE));
	return ret;
}

uint64_t allocationsize(uint64_t address){
	return pmem_map_l1[address/PMEM_PAGE_SIZE];
}

void delete_pagespan(uint64_t address){
	uint64_t l1_index = address/PMEM_PAGE_SIZE;
	for(uint64_t i = 0; i < pmem_map_l1[l1_index]; i++){
		pmem_map_l1[l1_index + i] = 0;
		uint64_t l2_index = (l1_index + i)/128;
		uint64_t l3_index = l2_index/128;
		if(pmem_map_l2[l2_index] == 128){
			pmem_map_l3[l3_index]--;
		}
		pmem_map_l2[l2_index]--;
	}
}

void test_pmemalloc(void){
	physalloc_new(0, PMEM_PAGE_SIZE*1);
	physalloc_new(PMEM_PAGE_SIZE*2, PMEM_PAGE_SIZE*8);
	uint64_t continguent = getlowestfree(0);
	kernel_printf("%u pages allocation size of %u pages.\n", continguent, (uint64_t)pmem_map_l1[0]);
	kernel_printf("%u\n", getlowestfree(0));
	delete_pagespan(0);
	delete_pagespan(PMEM_PAGE_SIZE*2);
	pmem_lowest_free = getlowestfree(0);
	palloc_state_t state;
	state.pagespanscompleted = 0;
	pagespan_t span;
	span.address = 1;
	span.size = 1;
	while(span.size != 0){
		span = palloc_new(768*PMEM_PAGE_SIZE, &state);
		kernel_printf("0x%x mapped size %u.\n", span.address, span.size);
	}
	kernel_printf("allocation size at 0x%x is %u bytes.\n", PMEM_PAGE_SIZE*23, allocationsize(PMEM_PAGE_SIZE*23)*PMEM_PAGE_SIZE);
	kernel_printf("nice.\n");
}

// kobjmalloc(uint64_t size) -> void *: mallocates a kernel object in virtual and physical memory to the kernel object memory area
// umemmalloc(uint16_t pid, uint64_t size) -> void *: mallocates a user mode region of memory for a specified pid, specific size, and does it inside the user memory region
// kobjfree(void *address) -> void: frees a kernel object
// umemfree(uint16_t pid, void *address) -> void: frees a region of user memory for a specific pid
