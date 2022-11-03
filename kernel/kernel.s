	.file	"kernel.cpp"
	.intel_syntax noprefix
	.text
	.local	_ZL9prgbuffer
	.comm	_ZL9prgbuffer,104857600,32
	.globl	lfb
	.bss
	.align 4
	.type	lfb, @object
	.size	lfb, 4
lfb:
	.zero	4
	.globl	x
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.zero	4
	.globl	y
	.align 4
	.type	y, @object
	.size	y, 4
y:
	.zero	4
	.text
	.globl	_Z4outbth
	.type	_Z4outbth, @function
_Z4outbth:
.LFB0:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 8[ebp]
	mov	edx, DWORD PTR 12[ebp]
	mov	WORD PTR -20[ebp], ax
	mov	eax, edx
	mov	BYTE PTR -24[ebp], al
	mov	WORD PTR -2[ebp], 0
	movzx	eax, WORD PTR -20[ebp]
#APP
# 5 "../include/basicio.h" 1
	mov dx, ax
# 0 "" 2
#NO_APP
	mov	WORD PTR -2[ebp], ax
	movzx	eax, BYTE PTR -24[ebp]
#APP
# 6 "../include/basicio.h" 1
	mov al, al
# 0 "" 2
#NO_APP
	mov	WORD PTR -2[ebp], ax
#APP
# 7 "../include/basicio.h" 1
	out dx, al
# 0 "" 2
#NO_APP
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	_Z4outbth, .-_Z4outbth
	.globl	_Z4outwtt
	.type	_Z4outwtt, @function
_Z4outwtt:
.LFB1:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	edx, DWORD PTR 8[ebp]
	mov	eax, DWORD PTR 12[ebp]
	mov	WORD PTR -20[ebp], dx
	mov	WORD PTR -24[ebp], ax
	mov	WORD PTR -2[ebp], 0
	movzx	eax, WORD PTR -20[ebp]
#APP
# 11 "../include/basicio.h" 1
	mov dx, ax
# 0 "" 2
#NO_APP
	mov	WORD PTR -2[ebp], ax
	movzx	eax, WORD PTR -24[ebp]
#APP
# 12 "../include/basicio.h" 1
	mov ax, ax
# 0 "" 2
#NO_APP
	mov	WORD PTR -2[ebp], ax
#APP
# 13 "../include/basicio.h" 1
	out dx, ax
# 0 "" 2
#NO_APP
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	_Z4outwtt, .-_Z4outwtt
	.globl	_Z3inbt
	.type	_Z3inbt, @function
_Z3inbt:
.LFB2:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 20
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 8[ebp]
	mov	WORD PTR -20[ebp], ax
	mov	WORD PTR -2[ebp], 0
	mov	BYTE PTR -3[ebp], 0
	movzx	eax, WORD PTR -20[ebp]
#APP
# 18 "../include/basicio.h" 1
	mov dx, ax
# 0 "" 2
#NO_APP
	mov	WORD PTR -2[ebp], ax
#APP
# 19 "../include/basicio.h" 1
	in al, dx
# 0 "" 2
#NO_APP
	mov	BYTE PTR -3[ebp], al
	movzx	eax, BYTE PTR -3[ebp]
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	_Z3inbt, .-_Z3inbt
	.globl	_Z3inwt
	.type	_Z3inwt, @function
_Z3inwt:
.LFB3:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 20
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 8[ebp]
	mov	WORD PTR -20[ebp], ax
	mov	WORD PTR -2[ebp], 0
	mov	WORD PTR -4[ebp], 0
	movzx	eax, WORD PTR -20[ebp]
#APP
# 25 "../include/basicio.h" 1
	mov dx, ax
# 0 "" 2
#NO_APP
	mov	WORD PTR -2[ebp], ax
#APP
# 26 "../include/basicio.h" 1
	in ax, dx
# 0 "" 2
#NO_APP
	mov	WORD PTR -4[ebp], ax
	movzx	eax, WORD PTR -4[ebp]
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	_Z3inwt, .-_Z3inwt
	.globl	cursorspos
	.type	cursorspos, @function
cursorspos:
.LFB4:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 12[ebp]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	mov	WORD PTR -2[ebp], ax
	push	15
	push	980
	call	_Z4outbth
	add	esp, 8
	movzx	eax, WORD PTR -2[ebp]
	movzx	eax, al
	push	eax
	push	981
	call	_Z4outbth
	add	esp, 8
	push	14
	push	980
	call	_Z4outbth
	add	esp, 8
	movzx	eax, WORD PTR -2[ebp]
	shr	ax, 8
	movzx	eax, al
	push	eax
	push	981
	call	_Z4outbth
	add	esp, 8
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	cursorspos, .-cursorspos
	.globl	cursorgpos
	.type	cursorgpos, @function
cursorgpos:
.LFB5:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	WORD PTR -2[ebp], 0
	push	15
	push	980
	call	_Z4outbth
	add	esp, 8
	push	981
	call	_Z3inbt
	add	esp, 4
	movzx	eax, al
	or	WORD PTR -2[ebp], ax
	push	14
	push	980
	call	_Z4outbth
	add	esp, 8
	push	981
	call	_Z3inbt
	add	esp, 4
	movzx	eax, al
	sal	eax, 8
	mov	edx, eax
	movzx	eax, WORD PTR -2[ebp]
	or	eax, edx
	mov	WORD PTR -2[ebp], ax
	movzx	eax, WORD PTR -2[ebp]
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	cursorgpos, .-cursorgpos
	.globl	scroll
	.type	scroll, @function
scroll:
.LFB6:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	esi
	push	ebx
	sub	esp, 16
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR -12[ebp], 0
.L14:
	cmp	DWORD PTR -12[ebp], 24
	jg	.L11
	mov	DWORD PTR -16[ebp], 0
.L13:
	cmp	DWORD PTR -16[ebp], 79
	jg	.L12
	mov	ebx, DWORD PTR lfb@GOTOFF[eax]
	mov	ecx, DWORD PTR -12[ebp]
	mov	edx, ecx
	sal	edx, 2
	add	edx, ecx
	sal	edx, 4
	mov	ecx, edx
	mov	edx, DWORD PTR -16[ebp]
	add	edx, ecx
	sal	edx, 3
	add	ebx, edx
	mov	esi, DWORD PTR lfb@GOTOFF[eax]
	mov	edx, DWORD PTR -12[ebp]
	lea	ecx, -1[edx]
	mov	edx, ecx
	sal	edx, 2
	add	edx, ecx
	sal	edx, 4
	mov	ecx, edx
	mov	edx, DWORD PTR -16[ebp]
	add	edx, ecx
	sal	edx, 3
	lea	ecx, [esi+edx]
	mov	edx, DWORD PTR [ebx]
	mov	DWORD PTR [ecx], edx
	mov	ebx, DWORD PTR lfb@GOTOFF[eax]
	mov	ecx, DWORD PTR -12[ebp]
	mov	edx, ecx
	sal	edx, 2
	add	edx, ecx
	sal	edx, 4
	mov	ecx, edx
	mov	edx, DWORD PTR -16[ebp]
	add	edx, ecx
	add	edx, edx
	add	edx, 1
	sal	edx, 2
	add	ebx, edx
	mov	esi, DWORD PTR lfb@GOTOFF[eax]
	mov	edx, DWORD PTR -12[ebp]
	lea	ecx, -1[edx]
	mov	edx, ecx
	sal	edx, 2
	add	edx, ecx
	sal	edx, 4
	mov	ecx, edx
	mov	edx, DWORD PTR -16[ebp]
	add	edx, ecx
	add	edx, edx
	add	edx, 1
	sal	edx, 2
	lea	ecx, [esi+edx]
	mov	edx, DWORD PTR [ebx]
	mov	DWORD PTR [ecx], edx
	mov	ebx, DWORD PTR lfb@GOTOFF[eax]
	mov	ecx, DWORD PTR -12[ebp]
	mov	edx, ecx
	sal	edx, 2
	add	edx, ecx
	sal	edx, 4
	mov	ecx, edx
	mov	edx, DWORD PTR -16[ebp]
	add	edx, ecx
	sal	edx, 3
	add	edx, ebx
	mov	DWORD PTR [edx], 0
	mov	ebx, DWORD PTR lfb@GOTOFF[eax]
	mov	ecx, DWORD PTR -12[ebp]
	mov	edx, ecx
	sal	edx, 2
	add	edx, ecx
	sal	edx, 4
	mov	ecx, edx
	mov	edx, DWORD PTR -16[ebp]
	add	edx, ecx
	add	edx, edx
	add	edx, 1
	sal	edx, 2
	add	edx, ebx
	mov	DWORD PTR [edx], 0
	add	DWORD PTR -16[ebp], 1
	jmp	.L13
.L12:
	add	DWORD PTR -12[ebp], 1
	jmp	.L14
.L11:
	mov	DWORD PTR x@GOTOFF[eax], 0
	mov	edx, DWORD PTR y@GOTOFF[eax]
	sub	edx, 1
	mov	DWORD PTR y@GOTOFF[eax], edx
	nop
	add	esp, 16
	pop	ebx
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	scroll, .-scroll
	.globl	putc
	.type	putc, @function
putc:
.LFB7:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 4
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 8[ebp]
	mov	BYTE PTR -8[ebp], al
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	cmp	eax, 79
	jle	.L16
	mov	DWORD PTR x@GOTOFF[ebx], 0
	mov	eax, DWORD PTR y@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR y@GOTOFF[ebx], eax
.L16:
	cmp	BYTE PTR -8[ebp], 10
	jne	.L17
	mov	eax, DWORD PTR y@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR y@GOTOFF[ebx], eax
	mov	DWORD PTR x@GOTOFF[ebx], 0
	jmp	.L18
.L17:
	mov	ecx, DWORD PTR lfb@GOTOFF[ebx]
	mov	edx, DWORD PTR y@GOTOFF[ebx]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	add	eax, edx
	sal	eax, 3
	lea	edx, [ecx+eax]
	movzx	eax, BYTE PTR -8[ebp]
	mov	DWORD PTR [edx], eax
	mov	ecx, DWORD PTR lfb@GOTOFF[ebx]
	mov	edx, DWORD PTR y@GOTOFF[ebx]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	add	eax, edx
	sal	eax, 3
	add	eax, 4
	add	eax, ecx
	mov	DWORD PTR [eax], 15
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR x@GOTOFF[ebx], eax
.L18:
	mov	eax, DWORD PTR y@GOTOFF[ebx]
	cmp	eax, 24
	jle	.L19
	call	scroll
.L19:
	mov	edx, DWORD PTR y@GOTOFF[ebx]
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	push	edx
	push	eax
	call	cursorspos
	add	esp, 8
	nop
	mov	ebx, DWORD PTR -4[ebp]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	putc, .-putc
	.globl	puts
	.type	puts, @function
puts:
.LFB8:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	esi
	push	ebx
	sub	esp, 16
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR -12[ebp], 0
.L26:
	mov	edx, DWORD PTR -12[ebp]
	mov	eax, DWORD PTR 12[ebp]
	add	eax, edx
	mov	edx, eax
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	test	al, al
	je	.L21
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	cmp	eax, 79
	jle	.L22
	mov	DWORD PTR x@GOTOFF[ebx], 0
	mov	eax, DWORD PTR y@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR y@GOTOFF[ebx], eax
.L22:
	mov	edx, DWORD PTR -12[ebp]
	mov	eax, DWORD PTR 12[ebp]
	add	eax, edx
	mov	edx, eax
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	cmp	al, 10
	jne	.L23
	mov	eax, DWORD PTR y@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR y@GOTOFF[ebx], eax
	mov	DWORD PTR x@GOTOFF[ebx], 0
	jmp	.L24
