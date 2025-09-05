#include <arch/paging.h>
#include <kernel.h>
#include <arch/tasksw.h>
#include <stdint.h>
#include <stddef.h>
#include <x86_64/tss.h>
#include <arch/kernel_string.h>

extern uint64_t kernel_pml3_map_n[256*512];
extern uint64_t kernel_pml4_map[512];

extern void test_user_function(void);
extern void um_enter(void);

void test_usermode(void){
	//ldtssi(0);
	// first allocate required userland virtual page
	// pml3_map_task_sw[0] = ((uint64_t)&test_user_function) | PML_P | PML_RW | PML_PS | PML_US;
	// kernel_pml4_map[33] = (uint64_t)pml3_map_task_sw | PML_P | PML_RW | PML_US;
	// vallocate_page_1G(&test_user_function, (void *)(33L * 512L * 1024L * 1024L * 1024L), PML_RW | PML_US);
	kernel_printf("paddr: %x\n", (uint64_t)&test_user_function);
	/*asm volatile(
		"invlpg [%0]"
		::
		"r" (0L)
	);
	asm volatile(
		"mov cr3, rax\n"
		::
		"a" ((uint64_t)(&kernel_pml4_map[0]))
	);*/
	ldtssi(0);
	// test the page allocation
	uint8_t *test_user_function_deallocated = (uint8_t *)&test_user_function;
	uint8_t *test_user_function_allocated = (uint8_t *)(33L*512L*1024L*1024L*1024L);

	/*for(int i = 0; i < 4096; i++) {
		test_user_function_allocated[i] = test_user_function_deallocated[i];
	}*/

	/*for(int i = 0; i < 4096; i++) {
		if(test_user_function_deallocated[i] != test_user_function_allocated[i]) {
			kernel_printf("oh no.\n");
			while(1);
		}
	}*/
	kernel_printf("&test_user_function: hex 0x%x.\n", (uint64_t)&test_user_function);
	kernel_printf("&thing hex 0x%x.\n", (uint64_t)(33L*512L*1024L*1024L*1024L));
	kernel_printf("---- Entering User Mode\n");
	um_enter();
}

