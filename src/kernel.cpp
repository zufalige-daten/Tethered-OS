#define uint8 unsigned char
#define uint16 unsigned short
#define uint32 unsigned int
#define uint64 unsigned long

void startup(){
    asm("jmp kernel_main");
}

void outb(uint16 port, uint8 data){
    uint16 null = 0;
    asm("mov dx, %[portd]" : "=r"(null) : [portd] "r"(port));
    asm("mov al, %[datad]" : "=r"(null) : [datad] "r"(data));
    asm("out dx, al");
}

void outw(uint16 port, uint16 data){
    uint16 null = 0;
    asm("mov dx, %[portd]" : "=r"(null) : [portd] "r"(port));
    asm("mov ax, %[datad]" : "=r"(null) : [datad] "r"(data));
    asm("out dx, ax");
}

uint8 inb(uint16 port){
    uint16 null = 0;
    uint8 data = 0;
    asm("mov dx, %[portd]" : "=r"(null) : [portd] "r"(port));
    asm("in %[datad], dx" : [datad] "=r"(data));
    return data;
}

uint16 inw(uint16 port){
    uint16 null = 0;
    uint16 data = 0;
    asm("mov dx, %[portd]" : "=r"(null) : [portd] "r"(port));
    asm("in %[datad], dx" : [datad] "=r"(data));
    return data;
}

void memsbyte(uint64 addr, uint8 data){
    uint8 null = 0;
    asm("mov rdi, %[addrd]" : "=r"(null) : [addrd] "r"(addr));
    asm("mov bl, %[datad]" : "=r"(null) : [datad] "r"(data));
    asm("mov byte ptr [rdi], bl");
}

uint8 memgbyte(uint64 addr){
    uint8 null = 0;
    uint8 data;
    asm("mov rdi, %[addrd]" : "=r"(null) : [addrd] "r"(addr));
    asm("mov %[outn], byte ptr [rdi]" : [outn] "=r"(data));
    return data;
}

void memsdword(uint64 addr, uint32 data){
    uint64 null = 0;
    asm("mov rdi, %[addrd]" : "=r"(null) : [addrd] "r"(addr));
    asm("mov ebx, %[datad]" : "=r"(null) : [datad] "r"(data));
    asm("mov dword ptr [rdi], ebx");
}

uint32 memgdword(uint64 addr){
    uint64 null = 0;
    uint32 data;
    asm("mov rdi, %[addrd]" : "=r"(null) : [addrd] "r"(addr));
    asm("mov %[outn], dword ptr [rdi]" : [outn] "=r"(data));
    return data;
}

void memsword(uint64 addr, uint16 data){
    uint64 null = 0;
    asm("mov rdi, %[addrd]" : "=r"(null) : [addrd] "r"(addr));
    asm("mov bx, %[datad]" : "=r"(null) : [datad] "r"(data));
    asm("mov word ptr [rdi], bx");
}

uint16 memgword(uint64 addr){
    uint64 null = 0;
    uint16 data;
    asm("mov rdi, %[addrd]" : "=r"(null) : [addrd] "r"(addr));
    asm("mov %[outn], word ptr [rdi]" : [outn] "=r"(data));
    return data;
}

void memsqword(uint64 addr, uint64 data){
    uint64 null = 0;
    asm("mov rdi, %[addrd]" : "=r"(null) : [addrd] "r"(addr));
    asm("mov rbx, %[datad]" : "=r"(null) : [datad] "r"(data));
    asm("mov qword ptr [rdi], rbx");
}

uint64 memgqword(uint64 addr){
    uint64 null = 0;
    uint64 data;
    asm("mov rdi, %[addrd]" : "=r"(null) : [addrd] "r"(addr));
    asm("mov %[outn], qword ptr [rdi]" : [outn] "=r"(data));
    return data;
}

#define VGA_WIDTH 80

void cursorspos(int x, int y)
{
	uint16 pos = y * VGA_WIDTH + x;
 
	outb(0x3D4, 0x0F);
	outb(0x3D5, (uint8) (pos & 0xFF));
	outb(0x3D4, 0x0E);
	outb(0x3D5, (uint8) ((pos >> 8) & 0xFF));
}

uint16 cursorgpos()
{
    uint16 pos = 0;
    outb(0x3D4, 0x0F);
    pos |= inb(0x3D5);
    outb(0x3D4, 0x0E);
    pos |= ((uint16)inb(0x3D5)) << 8;
    return pos;
}