.L23:
	mov	edx, DWORD PTR -12[ebp]
	mov	eax, DWORD PTR 12[ebp]
	add	eax, edx
	mov	edx, eax
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	ecx, BYTE PTR [eax]
	mov	esi, DWORD PTR lfb@GOTOFF[ebx]
	mov	edx, DWORD PTR y@GOTOFF[ebx]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	add	eax, edx
	sal	eax, 3
	lea	edx, [esi+eax]
	movzx	eax, cl
	mov	DWORD PTR [edx], eax
	mov	ecx, DWORD PTR lfb@GOTOFF[ebx]
	mov	edx, DWORD PTR y@GOTOFF[ebx]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	add	eax, edx
	sal	eax, 3
	add	eax, 4
	add	eax, ecx
	mov	DWORD PTR [eax], 15
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR x@GOTOFF[ebx], eax
.L24:
	mov	eax, DWORD PTR y@GOTOFF[ebx]
	cmp	eax, 24
	jle	.L25
	call	scroll
.L25:
	add	DWORD PTR -12[ebp], 1
	jmp	.L26
.L21:
	mov	edx, DWORD PTR y@GOTOFF[ebx]
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	push	edx
	push	eax
	call	cursorspos
	add	esp, 8
	nop
	lea	esp, -8[ebp]
	pop	ebx
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	puts, .-puts
	.globl	putc_c
	.type	putc_c, @function
putc_c:
.LFB9:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 8
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	edx, DWORD PTR 8[ebp]
	mov	eax, DWORD PTR 12[ebp]
	mov	BYTE PTR -8[ebp], dl
	mov	BYTE PTR -12[ebp], al
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	cmp	eax, 79
	jle	.L28
	mov	DWORD PTR x@GOTOFF[ebx], 0
	mov	eax, DWORD PTR y@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR y@GOTOFF[ebx], eax
.L28:
	cmp	BYTE PTR -8[ebp], 10
	jne	.L29
	mov	eax, DWORD PTR y@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR y@GOTOFF[ebx], eax
	mov	DWORD PTR x@GOTOFF[ebx], 0
	jmp	.L30
.L29:
	mov	ecx, DWORD PTR lfb@GOTOFF[ebx]
	mov	edx, DWORD PTR y@GOTOFF[ebx]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	add	eax, edx
	sal	eax, 3
	lea	edx, [ecx+eax]
	movzx	eax, BYTE PTR -8[ebp]
	mov	DWORD PTR [edx], eax
	mov	ecx, DWORD PTR lfb@GOTOFF[ebx]
	mov	edx, DWORD PTR y@GOTOFF[ebx]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	add	eax, edx
	sal	eax, 3
	add	eax, 4
	lea	edx, [ecx+eax]
	movzx	eax, BYTE PTR -12[ebp]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR x@GOTOFF[ebx], eax
.L30:
	mov	eax, DWORD PTR y@GOTOFF[ebx]
	cmp	eax, 24
	jle	.L31
	call	scroll
.L31:
	mov	edx, DWORD PTR y@GOTOFF[ebx]
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	push	edx
	push	eax
	call	cursorspos
	add	esp, 8
	nop
	mov	ebx, DWORD PTR -4[ebp]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	putc_c, .-putc_c
	.globl	puts_c
	.type	puts_c, @function
puts_c:
.LFB10:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	esi
	push	ebx
	sub	esp, 20
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 16[ebp]
	mov	BYTE PTR -28[ebp], al
	mov	DWORD PTR -12[ebp], 0
.L38:
	mov	edx, DWORD PTR -12[ebp]
	mov	eax, DWORD PTR 12[ebp]
	add	eax, edx
	mov	edx, eax
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	test	al, al
	je	.L33
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	cmp	eax, 79
	jle	.L34
	mov	DWORD PTR x@GOTOFF[ebx], 0
	mov	eax, DWORD PTR y@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR y@GOTOFF[ebx], eax
.L34:
	mov	edx, DWORD PTR -12[ebp]
	mov	eax, DWORD PTR 12[ebp]
	add	eax, edx
	mov	edx, eax
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	cmp	al, 10
	jne	.L35
	mov	eax, DWORD PTR y@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR y@GOTOFF[ebx], eax
	mov	DWORD PTR x@GOTOFF[ebx], 0
	jmp	.L36
.L35:
	mov	edx, DWORD PTR -12[ebp]
	mov	eax, DWORD PTR 12[ebp]
	add	eax, edx
	mov	edx, eax
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	ecx, BYTE PTR [eax]
	mov	esi, DWORD PTR lfb@GOTOFF[ebx]
	mov	edx, DWORD PTR y@GOTOFF[ebx]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	add	eax, edx
	sal	eax, 3
	lea	edx, [esi+eax]
	movzx	eax, cl
	mov	DWORD PTR [edx], eax
	mov	ecx, DWORD PTR lfb@GOTOFF[ebx]
	mov	edx, DWORD PTR y@GOTOFF[ebx]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 4
	mov	edx, eax
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	add	eax, edx
	sal	eax, 3
	add	eax, 4
	lea	edx, [ecx+eax]
	movzx	eax, BYTE PTR -28[ebp]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR x@GOTOFF[ebx], eax
.L36:
	mov	eax, DWORD PTR y@GOTOFF[ebx]
	cmp	eax, 24
	jle	.L37
	call	scroll
.L37:
	add	DWORD PTR -12[ebp], 1
	jmp	.L38
.L33:
	mov	edx, DWORD PTR y@GOTOFF[ebx]
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	push	edx
	push	eax
	call	cursorspos
	add	esp, 8
	nop
	lea	esp, -8[ebp]
	pop	ebx
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	puts_c, .-puts_c
	.globl	strlen
	.type	strlen, @function
strlen:
.LFB11:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR -4[ebp], 0
.L41:
	mov	edx, DWORD PTR -4[ebp]
	mov	eax, DWORD PTR 12[ebp]
	add	eax, edx
	mov	edx, eax
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	test	al, al
	je	.L40
	add	DWORD PTR -4[ebp], 1
	jmp	.L41
.L40:
	mov	eax, DWORD PTR -4[ebp]
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	strlen, .-strlen
	.globl	strcmp
	.type	strcmp, @function
strcmp:
.LFB12:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 16
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	push	0
	push	DWORD PTR 8[ebp]
	call	strlen
	add	esp, 8
	mov	ebx, eax
	push	0
	push	DWORD PTR 12[ebp]
	call	strlen
	add	esp, 8
	cmp	ebx, eax
	sete	al
	test	al, al
	je	.L44
	mov	DWORD PTR -8[ebp], 0
.L48:
	push	0
	push	DWORD PTR 8[ebp]
	call	strlen
	add	esp, 8
	cmp	DWORD PTR -8[ebp], eax
	setl	al
	test	al, al
	je	.L45
	mov	edx, DWORD PTR -8[ebp]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	edx, BYTE PTR [eax]
	mov	ecx, DWORD PTR -8[ebp]
	mov	eax, DWORD PTR 12[ebp]
	add	eax, ecx
	movzx	eax, BYTE PTR [eax]
	cmp	dl, al
	je	.L46
	mov	eax, 0
	jmp	.L47
.L46:
	add	DWORD PTR -8[ebp], 1
	jmp	.L48
.L45:
	mov	eax, 1
	jmp	.L47
.L44:
	mov	eax, 0
.L47:
	mov	ebx, DWORD PTR -4[ebp]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE12:
	.size	strcmp, .-strcmp
	.globl	oldkey
	.bss
	.type	oldkey, @object
	.size	oldkey, 1
oldkey:
	.zero	1
	.text
	.globl	waitkey
	.type	waitkey, @function
waitkey:
.LFB13:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 16
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	push	96
	call	_Z3inbt
	add	esp, 4
	mov	BYTE PTR -5[ebp], al
.L51:
	movzx	eax, BYTE PTR oldkey@GOTOFF[ebx]
	cmp	BYTE PTR -5[ebp], al
	jne	.L50
	push	96
	call	_Z3inbt
	add	esp, 4
	mov	BYTE PTR -5[ebp], al
	jmp	.L51
.L50:
	movzx	eax, BYTE PTR -5[ebp]
	mov	BYTE PTR oldkey@GOTOFF[ebx], al
	movzx	eax, BYTE PTR -5[ebp]
	mov	ebx, DWORD PTR -4[ebp]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE13:
	.size	waitkey, .-waitkey
	.globl	keytoascii
	.data
	.align 32
	.type	keytoascii, @object
	.size	keytoascii, 256
keytoascii:
	.string	""
	.string	""
	.string	"1234567890-="
	.string	"\tqwertyuiop[]\n"
	.string	"asdfghjkl;'`"
	.string	"#zxcvbnm,./"
	.string	""
	.string	""
	.string	" "
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\\"
	.zero	168
	.globl	keytoascii_s
	.align 32
	.type	keytoascii_s, @object
	.size	keytoascii_s, 256
keytoascii_s:
	.string	""
	.string	""
	.string	"1234567890-="
	.string	"\tqwertyuiop[]\n"
	.string	"asdfghjkl;'`"
	.string	"#zxcvbnm,./"
	.string	""
	.string	""
	.string	" "
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\\"
	.zero	168
	.globl	keytoascii_u
	.align 32
	.type	keytoascii_u, @object
	.size	keytoascii_u, 256
keytoascii_u:
	.string	""
	.string	""
	.string	"1234567890-="
	.string	"\tqwertyuiop[]\n"
	.string	"asdfghjkl;'`"
	.string	"#zxcvbnm,./"
	.string	""
	.string	""
	.string	" "
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\\"
	.zero	168
	.globl	keytoascii_su
	.align 32
	.type	keytoascii_su, @object
	.size	keytoascii_su, 256
keytoascii_su:
	.string	""
	.string	""
	.string	"1234567890-="
	.string	"\tqwertyuiop[]\n"
	.string	"asdfghjkl;'`"
	.string	"#zxcvbnm,./"
	.string	""
	.string	""
	.string	" "
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\\"
	.zero	168
	.globl	s_pressed
	.bss
	.type	s_pressed, @object
	.size	s_pressed, 1
s_pressed:
	.zero	1
	.globl	u_pressed
	.type	u_pressed, @object
	.size	u_pressed, 1
u_pressed:
	.zero	1
	.globl	caps_on
	.type	caps_on, @object
	.size	caps_on, 1
caps_on:
	.zero	1
	.globl	shift_on
	.type	shift_on, @object
	.size	shift_on, 1
shift_on:
	.zero	1
	.text
	.globl	getchar
	.type	getchar, @function
getchar:
.LFB14:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 16
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	BYTE PTR -5[ebp], 0
.L55:
	cmp	BYTE PTR -5[ebp], 0
	jne	.L54
	call	waitkey
	mov	BYTE PTR -6[ebp], al
	movzx	eax, BYTE PTR -6[ebp]
	movzx	eax, BYTE PTR keytoascii@GOTOFF[ebx+eax]
	mov	BYTE PTR -5[ebp], al
	jmp	.L55
.L54:
	cmp	BYTE PTR -5[ebp], 10
	je	.L56
	movzx	eax, BYTE PTR -5[ebp]
	push	eax
	call	putc
	add	esp, 4
.L56:
	movzx	eax, BYTE PTR -5[ebp]
	mov	ebx, DWORD PTR -4[ebp]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE14:
	.size	getchar, .-getchar
	.local	_ZZ6getstrE3str
	.comm	_ZZ6getstrE3str,999,32
	.globl	getstr
	.type	getstr, @function
