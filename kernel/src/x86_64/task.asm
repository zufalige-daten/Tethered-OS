section .text
global switch_task
	switch_task:
		mov ax, (4*8)|3
		mov ds, ax
		mov es, ax
		mov fs, ax
		mov gs, ax

		mov rax, qword [rdi+128]
		push (4*8)|3
		push rax
		pushf
		push (3*8)|3
		mov rax, qword [rdi+112]
		push rax
		mov rax, qword [rdi+0]
		mov rbx, qword [rdi+8]
		mov rcx, qword [rdi+16]
		mov rdx, qword [rdi+24]

		mov rdi, qword [rdi+32]
		mov rsi, qword [rdi+40]

		mov r8, qword [rdi+48]
		mov r9, qword [rdi+56]
		mov r10, qword [rdi+64]
		mov r11, qword [rdi+72]
		mov r12, qword [rdi+80]
		mov r13, qword [rdi+88]
		mov r14, qword [rdi+96]
		mov r15, qword [rdi+104]

		mov rbp, qword [rdi+120]
		iretq
