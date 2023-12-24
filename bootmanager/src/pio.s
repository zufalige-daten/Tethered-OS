	.file	"pio.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.align 16
	.globl	read_lba48
	.type	read_lba48, @function
read_lba48:
.LFB4:
.LM1:
.LVL0:
.LM2:
.LM3:
	push	ebp
.LCFI0:
.LBB60:
.LBB61:
.LM4:
	xor	eax, eax
.LBE61:
.LBE60:
.LM5:
	mov	ebp, esp
.LCFI1:
	push	esi
	push	ebx
	sub	esp, 8
.LCFI2:
.LM6:
	mov	ebx, DWORD PTR [ebp+8]
	mov	ecx, ebx
.LM7:
	lea	edx, [ebx+1]
.LVL1:
.LBB63:
.LBB62:
.LM8:
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL2:
/NO_APP
.LBE62:
.LBE63:
.LM9:
.LBB64:
.LBB65:
.LM10:
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL3:
/NO_APP
.LBE65:
.LBE64:
.LM11:
.LM12:
	lea	edx, [ebx+2]
.LVL4:
.LBB66:
.LBB67:
.LM13:
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL5:
/NO_APP
.LBE67:
.LBE66:
.LM14:
.LBB68:
.LBB69:
.LM15:
	mov	eax, 1
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL6:
/NO_APP
.LBE69:
.LBE68:
.LM16:
.LM17:
	mov	edx, DWORD PTR [ebp+20]
	mov	eax, DWORD PTR [ebp+16]
.LM18:
	lea	esi, [ebx+3]
.LVL7:
.LBB70:
.LBB71:
.LM19:
.LBE71:
.LBE70:
.LM20:
	shrd	eax, edx, 24
.LBB74:
.LBB72:
.LM21:
	mov	edx, esi
.LBE72:
.LBE74:
.LM22:
	mov	DWORD PTR [ebp-16], eax
.LBB75:
.LBB73:
.LM23:
	movzx	eax, BYTE PTR [ebp-16]
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL8:
/NO_APP
.LBE73:
.LBE75:
.LM24:
.LBB76:
.LBB77:
.LM25:
	movzx	eax, BYTE PTR [ebp+16]
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL9:
/NO_APP
.LBE77:
.LBE76:
.LM26:
.LM27:
	lea	esi, [ebx+4]
.LVL10:
.LBB78:
.LBB79:
.LM28:
.LBE79:
.LBE78:
.LM29:
	mov	eax, DWORD PTR [ebp+20]
.LBB81:
.LBB80:
.LM30:
	mov	edx, esi
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL11:
/NO_APP
.LBE80:
.LBE81:
.LM31:
.LBB82:
.LBB83:
.LM32:
.LBE83:
.LBE82:
.LM33:
	mov	edx, DWORD PTR [ebp+20]
	mov	eax, DWORD PTR [ebp+16]
	shrd	eax, edx, 8
.LBB86:
.LBB84:
.LM34:
	mov	edx, esi
.LBE84:
.LBE86:
.LM35:
	mov	DWORD PTR [ebp-16], eax
.LBB87:
.LBB85:
.LM36:
	movzx	eax, BYTE PTR [ebp-16]
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL12:
/NO_APP
.LBE85:
.LBE87:
.LM37:
.LM38:
	mov	eax, DWORD PTR [ebp+20]
.LM39:
	lea	esi, [ebx+5]
.LVL13:
.LBB88:
.LBB89:
.LM40:
	mov	edx, esi
.LBE89:
.LBE88:
.LM41:
	shr	eax, 8
.LBB91:
.LBB90:
.LM42:
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL14:
/NO_APP
.LBE90:
.LBE91:
.LM43:
.LBB92:
.LBB93:
.LM44:
.LBE93:
.LBE92:
.LM45:
	mov	edx, DWORD PTR [ebp+20]
	mov	eax, DWORD PTR [ebp+16]
	shrd	eax, edx, 16
	shr	edx, 16
	mov	DWORD PTR [ebp-16], eax
.LBB96:
.LBB94:
.LM46:
	movzx	eax, BYTE PTR [ebp-16]
.LBE94:
.LBE96:
.LM47:
	mov	DWORD PTR [ebp-12], edx
.LBB97:
.LBB95:
.LM48:
	mov	edx, esi
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL15:
/NO_APP
.LBE95:
.LBE97:
.LM49:
.LBB98:
.LBB99:
.LM50:
.LBE99:
.LBE98:
.LM51:
	movzx	eax, BYTE PTR [ebp+12]
.LM52:
	lea	edx, [ebx+6]
.LM53:
	sal	eax, 4
	or	eax, 64
.LBB101:
.LBB100:
.LM54:
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL16:
/NO_APP
.LBE100:
.LBE101:
.LM55:
.LBB102:
.LBB103:
.LM56:
	mov	eax, 36
.LBE103:
.LBE102:
.LM57:
	lea	edx, [ebx+7]
.LVL17:
.LBB105:
.LBB104:
.LM58:
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL18:
/NO_APP
.LBE104:
.LBE105:
.LM59:
	.align 16
.L2:
.LM60:
.LBB106:
.LBB107:
.LM61:
.LM62:
/APP
/  15 "../include/x86_64/x86io.h" 1
	inb al, dx
.LVL19:
.LM63:
/NO_APP
.LBE107:
.LBE106:
.LM64:
	test	al, 8
	je	.L2
	mov	ebx, DWORD PTR [ebp+24]
	mov	edx, ecx
	lea	esi, [ebx+512]
	.align 16
.L3:
.LBB108:
.LM65:
.LVL20:
.LBB109:
.LBB110:
.LM66:
.LM67:
/APP
/  21 "../include/x86_64/x86io.h" 1
	inw ax, dx
.LVL21:
.LM68:
/NO_APP
.LBE110:
.LBE109:
.LM69:
.LM70:
	mov	WORD PTR [ebx], ax
.LM71:
.LM72:
	add	ebx, 2
	cmp	ebx, esi
	jne	.L3
.LBE108:
.LM73:
	add	esp, 8
	pop	ebx
.LCFI3:
	pop	esi
.LCFI4:
	pop	ebp
.LCFI5:
	ret
.LFE4:
	.size	read_lba48, .-read_lba48
	.align 16
	.globl	write_lba48
	.type	write_lba48, @function
write_lba48:
.LFB5:
.LM74:
.LVL22:
.LM75:
.LM76:
	push	ebp
.LCFI6:
.LBB111:
.LBB112:
.LM77:
	xor	eax, eax
.LBE112:
.LBE111:
.LM78:
	mov	ebp, esp
.LCFI7:
	push	esi
	push	ebx
	sub	esp, 8
.LCFI8:
.LM79:
	mov	ebx, DWORD PTR [ebp+8]
	mov	ecx, ebx
.LM80:
	lea	edx, [ebx+1]
.LVL23:
.LBB114:
.LBB113:
.LM81:
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL24:
/NO_APP
.LBE113:
.LBE114:
.LM82:
.LBB115:
.LBB116:
.LM83:
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL25:
/NO_APP
.LBE116:
.LBE115:
.LM84:
.LM85:
	lea	edx, [ebx+2]
.LVL26:
.LBB117:
.LBB118:
.LM86:
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL27:
/NO_APP
.LBE118:
.LBE117:
.LM87:
.LBB119:
.LBB120:
.LM88:
	mov	eax, 1
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL28:
/NO_APP
.LBE120:
.LBE119:
.LM89:
.LM90:
	mov	edx, DWORD PTR [ebp+20]
	mov	eax, DWORD PTR [ebp+16]
.LM91:
	lea	esi, [ebx+3]
.LVL29:
.LBB121:
.LBB122:
.LM92:
.LBE122:
.LBE121:
.LM93:
	shrd	eax, edx, 24
.LBB125:
.LBB123:
.LM94:
	mov	edx, esi
.LBE123:
.LBE125:
.LM95:
	mov	DWORD PTR [ebp-16], eax
.LBB126:
.LBB124:
.LM96:
	movzx	eax, BYTE PTR [ebp-16]
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL30:
/NO_APP
.LBE124:
.LBE126:
.LM97:
.LBB127:
.LBB128:
.LM98:
	movzx	eax, BYTE PTR [ebp+16]
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL31:
/NO_APP
.LBE128:
.LBE127:
.LM99:
.LM100:
	lea	esi, [ebx+4]
.LVL32:
.LBB129:
.LBB130:
.LM101:
.LBE130:
.LBE129:
.LM102:
	mov	eax, DWORD PTR [ebp+20]
.LBB132:
.LBB131:
.LM103:
	mov	edx, esi
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL33:
/NO_APP
.LBE131:
.LBE132:
.LM104:
.LBB133:
.LBB134:
.LM105:
.LBE134:
.LBE133:
.LM106:
	mov	edx, DWORD PTR [ebp+20]
	mov	eax, DWORD PTR [ebp+16]
	shrd	eax, edx, 8
.LBB137:
.LBB135:
.LM107:
	mov	edx, esi
.LBE135:
.LBE137:
.LM108:
	mov	DWORD PTR [ebp-16], eax
.LBB138:
.LBB136:
.LM109:
	movzx	eax, BYTE PTR [ebp-16]
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL34:
/NO_APP
.LBE136:
.LBE138:
.LM110:
.LM111:
	mov	eax, DWORD PTR [ebp+20]
.LM112:
	lea	esi, [ebx+5]
.LVL35:
.LBB139:
.LBB140:
.LM113:
	mov	edx, esi
.LBE140:
.LBE139:
.LM114:
	shr	eax, 8
.LBB142:
.LBB141:
.LM115:
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL36:
/NO_APP
.LBE141:
.LBE142:
.LM116:
.LBB143:
.LBB144:
.LM117:
.LBE144:
.LBE143:
.LM118:
	mov	edx, DWORD PTR [ebp+20]
	mov	eax, DWORD PTR [ebp+16]
	shrd	eax, edx, 16
	shr	edx, 16
	mov	DWORD PTR [ebp-16], eax
.LBB147:
.LBB145:
.LM119:
	movzx	eax, BYTE PTR [ebp-16]
.LBE145:
.LBE147:
.LM120:
	mov	DWORD PTR [ebp-12], edx
.LBB148:
.LBB146:
.LM121:
	mov	edx, esi
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL37:
/NO_APP
.LBE146:
.LBE148:
.LM122:
.LBB149:
.LBB150:
.LM123:
.LBE150:
.LBE149:
.LM124:
	movzx	eax, BYTE PTR [ebp+12]
.LM125:
	lea	edx, [ebx+6]
.LM126:
	sal	eax, 4
	or	eax, 64
.LBB152:
.LBB151:
.LM127:
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL38:
/NO_APP
.LBE151:
.LBE152:
.LM128:
.LBB153:
.LBB154:
.LM129:
	mov	eax, 52
.LBE154:
.LBE153:
.LM130:
	lea	edx, [ebx+7]
.LVL39:
.LBB156:
.LBB155:
.LM131:
/APP
/  6 "../include/x86_64/x86io.h" 1
	outb dx, al
.LVL40:
/NO_APP
.LBE155:
.LBE156:
.LM132:
	.align 16
.L10:
.LM133:
.LBB157:
.LBB158:
.LM134:
.LM135:
/APP
/  15 "../include/x86_64/x86io.h" 1
	inb al, dx
.LVL41:
.LM136:
/NO_APP
.LBE158:
.LBE157:
.LM137:
	test	al, 8
	je	.L10
	mov	ebx, DWORD PTR [ebp+24]
	mov	edx, ecx
	lea	esi, [ebx+512]
	.align 16
.L11:
.LBB159:
.LM138:
.LVL42:
.LM139:
.LBB160:
.LBB161:
.LM140:
	movzx	eax, WORD PTR [ebx]
/APP
/  10 "../include/x86_64/x86io.h" 1
	outw dx, ax
.LVL43:
/NO_APP
.LBE161:
.LBE160:
.LM141:
.LM142:
	add	ebx, 2
.LVL44:
	cmp	ebx, esi
	jne	.L11
.LBE159:
.LM143:
	add	esp, 8
	pop	ebx
.LCFI9:
	pop	esi
.LCFI10:
	pop	ebp
.LCFI11:
	ret
.LFE5:
	.size	write_lba48, .-write_lba48
	.section	.debug_frame,"",@progbits
.Lframe0:
	.long	.LECIE0-.LSCIE0
.LSCIE0:
	.long	0xffffffff
	.byte	0x3
	.string	""
	.byte	0x1
	.byte	0x7c
	.byte	0x8
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.byte	0x88
	.byte	0x1
	.align 4
.LECIE0:
.LSFDE0:
	.long	.LEFDE0-.LASFDE0
.LASFDE0:
	.long	.Lframe0
	.long	.LFB4
	.long	.LFE4-.LFB4
	.byte	0x4
	.long	.LCFI0-.LFB4
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0x86
	.byte	0x3
	.byte	0x83
	.byte	0x4
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xc3
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xc6
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xc5
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.align 4
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB5
	.long	.LFE5-.LFB5
	.byte	0x4
	.long	.LCFI6-.LFB5
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0x86
	.byte	0x3
	.byte	0x83
	.byte	0x4
	.byte	0x4
	.long	.LCFI9-.LCFI8
	.byte	0xc3
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xc6
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0xc5
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.align 4
.LEFDE2:
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x75b
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.byte	0xf
	.string	"GNU C17 13.2.0 -m32 -masm=intel -mtune=generic -march=pentiumpro -g -O2 -fno-stack-protector -ffreestanding -fno-exceptions --param=min-pagesize=0"
	.byte	0x1d
	.string	"pio.c"
	.string	"/home/gunrajmann/Desktop/Tethered OS/bootmanager/src"
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.byte	0x3
	.byte	0x1
	.byte	0x6
	.string	"signed char"
	.byte	0x3
	.byte	0x2
	.byte	0x5
	.string	"short int"
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.string	"long int"
	.byte	0x3
	.byte	0x8
	.byte	0x5
	.string	"long long int"
	.byte	0x9
	.string	"uint8_t"
	.byte	0x2e
	.byte	0x18
	.long	0x130
	.byte	0x3
	.byte	0x1
	.byte	0x8
	.string	"unsigned char"
	.byte	0x9
	.string	"uint16_t"
	.byte	0x31
	.byte	0x19
	.long	0x151
	.byte	0x3
	.byte	0x2
	.byte	0x7
	.string	"short unsigned int"
	.byte	0x3
	.byte	0x4
	.byte	0x7
	.string	"long unsigned int"
	.byte	0x9
	.string	"uint64_t"
	.byte	0x37
	.byte	0x19
	.long	0x18c
	.byte	0x3
	.byte	0x8
	.byte	0x7
	.string	"long long unsigned int"
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.byte	0x4
	.byte	0x7
	.string	"unsigned int"
	.byte	0xb
	.string	"write_lba48"
	.byte	0x1a
	.long	.LFB5
	.long	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.long	0x443
	.byte	0xc
	.long	.LASF0
	.byte	0x1a
	.byte	0x1b
	.long	0x141
	.byte	0x2
	.byte	0x91
	.byte	0
	.byte	0x5
	.string	"drive"
	.byte	0x1a
	.byte	0x34
	.long	0x121
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x5
	.string	"lba"
	.byte	0x1a
	.byte	0x44
	.long	0x17c
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x5
	.string	"buffer"
	.byte	0x1a
	.byte	0x4f
	.long	0x443
	.byte	0x2
	.byte	0x91
	.byte	0x10
	.byte	0x10
	.string	"tmpword"
	.byte	0x1
	.byte	0x28
	.byte	0xb
	.long	0x141
	.long	.LLST34
	.byte	0xd
	.long	.LBB159
	.long	.LBE159-.LBB159
	.long	0x268
	.byte	0x7
	.string	"index"
	.byte	0x1
	.byte	0x29
	.byte	0xa
	.long	0x1a6
	.byte	0x8
	.long	0x714
	.long	.LBB160
	.long	.LBE160-.LBB160
	.byte	0x2b
	.byte	0x3
	.byte	0x1
	.long	0x72e
	.long	.LLST68
	.byte	0x1
	.long	0x722
	.long	.LLST69
	.byte	0
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB111
	.long	.LLRL35
	.byte	0x1b
	.long	0x28d
	.byte	0x1
	.long	0x751
	.long	.LLST36
	.byte	0x1
	.long	0x745
	.long	.LLST37
	.byte	0
	.byte	0x4
	.long	0x73b
	.long	.LBB115
	.long	.LBE115-.LBB115
	.byte	0x1c
	.long	0x2b2
	.byte	0x1
	.long	0x751
	.long	.LLST38
	.byte	0x1
	.long	0x745
	.long	.LLST39
	.byte	0
	.byte	0x4
	.long	0x73b
	.long	.LBB117
	.long	.LBE117-.LBB117
	.byte	0x1d
	.long	0x2d7
	.byte	0x1
	.long	0x751
	.long	.LLST40
	.byte	0x1
	.long	0x745
	.long	.LLST41
	.byte	0
	.byte	0x4
	.long	0x73b
	.long	.LBB119
	.long	.LBE119-.LBB119
	.byte	0x1e
	.long	0x2fc
	.byte	0x1
	.long	0x751
	.long	.LLST42
	.byte	0x1
	.long	0x745
	.long	.LLST43
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB121
	.long	.LLRL44
	.byte	0x1f
	.long	0x321
	.byte	0x1
	.long	0x751
	.long	.LLST45
	.byte	0x1
	.long	0x745
	.long	.LLST46
	.byte	0
	.byte	0x4
	.long	0x73b
	.long	.LBB127
	.long	.LBE127-.LBB127
	.byte	0x20
	.long	0x346
	.byte	0x1
	.long	0x751
	.long	.LLST47
	.byte	0x1
	.long	0x745
	.long	.LLST48
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB129
	.long	.LLRL49
	.byte	0x21
	.long	0x36b
	.byte	0x1
	.long	0x751
	.long	.LLST50
	.byte	0x1
	.long	0x745
	.long	.LLST51
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB133
	.long	.LLRL52
	.byte	0x22
	.long	0x390
	.byte	0x1
	.long	0x751
	.long	.LLST53
	.byte	0x1
	.long	0x745
	.long	.LLST54
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB139
	.long	.LLRL55
	.byte	0x23
	.long	0x3b5
	.byte	0x1
	.long	0x751
	.long	.LLST56
	.byte	0x1
	.long	0x745
	.long	.LLST57
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB143
	.long	.LLRL58
	.byte	0x24
	.long	0x3da
	.byte	0x1
	.long	0x751
	.long	.LLST59
	.byte	0x1
	.long	0x745
	.long	.LLST60
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB149
	.long	.LLRL61
	.byte	0x25
	.long	0x3ff
	.byte	0x1
	.long	0x751
	.long	.LLST62
	.byte	0x1
	.long	0x745
	.long	.LLST63
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB153
	.long	.LLRL64
	.byte	0x26
	.long	0x424
	.byte	0x1
	.long	0x751
	.long	.LLST65
	.byte	0x1
	.long	0x745
	.long	.LLST66
	.byte	0
	.byte	0x8
	.long	0x6ec
	.long	.LBB157
	.long	.LBE157-.LBB157
	.byte	0x27
	.byte	0xa
	.byte	0x1
	.long	0x6fb
	.long	.LLST67
	.byte	0xa
	.long	0x707
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x4
	.byte	0xb
	.string	"read_lba48"
	.byte	0x5
	.long	.LFB4
	.long	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.long	0x6c4
	.byte	0xc
	.long	.LASF0
	.byte	0x5
	.byte	0x1a
	.long	0x141
	.byte	0x2
	.byte	0x91
	.byte	0
	.byte	0x5
	.string	"drive"
	.byte	0x5
	.byte	0x33
	.long	0x121
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x5
	.string	"lba"
	.byte	0x5
	.byte	0x43
	.long	0x17c
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x5
	.string	"buffer"
	.byte	0x5
	.byte	0x4e
	.long	0x443
	.byte	0x2
	.byte	0x91
	.byte	0x10
	.byte	0x12
	.string	"tmpword"
	.byte	0x1
	.byte	0x13
	.byte	0xb
	.long	0x141
	.byte	0x1
	.byte	0x50
	.byte	0xd
	.long	.LBB108
	.long	.LBE108-.LBB108
	.long	0x4e9
	.byte	0x7
	.string	"index"
	.byte	0x1
	.byte	0x14
	.byte	0xa
	.long	0x1a6
	.byte	0x8
	.long	0x6c4
	.long	.LBB109
	.long	.LBE109-.LBB109
	.byte	0x15
	.byte	0xd
	.byte	0x1
	.long	0x6d3
	.long	.LLST33
	.byte	0xa
	.long	0x6df
	.byte	0
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB60
	.long	.LLRL0
	.byte	0x6
	.long	0x50e
	.byte	0x1
	.long	0x751
	.long	.LLST1
	.byte	0x1
	.long	0x745
	.long	.LLST2
	.byte	0
	.byte	0x4
	.long	0x73b
	.long	.LBB64
	.long	.LBE64-.LBB64
	.byte	0x7
	.long	0x533
	.byte	0x1
	.long	0x751
	.long	.LLST3
	.byte	0x1
	.long	0x745
	.long	.LLST4
	.byte	0
	.byte	0x4
	.long	0x73b
	.long	.LBB66
	.long	.LBE66-.LBB66
	.byte	0x8
	.long	0x558
	.byte	0x1
	.long	0x751
	.long	.LLST5
	.byte	0x1
	.long	0x745
	.long	.LLST6
	.byte	0
	.byte	0x4
	.long	0x73b
	.long	.LBB68
	.long	.LBE68-.LBB68
	.byte	0x9
	.long	0x57d
	.byte	0x1
	.long	0x751
	.long	.LLST7
	.byte	0x1
	.long	0x745
	.long	.LLST8
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB70
	.long	.LLRL9
	.byte	0xa
	.long	0x5a2
	.byte	0x1
	.long	0x751
	.long	.LLST10
	.byte	0x1
	.long	0x745
	.long	.LLST11
	.byte	0
	.byte	0x4
	.long	0x73b
	.long	.LBB76
	.long	.LBE76-.LBB76
	.byte	0xb
	.long	0x5c7
	.byte	0x1
	.long	0x751
	.long	.LLST12
	.byte	0x1
	.long	0x745
	.long	.LLST13
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB78
	.long	.LLRL14
	.byte	0xc
	.long	0x5ec
	.byte	0x1
	.long	0x751
	.long	.LLST15
	.byte	0x1
	.long	0x745
	.long	.LLST16
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB82
	.long	.LLRL17
	.byte	0xd
	.long	0x611
	.byte	0x1
	.long	0x751
	.long	.LLST18
	.byte	0x1
	.long	0x745
	.long	.LLST19
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB88
	.long	.LLRL20
	.byte	0xe
	.long	0x636
	.byte	0x1
	.long	0x751
	.long	.LLST21
	.byte	0x1
	.long	0x745
	.long	.LLST22
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB92
	.long	.LLRL23
	.byte	0xf
	.long	0x65b
	.byte	0x1
	.long	0x751
	.long	.LLST24
	.byte	0x1
	.long	0x745
	.long	.LLST25
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB98
	.long	.LLRL26
	.byte	0x10
	.long	0x680
	.byte	0x1
	.long	0x751
	.long	.LLST27
	.byte	0x1
	.long	0x745
	.long	.LLST28
	.byte	0
	.byte	0x2
	.long	0x73b
	.long	.LBB102
	.long	.LLRL29
	.byte	0x11
	.long	0x6a5
	.byte	0x1
	.long	0x751
	.long	.LLST30
	.byte	0x1
	.long	0x745
	.long	.LLST31
	.byte	0
	.byte	0x8
	.long	0x6ec
	.long	.LBB106
	.long	.LBE106-.LBB106
	.byte	0x12
	.byte	0xa
	.byte	0x1
	.long	0x6fb
	.long	.LLST32
	.byte	0xa
	.long	0x707
	.byte	0
	.byte	0
	.byte	0xe
	.string	"inw"
	.byte	0x13
	.byte	0x18
	.long	0x141
	.long	0x6ec
	.byte	0x6
	.string	"port"
	.byte	0x13
	.byte	0x25
	.long	0x141
	.byte	0x7
	.string	"ret"
	.byte	0x2
	.byte	0x14
	.byte	0xb
	.long	0x141
	.byte	0
	.byte	0xe
	.string	"inb"
	.byte	0xd
	.byte	0x17
	.long	0x121
	.long	0x714
	.byte	0x6
	.string	"port"
	.byte	0xd
	.byte	0x24
	.long	0x141
	.byte	0x7
	.string	"ret"
	.byte	0x2
	.byte	0xe
	.byte	0xa
	.long	0x121
	.byte	0
	.byte	0x13
	.string	"outw"
	.byte	0x2
	.byte	0x9
	.byte	0x14
	.byte	0x3
	.long	0x73b
	.byte	0x6
	.string	"port"
	.byte	0x9
	.byte	0x22
	.long	0x141
	.byte	0x6
	.string	"data"
	.byte	0x9
	.byte	0x31
	.long	0x141
	.byte	0
	.byte	0x14
	.string	"outb"
	.byte	0x2
	.byte	0x5
	.byte	0x14
	.byte	0x3
	.byte	0x6
	.string	"port"
	.byte	0x5
	.byte	0x22
	.long	0x141
	.byte	0x6
	.string	"data"
	.byte	0x5
	.byte	0x30
	.long	0x121
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0x21
	.byte	0x1
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0x21
	.byte	0x2
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0x21
	.byte	0x1
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0x21
	.byte	0x2
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0x21
	.byte	0x1
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x6
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0x21
	.byte	0x3
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0x8
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0x1b
	.byte	0x8
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.long	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.value	0x5
	.byte	0x4
	.byte	0
	.long	0
