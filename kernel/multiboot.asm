MBALIGN  equ  1 << 0
MEMINFO  equ  1 << 1
VIDINFO equ  1 << 2
FLAGS    equ  MBALIGN | MEMINFO | VIDINFO
MAGIC    equ  0x1BADB002
CHECKSUM equ -(MAGIC + FLAGS)

section .multiboot
	mbh:
	align 4
	dd MAGIC
	dd FLAGS
	dd CHECKSUM
	dd 0, 0, 0, 0, 0
	dd 0 ; 0 = set graphics mode
	dd 800, 600, 32 ; Width, height, depth

section .bss
	align 16
	stack_bottom:
	resb 67108864 ; 64 MiB
	stack_top:

section .data

section .text
global _start:function (_start.end - _start)

_start:
	extern loader_main
	mov esp, stack_top
	mov ebp, stack_top
	push ebx
	call loader_main
_start.hang:
	hlt
_start.end: