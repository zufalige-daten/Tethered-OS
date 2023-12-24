#pragma once

#include <kernel.h>
#include <stdint.h>

inline void fast_memset_b(uint64_t ptr, uint64_t size, uint8_t data){
	asm volatile("rep stosb" :: "D" (ptr), "c" (size), "a" (data));
}

inline void fast_memset_w(uint64_t ptr, uint64_t size, uint16_t data){
	asm volatile("rep stosw" :: "D" (ptr), "c" (size), "a" (data));
}

inline void fast_memset_d(uint64_t ptr, uint64_t size, uint32_t data){
	asm volatile("rep stosd" :: "D" (ptr), "c" (size), "a" (data));
}

inline void fast_memset_q(uint64_t ptr, uint64_t size, uint64_t data){
	asm volatile("rep stosq" :: "D" (ptr), "c" (size), "a" (data));
}

inline void fast_memcpy_b(uint64_t ptr, uint64_t size, uint8_t *src){
	asm volatile("rep movsb" :: "S" (&src[0]), "D" (ptr), "c" (size));
}

inline void fast_memcpy_w(uint64_t ptr, uint64_t size, uint16_t *src){
	asm volatile("rep movsw" :: "S" (&src[0]), "D" (ptr), "c" (size));
}

inline void fast_memcpy_d(uint64_t ptr, uint64_t size, uint32_t *src){
	asm volatile("rep movsd" :: "S" (&src[0]), "D" (ptr), "c" (size));
}

inline void fast_memcpy_q(uint64_t ptr, uint64_t size, uint64_t *src){
	asm volatile("rep movsq" :: "S" (&src[0]), "D" (ptr), "c" (size));
}

inline uint8_t memget_b(uint64_t ptr){
	uint8_t ret = 0;
	asm volatile("mov al, byte ptr [rsi]" : "=a" (ret) : "S" (ptr));
	return ret;
}

inline uint32_t memget_d(uint64_t ptr){
	uint32_t ret = 0;
	asm volatile("mov eax, dword ptr [rsi]" : "=a" (ret) : "S" (ptr));
	return ret;
}

inline uint64_t memget_q(uint64_t ptr){
	uint64_t ret = 0;
	asm volatile("mov rax, qword ptr [rsi]" : "=a" (ret) : "S" (ptr));
	return ret;
}