.Ldebug_loc0:
.LLST34:
	.byte	0x7
	.long	.LVL42
	.long	.LVL44
	.byte	0x2
	.byte	0x73
	.byte	0
	.byte	0x7
	.long	.LVL44
	.long	.LFE5
	.byte	0x1
	.byte	0x50
	.byte	0
.LLST68:
	.byte	0x7
	.long	.LVL42
	.long	.LVL43
	.byte	0x2
	.byte	0x73
	.byte	0
	.byte	0
.LLST69:
	.byte	0x7
	.long	.LVL42
	.long	.LVL43
	.byte	0x1
	.byte	0x52
	.byte	0
.LLST36:
	.byte	0x7
	.long	.LVL23
	.long	.LVL24
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST37:
	.byte	0x7
	.long	.LVL23
	.long	.LVL24
	.byte	0x1
	.byte	0x52
	.byte	0
.LLST38:
	.byte	0x7
	.long	.LVL24
	.long	.LVL25
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST39:
	.byte	0x7
	.long	.LVL24
	.long	.LVL25
	.byte	0x1
	.byte	0x52
	.byte	0
.LLST40:
	.byte	0x7
	.long	.LVL26
	.long	.LVL27
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST41:
	.byte	0x7
	.long	.LVL26
	.long	.LVL27
	.byte	0x1
	.byte	0x52
	.byte	0
