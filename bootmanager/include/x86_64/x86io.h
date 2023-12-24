#pragma once

#include <stdint.h>

static inline void outb(uint16_t port, uint8_t data){
	asm volatile("outb dx, al" :: "a" (data), "d" (port));
}

static inline void outw(uint16_t port, uint16_t data){
	asm volatile("outw dx, ax" :: "a" (data), "d" (port));
}

static inline uint8_t inb(uint16_t port){
	uint8_t ret;
	asm volatile("inb al, dx" : "=a" (ret) : "d" (port));
	return ret;
}

static inline uint16_t inw(uint16_t port){
	uint16_t ret;
	asm volatile("inw ax, dx" : "=a" (ret) : "d" (port));
	return ret;
}