getstr:
.LFB15:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 16
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	BYTE PTR -5[ebp], 0
	mov	DWORD PTR -12[ebp], 0
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	mov	DWORD PTR -16[ebp], eax
.L73:
	cmp	BYTE PTR -5[ebp], 10
	je	.L59
	call	waitkey
	mov	BYTE PTR -17[ebp], al
	movzx	eax, BYTE PTR -17[ebp]
	movzx	eax, BYTE PTR keytoascii@GOTOFF[ebx+eax]
	mov	BYTE PTR -5[ebp], al
	cmp	BYTE PTR -5[ebp], 0
	je	.L60
	cmp	BYTE PTR -5[ebp], 9
	jne	.L61
	lea	edx, _ZZ6getstrE3str@GOTOFF[ebx]
	mov	eax, DWORD PTR -12[ebp]
	add	eax, edx
	mov	BYTE PTR [eax], 32
	jmp	.L62
.L61:
	cmp	BYTE PTR -5[ebp], 10
	jne	.L63
	lea	edx, _ZZ6getstrE3str@GOTOFF[ebx]
	mov	eax, DWORD PTR -12[ebp]
	add	eax, edx
	mov	BYTE PTR [eax], 0
	add	DWORD PTR -12[ebp], 1
	jmp	.L59
.L63:
	movzx	eax, BYTE PTR caps_on@GOTOFF[ebx]
	test	al, al
	jne	.L64
	movzx	eax, BYTE PTR shift_on@GOTOFF[ebx]
	test	al, al
	jne	.L64
	lea	edx, _ZZ6getstrE3str@GOTOFF[ebx]
	mov	eax, DWORD PTR -12[ebp]
	add	edx, eax
	movzx	eax, BYTE PTR -5[ebp]
	mov	BYTE PTR [edx], al
	jmp	.L62
.L64:
	movzx	eax, BYTE PTR caps_on@GOTOFF[ebx]
	cmp	al, -1
	jne	.L65
	movzx	eax, BYTE PTR shift_on@GOTOFF[ebx]
	test	al, al
	jne	.L65
	movzx	eax, BYTE PTR -17[ebp]
	movzx	eax, BYTE PTR keytoascii_u@GOTOFF[ebx+eax]
	mov	BYTE PTR -5[ebp], al
	lea	edx, _ZZ6getstrE3str@GOTOFF[ebx]
	mov	eax, DWORD PTR -12[ebp]
	add	edx, eax
	movzx	eax, BYTE PTR -5[ebp]
	mov	BYTE PTR [edx], al
	jmp	.L62
.L65:
	movzx	eax, BYTE PTR caps_on@GOTOFF[ebx]
	test	al, al
	jne	.L66
	movzx	eax, BYTE PTR shift_on@GOTOFF[ebx]
	cmp	al, -1
	jne	.L66
	movzx	eax, BYTE PTR -17[ebp]
	movzx	eax, BYTE PTR keytoascii_s@GOTOFF[ebx+eax]
	mov	BYTE PTR -5[ebp], al
	lea	edx, _ZZ6getstrE3str@GOTOFF[ebx]
	mov	eax, DWORD PTR -12[ebp]
	add	edx, eax
	movzx	eax, BYTE PTR -5[ebp]
	mov	BYTE PTR [edx], al
	jmp	.L62
.L66:
	movzx	eax, BYTE PTR caps_on@GOTOFF[ebx]
	cmp	al, -1
	jne	.L62
	movzx	eax, BYTE PTR shift_on@GOTOFF[ebx]
	cmp	al, -1
	jne	.L62
	movzx	eax, BYTE PTR -17[ebp]
	movzx	eax, BYTE PTR keytoascii_su@GOTOFF[ebx+eax]
	mov	BYTE PTR -5[ebp], al
	lea	edx, _ZZ6getstrE3str@GOTOFF[ebx]
	mov	eax, DWORD PTR -12[ebp]
	add	edx, eax
	movzx	eax, BYTE PTR -5[ebp]
	mov	BYTE PTR [edx], al
.L62:
	add	DWORD PTR -12[ebp], 1
	movzx	eax, BYTE PTR -5[ebp]
	push	eax
	call	putc
	add	esp, 4
	jmp	.L73
.L60:
	cmp	BYTE PTR -17[ebp], 14
	jne	.L68
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	cmp	DWORD PTR -16[ebp], eax
	jge	.L68
	sub	DWORD PTR -12[ebp], 1
	lea	edx, _ZZ6getstrE3str@GOTOFF[ebx]
	mov	eax, DWORD PTR -12[ebp]
	add	eax, edx
	mov	BYTE PTR [eax], 0
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	sub	eax, 1
	mov	DWORD PTR x@GOTOFF[ebx], eax
	push	32
	call	putc
	add	esp, 4
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	sub	eax, 1
	mov	DWORD PTR x@GOTOFF[ebx], eax
	mov	edx, DWORD PTR y@GOTOFF[ebx]
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	push	edx
	push	eax
	call	cursorspos
	add	esp, 8
	jmp	.L67
.L68:
	cmp	BYTE PTR -17[ebp], 58
	jne	.L69
	movzx	eax, BYTE PTR caps_on@GOTOFF[ebx]
	not	eax
	mov	BYTE PTR caps_on@GOTOFF[ebx], al
	jmp	.L73
.L69:
	cmp	BYTE PTR -17[ebp], 42
	je	.L70
	cmp	BYTE PTR -17[ebp], 54
	jne	.L71
.L70:
	mov	BYTE PTR shift_on@GOTOFF[ebx], -1
	jmp	.L67
.L71:
	cmp	BYTE PTR -17[ebp], -86
	je	.L72
	cmp	BYTE PTR -17[ebp], -74
	jne	.L73
.L72:
	mov	BYTE PTR shift_on@GOTOFF[ebx], 0
.L67:
	jmp	.L73
.L59:
	sub	DWORD PTR -12[ebp], 1
	lea	edx, _ZZ6getstrE3str@GOTOFF[ebx]
	mov	eax, DWORD PTR -12[ebp]
	add	eax, edx
	mov	BYTE PTR [eax], 0
	lea	eax, _ZZ6getstrE3str@GOTOFF[ebx]
	mov	ebx, DWORD PTR -4[ebp]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE15:
	.size	getstr, .-getstr
	.local	_ZZ12split_stringE3des
	.comm	_ZZ12split_stringE3des,1024,32
	.section	.rodata
.LC0:
	.string	""
	.text
	.globl	split_string
	.type	split_string, @function
split_string:
.LFB16:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 36
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 12[ebp]
	mov	BYTE PTR -40[ebp], al
	mov	DWORD PTR -8[ebp], 0
.L77:
	cmp	DWORD PTR -8[ebp], 1023
	jg	.L76
	lea	edx, _ZZ12split_stringE3des@GOTOFF[ebx]
	mov	eax, DWORD PTR -8[ebp]
	add	eax, edx
	mov	BYTE PTR [eax], 0
	add	DWORD PTR -8[ebp], 1
	jmp	.L77
.L76:
	mov	DWORD PTR -12[ebp], 0
	mov	DWORD PTR -16[ebp], 0
	mov	DWORD PTR -28[ebp], 0
	mov	DWORD PTR -20[ebp], 0
	mov	DWORD PTR -24[ebp], 0
.L79:
	mov	edx, DWORD PTR -24[ebp]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	cmp	BYTE PTR -40[ebp], al
	jne	.L78
	add	DWORD PTR -24[ebp], 1
	jmp	.L79
.L78:
	push	0
	push	DWORD PTR 8[ebp]
	call	strlen
	add	esp, 8
	cmp	DWORD PTR -24[ebp], eax
	setl	al
	test	al, al
	je	.L80
	mov	edx, DWORD PTR -24[ebp]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	cmp	BYTE PTR -40[ebp], al
	jne	.L81
	lea	edx, _ZZ12split_stringE3des@GOTOFF[ebx]
	mov	eax, DWORD PTR -16[ebp]
	add	eax, edx
	mov	BYTE PTR [eax], 0
	mov	DWORD PTR -16[ebp], 0
	mov	eax, DWORD PTR 16[ebp]
	cmp	eax, DWORD PTR -12[ebp]
	jne	.L82
	mov	eax, DWORD PTR -20[ebp]
	mov	DWORD PTR -28[ebp], eax
	jmp	.L80
.L82:
	add	DWORD PTR -12[ebp], 1
.L84:
	mov	edx, DWORD PTR -24[ebp]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	cmp	BYTE PTR -40[ebp], al
	jne	.L83
	add	DWORD PTR -24[ebp], 1
	jmp	.L84
.L83:
	mov	eax, DWORD PTR -24[ebp]
	mov	DWORD PTR -20[ebp], eax
	sub	DWORD PTR -24[ebp], 1
	jmp	.L85
.L81:
	mov	edx, DWORD PTR -24[ebp]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	lea	ecx, _ZZ12split_stringE3des@GOTOFF[ebx]
	mov	edx, DWORD PTR -16[ebp]
	add	edx, ecx
	mov	BYTE PTR [edx], al
	add	DWORD PTR -16[ebp], 1
.L85:
	add	DWORD PTR -24[ebp], 1
	jmp	.L78
.L80:
	mov	eax, DWORD PTR 16[ebp]
	cmp	eax, DWORD PTR -12[ebp]
	je	.L86
	lea	eax, .LC0@GOTOFF[ebx]
	jmp	.L87
.L86:
	lea	eax, _ZZ12split_stringE3des@GOTOFF[ebx]
.L87:
	mov	ebx, DWORD PTR -4[ebp]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	split_string, .-split_string
	.globl	readlba48
	.type	readlba48, @function
readlba48:
.LFB17:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 32
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	edx, DWORD PTR 16[ebp]
	mov	eax, DWORD PTR 8[ebp]
	mov	DWORD PTR -24[ebp], eax
	mov	eax, DWORD PTR 12[ebp]
	mov	DWORD PTR -20[ebp], eax
	mov	eax, edx
	mov	BYTE PTR -28[ebp], al
	push	0
	push	497
	call	_Z4outbth
	add	esp, 8
	push	0
	push	497
	call	_Z4outbth
	add	esp, 8
	push	0
	push	498
	call	_Z4outbth
	add	esp, 8
	push	1
	push	498
	call	_Z4outbth
	add	esp, 8
	mov	eax, DWORD PTR -24[ebp]
	mov	edx, DWORD PTR -20[ebp]
	shrd	eax, edx, 24
	shr	edx, 24
	movzx	eax, al
	push	eax
	push	499
	call	_Z4outbth
	add	esp, 8
	mov	eax, DWORD PTR -24[ebp]
	movzx	eax, al
	push	eax
	push	499
	call	_Z4outbth
	add	esp, 8
	mov	eax, DWORD PTR -24[ebp]
	mov	edx, DWORD PTR -20[ebp]
	mov	eax, edx
	xor	edx, edx
	movzx	eax, al
	push	eax
	push	500
	call	_Z4outbth
	add	esp, 8
	mov	eax, DWORD PTR -24[ebp]
	mov	edx, DWORD PTR -20[ebp]
	shrd	eax, edx, 8
	shr	edx, 8
	movzx	eax, al
	push	eax
	push	500
	call	_Z4outbth
	add	esp, 8
	mov	eax, DWORD PTR -24[ebp]
	mov	edx, DWORD PTR -20[ebp]
	mov	eax, edx
	xor	edx, edx
	shr	eax, 8
	movzx	eax, al
	push	eax
	push	501
	call	_Z4outbth
	add	esp, 8
	mov	eax, DWORD PTR -24[ebp]
	mov	edx, DWORD PTR -20[ebp]
	shrd	eax, edx, 16
	shr	edx, 16
	movzx	eax, al
	push	eax
	push	501
	call	_Z4outbth
	add	esp, 8
	movzx	eax, BYTE PTR -28[ebp]
	sal	eax, 4
	or	eax, 64
	movzx	eax, al
	push	eax
	push	502
	call	_Z4outbth
	add	esp, 8
	push	36
	push	503
	call	_Z4outbth
	add	esp, 8