.LLST42:
	.byte	0x7
	.long	.LVL27
	.long	.LVL28
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST43:
	.byte	0x7
	.long	.LVL27
	.long	.LVL28
	.byte	0x1
	.byte	0x52
	.byte	0
.LLST45:
	.byte	0x7
	.long	.LVL29
	.long	.LVL30
	.byte	0x2
	.byte	0x91
	.byte	0xb
	.byte	0
.LLST46:
	.byte	0x7
	.long	.LVL29
	.long	.LVL30
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST47:
	.byte	0x7
	.long	.LVL30
	.long	.LVL31
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0
.LLST48:
	.byte	0x7
	.long	.LVL30
	.long	.LVL31
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST50:
	.byte	0x7
	.long	.LVL32
	.long	.LVL33
	.byte	0x2
	.byte	0x91
	.byte	0xc
	.byte	0
.LLST51:
	.byte	0x7
	.long	.LVL32
	.long	.LVL33
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST53:
	.byte	0x7
	.long	.LVL33
	.long	.LVL34
	.byte	0x2
	.byte	0x91
	.byte	0x9
	.byte	0
.LLST54:
	.byte	0x7
	.long	.LVL33
	.long	.LVL34
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST56:
	.byte	0x7
	.long	.LVL35
	.long	.LVL36
	.byte	0x2
	.byte	0x91
	.byte	0xd
	.byte	0
.LLST57:
	.byte	0x7
	.long	.LVL35
	.long	.LVL36
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST59:
	.byte	0x7
	.long	.LVL36
	.long	.LVL37
	.byte	0x2
	.byte	0x91
	.byte	0xa
	.byte	0
