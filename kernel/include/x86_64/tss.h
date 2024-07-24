#pragma once

#include <kernel.h>

typedef struct{
	uint32_t rsvd0;
	uint64_t rsp0;
	uint64_t rsp1;
	uint64_t rsp2;
	uint32_t rsvd1;
	uint32_t rsvd2;
	uint64_t ist1;
	uint64_t ist2;
	uint64_t ist3;
	uint64_t ist4;
	uint64_t ist5;
	uint64_t ist6;
	uint64_t ist7;
	uint32_t rsvd3;
	uint32_t rsvd4;
	uint16_t rsvd5;
	uint16_t iopb;
} _packed tss_t;

typedef struct{
	uint64_t rax, rbx, rcx, rdx; // general purpose
	uint64_t rdi, rsi; // string
	uint64_t r8, r9, r10, r11, r12, r13, r14, r15; // newly added general purpose
	uint64_t rip, rbp, rsp; // special purpose (instruction pointer, stack base, stack top)
} _packed regs_t;

extern tss_t tss[128];
extern uint64_t tss_count;

extern void ldtssi(uint16_t tss_i);

