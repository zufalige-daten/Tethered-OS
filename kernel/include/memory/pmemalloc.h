#pragma once

#include <kernel.h>
#include <stdint.h>

extern uint64_t pmem_lowest_free;
extern uint64_t pmem_max;
extern uint64_t pmem_map_ptr;
extern uint64_t pmem_map_end;
extern uint8_t *pmem_map_l3;
extern uint8_t *pmem_map_l2;
extern uint64_t *pmem_map_l1;

extern void physalloc(uint64_t physaddr, uint64_t size_bytes);

#define PMEM_PAGE_SIZE 32768

typedef struct{
	uint64_t address;
	uint64_t size;
} __attribute__((packed)) pagespan_t;

typedef struct{
	uint64_t pagespanscompleted;
} __attribute__((packed)) palloc_state_t;

extern pagespan_t palloc(uint64_t size_bytes, palloc_state_t *state);
extern void init_pmemalloc(void);
extern void test_pmemalloc(void);
extern uint64_t getlowestfree(uint64_t index);
extern uint64_t allocationsize(uint64_t address);