.LLST60:
	.byte	0x7
	.long	.LVL36
	.long	.LVL37
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST62:
	.byte	0x7
	.long	.LVL37
	.long	.LVL38
	.byte	0xa
	.byte	0x91
	.byte	0x4
	.byte	0x94
	.byte	0x1
	.byte	0x34
	.byte	0x24
	.byte	0x8
	.byte	0x40
	.byte	0x21
	.byte	0x9f
	.byte	0
.LLST63:
	.byte	0x7
	.long	.LVL37
	.long	.LVL38
	.byte	0x3
	.byte	0x71
	.byte	0x6
	.byte	0x9f
	.byte	0
.LLST65:
	.byte	0x7
	.long	.LVL39
	.long	.LVL40
	.byte	0x3
	.byte	0x8
	.byte	0x34
	.byte	0x9f
	.byte	0
.LLST66:
	.byte	0x7
	.long	.LVL39
	.long	.LVL40
	.byte	0x1
	.byte	0x52
	.byte	0
.LLST67:
	.byte	0x7
	.long	.LVL40
	.long	.LVL41
	.byte	0x1
	.byte	0x52
	.byte	0
.LLST33:
	.byte	0x7
	.long	.LVL20
	.long	.LVL21
	.byte	0x1
	.byte	0x52
	.byte	0
.LLST1:
	.byte	0x7
	.long	.LVL1
	.long	.LVL2
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x7
	.long	.LVL1
	.long	.LVL2
	.byte	0x1
	.byte	0x52
	.byte	0
.LLST3:
	.byte	0x7
	.long	.LVL2
	.long	.LVL3
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x7
	.long	.LVL2
	.long	.LVL3
	.byte	0x1
	.byte	0x52
	.byte	0
.LLST5:
	.byte	0x7
	.long	.LVL4
	.long	.LVL5
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x7
	.long	.LVL4
	.long	.LVL5
	.byte	0x1
	.byte	0x52
	.byte	0
.LLST7:
	.byte	0x7
	.long	.LVL5
	.long	.LVL6
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x7
	.long	.LVL5
	.long	.LVL6
	.byte	0x1
	.byte	0x52
	.byte	0
.LLST10:
	.byte	0x7
	.long	.LVL7
	.long	.LVL8
	.byte	0x2
	.byte	0x91
	.byte	0xb
	.byte	0
.LLST11:
	.byte	0x7
	.long	.LVL7
	.long	.LVL8
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST12:
	.byte	0x7
	.long	.LVL8
	.long	.LVL9
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0
.LLST13:
	.byte	0x7
	.long	.LVL8
	.long	.LVL9
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST15:
	.byte	0x7
	.long	.LVL10
	.long	.LVL11
	.byte	0x2
	.byte	0x91
	.byte	0xc
	.byte	0
.LLST16:
	.byte	0x7
	.long	.LVL10
	.long	.LVL11
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST18:
	.byte	0x7
	.long	.LVL11
	.long	.LVL12
	.byte	0x2
	.byte	0x91
	.byte	0x9
	.byte	0
.LLST19:
	.byte	0x7
	.long	.LVL11
	.long	.LVL12
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST21:
	.byte	0x7
	.long	.LVL13
	.long	.LVL14
	.byte	0x2
	.byte	0x91
	.byte	0xd
	.byte	0
.LLST22:
	.byte	0x7
	.long	.LVL13
	.long	.LVL14
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST24:
	.byte	0x7
	.long	.LVL14
	.long	.LVL15
	.byte	0x2
	.byte	0x91
	.byte	0xa
	.byte	0
.LLST25:
	.byte	0x7
	.long	.LVL14
	.long	.LVL15
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST27:
	.byte	0x7
	.long	.LVL15
	.long	.LVL16
	.byte	0xa
	.byte	0x91
	.byte	0x4
	.byte	0x94
	.byte	0x1
	.byte	0x34
	.byte	0x24
	.byte	0x8
	.byte	0x40
	.byte	0x21
	.byte	0x9f
	.byte	0
.LLST28:
	.byte	0x7
	.long	.LVL15
	.long	.LVL16
	.byte	0x3
	.byte	0x71
	.byte	0x6
	.byte	0x9f
	.byte	0
.LLST30:
	.byte	0x7
	.long	.LVL17
	.long	.LVL18
	.byte	0x3
	.byte	0x8
	.byte	0x24
	.byte	0x9f
	.byte	0
.LLST31:
	.byte	0x7
	.long	.LVL17
	.long	.LVL18
	.byte	0x1
	.byte	0x52
	.byte	0
.LLST32:
	.byte	0x7
	.long	.LVL18
	.long	.LVL19
	.byte	0x1
	.byte	0x52
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.long	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.value	0x5
	.byte	0x4
	.byte	0
	.long	0
.LLRL0:
	.byte	0x6
	.long	.LBB60
	.long	.LBE60
	.byte	0x6
	.long	.LBB63
	.long	.LBE63
	.byte	0
.LLRL9:
	.byte	0x6
	.long	.LBB70
	.long	.LBE70
	.byte	0x6
	.long	.LBB74
	.long	.LBE74
	.byte	0x6
	.long	.LBB75
	.long	.LBE75
	.byte	0
.LLRL14:
	.byte	0x6
	.long	.LBB78
	.long	.LBE78
	.byte	0x6
	.long	.LBB81
	.long	.LBE81
	.byte	0
.LLRL17:
	.byte	0x6
	.long	.LBB82
	.long	.LBE82
	.byte	0x6
	.long	.LBB86
	.long	.LBE86
	.byte	0x6
	.long	.LBB87
	.long	.LBE87
	.byte	0
.LLRL20:
	.byte	0x6
	.long	.LBB88
	.long	.LBE88
	.byte	0x6
	.long	.LBB91
	.long	.LBE91
	.byte	0
