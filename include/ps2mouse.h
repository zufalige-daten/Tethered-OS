#ifndef PS2MOUSE_H
#define PS2MOUSE_H
#include <idt.h>
#include <types.h>
uint8_t mouse_cycle = 0;
char mouse_byte[3];
int mouse_x = 0;
int mouse_y = 0;
int mouse_x_old = 0;
int mouse_y_old = 0;
inline void mouse_wait(byte a_type){
    uint32_t _time_out = 100000;
    if(a_type == 0){
        while(_time_out--){
            if((inb(0x64)&1)==1){
                return;
            }
        }
        return;
    }
    else{
        while(_time_out--){
            if((inb(0x64)&2)==0){
                return;
            }
        }
        return;
    }
}
inline void mouse_write(byte a_write){
    mouse_wait(1);
    outb(0x64, 0xd4);
    mouse_wait(1);
    outb(0x60, a_write);
}
uint8_t mouse_read(){
    mouse_wait(0);
    return inb(0x60);
}
void mouse_handler(uint32_t *a_r){
    switch(mouse_cycle){
        case 0:
            mouse_byte[0] = mouse_read();
            mouse_cycle++;
            break;
        case 1:
            mouse_byte[1] = mouse_read();
            mouse_cycle++;
            break;
        case 2:
            mouse_byte[2] = mouse_read();
            if(retbit(mouse_byte[0], 5)){
                mouse_y = mouse_y - (mouse_byte[2]);
            }
            else if(!retbit(mouse_byte[0], 5)){
                mouse_y = mouse_y + (mouse_byte[2]);
            }
            if(retbit(mouse_byte[0], 4)){
                mouse_x = mouse_x - (mouse_byte[1]);
            }
            else if(!retbit(mouse_byte[0], 4)){
                mouse_x = mouse_x + (mouse_byte[1]);
            }
            if(mouse_x/10 >= 800-40){
                mouse_x = 759*10;
            }
            else if(mouse_x/10 < 0){
                mouse_x = 0;
            }
            if(mouse_y/10 >= 600-40){
                mouse_y = 559*10;
            }
            else if(mouse_y/10 < 0){
                mouse_y = 0;
            }
            mouse_x_old = mouse_x;
            mouse_y_old = mouse_y;
            mouse_cycle = 0;
            break;
    }
}
void mouse_install(){
    uint8_t _status;
    mouse_wait(1);
    outb(0x64, 0xa8);
    mouse_wait(1);
    outb(0x64, 0x20);
    mouse_wait(0);
    _status = (inb(0x60)|2);
    mouse_wait(1);
    outb(0x64, 0x60);
    mouse_wait(1);
    outb(0x60, _status);
    mouse_write(0xf6);
    mouse_read();
    mouse_write(0xf4);
    mouse_read();
    irq_install_handler(0x20 + 12, mouse_handler);
}
#endif