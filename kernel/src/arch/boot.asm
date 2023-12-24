section .text
global _start
_start:
	finit
	mov rsp, stack_top
	mov rbp, rsp
	mov dword [khs], edx
	mov dword [khs+4], 0
	extern kernel_main
	call kernel_main
	jmp $

section .data
global khs
global kernel_endpoint
extern kernel_end
	khs: dq 0
	global pmem_map_ptr
	extern pmemmap_start
	pmem_map_ptr: dq pmemmap_start
	kernel_endpoint: dq kernel_end

section .bss
	global kernel_pml4_map
	global kernel_pml3_map_n
	global kernel_pml2_map_1
	global stack_top
	align 8
	resb 65536*128 ; 1 stack for each core's kernel instance
	stack_top:
	align 4096
	kernel_pml4_map: resb 4096
	kernel_pml3_map_n: resb 8*256*512
	kernel_pml2_map_1: resb 4096
