#include <kernel.h>
#include <arch/interrupts.h>
#include <stdint.h>
#include <arch/kernel_string.h>
#include <x86_64/idt.h>

void interrupts_init(void){
	idt_init();
}

int in_kernel_state = 1; // 1: in kernel execution, 0: in user execution.

#define kbreak if(in_kernel_state){kernel_printf("Kernel stopped due to malfunction.\n");while(1);}

// add any interrupt handelers here
_interrupt void ex_diverror(interrupt_frame_t *frame){
	kernel_printf("Interrupt: DVEINT.\n");
	kbreak;
}
_interrupt void ex_debug(interrupt_frame_t *frame){
	kernel_printf("Interrupt: DBGINT.\n");
}
_interrupt void ex_nmi(interrupt_frame_t *frame){
	kernel_printf("Interrupt: NMIINT.\n");
}
_interrupt void ex_breakpoint(interrupt_frame_t *frame){
	kernel_printf("Interrupt: BRPINT.\n");
	kbreak;
}
_interrupt void ex_overflow(interrupt_frame_t *frame){
	kernel_printf("Interrupt: OFWINT.\n");
	kbreak;
}
_interrupt void ex_brexceeded(interrupt_frame_t *frame){
	kernel_printf("Interrupt: BREINT.\n");
	kbreak;
}
_interrupt void ex_invopcode(interrupt_frame_t *frame){
	kernel_printf("Interrupt: IOPINT.\n");
	kbreak;
}
_interrupt void ex_devnotaval(interrupt_frame_t *frame){
	kernel_printf("Interrupt: DNAINT.\n");
}
_interrupt void ex_doublefault(interrupt_frame_t *frame, uint64_t err){
	kernel_printf("Interrupt: DBFINT %x.\n", err);
	kbreak;
}
_interrupt void ex_coprocsegover(interrupt_frame_t *frame){
	kernel_printf("Interrupt: CSOINT.\n");
	kbreak;
}
_interrupt void ex_invaltss(interrupt_frame_t *frame, uint64_t err){
	kernel_printf("Interrupt: ITSINT %x.\n", err);
	kbreak;
}
_interrupt void ex_segnotpresent(interrupt_frame_t *frame, uint64_t err){
	kernel_printf("Interrupt: NSGINT %x.\n", err);
	kbreak;
}
_interrupt void ex_stacksegfault(interrupt_frame_t *frame, uint64_t err){
	kernel_printf("Interrupt: SSFINT %x.\n", err);
	kbreak;
}
_interrupt void ex_generalprotfault(interrupt_frame_t *frame, uint64_t err){
	kernel_printf("Interrupt: GPFINT %x.\n", err);
	kbreak;
}
_interrupt void ex_pagefault(interrupt_frame_t *frame, uint64_t err){
	kernel_printf("Interrupt: PGFINT %x.\n", err);
	// give a more descriptive breakdown of the PGFINT error
	if(err & (1<<0)) kernel_printf("Page protection violation.\n");
	else kernel_printf("Page not found.\n");
	if(err & (1<<1)) kernel_printf("Write access.\n");
	else kernel_printf("Read access.\n");
	if(err & (1<<2)) kernel_printf("Access by usermode (CPL = 3).\n");
	else kernel_printf("Access by non-usermode (CPL < 3).\n");
	if(err & (1<<3)) kernel_printf("Reserved bits set to write.\n");
	if(err & (1<<4)) kernel_printf("Executed in a non-executing page.\n");
	else kernel_printf("Data access.\n");
	if(err & (1<<5)) kernel_printf("Protection key violation.\n");
	if(err & (1<<6)) kernel_printf("Accessed a shadow stack.\n");
	if(err & (1<<15)) kernel_printf("Software guard extensions violation.\n");
	uint64_t crget;
	asm volatile("mov rax, cr2" : "=a"(crget));
	kernel_printf("Access of (virtual) address 0x%x.\n", crget);
	kbreak;
}
_interrupt void ex_x87floatexception(interrupt_frame_t *frame){
	kernel_printf("Interrupt: XFEINT.\n");
	kbreak;
}
_interrupt void ex_aligncheck(interrupt_frame_t *frame, uint64_t err){
	kernel_printf("Interrupt: ALCINT %x.\n", err);
	kbreak;
}
_interrupt void ex_machinecheck(interrupt_frame_t *frame){
	kernel_printf("Interrupt: MCCINT.\n");
	kbreak;
}
_interrupt void ex_simdfloatexception(interrupt_frame_t *frame){
	kernel_printf("Interrupt: SFEINT.\n");
	kbreak;
}
_interrupt void ex_virtexception(interrupt_frame_t *frame){
	kernel_printf("Interrupt: VMXINT.\n");
}
_interrupt void ex_controlprotexception(interrupt_frame_t *frame, uint64_t err){
	kernel_printf("Interrupt: CPEINT %x.\n", err);
	kbreak;
}
_interrupt void ex_hypervinjectexception(interrupt_frame_t *frame){
	kernel_printf("Interrupt: HVEINT.\n");
	kbreak;
}
_interrupt void ex_vmmcomexception(interrupt_frame_t *frame, uint64_t err){
	kernel_printf("Interrupt: VCEINT %x.\n", err);
	kbreak;
}
_interrupt void ex_securityexception(interrupt_frame_t *frame, uint64_t err){
	kernel_printf("Interrupt: SCEINT %x.\n", err);
	kbreak;
}
extern _interrupt void in_syscallinterrupt(interrupt_frame_t *frame);
_interrupt void nu_unknowninterrupt(interrupt_frame_t *frame){
	kernel_printf("Interrupt: UKNINT.\n");
}
// end interrupt handelers

