org 0x7c00
use16

start:
	jmp ves
	times 0x30-($-$$) db 2

ves:
   mov ax, 0x4F01
   mov cx, 0x0115 or 0xc000
   mov di, vesa_info
   int 0x10

   mov ax, 0x4F02
   mov bx, 0x0115 or 0xc000
   int 0x10

   jmp init

vesa_info:
   dw 0
   db 0
   db 0
   dw 0
   dw 0
   dw 0
   dw 0
   dd 0
   dw 0

   dw 0
   dw 0
   db 0
   db 0
   db 0
   db 0
   db 0
   db 0
   db 0
   db 0
   db 0

   db 0
   db 0
   db 0
   db 0
   db 0
   db 0
   db 0
   db 0
   db 0
.linear_frame_buffer_start      dd 0
   dd 0
   dw 0
   times 206 db 0

init:
	mov ah, 2
	mov al, 19
	mov ch, 0
	mov cl, 2
	mov dh, 0
	mov bx, 0x7E00
	int 13h

	cli				; disable the interrupts, just in
					; case they are not disabled yet

	lgdt	[cs:GDTR]		; load GDT register

	mov	eax,cr0 		; switch to protected mode
	or	al,1
	mov	cr0,eax

	jmp	CODE_SELECTOR:pm_start


NULL_SELECTOR = 0
DATA_SELECTOR = 1 shl 3 		; flat data selector (ring 0)
CODE_SELECTOR = 2 shl 3 		; 32-bit code selector (ring 0)

GDTR:					; Global Descriptors Table Register
  dw 4*8-1				; limit of GDT (size minus one)
  dq GDT				; linear address of GDT

GDT rw 4				; null desciptor
    dw 0FFFFh,0,9200h,08Fh		; flat data desciptor
    dw 0FFFFh,0,9A00h,0CFh		; 32-bit code desciptor

	USE32

pm_start:
	mov esi, dword [vesa_info.linear_frame_buffer_start]
	jmp 0x7e00

times 510-($-$$) db 0
dw 0xaa55