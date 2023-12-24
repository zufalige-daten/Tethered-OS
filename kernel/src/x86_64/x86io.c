#include <x86_64/x86io.h>
#include <stdint.h>

void outb(uint16_t port, uint8_t data){
	asm volatile("outb dx, al" :: "a" (data), "d" (port));
}

void outw(uint16_t port, uint16_t data){
	asm volatile("outw dx, ax" :: "a" (data), "d" (port));
}

uint8_t inb(uint16_t port){
	uint8_t ret;
	asm volatile("inb al, dx" : "=a" (ret) : "d" (port));
	return ret;
}

uint16_t inw(uint16_t port){
	uint16_t ret;
	asm volatile("inw ax, dx" : "=a" (ret) : "d" (port));
	return ret;
}

void outd(uint16_t port, uint32_t data){
	asm volatile("outd dx, eax" :: "a" (data), "d" (port));
}

uint32_t ind(uint16_t port){
	uint32_t ret;
	asm volatile("ind eax, dx" : "=a" (ret) : "d" (port));
	return ret;
}
