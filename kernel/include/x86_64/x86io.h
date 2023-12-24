#pragma once

#include <stdint.h>

extern void outb(uint16_t port, uint8_t data);

extern void outw(uint16_t port, uint16_t data);

extern void outd(uint16_t port, uint32_t data);

extern uint32_t ind(uint16_t port);

extern uint8_t inb(uint16_t port);

extern uint16_t inw(uint16_t port);
