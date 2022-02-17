org 0x7c00
bits 16

init:
	mov ah, 2
	mov al, 18
	mov ch, 0
	mov cl, 2
	mov dh, 0
	mov dl, 80h
	mov bx, 0x7E00
	int 13h

	mov ah, 0x00
	mov al, 0x03
	int 0x10

   cli
	mov edi, 0x1000
	mov cr3, edi
	xor eax, eax
	mov ecx, 4096
	rep stosd

	mov edi, 0x1000
	mov dword [edi], 0x2003
	add edi, 0x1000
	mov dword [edi], 0x3003
	add edi, 0x1000
	mov dword [edi], 0x4003
	add edi, 0x1000
	mov dword ebx, 3
	mov ecx, 512

	.setEntry:
		mov dword [edi], ebx
		add ebx, 0x1000
		add edi, 8
		loop .setEntry

	mov eax, cr4
	or eax, 1 << 5
	mov cr4, eax
	mov ecx, 0xc0000080
	rdmsr

	or eax, 1 << 8
	wrmsr

	mov eax, cr0
	or eax, 1 << 31
	or eax, 1 << 0

	mov cr0, eax
	lgdt [GDT.Pointer]
	jmp GDT.Code:LongMode
	bits 64
	LongMode:
   jmp 0x7e00

GDT:
	.Null: equ $ - GDT
		dw 0
		dw 0
		db 0
		db 0
		db 0
		db 0
	
	.Code: equ $ - GDT
		dw 0
		dw 0
		db 0
		db 10011000b
		db 00100000b
		db 0
	
	.Data: equ $ - GDT
		dw 0
		dw 0
		db 0
		db 10000000b
		db 0
		db 0
	
	.Pointer:
		dw $ - GDT - 1
		dq GDT

times 510-($-$$) db 0
dw 0xaa55