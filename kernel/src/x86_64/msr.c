#include <x86_64/msr.h>
#include <kernel.h>
#include <stdint.h>

void getmsr(uint32_t msr, uint32_t *lo, uint32_t *hi){
	asm volatile("rdmsr" : "=a" (*lo), "=d" (*hi) : "c" (msr));
}

void setmsr(uint32_t msr, uint32_t lo, uint32_t hi){
	asm volatile("wrmsr" :: "a" (lo), "d" (hi), "c" (msr));
}
