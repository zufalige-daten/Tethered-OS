#ifndef IDT_H
#define IDT_H
#include <types.h>
typedef struct{
    uint16_t low_off;
    uint16_t sel;
    uint8_t null0;
    uint8_t flags;
    uint16_t high_off;
} idt_gate_t;
typedef struct{
    uint16_t lim;
    uint32_t base;
} idt_register_t;
#define IDT_ENT 256
void (*idt[IDT_ENT])(uint32_t *eeee);
idt_register_t idt_reg;
#include <util.h>
void irq_install_handler(int n, void (*handler)(uint32_t *eeeee)){
    // idt[n].low_off = (uint16_t)(n&0x0000ffffUL);
    // idt[n].sel = 0x08;
    // idt[n].null0 = 0;
    // idt[n].flags = 0x8e;
    // idt[n].high_off = (uint16_t)((n>>16)&0xffffUL);
    idt[n] = handler;
}
void irq_dofinal(){
    
}
void set_idt(){
    idt_reg.base = (uint32_t)&idt;
    idt_reg.lim = IDT_ENT*sizeof(idt_gate_t)-1;
    asm("lidt [%0]" :: "r" (&idt_reg));
}
#endif