int cursor_x = 0;
int cursor_y = 0;

void vga_scroll_down(){
    for(int i = 0; i < ((80*2)+(25*(VGA_WIDTH*2))); i++){
        memsbyte((0xb8000-(VGA_WIDTH*2))+(i), memgbyte(0xb8000+i));
    }
    // for(int i = 0; i < 80 i++;)
    cursor_y--;
    cursorspos(cursor_x, cursor_y);
}

void vga_put_char(uint8 ch, uint8 color){
    int xi = cursor_x*2;
    int yi = cursor_y*2;
    if(cursor_x >= 80){     // implements scrolling when charachters reach border without using newline, messy and so is not recomended to be used with programs.
        cursor_y++;
        cursor_x = 0;
        if(cursor_y >= 25){
            vga_scroll_down();
        }
    }
    if(ch == '\n'){
        cursor_x = 0;
        cursor_y++;
        if(cursor_y >= 25){
            vga_scroll_down();
        }
    }
    else{
        memsbyte(0xb8000+(xi+(yi*VGA_WIDTH)), ch);
        memsbyte(0xb8001+(xi+(yi*VGA_WIDTH)), color);
        cursor_x++;
        if(cursor_y >= 25){
            vga_scroll_down();
        }
    }
    cursorspos(cursor_x, cursor_y);
}

void vga_put_string(const char *str, uint8 color){
    int i = 0;
    while(str[i] != 0){
        vga_put_char(str[i], color);
        i++;
    }
}

bool strcmp(const char *str0, const char *str1){
    for(int i = 0; i == i; i++){
        if(str0[i] != str1[i]){
            return false;
        }
        if(str0[i] == 0){
            if(str1[i] == 0){
                return true;
            }
            else{
                return false;
            }
        }
    }
    return false;
}

#define strcpy(des,src,len) for(int i = 0; i < len; i++){des[i] = src[i];}0

#include "keys.h"

char kb_getchar(){
    char ret = getascii(inkey());
    while(ret == 0){
        ret = getascii(inkey());
    }
    if(ret == 1 || ret == '\n'){
    }
    else{
        vga_put_char(ret, 0x0f);
    }
    return ret;
}

char *createStr(){
    static char str[999] = "";
    return str;
}

char *inputstring(int len){
    char *ret = createStr();
    int origonal_x = cursor_x;
    for(int i = 0; i < len; i++){
        char ch = kb_getchar();
        if(ch == '\n'){
            ret[i] = 0;
            for(int i = 0; i < 29999999; i++){
            }
            return ret;
        }
        else if(ch == 1){
            if(cursor_x != origonal_x){
                cursor_x--;
                vga_put_char(' ', 0x0f);
                cursor_x--;
                cursorspos(cursor_x, cursor_y);
                i--;
                ret[i] = 0;
                i--;
            }
        }
        else{
            ret[i] = ch;
        }
        for(int i = 0; i < 29999999; i++){
        }
    }
    return ret;
}

char *splitstring(char *str, int index){
    char *outstr = createStr();
    int i = 0;
    int i2 = 0;
    int i3 = 0;
    while(str[i] && i3 != index+1){
        if(str[i] == ' '){
            i2 = 0;
            i3++;
        }
        else{
            outstr[i2] = str[i];
            i2++;
            i++;
        }
    }
    outstr[i] = 0;
    return outstr;
}

void check_command(char inputstr[999]){
    if(strcmp(splitstring(inputstr, 0), "LIST")){
        vga_put_string("Feature Coming Soon!\n", 0x0e);
    }
    else if(strcmp(inputstr, "")){
    }
    else if(strcmp(splitstring(inputstr, 0), "TEST")){
        vga_put_string("This Feature Is Used To Test New Features.\n", 0x0e);
    }
    else{
        vga_put_string("Error, Unknown Command Or File '", 0x04);
        vga_put_string(splitstring(inputstr, 0), 0x04);
        vga_put_string("'.\n", 0x04);
    }
}

extern "C"{
    void kernel_main(){
        cursorspos(cursor_x, cursor_y);
        vga_put_string("Welcome To Tethered OS Alpha 0.1!\nFor A List Of Commands, Type 'PLACEHOLDER'.\nCurret Keyboard Layout: US\n", 0x0f);
        char *inputstr = createStr();
        int a = 0;
        while(true){
            vga_put_string("command$: ", 0x0f);
            inputstr = inputstring(999);
            vga_put_string("\n", 0x0f);
            check_command(inputstr);
        }
    }
}