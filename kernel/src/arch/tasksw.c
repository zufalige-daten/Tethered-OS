#include <arch/paging.h>
#include <kernel.h>
#include <arch/tasksw.h>
#include <stdint.h>
#include <stddef.h>
#include <x86_64/tss.h>

extern uint64_t kernel_pml3_map_n[256*512];
extern uint64_t kernel_pml4_map[512];

extern void test_user_function(void);
extern void um_enter(void);

void test_usermode(void){
	ldtssi(0);
	// first allocate required userland virtual page
	kernel_pml3_map_n[16] = ((uint64_t)&test_user_function) | PML_P | PML_RW | PML_PS | PML_US;
	asm volatile(
		"mov cr3, rax\n"
		::
		"a" ((uint64_t)(&kernel_pml4_map[0]))
	);
	// asm volatile("mov ax, (4*8)");
	// asm volatile("mov ds, ax");
	// asm volatile("mov es, ax");
	// asm volatile("mov fs, ax");
	// asm volatile("mov gs, ax");
	// asm volatile("mov rax, (4*8)");
	// asm volatile("push rax");
	// asm volatile("mov rax, rsp");
	// asm volatile("push rax");
	// asm volatile("pushfq");
	// asm volatile("mov rax, (3*8)");
	// asm volatile("push rax");
	// asm volatile("mov rax, (16*(1024*1024*1024))");
	// asm volatile("push rax");
	// asm volatile("mov rax, rax");
	um_enter();
}

