#include <kernel.h>
#include <arch/interrupts.h>
#include <arch/kernel_string.h>

_interrupt void in_syscallinterrupt(interrupt_frame_t *frame){
	uint64_t extract;
	asm volatile("mov rbx, rbx" : "=b"(extract));
	kernel_printf("Interrupt: SCLINT.\n");
	kernel_printf("System call: attempted call of syscall function %u.\n", extract);
	if(extract == 0){
		kernel_printf("Hello there.\n");
	}
}

