#ifndef BASICIO_H
#define BASICIO_H
void outb(uint16_t port, uint8_t data){
    uint16_t null = 0;
    asm("mov dx, %[portd]" : "=r"(null) : [portd] "r"(port));
    asm("mov al, %[datad]" : "=r"(null) : [datad] "r"(data));
    asm("out dx, al");
}
void outw(uint16_t port, uint16_t data){
    uint16_t null = 0;
    asm("mov dx, %[portd]" : "=r"(null) : [portd] "r"(port));
    asm("mov ax, %[datad]" : "=r"(null) : [datad] "r"(data));
    asm("out dx, ax");
}
uint8_t inb(uint16_t port){
    uint16_t null = 0;
    uint8_t data = 0;
    asm("mov dx, %[portd]" : "=r"(null) : [portd] "r"(port));
    asm("in %[datad], dx" : [datad] "=r"(data));
    return data;
}
uint16_t inw(uint16_t port){
    uint16_t null = 0;
    uint16_t data = 0;
    asm("mov dx, %[portd]" : "=r"(null) : [portd] "r"(port));
    asm("in %[datad], dx" : [datad] "=r"(data));
    return data;
}
#endif