.LLRL23:
	.byte	0x6
	.long	.LBB92
	.long	.LBE92
	.byte	0x6
	.long	.LBB96
	.long	.LBE96
	.byte	0x6
	.long	.LBB97
	.long	.LBE97
	.byte	0
.LLRL26:
	.byte	0x6
	.long	.LBB98
	.long	.LBE98
	.byte	0x6
	.long	.LBB101
	.long	.LBE101
	.byte	0
.LLRL29:
	.byte	0x6
	.long	.LBB102
	.long	.LBE102
	.byte	0x6
	.long	.LBB105
	.long	.LBE105
	.byte	0
.LLRL35:
	.byte	0x6
	.long	.LBB111
	.long	.LBE111
	.byte	0x6
	.long	.LBB114
	.long	.LBE114
	.byte	0
.LLRL44:
	.byte	0x6
	.long	.LBB121
	.long	.LBE121
	.byte	0x6
	.long	.LBB125
	.long	.LBE125
	.byte	0x6
	.long	.LBB126
	.long	.LBE126
	.byte	0
.LLRL49:
	.byte	0x6
	.long	.LBB129
	.long	.LBE129
	.byte	0x6
	.long	.LBB132
	.long	.LBE132
	.byte	0
.LLRL52:
	.byte	0x6
	.long	.LBB133
	.long	.LBE133
	.byte	0x6
	.long	.LBB137
	.long	.LBE137
	.byte	0x6
	.long	.LBB138
	.long	.LBE138
	.byte	0
.LLRL55:
	.byte	0x6
	.long	.LBB139
	.long	.LBE139
	.byte	0x6
	.long	.LBB142
	.long	.LBE142
	.byte	0
.LLRL58:
	.byte	0x6
	.long	.LBB143
	.long	.LBE143
	.byte	0x6
	.long	.LBB147
	.long	.LBE147
	.byte	0x6
	.long	.LBB148
	.long	.LBE148
	.byte	0
.LLRL61:
	.byte	0x6
	.long	.LBB149
	.long	.LBE149
	.byte	0x6
	.long	.LBB152
	.long	.LBE152
	.byte	0
.LLRL64:
	.byte	0x6
	.long	.LBB153
	.long	.LBE153
	.byte	0x6
	.long	.LBB156
	.long	.LBE156
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.long	.LELT0-.LSLT0
.LSLT0:
	.value	0x5
	.byte	0x4
	.byte	0
	.long	.LELTP0-.LASLTP0
.LASLTP0:
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0xf6
	.byte	0xf2
	.byte	0xd
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.byte	0x3
	.string	"/home/gunrajmann/Desktop/Tethered OS/bootmanager/src"
	.ascii	"../include/x86_64"
	.byte	0
	.ascii	"/home/gunrajmann/.local/gcc-cross/lib/gcc/i686-elf/13.2.0/in"
	.ascii	"clude"
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0xb
	.byte	0x4
	.string	"pio.c"
	.byte	0
	.string	"pio.c"
	.byte	0
	.string	"x86io.h"
	.byte	0x1
	.string	"stdint-gcc.h"
	.byte	0x2
