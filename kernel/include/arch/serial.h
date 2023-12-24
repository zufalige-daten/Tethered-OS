#pragma once

#include <stdint.h>
#include <x86_64/x86io.h>

#define port 0x3f8

extern void init_serial(void);

extern uint32_t is_transmit_empty(void);

extern void serial_write_char(char chr);

extern void serial_write_string(const char *str);
