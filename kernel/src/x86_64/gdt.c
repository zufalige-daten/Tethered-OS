#include <kernel.h>
#include <x86_64/gdt.h>
#include <stdint.h>

void reload_gdt(gdtr_t *gdtr){
	asm volatile(
		"lgdt [rax]\n"
		"push 0x08\n"
		"lea rax, [reloaded_gdt]\n"
		"push rax\n"
		"retfq\n"
		"reloaded_gdt:\n"
		"mov ax, 0x10\n"
		"mov ds, ax\n"
		"mov es, ax\n"
		"mov ss, ax\n"
		"mov gs, ax\n"
		"mov fs, ax\n"
		::
		"a"
		((uint64_t)gdtr)
	);
}