.L90:
	push	503
	call	_Z3inbt
	add	esp, 4
	movzx	eax, al
	and	eax, 8
	test	eax, eax
	sete	al
	test	al, al
	je	.L89
	jmp	.L90
.L89:
	mov	DWORD PTR -4[ebp], 0
.L92:
	cmp	DWORD PTR -4[ebp], 255
	jg	.L93
	push	496
	call	_Z3inwt
	add	esp, 4
	mov	WORD PTR -6[ebp], ax
	mov	eax, DWORD PTR -4[ebp]
	add	eax, eax
	mov	edx, eax
	mov	eax, DWORD PTR 20[ebp]
	add	eax, edx
	movzx	edx, WORD PTR -6[ebp]
	mov	BYTE PTR [eax], dl
	movzx	eax, WORD PTR -6[ebp]
	sar	eax, 8
	mov	ecx, eax
	mov	eax, DWORD PTR -4[ebp]
	add	eax, eax
	lea	edx, 1[eax]
	mov	eax, DWORD PTR 20[ebp]
	add	eax, edx
	mov	edx, ecx
	mov	BYTE PTR [eax], dl
	add	DWORD PTR -4[ebp], 1
	jmp	.L92
.L93:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	readlba48, .-readlba48
	.globl	writelba48
	.type	writelba48, @function
writelba48:
.LFB18:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 32
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	edx, DWORD PTR 16[ebp]
	mov	eax, DWORD PTR 8[ebp]
	mov	DWORD PTR -24[ebp], eax
	mov	eax, DWORD PTR 12[ebp]
	mov	DWORD PTR -20[ebp], eax
	mov	eax, edx
	mov	BYTE PTR -28[ebp], al
	push	0
	push	497
	call	_Z4outbth
	add	esp, 8
	push	0
	push	497
	call	_Z4outbth
	add	esp, 8
	push	0
	push	498
	call	_Z4outbth
	add	esp, 8
	push	1
	push	498
	call	_Z4outbth
	add	esp, 8
	mov	eax, DWORD PTR -24[ebp]
	mov	edx, DWORD PTR -20[ebp]
	shrd	eax, edx, 24
	shr	edx, 24
	movzx	eax, al
	push	eax
	push	499
	call	_Z4outbth
	add	esp, 8
	mov	eax, DWORD PTR -24[ebp]
	movzx	eax, al
	push	eax
	push	499
	call	_Z4outbth
	add	esp, 8
	mov	eax, DWORD PTR -24[ebp]
	mov	edx, DWORD PTR -20[ebp]
	mov	eax, edx
	xor	edx, edx
	movzx	eax, al
	push	eax
	push	500
	call	_Z4outbth
	add	esp, 8
	mov	eax, DWORD PTR -24[ebp]
	mov	edx, DWORD PTR -20[ebp]
	shrd	eax, edx, 8
	shr	edx, 8
	movzx	eax, al
	push	eax
	push	500
	call	_Z4outbth
	add	esp, 8
	mov	eax, DWORD PTR -24[ebp]
	mov	edx, DWORD PTR -20[ebp]
	mov	eax, edx
	xor	edx, edx
	shr	eax, 8
	movzx	eax, al
	push	eax
	push	501
	call	_Z4outbth
	add	esp, 8
	mov	eax, DWORD PTR -24[ebp]
	mov	edx, DWORD PTR -20[ebp]
	shrd	eax, edx, 16
	shr	edx, 16
	movzx	eax, al
	push	eax
	push	501
	call	_Z4outbth
	add	esp, 8
	movzx	eax, BYTE PTR -28[ebp]
	sal	eax, 4
	or	eax, 64
	movzx	eax, al
	push	eax
	push	502
	call	_Z4outbth
	add	esp, 8
	push	52
	push	503
	call	_Z4outbth
	add	esp, 8
.L96:
	push	503
	call	_Z3inbt
	add	esp, 4
	movzx	eax, al
	and	eax, 8
	test	eax, eax
	sete	al
	test	al, al
	je	.L95
	jmp	.L96
.L95:
	mov	DWORD PTR -4[ebp], 0
