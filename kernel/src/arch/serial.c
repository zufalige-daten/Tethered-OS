#include <arch/serial.h>
#include <stdint.h>
#include <x86_64/x86io.h>

void init_serial(void){
	outb(port + 1, 0x00);
	outb(port + 3, 0x80);
	outb(port + 0, 0x03);
	outb(port + 1, 0x00);
	outb(port + 3, 0x03);
	outb(port + 2, 0xc7);
	outb(port + 4, 0x0b);
	outb(port + 4, 0x1e);
	outb(port + 0, 0xae);

	inb(port + 0);

	outb(port + 4, 0x0f);
}

uint32_t is_transmit_empty(void){
	return inb(port + 5) & 0x20;
}

void serial_write_char(char chr){
	while(is_transmit_empty() == 0);
	outb(port, (uint8_t)chr);
}

void serial_write_string(const char *str){
	while(*str){
		serial_write_char(*str);
		str++;
	}
}
