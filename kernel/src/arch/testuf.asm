section .text
	ADDRESS_ABSOLUTE equ (32*512*(1024*1024*1024))
	CODE_SELECTOR equ 24
	DATA_SELECTOR equ 32
	global um_enter
	um_enter:
		mov rax, 0
		mov rdx, 0
		mov ax, DATA_SELECTOR | 0x3
		mov ds, ax
		mov es, ax
		mov fs, ax
		mov gs, ax

		mov rdi, ADDRESS_ABSOLUTE
		mov rsi, um_stack
		mov dx, CODE_SELECTOR | 0x3
		mov ax, DATA_SELECTOR | 0x3
		push rax
		push rsi
		push 0x200
		push rdx
		push rdi
		iretq
	ret
	global test_user_function
	align 4096
	test_user_function:
		nop
		mov rbx, 0
		int 0x80
		jmp $
	align 4096
	um_stack:
		times 4096 db 0

