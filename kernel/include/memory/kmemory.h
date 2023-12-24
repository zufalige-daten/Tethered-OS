#pragma once

#include <kernel.h>
#include <stdint.h>
#include <memory/pmemalloc.h>
#include <arch/paging.h>

extern void *kmalloc(uint64_t size);
extern void *kfree(void *address);