.L98:
	cmp	DWORD PTR -4[ebp], 255
	jg	.L99
	mov	eax, DWORD PTR -4[ebp]
	add	eax, 4
	add	eax, eax
	mov	edx, eax
	mov	eax, DWORD PTR 20[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	movzx	eax, al
	mov	edx, DWORD PTR -4[ebp]
	add	edx, edx
	lea	ecx, 9[edx]
	mov	edx, DWORD PTR 20[ebp]
	add	edx, ecx
	movzx	edx, BYTE PTR [edx]
	movzx	edx, dl
	sal	edx, 8
	or	eax, edx
	mov	WORD PTR -6[ebp], ax
	movzx	eax, WORD PTR -6[ebp]
	push	eax
	push	496
	call	_Z4outwtt
	add	esp, 8
	add	DWORD PTR -4[ebp], 1
	jmp	.L98
.L99:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	writelba48, .-writelba48
	.globl	baotl
	.type	baotl, @function
baotl:
.LFB19:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	edx, DWORD PTR 12[ebp]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	mov	BYTE PTR -12[ebp], al
	mov	eax, DWORD PTR 12[ebp]
	lea	edx, 1[eax]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	mov	BYTE PTR -11[ebp], al
	mov	eax, DWORD PTR 12[ebp]
	lea	edx, 2[eax]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	mov	BYTE PTR -10[ebp], al
	mov	eax, DWORD PTR 12[ebp]
	lea	edx, 3[eax]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	mov	BYTE PTR -9[ebp], al
	mov	eax, DWORD PTR 12[ebp]
	lea	edx, 4[eax]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	mov	BYTE PTR -8[ebp], al
	mov	eax, DWORD PTR 12[ebp]
	lea	edx, 5[eax]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	mov	BYTE PTR -7[ebp], al
	mov	eax, DWORD PTR 12[ebp]
	lea	edx, 6[eax]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	mov	BYTE PTR -6[ebp], al
	mov	eax, DWORD PTR 12[ebp]
	lea	edx, 7[eax]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	mov	BYTE PTR -5[ebp], al
	lea	eax, -12[ebp]
	mov	DWORD PTR -4[ebp], eax
	mov	eax, DWORD PTR -4[ebp]
	mov	edx, DWORD PTR 4[eax]
	mov	eax, DWORD PTR [eax]
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	baotl, .-baotl
	.globl	baots
	.type	baots, @function
baots:
.LFB20:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	edx, DWORD PTR 12[ebp]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	mov	BYTE PTR -6[ebp], al
	mov	eax, DWORD PTR 12[ebp]
	lea	edx, 1[eax]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	mov	BYTE PTR -5[ebp], al
	lea	eax, -6[ebp]
	mov	DWORD PTR -4[ebp], eax
	mov	eax, DWORD PTR -4[ebp]
	movzx	eax, WORD PTR [eax]
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	baots, .-baots
	.section	.rodata
.LC1:
	.string	", "
.LC2:
	.string	"  "
	.text
	.globl	listfiles
	.type	listfiles, @function
listfiles:
.LFB21:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	push	esi
	push	ebx
	sub	esp, 804
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	lea	eax, -556[ebp]
	push	eax
	push	0
	push	0
	push	204883
	call	readlba48
	add	esp, 16
	push	12
	lea	eax, -556[ebp]
	push	eax
	call	baotl
	add	esp, 8
	mov	DWORD PTR -40[ebp], eax
	mov	DWORD PTR -36[ebp], edx
	mov	DWORD PTR -44[ebp], 1
	mov	DWORD PTR -20[ebp], 1
.L111:
	mov	eax, DWORD PTR -20[ebp]
	cdq
	mov	esi, DWORD PTR -40[ebp]
	mov	edi, DWORD PTR -36[ebp]
	add	esi, 1
	adc	edi, 0
	cmp	eax, esi
	mov	eax, edx
	sbb	eax, edi
	jnc	.L105
	mov	eax, DWORD PTR -20[ebp]
	add	eax, 204883
	cdq
	lea	ecx, -556[ebp]
	push	ecx
	push	0
	push	edx
	push	eax
	call	readlba48
	add	esp, 16
	mov	DWORD PTR -24[ebp], 0
.L110:
	cmp	DWORD PTR -24[ebp], 1
	jg	.L106
	mov	eax, DWORD PTR -24[ebp]
	sal	eax, 8
	movzx	eax, BYTE PTR -556[ebp+eax]
	cmp	al, 1
	jne	.L107
	mov	eax, DWORD PTR -24[ebp]
	sal	eax, 8
	add	eax, 9
	sub	esp, 4
	push	3
	push	eax
	lea	eax, -556[ebp]
	push	eax
	call	puts_c
	add	esp, 16
	sub	esp, 4
	push	3
	push	0
	lea	eax, .LC1@GOTOFF[ebx]
	push	eax
	call	puts_c
	add	esp, 16
	mov	DWORD PTR -28[ebp], 0
.L109:
	cmp	DWORD PTR -28[ebp], 246
	jg	.L107
	mov	eax, DWORD PTR -24[ebp]
	sal	eax, 8
	lea	edx, 9[eax]
	mov	eax, DWORD PTR -28[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR -556[ebp+eax]
	lea	ecx, -803[ebp]
	mov	edx, DWORD PTR -28[ebp]
	add	edx, ecx
	mov	BYTE PTR [edx], al
	add	DWORD PTR -28[ebp], 1
	jmp	.L109
.L107:
	add	DWORD PTR -24[ebp], 1
	jmp	.L110
.L106:
	add	DWORD PTR -20[ebp], 1
	jmp	.L111
.L105:
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	sub	eax, 2
	mov	DWORD PTR x@GOTOFF[ebx], eax
	push	0
	lea	eax, .LC2@GOTOFF[ebx]
	push	eax
	call	puts
	add	esp, 8
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	sub	eax, 2
	mov	DWORD PTR x@GOTOFF[ebx], eax
	sub	esp, 4
	push	10
	call	putc
	add	esp, 8
	nop
	lea	esp, -12[ebp]
	pop	ebx
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	listfiles, .-listfiles
	.globl	file_size
	.type	file_size, @function
file_size:
.LFB22:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	push	esi
	push	ebx
	sub	esp, 828
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR -20[ebp], 0
	lea	eax, -570[ebp]
	push	eax
	push	0
	push	0
	push	204883
	call	readlba48
	add	esp, 16
	push	12
	lea	eax, -570[ebp]
	push	eax
	call	baotl
	add	esp, 8
	mov	DWORD PTR -48[ebp], eax
	mov	DWORD PTR -44[ebp], edx
	mov	DWORD PTR -24[ebp], 1
.L123:
	mov	eax, DWORD PTR -24[ebp]
	mov	ecx, eax
	mov	ebx, eax
	sar	ebx, 31
	mov	eax, DWORD PTR -48[ebp]
	mov	edx, DWORD PTR -44[ebp]
	add	eax, 1
	adc	edx, 0
	cmp	ecx, eax
	sbb	ebx, edx
	jnc	.L113
	mov	eax, DWORD PTR -24[ebp]
	add	eax, 204883
	cdq
	lea	ecx, -570[ebp]
	push	ecx
	push	0
	push	edx
	push	eax
	call	readlba48
	add	esp, 16
	mov	DWORD PTR -28[ebp], 0
.L122:
	cmp	DWORD PTR -28[ebp], 1
	jg	.L114
	mov	eax, DWORD PTR -28[ebp]
	sal	eax, 8
	movzx	eax, BYTE PTR -570[ebp+eax]
	cmp	al, 1
	jne	.L115
	mov	DWORD PTR -32[ebp], 0
.L117:
	cmp	DWORD PTR -32[ebp], 246
	jg	.L116
	mov	eax, DWORD PTR -28[ebp]
	sal	eax, 8
	lea	edx, 9[eax]
	mov	eax, DWORD PTR -32[ebp]
	add	eax, edx
	movzx	edx, BYTE PTR -570[ebp+eax]
	lea	ecx, -817[ebp]
	mov	eax, DWORD PTR -32[ebp]
	add	eax, ecx
	mov	BYTE PTR [eax], dl
	add	DWORD PTR -32[ebp], 1
	jmp	.L117
.L116:
	mov	eax, DWORD PTR -28[ebp]
	sal	eax, 8
	add	eax, 1
	push	eax
	lea	eax, -570[ebp]
	push	eax
	call	baotl
	add	esp, 8
	mov	DWORD PTR -56[ebp], eax
	mov	DWORD PTR -52[ebp], edx
	push	DWORD PTR 8[ebp]
	lea	eax, -817[ebp]
	push	eax
	call	strcmp
	add	esp, 8
	test	al, al
	je	.L115
	mov	eax, DWORD PTR -56[ebp]
	mov	edx, DWORD PTR -52[ebp]
	mov	DWORD PTR -40[ebp], eax
	mov	DWORD PTR -36[ebp], edx
.L121:
	mov	eax, DWORD PTR -40[ebp]
	xor	ah, 0
	mov	esi, eax
	mov	eax, DWORD PTR -36[ebp]
	xor	ah, 0
	mov	edi, eax
	mov	eax, edi
	or	eax, esi
	test	eax, eax
	je	.L115
	mov	eax, DWORD PTR -40[ebp]
	mov	edx, DWORD PTR -36[ebp]
	add	eax, 204883
	adc	edx, 0
	lea	ecx, -570[ebp]
	push	ecx
	push	0
	push	edx
	push	eax
	call	readlba48
	add	esp, 16
	mov	WORD PTR -58[ebp], 0
	push	3
	lea	eax, -570[ebp]
	push	eax
	call	baotl
	add	esp, 8
	mov	DWORD PTR -40[ebp], eax
	mov	DWORD PTR -36[ebp], edx
	mov	eax, DWORD PTR -40[ebp]
	xor	ah, 0
	mov	DWORD PTR -840[ebp], eax
	mov	eax, DWORD PTR -36[ebp]
	xor	ah, 0
	mov	DWORD PTR -836[ebp], eax
	mov	edx, DWORD PTR -840[ebp]
	mov	ecx, DWORD PTR -836[ebp]
	mov	eax, ecx
	or	eax, edx
	test	eax, eax
	jne	.L119
	push	1
	lea	eax, -570[ebp]
	push	eax
	call	baots
	add	esp, 8
	mov	WORD PTR -58[ebp], ax
	movzx	eax, WORD PTR -58[ebp]
	add	DWORD PTR -20[ebp], eax
	jmp	.L121
.L119:
	add	DWORD PTR -20[ebp], 501
	jmp	.L121
.L115:
	add	DWORD PTR -28[ebp], 1
	jmp	.L122
.L114:
	add	DWORD PTR -24[ebp], 1
	jmp	.L123
.L113:
	mov	eax, DWORD PTR -20[ebp]
	lea	esp, -12[ebp]
	pop	ebx
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	file_size, .-file_size
	.globl	file_read
	.type	file_read, @function
file_read:
.LFB23:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	push	esi
	push	ebx
	sub	esp, 844
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR -56[ebp], 0
	sub	esp, 4
	push	DWORD PTR 8[ebp]
	call	file_size
	add	esp, 8
	mov	DWORD PTR -56[ebp], eax
	lea	eax, -586[ebp]
	push	eax
	push	0
	push	0
	push	204883
	call	readlba48
	add	esp, 16
	push	12
	lea	eax, -586[ebp]
	push	eax
	call	baotl
	add	esp, 8
	mov	DWORD PTR -64[ebp], eax
	mov	DWORD PTR -60[ebp], edx
	mov	DWORD PTR -20[ebp], 1
.L138:
	mov	eax, DWORD PTR -20[ebp]
	mov	ecx, eax
	mov	ebx, eax
	sar	ebx, 31
	mov	eax, DWORD PTR -64[ebp]
	mov	edx, DWORD PTR -60[ebp]
	add	eax, 1
	adc	edx, 0
	cmp	ecx, eax
	sbb	ebx, edx
	jnc	.L126
	mov	eax, DWORD PTR -20[ebp]
	add	eax, 204883
	cdq
	lea	ecx, -586[ebp]
	push	ecx
	push	0
	push	edx
	push	eax
	call	readlba48
	add	esp, 16
	mov	DWORD PTR -24[ebp], 0
.L137:
	cmp	DWORD PTR -24[ebp], 1
	jg	.L127
	mov	eax, DWORD PTR -24[ebp]
	sal	eax, 8
	movzx	eax, BYTE PTR -586[ebp+eax]
	cmp	al, 1
	jne	.L128
	mov	DWORD PTR -28[ebp], 0
.L130:
	cmp	DWORD PTR -28[ebp], 246
	jg	.L129
	mov	eax, DWORD PTR -24[ebp]
	sal	eax, 8
	lea	edx, 9[eax]
	mov	eax, DWORD PTR -28[ebp]
	add	eax, edx
	movzx	edx, BYTE PTR -586[ebp+eax]
	lea	ecx, -833[ebp]
	mov	eax, DWORD PTR -28[ebp]
	add	eax, ecx
	mov	BYTE PTR [eax], dl
	add	DWORD PTR -28[ebp], 1
	jmp	.L130
.L129:
	mov	eax, DWORD PTR -24[ebp]
	sal	eax, 8
	add	eax, 1
	push	eax
	lea	eax, -586[ebp]
	push	eax
	call	baotl
	add	esp, 8
	mov	DWORD PTR -72[ebp], eax
	mov	DWORD PTR -68[ebp], edx
	push	DWORD PTR 8[ebp]
	lea	eax, -833[ebp]
	push	eax
	call	strcmp
	add	esp, 8
	test	al, al
	je	.L128
	mov	eax, DWORD PTR -72[ebp]
	mov	edx, DWORD PTR -68[ebp]
	mov	DWORD PTR -40[ebp], eax
	mov	DWORD PTR -36[ebp], edx
	mov	DWORD PTR -44[ebp], 0
.L136:
	mov	eax, DWORD PTR -40[ebp]
	xor	ah, 0
	mov	esi, eax
	mov	eax, DWORD PTR -36[ebp]
	xor	ah, 0
	mov	edi, eax
	mov	eax, edi
	or	eax, esi
	test	eax, eax
	je	.L128
	mov	eax, DWORD PTR -40[ebp]
	mov	edx, DWORD PTR -36[ebp]
	add	eax, 204883
	adc	edx, 0
	lea	ecx, -586[ebp]
	push	ecx
	push	0
	push	edx
	push	eax
	call	readlba48
	add	esp, 16
	mov	WORD PTR -74[ebp], 0
	push	3
	lea	eax, -586[ebp]
	push	eax
	call	baotl
	add	esp, 8
	mov	DWORD PTR -40[ebp], eax
	mov	DWORD PTR -36[ebp], edx
	mov	eax, DWORD PTR -40[ebp]
	xor	ah, 0
	mov	DWORD PTR -856[ebp], eax
	mov	eax, DWORD PTR -36[ebp]
	xor	ah, 0
	mov	DWORD PTR -852[ebp], eax
	mov	ecx, DWORD PTR -856[ebp]
	mov	ebx, DWORD PTR -852[ebp]
	mov	eax, ebx
	or	eax, ecx
	test	eax, eax
	jne	.L132
	push	1
	lea	eax, -586[ebp]
	push	eax
	call	baots
	add	esp, 8
	mov	WORD PTR -74[ebp], ax
	mov	DWORD PTR -48[ebp], 0
.L134:
	movzx	eax, WORD PTR -74[ebp]
	cmp	DWORD PTR -48[ebp], eax
	jge	.L133
	mov	eax, DWORD PTR -48[ebp]
	lea	ecx, 11[eax]
	mov	edx, DWORD PTR -48[ebp]
	mov	eax, DWORD PTR -44[ebp]
	add	edx, eax
	mov	eax, DWORD PTR 12[ebp]
	add	edx, eax
	movzx	eax, BYTE PTR -586[ebp+ecx]
	mov	BYTE PTR [edx], al
	add	DWORD PTR -48[ebp], 1
	jmp	.L134
.L132:
	mov	DWORD PTR -52[ebp], 0
.L135:
	cmp	DWORD PTR -52[ebp], 500
	jg	.L133
	mov	eax, DWORD PTR -52[ebp]
	lea	ecx, 11[eax]
	mov	edx, DWORD PTR -52[ebp]
	mov	eax, DWORD PTR -44[ebp]
	add	edx, eax
	mov	eax, DWORD PTR 12[ebp]
	add	edx, eax
	movzx	eax, BYTE PTR -586[ebp+ecx]
	mov	BYTE PTR [edx], al
	add	DWORD PTR -52[ebp], 1
	jmp	.L135
.L133:
	add	DWORD PTR -44[ebp], 501
	jmp	.L136
.L128:
	add	DWORD PTR -24[ebp], 1
	jmp	.L137
.L127:
	add	DWORD PTR -20[ebp], 1
	jmp	.L138
.L126:
	mov	eax, DWORD PTR -56[ebp]
	lea	esp, -12[ebp]
	pop	ebx
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE23:
	.size	file_read, .-file_read
	.globl	idt
	.bss
	.align 32
	.type	idt, @object
	.size	idt, 2048
idt:
	.zero	2048
	.globl	idt_reg
	.align 4
	.type	idt_reg, @object
	.size	idt_reg, 6
idt_reg:
	.zero	6
	.text
	.globl	memcpy
	.type	memcpy, @function
memcpy:
.LFB24:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR -4[ebp], 0
.L142:
	mov	eax, DWORD PTR -4[ebp]
	cmp	DWORD PTR 16[ebp], eax
	jbe	.L143
	mov	edx, DWORD PTR -4[ebp]
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	mov	ecx, DWORD PTR -4[ebp]
	mov	edx, DWORD PTR 12[ebp]
	add	edx, ecx
	movzx	eax, BYTE PTR [eax]
	mov	BYTE PTR [edx], al
	add	DWORD PTR -4[ebp], 1
	jmp	.L142
.L143:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	memcpy, .-memcpy
	.globl	memfill
	.type	memfill, @function
memfill:
.LFB25:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 20
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 12[ebp]
	mov	BYTE PTR -20[ebp], al
	mov	DWORD PTR -4[ebp], 0
.L146:
	mov	eax, DWORD PTR -4[ebp]
	cmp	DWORD PTR 16[ebp], eax
	jbe	.L147
	mov	edx, DWORD PTR -4[ebp]
	mov	eax, DWORD PTR 8[ebp]
	add	edx, eax
	movzx	eax, BYTE PTR -20[ebp]
	mov	BYTE PTR [edx], al
	add	DWORD PTR -4[ebp], 1
	jmp	.L146
.L147:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE25:
	.size	memfill, .-memfill
	.globl	irq_install_handler
	.type	irq_install_handler, @function
irq_install_handler:
.LFB26:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	edx, DWORD PTR 8[ebp]
	mov	ecx, edx
	mov	edx, DWORD PTR 8[ebp]
	mov	WORD PTR idt@GOTOFF[eax+edx*8], cx
	mov	edx, DWORD PTR 8[ebp]
	mov	WORD PTR idt@GOTOFF[eax+2+edx*8], 8
	mov	edx, DWORD PTR 8[ebp]
	mov	BYTE PTR idt@GOTOFF[eax+4+edx*8], 0
	mov	edx, DWORD PTR 8[ebp]
	mov	BYTE PTR idt@GOTOFF[eax+5+edx*8], -114
	mov	edx, DWORD PTR 8[ebp]
	shr	edx, 16
	mov	ecx, edx
	mov	edx, DWORD PTR 8[ebp]
	mov	WORD PTR idt@GOTOFF[eax+6+edx*8], cx
	nop
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE26:
	.size	irq_install_handler, .-irq_install_handler
	.globl	set_idt
	.type	set_idt, @function
set_idt:
.LFB27:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	lea	edx, idt@GOTOFF[eax]
	mov	DWORD PTR idt_reg@GOTOFF[eax+2], edx
	mov	WORD PTR idt_reg@GOTOFF[eax], 2047
	lea	eax, idt_reg@GOTOFF[eax]
#APP
# 29 "../include/idt.h" 1
	lidt [eax]
# 0 "" 2
#NO_APP
	nop
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE27:
	.size	set_idt, .-set_idt
	.globl	retbit
	.type	retbit, @function
retbit:
.LFB28:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	BYTE PTR -1[ebp], 0
	mov	eax, DWORD PTR 8[ebp]
#APP
# 294 "kernel.cpp" 1
	mov eax, eax
# 0 "" 2
#NO_APP
	mov	eax, DWORD PTR 12[ebp]
#APP
# 295 "kernel.cpp" 1
	bt eax, eax
# 0 "" 2
# 296 "kernel.cpp" 1
	jc .setddd
# 0 "" 2
# 297 "kernel.cpp" 1
	jmp .nsetddd
# 0 "" 2
# 298 "kernel.cpp" 1
	.setddd:
# 0 "" 2
# 299 "kernel.cpp" 1
	mov al, 1
# 0 "" 2
#NO_APP
	mov	BYTE PTR -1[ebp], al
#APP
# 300 "kernel.cpp" 1
	jmp .nonono
# 0 "" 2
# 301 "kernel.cpp" 1
	.nsetddd:
# 0 "" 2
# 302 "kernel.cpp" 1
	mov al, 0
# 0 "" 2
#NO_APP
	mov	BYTE PTR -1[ebp], al
#APP
# 303 "kernel.cpp" 1
	.nonono:
# 0 "" 2
#NO_APP
	movzx	eax, BYTE PTR -1[ebp]
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE28:
	.size	retbit, .-retbit
	.globl	mouse_cycle
	.bss
	.type	mouse_cycle, @object
	.size	mouse_cycle, 1
mouse_cycle:
	.zero	1
	.globl	mouse_byte
	.type	mouse_byte, @object
	.size	mouse_byte, 3
mouse_byte:
	.zero	3
	.globl	mouse_x
	.type	mouse_x, @object
	.size	mouse_x, 1
mouse_x:
	.zero	1
	.globl	mouse_y
	.type	mouse_y, @object
	.size	mouse_y, 1
mouse_y:
	.zero	1
	.globl	defx
	.align 4
	.type	defx, @object
	.size	defx, 4
defx:
	.zero	4
	.globl	defy
	.align 4
	.type	defy, @object
	.size	defy, 4
defy:
	.zero	4
	.globl	oldx
	.type	oldx, @object
	.size	oldx, 1
oldx:
	.zero	1
	.globl	oldy
	.type	oldy, @object
	.size	oldy, 1
oldy:
	.zero	1
	.text
	.globl	mouse_handler
	.type	mouse_handler, @function
mouse_handler:
.LFB29:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	movzx	eax, BYTE PTR mouse_cycle@GOTOFF[ebx]
	movzx	eax, al
	cmp	eax, 2
	je	.L153
	cmp	eax, 2
	jg	.L165
	test	eax, eax
	je	.L155
	cmp	eax, 1
	je	.L156
	jmp	.L165
.L155:
	push	96
	call	_Z3inbt
	add	esp, 4
	mov	BYTE PTR mouse_byte@GOTOFF[ebx], al
	movzx	eax, BYTE PTR mouse_cycle@GOTOFF[ebx]
	add	eax, 1
	mov	BYTE PTR mouse_cycle@GOTOFF[ebx], al
	jmp	.L154
.L156:
	push	96
	call	_Z3inbt
	add	esp, 4
	mov	BYTE PTR mouse_byte@GOTOFF[ebx+1], al
	movzx	eax, BYTE PTR mouse_cycle@GOTOFF[ebx]
	add	eax, 1
	mov	BYTE PTR mouse_cycle@GOTOFF[ebx], al
	jmp	.L154
.L153:
	push	96
	call	_Z3inbt
	add	esp, 4
	mov	BYTE PTR mouse_byte@GOTOFF[ebx+2], al
	movzx	eax, BYTE PTR mouse_byte@GOTOFF[ebx+1]
	mov	BYTE PTR mouse_x@GOTOFF[ebx], al
	movzx	eax, BYTE PTR mouse_byte@GOTOFF[ebx+2]
	mov	BYTE PTR mouse_y@GOTOFF[ebx], al
	movzx	edx, BYTE PTR oldx@GOTOFF[ebx]
	movzx	eax, BYTE PTR mouse_x@GOTOFF[ebx]
	cmp	dl, al
	jbe	.L157
	movzx	eax, BYTE PTR mouse_byte@GOTOFF[ebx]
	movzx	eax, al
	push	4
	push	eax
	call	retbit
	add	esp, 8
	test	eax, eax
	setne	al
	test	al, al
	je	.L158
	mov	eax, DWORD PTR defx@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR defx@GOTOFF[ebx], eax
	jmp	.L159
.L158:
	mov	eax, DWORD PTR defx@GOTOFF[ebx]
	sub	eax, 1
	mov	DWORD PTR defx@GOTOFF[ebx], eax
	jmp	.L159
.L157:
	movzx	edx, BYTE PTR oldx@GOTOFF[ebx]
	movzx	eax, BYTE PTR mouse_x@GOTOFF[ebx]
	cmp	dl, al
	jnb	.L159
	movzx	eax, BYTE PTR mouse_byte@GOTOFF[ebx]
	movzx	eax, al
	push	4
	push	eax
	call	retbit
	add	esp, 8
	test	eax, eax
	setne	al
	test	al, al
	je	.L160
	mov	eax, DWORD PTR defx@GOTOFF[ebx]
	sub	eax, 1
	mov	DWORD PTR defx@GOTOFF[ebx], eax
	jmp	.L159
.L160:
	mov	eax, DWORD PTR defx@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR defx@GOTOFF[ebx], eax
.L159:
	movzx	edx, BYTE PTR oldy@GOTOFF[ebx]
	movzx	eax, BYTE PTR mouse_y@GOTOFF[ebx]
	cmp	dl, al
	jbe	.L161
	movzx	eax, BYTE PTR mouse_byte@GOTOFF[ebx]
	movzx	eax, al
	push	5
	push	eax
	call	retbit
	add	esp, 8
	test	eax, eax
	setne	al
	test	al, al
	je	.L162
	mov	eax, DWORD PTR defy@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR defy@GOTOFF[ebx], eax
	jmp	.L163
.L162:
	mov	eax, DWORD PTR defy@GOTOFF[ebx]
	sub	eax, 1
	mov	DWORD PTR defy@GOTOFF[ebx], eax
	jmp	.L163
.L161:
	movzx	edx, BYTE PTR oldy@GOTOFF[ebx]
	movzx	eax, BYTE PTR mouse_y@GOTOFF[ebx]
	cmp	dl, al
	jnb	.L163
	movzx	eax, BYTE PTR mouse_byte@GOTOFF[ebx]
	movzx	eax, al
	push	5
	push	eax
	call	retbit
	add	esp, 8
	test	eax, eax
	setne	al
	test	al, al
	je	.L164
	mov	eax, DWORD PTR defy@GOTOFF[ebx]
	sub	eax, 1
	mov	DWORD PTR defy@GOTOFF[ebx], eax
	jmp	.L163
.L164:
	mov	eax, DWORD PTR defy@GOTOFF[ebx]
	add	eax, 1
	mov	DWORD PTR defy@GOTOFF[ebx], eax
.L163:
	movzx	eax, BYTE PTR mouse_x@GOTOFF[ebx]
	mov	BYTE PTR oldx@GOTOFF[ebx], al
	movzx	eax, BYTE PTR mouse_y@GOTOFF[ebx]
	mov	BYTE PTR oldy@GOTOFF[ebx], al
	mov	BYTE PTR mouse_cycle@GOTOFF[ebx], 0
	nop
.L154:
.L165:
	nop
	mov	ebx, DWORD PTR -4[ebp]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE29:
	.size	mouse_handler, .-mouse_handler
	.section	.text.mouse_wait,"axG",@progbits,mouse_wait,comdat
	.weak	mouse_wait
	.type	mouse_wait, @function
mouse_wait:
.LFB30:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 20
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 8[ebp]
	mov	BYTE PTR -20[ebp], al
	mov	DWORD PTR -4[ebp], 100000
	cmp	BYTE PTR -20[ebp], 0
	jne	.L167
.L171:
	mov	eax, DWORD PTR -4[ebp]
	lea	edx, -1[eax]
	mov	DWORD PTR -4[ebp], edx
	test	eax, eax
	setne	al
	test	al, al
	je	.L174
	push	100
	call	_Z3inbt
	add	esp, 4
	movzx	eax, al
	and	eax, 1
	cmp	eax, 1
	sete	al
	test	al, al
	jne	.L175
	jmp	.L171
.L167:
	mov	eax, DWORD PTR -4[ebp]
	lea	edx, -1[eax]
	mov	DWORD PTR -4[ebp], edx
	test	eax, eax
	setne	al
	test	al, al
	je	.L176
	push	100
	call	_Z3inbt
	add	esp, 4
	movzx	eax, al
	and	eax, 2
	test	eax, eax
	sete	al
	test	al, al
	jne	.L177
	jmp	.L167
.L174:
	nop
	jmp	.L166
.L175:
	nop
	jmp	.L166
.L176:
	nop
	jmp	.L166
.L177:
	nop
.L166:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE30:
	.size	mouse_wait, .-mouse_wait
	.section	.text.mouse_write,"axG",@progbits,mouse_write,comdat
	.weak	mouse_write
	.type	mouse_write, @function
mouse_write:
.LFB31:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 8[ebp]
	mov	BYTE PTR -12[ebp], al
	sub	esp, 12
	push	1
	call	mouse_wait
	add	esp, 16
	sub	esp, 8
	push	212
	push	100
	call	_Z4outbth
	add	esp, 16
	sub	esp, 12
	push	1
	call	mouse_wait
	add	esp, 16
	movzx	eax, BYTE PTR -12[ebp]
	movzx	eax, al
	sub	esp, 8
	push	eax
	push	96
	call	_Z4outbth
	add	esp, 16
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE31:
	.size	mouse_write, .-mouse_write
	.text
	.globl	mouse_read
	.type	mouse_read, @function
mouse_read:
.LFB32:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	sub	esp, 12
	push	0
	call	mouse_wait
	add	esp, 16
	sub	esp, 12
	push	96
	call	_Z3inbt
	add	esp, 16
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE32:
	.size	mouse_read, .-mouse_read
	.globl	mouse_install
	.type	mouse_install, @function
mouse_install:
.LFB33:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 20
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	sub	esp, 12
	push	1
	call	mouse_wait
	add	esp, 16
	sub	esp, 8
	push	168
	push	100
	call	_Z4outbth
	add	esp, 16
	sub	esp, 12
	push	1
	call	mouse_wait
	add	esp, 16
	sub	esp, 8
	push	32
	push	100
	call	_Z4outbth
	add	esp, 16
	sub	esp, 12
	push	0
	call	mouse_wait
	add	esp, 16
	sub	esp, 12
	push	96
	call	_Z3inbt
	add	esp, 16
	or	eax, 2
	mov	BYTE PTR -9[ebp], al
	sub	esp, 12
	push	1
	call	mouse_wait
	add	esp, 16
	sub	esp, 8
	push	96
	push	100
	call	_Z4outbth
	add	esp, 16
	sub	esp, 12
	push	1
	call	mouse_wait
	add	esp, 16
	movzx	eax, BYTE PTR -9[ebp]
	sub	esp, 8
	push	eax
	push	96
	call	_Z4outbth
	add	esp, 16
	sub	esp, 12
	push	-10
	call	mouse_write
	add	esp, 16
	call	mouse_read
	sub	esp, 12
	push	-12
	call	mouse_write
	add	esp, 16
	call	mouse_read
	lea	eax, mouse_handler@GOTOFF[ebx]
	sub	esp, 8
	push	eax
	push	12
	call	irq_install_handler
	add	esp, 16
	nop
	mov	ebx, DWORD PTR -4[ebp]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE33:
	.size	mouse_install, .-mouse_install
	.local	_ZL10filebuffer
	.comm	_ZL10filebuffer,104857600,32
	.section	.data.rel.local,"aw"
	.align 32
	.type	_ZL7prgfuns, @object
	.size	_ZL7prgfuns, 1024
_ZL7prgfuns:
	.long	readlba48
	.long	writelba48
	.long	putc
	.long	puts
	.long	getchar
	.zero	1004
	.local	_ZZ3itsE3out
	.comm	_ZZ3itsE3out,12,4
	.text
	.globl	its
	.type	its, @function
its:
.LFB34:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 16
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.cx
	add	ecx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR -8[ebp], 0
	mov	eax, DWORD PTR 8[ebp]
	mov	DWORD PTR -12[ebp], eax
.L184:
	mov	eax, DWORD PTR -12[ebp]
	add	eax, 9
	cmp	eax, 18
	jbe	.L183
	mov	ebx, DWORD PTR -12[ebp]
	mov	edx, 1717986919
	mov	eax, ebx
	imul	edx
	sar	edx, 2
	mov	eax, ebx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR -12[ebp], eax
	add	DWORD PTR -8[ebp], 1
	jmp	.L184
.L183:
	add	DWORD PTR -8[ebp], 1
	lea	edx, _ZZ3itsE3out@GOTOFF[ecx]
	mov	eax, DWORD PTR -8[ebp]
	add	eax, edx
	mov	BYTE PTR [eax], 0
	mov	eax, DWORD PTR 8[ebp]
	mov	DWORD PTR -12[ebp], eax
	mov	eax, DWORD PTR -8[ebp]
	sub	eax, 1
	mov	DWORD PTR -16[ebp], eax
.L186:
	cmp	DWORD PTR -16[ebp], 0
	js	.L185
	mov	ebx, DWORD PTR -12[ebp]
	mov	edx, 1717986919
	mov	eax, ebx
	imul	edx
	sar	edx, 2
	mov	eax, ebx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	sub	ebx, eax
	mov	edx, ebx
	mov	eax, edx
	lea	edx, 48[eax]
	lea	ebx, _ZZ3itsE3out@GOTOFF[ecx]
	mov	eax, DWORD PTR -16[ebp]
	add	eax, ebx
	mov	BYTE PTR [eax], dl
	mov	ebx, DWORD PTR -12[ebp]
	mov	edx, 1717986919
	mov	eax, ebx
	imul	edx
	sar	edx, 2
	mov	eax, ebx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR -12[ebp], eax
	sub	DWORD PTR -16[ebp], 1
	jmp	.L186
.L185:
	lea	eax, _ZZ3itsE3out@GOTOFF[ecx]
	add	esp, 16
	pop	ebx
	.cfi_restore 3
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE34:
	.size	its, .-its
	.local	_ZL10filenameog
	.comm	_ZL10filenameog,999,32
	.section	.rodata
.LC3:
	.string	"> "
.LC4:
	.string	"ls"
.LC5:
	.string	"help"
	.align 4
.LC6:
	.string	"Commands: ls, scancodes, help.\n"
.LC7:
	.string	"scancodes"
.LC8:
	.string	"scancode:"
.LC9:
	.string	"clear"
	.align 4
.LC10:
	.string	"                                        "
	.align 4
.LC11:
	.string	"                                        \n"
.LC12:
	.string	"cat"
.LC13:
	.string	"prgload"
.LC14:
	.string	"kload"
.LC15:
	.string	"mtest"
	.align 4
.LC16:
	.string	"Error, unknown command or filename '"
.LC17:
	.string	"'.\n"
	.text
	.globl	iloop
	.type	iloop, @function
iloop:
.LFB35:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	esi
	push	ebx
	sub	esp, 48
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
.L242:
	push	0
	lea	eax, .LC3@GOTOFF[ebx]
	push	eax
	call	puts
	add	esp, 8
	call	getstr
	mov	DWORD PTR -24[ebp], eax
	push	0
	push	32
	push	DWORD PTR -24[ebp]
	call	split_string
	add	esp, 12
	mov	DWORD PTR -28[ebp], eax
	push	10
	call	putc
	add	esp, 4
	lea	eax, .LC4@GOTOFF[ebx]
	push	eax
	push	DWORD PTR -28[ebp]
	call	strcmp
	add	esp, 8
	test	al, al
	je	.L189
	sub	esp, 4
	lea	eax, .LC0@GOTOFF[ebx]
	push	eax
	call	listfiles
	add	esp, 8
	jmp	.L242
.L189:
	lea	eax, .LC5@GOTOFF[ebx]
	push	eax
	push	DWORD PTR -28[ebp]
	call	strcmp
	add	esp, 8
	test	al, al
	je	.L191
	push	0
	lea	eax, .LC6@GOTOFF[ebx]
	push	eax
	call	puts
	add	esp, 8
	jmp	.L242
.L191:
	lea	eax, .LC7@GOTOFF[ebx]
	push	eax
	push	DWORD PTR -28[ebp]
	call	strcmp
	add	esp, 8
	test	al, al
	je	.L192
.L229:
	push	0
	lea	eax, .LC8@GOTOFF[ebx]
	push	eax
	call	puts
	add	esp, 8
	call	waitkey
	mov	BYTE PTR -49[ebp], al
	movzx	eax, BYTE PTR -49[ebp]
	and	eax, 15
	mov	BYTE PTR -50[ebp], al
	movzx	eax, BYTE PTR -49[ebp]
	shr	al, 4
	mov	BYTE PTR -51[ebp], al
	movzx	eax, BYTE PTR -51[ebp]
	cmp	eax, 15
	ja	.L193
	sal	eax, 2
	mov	eax, DWORD PTR .L195@GOTOFF[eax+ebx]
	add	eax, ebx
	notrack jmp	eax
	.section	.rodata
	.align 4
	.align 4
.L195:
	.long	.L193@GOTOFF
	.long	.L209@GOTOFF
	.long	.L208@GOTOFF
	.long	.L207@GOTOFF
	.long	.L206@GOTOFF
	.long	.L205@GOTOFF
	.long	.L204@GOTOFF
	.long	.L203@GOTOFF
	.long	.L202@GOTOFF
	.long	.L201@GOTOFF
	.long	.L200@GOTOFF
	.long	.L199@GOTOFF
	.long	.L198@GOTOFF
	.long	.L197@GOTOFF
	.long	.L196@GOTOFF
	.long	.L194@GOTOFF
	.text
.L209:
	sub	esp, 4
	push	49
	call	putc
	add	esp, 8
	jmp	.L210
.L208:
	sub	esp, 4
	push	50
	call	putc
	add	esp, 8
	jmp	.L210
.L207:
	sub	esp, 4
	push	51
	call	putc
	add	esp, 8
	jmp	.L210
.L206:
	sub	esp, 4
	push	52
	call	putc
	add	esp, 8
	jmp	.L210
.L205:
	sub	esp, 4
	push	53
	call	putc
	add	esp, 8
	jmp	.L210
.L204:
	sub	esp, 4
	push	54
	call	putc
	add	esp, 8
	jmp	.L210
.L203:
	sub	esp, 4
	push	55
	call	putc
	add	esp, 8
	jmp	.L210
.L202:
	sub	esp, 4
	push	56
	call	putc
	add	esp, 8
	jmp	.L210
.L201:
	sub	esp, 4
	push	57
	call	putc
	add	esp, 8
	jmp	.L210
.L200:
	sub	esp, 4
	push	97
	call	putc
	add	esp, 8
	jmp	.L210
.L199:
	sub	esp, 4
	push	98
	call	putc
	add	esp, 8
	jmp	.L210
.L198:
	sub	esp, 4
	push	99
	call	putc
	add	esp, 8
	jmp	.L210
.L197:
	sub	esp, 4
	push	100
	call	putc
	add	esp, 8
	jmp	.L210
.L196:
	sub	esp, 4
	push	101
	call	putc
	add	esp, 8
	jmp	.L210
.L194:
	sub	esp, 4
	push	102
	call	putc
	add	esp, 8
	jmp	.L210
.L193:
	sub	esp, 4
	push	48
	call	putc
	add	esp, 8
	nop
.L210:
	movzx	eax, BYTE PTR -50[ebp]
	cmp	eax, 15
	ja	.L211
	sal	eax, 2
	mov	eax, DWORD PTR .L213@GOTOFF[eax+ebx]
	add	eax, ebx
	notrack jmp	eax
	.section	.rodata
	.align 4
	.align 4
.L213:
	.long	.L211@GOTOFF
	.long	.L227@GOTOFF
	.long	.L226@GOTOFF
	.long	.L225@GOTOFF
	.long	.L224@GOTOFF
	.long	.L223@GOTOFF
	.long	.L222@GOTOFF
	.long	.L221@GOTOFF
	.long	.L220@GOTOFF
	.long	.L219@GOTOFF
	.long	.L218@GOTOFF
	.long	.L217@GOTOFF
	.long	.L216@GOTOFF
	.long	.L215@GOTOFF
	.long	.L214@GOTOFF
	.long	.L212@GOTOFF
	.text
.L227:
	sub	esp, 4
	push	49
	call	putc
	add	esp, 8
	jmp	.L228
.L226:
	sub	esp, 4
	push	50
	call	putc
	add	esp, 8
	jmp	.L228
.L225:
	sub	esp, 4
	push	51
	call	putc
	add	esp, 8
	jmp	.L228
.L224:
	sub	esp, 4
	push	52
	call	putc
	add	esp, 8
	jmp	.L228
.L223:
	sub	esp, 4
	push	53
	call	putc
	add	esp, 8
	jmp	.L228
.L222:
	sub	esp, 4
	push	54
	call	putc
	add	esp, 8
	jmp	.L228
.L221:
	sub	esp, 4
	push	55
	call	putc
	add	esp, 8
	jmp	.L228
.L220:
	sub	esp, 4
	push	56
	call	putc
	add	esp, 8
	jmp	.L228
.L219:
	sub	esp, 4
	push	57
	call	putc
	add	esp, 8
	jmp	.L228
.L218:
	sub	esp, 4
	push	97
	call	putc
	add	esp, 8
	jmp	.L228
.L217:
	sub	esp, 4
	push	98
	call	putc
	add	esp, 8
	jmp	.L228
.L216:
	sub	esp, 4
	push	99
	call	putc
	add	esp, 8
	jmp	.L228
.L215:
	sub	esp, 4
	push	100
	call	putc
	add	esp, 8
	jmp	.L228
.L214:
	sub	esp, 4
	push	101
	call	putc
	add	esp, 8
	jmp	.L228
.L212:
	sub	esp, 4
	push	102
	call	putc
	add	esp, 8
	jmp	.L228
.L211:
	sub	esp, 4
	push	48
	call	putc
	add	esp, 8
	nop
.L228:
	sub	esp, 4
	push	10
	call	putc
	add	esp, 8
	jmp	.L229
.L192:
	lea	eax, .LC0@GOTOFF[ebx]
	push	eax
	push	DWORD PTR -28[ebp]
	call	strcmp
	add	esp, 8
	test	al, al
	jne	.L242
	lea	eax, .LC9@GOTOFF[ebx]
	push	eax
	push	DWORD PTR -28[ebp]
	call	strcmp
	add	esp, 8
	test	al, al
	je	.L230
	mov	DWORD PTR -12[ebp], 0
.L232:
	cmp	DWORD PTR -12[ebp], 39
	jg	.L231
	push	0
	lea	eax, .LC10@GOTOFF[ebx]
	push	eax
	call	puts
	add	esp, 8
	push	0
	lea	eax, .LC11@GOTOFF[ebx]
	push	eax
	call	puts
	add	esp, 8
	add	DWORD PTR -12[ebp], 1
	jmp	.L232
.L231:
	mov	DWORD PTR x@GOTOFF[ebx], 0
	mov	DWORD PTR y@GOTOFF[ebx], 0
	jmp	.L242
.L230:
	lea	eax, .LC12@GOTOFF[ebx]
	push	eax
	push	DWORD PTR -28[ebp]
	call	strcmp
	add	esp, 8
	test	al, al
	je	.L233
	sub	esp, 4
	push	1
	push	32
	push	DWORD PTR -24[ebp]
	call	split_string
	add	esp, 16
	mov	DWORD PTR -32[ebp], eax
	lea	eax, _ZL10filebuffer@GOTOFF[ebx]
	push	eax
	push	DWORD PTR -32[ebp]
	call	file_read
	add	esp, 8
	mov	DWORD PTR -48[ebp], eax
	mov	DWORD PTR -16[ebp], 0
.L234:
	mov	eax, DWORD PTR -16[ebp]
	cmp	eax, DWORD PTR -48[ebp]
	jnb	.L242
	lea	edx, _ZL10filebuffer@GOTOFF[ebx]
	mov	eax, DWORD PTR -16[ebp]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	movzx	eax, al
	sub	esp, 4
	push	eax
	call	putc
	add	esp, 8
	add	DWORD PTR -16[ebp], 1
	jmp	.L234
.L233:
	lea	eax, .LC13@GOTOFF[ebx]
	push	eax
	push	DWORD PTR -28[ebp]
	call	strcmp
	add	esp, 8
	test	al, al
	je	.L235
	lea	eax, _ZL9prgbuffer@GOTOFF[ebx]
	sub	esp, 4
	push	eax
	call	its
	add	esp, 8
	push	0
	push	eax
	call	puts
	add	esp, 8
	sub	esp, 4
	push	10
	call	putc
	add	esp, 8
	jmp	.L242
.L235:
	lea	eax, .LC14@GOTOFF[ebx]
	push	eax
	push	DWORD PTR -28[ebp]
	call	strcmp
	add	esp, 8
	test	al, al
	je	.L236
	lea	eax, iloop@GOTOFF[ebx]
	sub	esp, 4
	push	eax
	call	its
	add	esp, 8
	push	0
	push	eax
	call	puts
	add	esp, 8
	sub	esp, 4
	push	10
	call	putc
	add	esp, 8
	jmp	.L242
.L236:
	mov	eax, DWORD PTR -28[ebp]
	movzx	eax, BYTE PTR [eax]
	cmp	al, 46
	jne	.L237
	mov	eax, DWORD PTR -28[ebp]
	add	eax, 1
	movzx	eax, BYTE PTR [eax]
	cmp	al, 47
	jne	.L237
	sub	esp, 4
	push	0
	push	32
	push	DWORD PTR -24[ebp]
	call	split_string
	add	esp, 16
	mov	DWORD PTR -32[ebp], eax
	mov	DWORD PTR -20[ebp], 0
.L239:
	push	0
	push	DWORD PTR -28[ebp]
	call	strlen
	add	esp, 8
	sub	eax, 2
	cmp	DWORD PTR -20[ebp], eax
	setl	al
	test	al, al
	je	.L238
	mov	eax, DWORD PTR -20[ebp]
	lea	edx, 2[eax]
	mov	eax, DWORD PTR -28[ebp]
	add	eax, edx
	mov	ecx, DWORD PTR -20[ebp]
	mov	edx, DWORD PTR -32[ebp]
	add	edx, ecx
	movzx	eax, BYTE PTR [eax]
	mov	BYTE PTR [edx], al
	add	DWORD PTR -20[ebp], 1
	jmp	.L239
.L238:
	push	0
	push	DWORD PTR -28[ebp]
	call	strlen
	add	esp, 8
	lea	edx, -2[eax]
	mov	eax, DWORD PTR -32[ebp]
	add	eax, edx
	mov	BYTE PTR [eax], 0
	lea	eax, _ZL9prgbuffer@GOTOFF[ebx]
	push	eax
	push	DWORD PTR -32[ebp]
	call	file_read
	add	esp, 8
	mov	DWORD PTR -36[ebp], eax
	lea	eax, _ZL9prgbuffer@GOTOFF[ebx]
	mov	DWORD PTR -40[ebp], eax
	lea	eax, iloop@GOTOFF[ebx]
#APP
# 427 "kernel.cpp" 1
	mov eax, eax
# 0 "" 2
# 428 "kernel.cpp" 1
	push eax
# 0 "" 2
#NO_APP
	lea	eax, _ZL7prgfuns@GOTOFF[ebx]
#APP
# 429 "kernel.cpp" 1
	mov eax, eax
# 0 "" 2
# 430 "kernel.cpp" 1
	push eax
# 0 "" 2
#NO_APP
	mov	eax, DWORD PTR -40[ebp]
	call	eax
	jmp	.L190
.L237:
	sub	esp, 8
	lea	eax, .LC15@GOTOFF[ebx]
	push	eax
	push	DWORD PTR -28[ebp]
	call	strcmp
	add	esp, 16
	test	al, al
	je	.L240
	sub	esp, 8
	push	173
	push	100
	call	_Z4outbth
	add	esp, 16
	sub	esp, 8
	push	168
	push	100
	call	_Z4outbth
	add	esp, 16
	mov	DWORD PTR -44[ebp], 1000
.L241:
	mov	DWORD PTR x@GOTOFF[ebx], 0
	mov	DWORD PTR y@GOTOFF[ebx], 10
	mov	ecx, DWORD PTR lfb@GOTOFF[ebx]
	mov	eax, DWORD PTR defx@GOTOFF[ebx]
	mov	edx, 0
	div	DWORD PTR -44[ebp]
	mov	esi, eax
	mov	eax, DWORD PTR defy@GOTOFF[ebx]
	mov	edx, 0
	div	DWORD PTR -44[ebp]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 4
	add	eax, esi
	sal	eax, 3
	add	eax, ecx
	mov	DWORD PTR [eax], 81
	mov	ecx, DWORD PTR lfb@GOTOFF[ebx]
	mov	eax, DWORD PTR defx@GOTOFF[ebx]
	mov	edx, 0
	div	DWORD PTR -44[ebp]
	mov	esi, eax
	mov	eax, DWORD PTR defy@GOTOFF[ebx]
	mov	edx, 0
	div	DWORD PTR -44[ebp]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 4
	add	eax, esi
	sal	eax, 3
	add	eax, 4
	add	eax, ecx
	mov	DWORD PTR [eax], 15
	sub	esp, 12
	push	0
	call	mouse_handler
	add	esp, 16
	jmp	.L241
.L240:
	sub	esp, 8
	push	0
	lea	eax, .LC16@GOTOFF[ebx]
	push	eax
	call	puts
	add	esp, 16
	sub	esp, 8
	push	0
	push	DWORD PTR -28[ebp]
	call	puts
	add	esp, 16
	sub	esp, 8
	push	0
	lea	eax, .LC17@GOTOFF[ebx]
	push	eax
	call	puts
	add	esp, 16
.L190:
	jmp	.L242
	.cfi_endproc
.LFE35:
	.size	iloop, .-iloop
	.globl	lfb2
	.bss
	.align 32
	.type	lfb2, @object
	.size	lfb2, 1923200
lfb2:
	.zero	1923200
	.text
	.globl	loader_main
	.type	loader_main, @function
loader_main:
.LFB36:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 20
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	call	set_idt
	call	mouse_install
	mov	eax, DWORD PTR 8[ebp]
	add	eax, 88
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR lfb@GOTOFF[ebx], eax
	mov	eax, DWORD PTR lfb@GOTOFF[ebx]
	mov	DWORD PTR [eax], -1
	mov	eax, DWORD PTR lfb@GOTOFF[ebx]
	add	eax, 1919996
	mov	DWORD PTR [eax], -1
	sub	esp, 8
	push	173
	push	100
	call	_Z4outbth
	add	esp, 16
	sub	esp, 8
	push	168
	push	100
	call	_Z4outbth
	add	esp, 16
	mov	DWORD PTR -12[ebp], 1
.L246:
	mov	DWORD PTR -16[ebp], 367
	sub	esp, 8
	push	31
	push	DWORD PTR -16[ebp]
	call	retbit
	add	esp, 16
	cmp	eax, 1
	sete	al
	test	al, al
	je	.L244
	mov	eax, DWORD PTR lfb@GOTOFF[ebx]
	add	eax, 400
	mov	DWORD PTR [eax], -1
	jmp	.L246
.L244:
	mov	eax, DWORD PTR lfb@GOTOFF[ebx]
	add	eax, 400
	mov	DWORD PTR [eax], 0
	jmp	.L246
	.cfi_endproc
.LFE36:
	.size	loader_main, .-loader_main
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB37:
	.cfi_startproc
	mov	eax, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE37:
	.section	.text.__x86.get_pc_thunk.cx,"axG",@progbits,__x86.get_pc_thunk.cx,comdat
	.globl	__x86.get_pc_thunk.cx
	.hidden	__x86.get_pc_thunk.cx
	.type	__x86.get_pc_thunk.cx, @function
__x86.get_pc_thunk.cx:
.LFB38:
	.cfi_startproc
	mov	ecx, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE38:
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB39:
	.cfi_startproc
	mov	ebx, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE39:
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 4
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 4
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 4
4:
