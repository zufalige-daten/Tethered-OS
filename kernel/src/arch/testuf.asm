section .text
	ADDRESS_ABSOLUTE equ (33*512*(1024*1024*1024))
	CODE_SELECTOR equ 24
	DATA_SELECTOR equ 32
	global um_enter
	um_enter:
		cli
		mov rax, 0
		mov rdx, 0
		mov ax, DATA_SELECTOR | 0x3
		mov ds, ax
		mov es, ax
		mov fs, ax
		mov gs, ax

		mov rdi, test_user_function
		; mov rsi, test_user_function + 4096
		mov rax, rsp
		push DATA_SELECTOR | 0x3
		push rax
		pushfq
		pop rax
		or rax, 0x200
		push rax
		push CODE_SELECTOR | 0x3
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

