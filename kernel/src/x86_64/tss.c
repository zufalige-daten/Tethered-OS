#include <x86_64/tss.h>
#include <kernel.h>

tss_t tss[128];
uint64_t tss_count = 0;
