#pragma once

#include <kernel.h>
#include <stdint.h>
#include <memory/pmemalloc.h>
#include <arch/paging.h>

extern void *kmalloc_phys(size_t size);
extern void kfree_phys(void *address);
extern void *kmalloc(size_t size);
extern void kfree(void *address);

