#include <x86_64/pio.h>
#include <stdint.h>
#include <x86_64/x86io.h>

void read_lba48(uint16_t base_controller, uint8_t drive, uint64_t lba, void *buffer){
	outb(base_controller + 1, 0x00);
	outb(base_controller + 1, 0x00);
	outb(base_controller + 2, 0x00);
	outb(base_controller + 2, 0x01);
	outb(base_controller + 3, (unsigned char)(lba >> 24));
	outb(base_controller + 3, (unsigned char)lba);
	outb(base_controller + 4, (unsigned char)(lba >> 32));
	outb(base_controller + 4, (unsigned char)(lba >> 8));
	outb(base_controller + 5, (unsigned char)(lba >> 40));
	outb(base_controller + 5, (unsigned char)(lba >> 16));
	outb(base_controller + 6, 0x40 | (drive << 4));
	outb(base_controller + 7, 0x24);
	while(!(inb(base_controller + 7)&0x08));
	uint16_t tmpword;
	for(int index = 0; index < 256; index++){
		tmpword = inw(base_controller + 0);
		((uint16_t *)buffer)[index] = tmpword;
	}
}

void write_lba48(uint16_t base_controller, uint8_t drive, uint64_t lba, void *buffer){
	outb(base_controller + 1, 0x00);
	outb(base_controller + 1, 0x00);
	outb(base_controller + 2, 0x00);
	outb(base_controller + 2, 0x01);
	outb(base_controller + 3, (unsigned char)(lba >> 24));
	outb(base_controller + 3, (unsigned char)lba);
	outb(base_controller + 4, (unsigned char)(lba >> 32));
	outb(base_controller + 4, (unsigned char)(lba >> 8));
	outb(base_controller + 5, (unsigned char)(lba >> 40));
	outb(base_controller + 5, (unsigned char)(lba >> 16));
	outb(base_controller + 6, 0x40 | (drive << 4));
	outb(base_controller + 7, 0x34);
	while(!(inb(base_controller + 7)&0x08));
	uint16_t tmpword;
	for(int index = 0; index < 256; index++){
		tmpword = ((uint16_t *)buffer)[index];
		outw(base_controller + 0, tmpword);
	}
}
