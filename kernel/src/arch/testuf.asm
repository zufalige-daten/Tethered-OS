section .text
	global um_enter
	um_enter:
		; enable syscall and sysret
		mov rcx, 0xC0000082
		wrmsr
		mov rcx, 0xC0000080
		rdmsr
		or eax, 1
		wrmsr
		mov rcx, 0xC0000081
		rdmsr
		mov edx, 0x0018000C
		wrmsr

		mov ax, 0x23
		mov es, ax
		mov ds, ax
		mov fs, ax
		mov gs, ax

		; load RIP and EFLAGS
		mov rcx, test_user_function ; 16*(1024*1024*1024)
		mov r11, 0x202
		o64 sysret
	ret
	global test_user_function
	align 4096
	test_user_function:
		nop
	ret