#define KTRAP_INT IDT_ATTRIB_DPL_0 | IDT_ATTRIB_GATE_LONG_TRAP | IDT_ATTRIB_PRESENT
#define KINT_INT IDT_ATTRIB_DPL_0 | IDT_ATTRIB_GATE_LONG_INTERUPT | IDT_ATTRIB_PRESENT

int ktrap_index = 0;

void sp_idt_set_ktrap(void *proc){
	idt_set(ktrap_index, proc, 0x8, 0, KTRAP_INT);
	ktrap_index++;
}

void interrupts_register_all(void){
	ktrap_index = 0;
	sp_idt_set_ktrap(&ex_diverror);
	sp_idt_set_ktrap(&ex_debug);
	sp_idt_set_ktrap(&ex_nmi);
	sp_idt_set_ktrap(&ex_breakpoint);
	sp_idt_set_ktrap(&ex_overflow);
	sp_idt_set_ktrap(&ex_brexceeded);
	sp_idt_set_ktrap(&ex_invopcode);
	sp_idt_set_ktrap(&ex_devnotaval);
	sp_idt_set_ktrap(&ex_doublefault);
	sp_idt_set_ktrap(&ex_coprocsegover);
	sp_idt_set_ktrap(&ex_invaltss);
	sp_idt_set_ktrap(&ex_segnotpresent);
	sp_idt_set_ktrap(&ex_stacksegfault);
	sp_idt_set_ktrap(&ex_generalprotfault);
	sp_idt_set_ktrap(&ex_pagefault);
	ktrap_index++;
	sp_idt_set_ktrap(&ex_x87floatexception);
	sp_idt_set_ktrap(&ex_aligncheck);
	sp_idt_set_ktrap(&ex_machinecheck);
	sp_idt_set_ktrap(&ex_simdfloatexception);
	sp_idt_set_ktrap(&ex_virtexception);
	sp_idt_set_ktrap(&ex_controlprotexception);
	ktrap_index += 7;
	sp_idt_set_ktrap(&ex_hypervinjectexception);
	sp_idt_set_ktrap(&ex_vmmcomexception);
	sp_idt_set_ktrap(&ex_securityexception);
	for(int i = 32; i < 0x80; i++){
		idt_set(i, &nu_unknowninterrupt, 0x8, 0, KTRAP_INT);
	}
	idt_set(0x80, &in_syscallinterrupt, 0x8, 0, KINT_INT);
	for(int i = 0x81; i < 256; i++){
		idt_set(i, &nu_unknowninterrupt, 0x8, 0, KTRAP_INT);
	}
}

