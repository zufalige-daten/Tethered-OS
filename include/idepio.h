#ifndef IDEPIO_H
#define IDEPIO_H
#include <types.h>
#include <basicio.h>
void readlba48(uint64_t addr, uint8_t drive, uint8_t *buffer){
    outb(0x1F1, 0x00);
    outb(0x1F1, 0x00);
    outb(0x1F2, 0x00);
    outb(0x1F2, 0x01);
    outb(0x1F3, (unsigned char)(addr >> 24));
    outb(0x1F3, (unsigned char)addr);
    outb(0x1F4, (unsigned char)(addr >> 32));
    outb(0x1F4, (unsigned char)(addr >> 8));
    outb(0x1F5, (unsigned char)(addr >> 40));
    outb(0x1F5, (unsigned char)(addr >> 16));
    outb(0x1F6, 0x40 | (drive << 4));
    outb(0x1F7, 0x24);
    while(!(inb(0x1F7)&0x08)){}
    uint16_t tmpword;
    for(int index = 0; index < 256; index++){
        tmpword = inw(0x1F0);
        buffer[index*2] = (uint8_t)tmpword;
        buffer[(index*2)+1] = (uint8_t)(tmpword >> 8);
    }
}
void writelba48(uint64_t addr, uint8_t drive, uint8_t *buffer){
    outb(0x1F1, 0x00);
    outb(0x1F1, 0x00);
    outb(0x1F2, 0x00);
    outb(0x1F2, 0x01);
    outb(0x1F3, (unsigned char)(addr >> 24));
    outb(0x1F3, (unsigned char)addr);
    outb(0x1F4, (unsigned char)(addr >> 32));
    outb(0x1F4, (unsigned char)(addr >> 8));
    outb(0x1F5, (unsigned char)(addr >> 40));
    outb(0x1F5, (unsigned char)(addr >> 16));
    outb(0x1F6, 0x40 | (drive << 4));
    outb(0x1F7, 0x34);
    while(!(inb(0x1F7)&0x08)){}
    uint16_t tmpword;
    for(int index = 0; index < 256; index++){
        tmpword = buffer[8+(index*2)]|(buffer[8+(index*2)+1]<<8);
        outw(0x1F0, tmpword);
    }
}
#endif