.LELTP0:
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM1
	.byte	0x1b
	.byte	0x5
	.byte	0x55
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM2
	.byte	0x18
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM3
	.byte	0x6
	.byte	0x16
	.byte	0x5
	.byte	0x55
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM4
	.byte	0x4
	.byte	0x2
	.byte	0x18
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM5
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0x5
	.byte	0x55
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM6
	.byte	0x1
	.byte	0x5
	.byte	0x55
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM7
	.byte	0x18
	.byte	0x5
	.byte	0x17
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM8
	.byte	0x4
	.byte	0x2
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM9
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM10
	.byte	0x4
	.byte	0x2
	.byte	0x16
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM11
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM12
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.byte	0x17
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM13
	.byte	0x4
	.byte	0x2
	.byte	0x6
	.byte	0x15
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM14
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM15
	.byte	0x4
	.byte	0x2
	.byte	0x14
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM16
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM17
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM18
	.byte	0x1
	.byte	0x5
	.byte	0x17
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM19
	.byte	0x4
	.byte	0x2
	.byte	0x6
	.byte	0x13
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM20
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x1b
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM21
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM22
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM24
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x1c
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM25
	.byte	0x4
	.byte	0x2
	.byte	0x12
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM26
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM27
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.byte	0x17
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM28
	.byte	0x4
	.byte	0x2
	.byte	0x6
	.byte	0x11
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM29
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x1d
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM30
	.byte	0x4
	.byte	0x2
	.byte	0x11
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM31
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x1e
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM32
	.byte	0x4
	.byte	0x2
	.byte	0x10
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM33
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x1e
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM34
	.byte	0x4
	.byte	0x2
	.byte	0x10
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM35
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM36
	.byte	0x4
	.byte	0x2
	.byte	0x10
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM37
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x1f
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM38
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM39
	.byte	0x1
	.byte	0x5
	.byte	0x17
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM40
	.byte	0x4
	.byte	0x2
	.byte	0x6
	.byte	0xf
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM41
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x1f
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM42
	.byte	0x4
	.byte	0x2
	.byte	0xf
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM43
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x20
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM44
	.byte	0x4
	.byte	0x2
	.byte	0xe
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM45
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x20
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM46
	.byte	0x4
	.byte	0x2
	.byte	0xe
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM47
	.byte	0x4
	.byte	0x1
	.byte	0x20
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM48
	.byte	0x4
	.byte	0x2
	.byte	0xe
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM49
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x21
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM50
	.byte	0x4
	.byte	0x2
	.byte	0xd
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM51
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x21
	.byte	0x5
	.byte	0x21
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM52
	.byte	0x1
	.byte	0x5
	.byte	0x17
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM53
	.byte	0x1
	.byte	0x5
	.byte	0x21
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM54
	.byte	0x4
	.byte	0x2
	.byte	0xd
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM55
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x22
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM56
	.byte	0x4
	.byte	0x2
	.byte	0x6
	.byte	0x3
	.byte	0x75
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM57
	.byte	0x4
	.byte	0x1
	.byte	0x22
	.byte	0x5
	.byte	0x17
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM58
	.byte	0x4
	.byte	0x2
	.byte	0x6
	.byte	0x3
	.byte	0x75
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM59
	.byte	0x4
	.byte	0x1
	.byte	0x23
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM60
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0x5
	.byte	0x8
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM61
	.byte	0x4
	.byte	0x2
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0
	.byte	0x13
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM62
	.byte	0x18
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM63
	.byte	0x18
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM64
	.byte	0x4
	.byte	0x1
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x19
	.byte	0x5
	.byte	0x8
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM65
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0
	.byte	0x6
	.byte	0x1a
	.byte	0x5
	.byte	0x3
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM66
	.byte	0x4
	.byte	0x2
	.byte	0x16
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM67
	.byte	0x18
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM68
	.byte	0x18
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM69
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM70
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.byte	0x1f
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM71
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x3
	.byte	0x6
	.byte	0x15
	.byte	0x5
	.byte	0x27
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM72
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0x5
	.byte	0x1b
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM73
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0
	.byte	0x6
	.byte	0x1b
	.byte	0x5
	.byte	0x1
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM74
	.byte	0x6
	.byte	0x19
	.byte	0x5
	.byte	0x56
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM75
	.byte	0x18
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM76
	.byte	0x6
	.byte	0x16
	.byte	0x5
	.byte	0x56
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM77
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x6c
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM78
	.byte	0x4
	.byte	0x1
	.byte	0x2b
	.byte	0x5
	.byte	0x56
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM79
	.byte	0x1
	.byte	0x5
	.byte	0x56
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM80
	.byte	0x18
	.byte	0x5
	.byte	0x17
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM81
	.byte	0x4
	.byte	0x2
	.byte	0x6
	.byte	0x3
	.byte	0x6b
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM82
	.byte	0x4
	.byte	0x1
	.byte	0x2d
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM83
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x6a
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM84
	.byte	0x4
	.byte	0x1
	.byte	0x2e
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM85
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.byte	0x17
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM86
	.byte	0x4
	.byte	0x2
	.byte	0x6
	.byte	0x3
	.byte	0x69
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM87
	.byte	0x4
	.byte	0x1
	.byte	0x2f
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM88
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x68
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM89
	.byte	0x4
	.byte	0x1
	.byte	0x30
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM90
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM91
	.byte	0x1
	.byte	0x5
	.byte	0x17
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM92
	.byte	0x4
	.byte	0x2
	.byte	0x6
	.byte	0x3
	.byte	0x67
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM93
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x30
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM94
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x67
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM95
	.byte	0x4
	.byte	0x1
	.byte	0x30
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM96
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x67
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM97
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x31
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM98
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x66
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM99
	.byte	0x4
	.byte	0x1
	.byte	0x32
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM100
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.byte	0x17
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM101
	.byte	0x4
	.byte	0x2
	.byte	0x6
	.byte	0x3
	.byte	0x65
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM102
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x32
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM103
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x65
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM104
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x33
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM105
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x64
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM106
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x33
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM107
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x64
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM108
	.byte	0x4
	.byte	0x1
	.byte	0x33
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM109
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x64
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM110
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x34
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM111
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM112
	.byte	0x1
	.byte	0x5
	.byte	0x17
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM113
	.byte	0x4
	.byte	0x2
	.byte	0x6
	.byte	0x3
	.byte	0x63
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM114
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x34
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM115
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x63
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM116
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x35
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM117
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x62
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM118
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x35
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM119
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x62
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM120
	.byte	0x4
	.byte	0x1
	.byte	0x35
	.byte	0x5
	.byte	0x30
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM121
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x62
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM122
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x36
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM123
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x61
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM124
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x36
	.byte	0x5
	.byte	0x21
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM125
	.byte	0x1
	.byte	0x5
	.byte	0x17
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM126
	.byte	0x1
	.byte	0x5
	.byte	0x21
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM127
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x61
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM128
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x37
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM129
	.byte	0x4
	.byte	0x2
	.byte	0x6
	.byte	0x3
	.byte	0x60
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM130
	.byte	0x4
	.byte	0x1
	.byte	0x37
	.byte	0x5
	.byte	0x17
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM131
	.byte	0x4
	.byte	0x2
	.byte	0x6
	.byte	0x3
	.byte	0x60
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM132
	.byte	0x4
	.byte	0x1
	.byte	0x38
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM133
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0x5
	.byte	0x8
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM134
	.byte	0x4
	.byte	0x2
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0
	.byte	0x3
	.byte	0x67
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM135
	.byte	0x18
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM136
	.byte	0x18
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM137
	.byte	0x4
	.byte	0x1
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x2e
	.byte	0x5
	.byte	0x8
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM138
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0
	.byte	0x6
	.byte	0x1a
	.byte	0x5
	.byte	0x3
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM139
	.byte	0x18
	.byte	0x5
	.byte	0x3
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM140
	.byte	0x4
	.byte	0x2
	.byte	0x3
	.byte	0x5f
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM141
	.byte	0x4
	.byte	0x1
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x3
	.byte	0x36
	.byte	0x5
	.byte	0x27
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM142
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0x5
	.byte	0x1b
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.LM143
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0
	.byte	0x6
	.byte	0x1b
	.byte	0x5
	.byte	0x1
	.byte	0
	.byte	0x5
	.byte	0x2
	.long	.Letext0
	.byte	0
	.byte	0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,"",@progbits
.LASF0:
	.string	"base_controller"
	.ident	"GCC: (GNU) 13.2.0"
