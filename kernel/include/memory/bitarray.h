#pragma once

#include <stdint.h>
#include <kernel.h>

extern void setbit(uint64_t bitarray_ptr, uint64_t offset, int32_t bit);
extern int32_t getbit(uint64_t bitarray_ptr, uint64_t offset);
extern uint64_t findzbit(uint64_t bitarray_ptr, uint64_t baseoffset, uint64_t maxlength);
extern uint64_t rfindzbit(uint64_t bitarray_ptr, uint64_t baseoffset);
