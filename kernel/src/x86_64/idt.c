#include <kernel.h>
#include <x86_64/idt.h>
#include <arch/fast_memcpy.h>
#include <arch/kernel_string.h>

idtr_t kernel_idtr;
idt_entry_t kernel_idt[256];

void idt_init(void){
	kernel_idtr.offset = (uint64_t)kernel_idt;
	kernel_idtr.size = (256*16)-1;
	fast_memset_q((uint64_t)kernel_idt, 512, 0);
	asm volatile("lidt %0" :: "m"(kernel_idtr));
}

inline void idt_reload(void){
	asm volatile("lidt %0" :: "m"(kernel_idtr));
}

void idt_set(int idt_index, void *isr, uint8_t selector, uint8_t ist, uint8_t type_attribs){
	kernel_idt[idt_index].attribs = type_attribs;
	kernel_idt[idt_index].selector = selector;
	kernel_idt[idt_index].ist = ist;
	kernel_idt[idt_index].offset0 = (uint16_t)((uint64_t)isr);
	kernel_idt[idt_index].offset1 = (uint16_t)((uint64_t)isr>>16);
	kernel_idt[idt_index].offset2 = (uint32_t)((uint64_t)isr>>32);
	idt_reload();
}

