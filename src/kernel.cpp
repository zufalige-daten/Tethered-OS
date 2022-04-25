#define uint8 unsigned char
#define uint16 unsigned short
#define uint32 unsigned int

uint32 K_LFB = 0;

void startup(){
    asm("mov %[lfb], esi" : [lfb] "=r"(K_LFB));
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

void memsbyte(uint32 addr, uint8 data){
    uint8 null = 0;
    asm("mov edi, %[addrd]" : "=r"(null) : [addrd] "r"(addr));
    asm("mov bl, %[datad]" : "=r"(null) : [datad] "r"(data));
    asm("mov byte ptr [edi], bl");
}

uint8 memgbyte(uint32 addr){
    uint8 null = 0;
    uint8 data;
    asm("mov edi, %[addrd]" : "=r"(null) : [addrd] "r"(addr));
    asm("mov %[outn], byte ptr [edi]" : [outn] "=r"(data));
    return data;
}

void memsdword(uint32 addr, uint32 data){
    uint32 null = 0;
    asm("mov edi, %[addrd]" : "=r"(null) : [addrd] "r"(addr));
    asm("mov ebx, %[datad]" : "=r"(null) : [datad] "r"(data));
    asm("mov dword ptr [edi], ebx");
}

uint32 memgdword(uint32 addr){
    uint32 null = 0;
    uint32 data;
    asm("mov edi, %[addrd]" : "=r"(null) : [addrd] "r"(addr));
    asm("mov %[outn], dword ptr [edi]" : [outn] "=r"(data));
    return data;
}

void memsword(uint32 addr, uint16 data){
    uint32 null = 0;
    asm("mov edi, %[addrd]" : "=r"(null) : [addrd] "r"(addr));
    asm("mov bx, %[datad]" : "=r"(null) : [datad] "r"(data));
    asm("mov word ptr [edi], bx");
}

uint16 memgword(uint32 addr){
    uint32 null = 0;
    uint16 data;
    asm("mov edi, %[addrd]" : "=r"(null) : [addrd] "r"(addr));
    asm("mov %[outn], word ptr [edi]" : [outn] "=r"(data));
    return data;
}

#define VGA_WIDTH 80

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

char *createStr(){
    static char str[999] = "";
    return str;
}

// char testimg1[(10*10)+1][3] = {        // Test image
//     // Image header:
//     // 10x10 pixel resolution:
//     {10, 10, 16},
//     // Image data:
// };

struct Color{
public:
    uint8 R;
    uint8 G;
    uint8 B;
};

Color ColorFromRGB(int r, int g, int b){
    Color col;
    col.R = r;
    col.G = g;
    col.B = b;
    return col;
}

class Rectangle{
public:
    int Width;
    int Height;
    int X;
    int Y;
    Color RGBColor;
    Rectangle(int width, int height, int x, int y, Color col){
        RGBColor = col;
        Width = width;
        Height = height;
        X = x;
        Y = y;
    }
};

uint8 InneficientGoPastVmemInHope[((800*3)+(600*(800*3)))];
uint8 IFB[((800*3)+(600*(800*3)))];

void DrawRect(Rectangle rect){
    int width = rect.Width;
    int height = rect.Height;
    int ox = rect.X;
    int oy = rect.Y;
    Color thecol = rect.RGBColor;
    unsigned char col[3] = {thecol.B, thecol.G, thecol.R};
    int x;
    int y;
    for(y = oy; y < height; y++){
        for(x = ox; x < width; x++){
            IFB[(x*3)+(y*(800*3))] = col[0];
            IFB[(x*3)+1+(y*(800*3))] = col[1];
            IFB[(x*3)+2+(y*(800*3))] = col[2];
        }
        x = ox;
    }
}

void DrawFrameBuffer(){
    uint32 LFB = K_LFB;
    uint32 *thefb = (uint32*)IFB;
    for(int i = 0; i < ((800+(600*800))*3); i += 4){
        memsdword(LFB+i, thefb[(i/4)]);
    }
}

extern "C"{
    void kernel_main(){
        uint32 LFB = K_LFB;
        for(int i = 0; i < ((800+(600*800))*3); i += 4){
            memsdword(LFB+i, 0);
        }
        while(1){
            Rectangle rect1(100, 60, 10, 10, ColorFromRGB(255, 0, 0));
            DrawRect(rect1);
            Rectangle rect2(200, 300, 20, 10, ColorFromRGB(0, 127, 255));
            DrawRect(rect2);
            DrawFrameBuffer();
        }
    }
}