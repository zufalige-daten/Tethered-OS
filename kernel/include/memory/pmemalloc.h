#pragma once

#include <kernel.h>
#include <stdint.h>
#include <stddef.h>

extern size_t pmem_lowest_free;
extern size_t pmem_max;
extern size_t pmem_map_ptr;
extern size_t pmem_map_size;

extern void physalloc(size_t physaddr, size_t r_size_bytes);

#define PMEM_PAGE_SIZE_2S 7
#define PMEM_PAGE_SIZE ((1<<PMEM_PAGE_SIZE_2S)*1024)
#define BMCONSTRUCT(n) ((1<<n)-1)
#define BM_PMEM2S BMCONSTRUCT(PMEM_PAGE_SIZE_2S)

typedef struct{
	size_t address;
	size_t size;
} __attribute__((packed)) pagespan_t;

typedef struct{
	size_t pagespanscompleted;
} __attribute__((packed)) palloc_state_t;

typedef size_t palloc_entry_t;

extern palloc_entry_t *palloc_entries;

extern pagespan_t palloc(size_t size_bytes, palloc_state_t *state);
extern void init_pmemalloc(void);
extern void test_pmemalloc(void);
extern size_t getlowestfree(size_t index);
extern size_t allocationsize(size_t address);

