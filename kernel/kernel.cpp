#include <types.h>
static uint8_t prgbuffer[100*1024*1024];

#define SHIFT_LEFT_DOWN 0x2a
#define SHIFT_LEFT_UP 0xaa
#define SHIFT_RIGHT_DOWN 0x36
#define SHIFT_RIGHT_UP 0xb6
#define CAPS 0x3a
#define BACKSPACE 0x0e

uint32_t *main_lfb;
uint32_t sub_lfb[800+(600*800)];
uint8_t lfb[2*(80+(60*80))];
#define TOSFS_START 204883
int x = 0; int y = 0;

#include <basicio.h>
extern "C"{
static uint8_t filebuffer[100*1024*1024];
uint32_t file_read(string_t filename, string_t filebuf);
void cursorspos(int x, int y){
	uint16_t pos = y * 80 + x;
 
	outb(0x3D4, 0x0F);
	outb(0x3D5, (uint8_t) (pos & 0xFF));
	outb(0x3D4, 0x0E);
	outb(0x3D5, (uint8_t) ((pos >> 8) & 0xFF));
}
uint16_t cursorgpos(){
    uint16_t pos = 0;
    outb(0x3D4, 0x0F);
    pos |= inb(0x3D5);
    outb(0x3D4, 0x0E);
    pos |= ((uint16_t)inb(0x3D5)) << 8;
    return pos;
}
uint8_t font_abc[(94*(8*8))+8+(8*8)];
void load_font(string_t fontfilename){
    int sz = file_read(fontfilename, filebuffer);
    for(int i = 0; i < sz; i++){
        font_abc[i] = filebuffer[i];
    }
}
void update_text(){
    for(int y = 0; y < 60; y++){
        for(int x = 0; x < 80; x++){
            if(lfb[2*(x+(y*80))]>0 && lfb[(2*(x+(y*80)))+1]>0){
                uint8_t color = lfb[(2*(x+(y*80)))+1];
                if(lfb[2*(x+(y*80))] >= 32 && lfb[2*(x+(y*80))] <= 126){
                    uint8_t chr = lfb[2*(x+(y*80))];
                    chr -= 32;
                    for(int fy = 0; fy < 8; fy++){
                        for(int fx = 0; fx < 8; fx++){
                            if(font_abc[(chr*(8*8))+fx+(fy*8)]){
                                sub_lfb[(x*10)+fx+(((y*10)+fy)*800)] = 0xffffffff;
                            }
                            else{
                                sub_lfb[(x*10)+fx+(((y*10)+fy)*800)] = 0x00000000;
                            }
                        }
                    }
                }
            }
        }
    }
}
void scroll(){
    // for(int i = 0; i < ((80+(25*80))*2); i++){
    //     lfb[i] = 0;
    // }
    for(int yi = 0; yi < 60; yi++){
        for(int i = 0; i < 80; i++){
            if(yi != 0){
                lfb[(i+((yi-1)*80))*2] = lfb[(i+(yi*80))*2];
                lfb[1+(i+((yi-1)*80))*2] = lfb[1+(i+(yi*80))*2];
                lfb[(i+(yi*80))*2] = 0;
                lfb[1+(i+(yi*80))*2] = 0;
            }
        }
    }
    x = 0;
    y--;
    update_text();
}
void update_display(){
    for(int i = 0; i < 2*(799+(599*800)); i++){
        main_lfb[i] = sub_lfb[i];
    }
}
void putc(uint8_t chr){
    if(x >= 80){
        x = 0;
        y++;
    }
    if(chr == '\n'){
        y++;
        x = 0;
    }
    else{
        lfb[(x+(y*80))*2] = chr;
        lfb[((x+(y*80))*2)+1] = 0x0f;
        x++;
    }
    if(y >= 60){
        scroll();
    }
    cursorspos(x, y);
    update_text();
}
void puts(string_t src, int startindex){
    for(int i = 0;src[i+startindex]!=0;i++){
        if(x >= 80){
            x = 0;
            y++;
        }
        if(src[i+startindex]=='\n'){
            y++;
            x = 0;
        }
        else{
            lfb[((x)+(y*80))*2] = src[i+startindex];
            lfb[(((x)+(y*80))*2)+1] = 0x0f;
            x++;
        }
        if(y >= 60){
            scroll();
        }
    }
    cursorspos(x, y);
    update_text();
}
void prints(int xc, int yc, string_t src, int startindex, bool trbc){
    for(int i = 0;src[i+startindex]!=0;i++){
        if(xc >= 80){
            return;
        }
        else{
            if(src[i] >= 32 && src[i] <= 126){
                for(int fy = 0; fy < 8; fy++){
                    for(int fx = 0; fx < 8; fx++){
                        if(font_abc[((src[i]-32)*(8*8))+fx+(fy*8)]){
                            sub_lfb[(xc*9)+fx+((yc+fy)*800)] = 0xffffffff;
                        }
                        else if(!trbc){
                            sub_lfb[(xc*9)+fx+((yc+fy)*800)] = 0x00000000;
                        }
                    }
                }
            }
        }
        xc++;
    }
}
void putc_c(uint8_t chr, uint8_t col){
    if(x >= 80){
        x = 0;
        y++;
    }
    if(chr == '\n'){
        y++;
        x = 0;
    }
    else{
        lfb[(x+(y*80))*2] = chr;
        lfb[((x+(y*80))*2)+1] = col;
        x++;
    }
    if(y >= 60){
        scroll();
    }
    cursorspos(x, y);
    update_text();
}
void puts_c(string_t src, int startindex, uint8_t col){
    for(int i = 0;src[i+startindex]!=0;i++){
        if(x >= 80){
            x = 0;
            y++;
        }
        if(src[i+startindex]=='\n'){
            y++;
            x = 0;
        }
        else{
            lfb[((x)+(y*80))*2] = src[i+startindex];
            lfb[(((x)+(y*80))*2)+1] = col;
            x++;
        }
        if(y >= 60){
            scroll();
        }
    }
    cursorspos(x, y);
    update_text();
}
int strlen(string_t src, int startindex){
    int i = 0;
    for(;src[i+startindex]!=0;i++){}
    return i;
}
bool strcmp(string_t src0, string_t src1){
    if(strlen(src0, 0) == strlen(src1, 0)){
        for(int i = 0; i < strlen(src0, 0); i++){
            if(src0[i] != src1[i]){
                return false;
            }
        }
        return true;
    }
    else{
        return false;
    }
}
uint8_t oldkey = 0;
uint8_t waitkey(){
    uint8_t key = inb(0x60);
    while(key == oldkey){
        key = inb(0x60);
    }
    oldkey = key;
    return key;
}
uint8_t keytoascii[256]={
    0x0,0x0,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39,0x30,0x2d,0x3d,0x0,0x9,0x71,0x77,
    0x65,0x72,0x74,0x79,0x75,0x69,0x6f,0x70,0x5b,0x5d,0xa,0x0,0x61,0x73,0x64,0x66,0x67,0x68,
    0x6a,0x6b,0x6c,0x3b,0x27,0x60,0x0,0x23,0x7a,0x78,0x63,0x76,0x62,0x6e,0x6d,0x2c,0x2e,0x2f,
    0x0,0x0,0x0,0x20,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
    0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x5c
};
uint8_t keytoascii_s[256]={
    0x0,0x0,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39,0x30,0x2d,0x3d,0x0,0x9,0x71,0x77,
    0x65,0x72,0x74,0x79,0x75,0x69,0x6f,0x70,0x5b,0x5d,0xa,0x0,0x61,0x73,0x64,0x66,0x67,0x68,
    0x6a,0x6b,0x6c,0x3b,0x27,0x60,0x0,0x23,0x7a,0x78,0x63,0x76,0x62,0x6e,0x6d,0x2c,0x2e,0x2f,
    0x0,0x0,0x0,0x20,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
    0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x5c
};
uint8_t keytoascii_u[256]={
    0x0,0x0,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39,0x30,0x2d,0x3d,0x0,0x9,0x71,0x77,
    0x65,0x72,0x74,0x79,0x75,0x69,0x6f,0x70,0x5b,0x5d,0xa,0x0,0x61,0x73,0x64,0x66,0x67,0x68,
    0x6a,0x6b,0x6c,0x3b,0x27,0x60,0x0,0x23,0x7a,0x78,0x63,0x76,0x62,0x6e,0x6d,0x2c,0x2e,0x2f,
    0x0,0x0,0x0,0x20,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
    0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x5c
};
uint8_t keytoascii_su[256]={
    0x0,0x0,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39,0x30,0x2d,0x3d,0x0,0x9,0x71,0x77,
    0x65,0x72,0x74,0x79,0x75,0x69,0x6f,0x70,0x5b,0x5d,0xa,0x0,0x61,0x73,0x64,0x66,0x67,0x68,
    0x6a,0x6b,0x6c,0x3b,0x27,0x60,0x0,0x23,0x7a,0x78,0x63,0x76,0x62,0x6e,0x6d,0x2c,0x2e,0x2f,
    0x0,0x0,0x0,0x20,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
    0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x5c
};
uint8_t s_pressed = 0;
uint8_t u_pressed = 0;
uint8_t caps_on = 0;
uint8_t shift_on = 0;
uint8_t getchar(){
    uint8_t chr = 0;
    while(chr == 0){
        uint8_t key = waitkey();
        chr = keytoascii[key];
    }
    if(chr != '\n'){
        putc(chr);
    }
    return chr;
}
string_t getstr(){
    uint8_t chr = 0;
    static uint8_t str[999];
    int i = 0;
    int initialx = x;
    while(chr != '\n'){
        uint8_t key = waitkey();
        chr = keytoascii[key];
        if(chr != 0){
            if(chr == '\t'){
                str[i] = ' ';
            }
            else if(chr == '\n'){str[i] = 0; i++; break;}
            else if(caps_on==0&&shift_on==0){
                str[i] = chr;
            }
            else if(caps_on==0xff&&shift_on==0){
                chr = keytoascii_u[key];
                str[i] = chr;
            }
            else if(caps_on==0&&shift_on==0xff){
                chr = keytoascii_s[key];
                str[i] = chr;
            }
            else if(caps_on==0xff&&shift_on==0xff){
                chr = keytoascii_su[key];
                str[i] = chr;
            }
            i++;
            putc(chr);
        }
        else if(key == BACKSPACE && x > initialx){
            i--;
            str[i] = 0;
            x--;
            putc(' ');
            x--;
            cursorspos(x, y);
        }
        else if(key == CAPS){
            caps_on = ~caps_on;
        }
        else if(key == SHIFT_LEFT_DOWN || key == SHIFT_RIGHT_DOWN){
            shift_on = 0xff;
        }
        else if(key == SHIFT_LEFT_UP || key == SHIFT_RIGHT_UP){
            shift_on = 0;
        }
    }
    i--;
    str[i] = 0;
    return str;
}
string_t split_string(string_t src, uint8_t delim, int index){
    static uint8_t des[1024];
    for(int h = 0; h < 1024; h++){
        des[h] = 0;
    }
    int off = 0;
    int j = 0;
    int outd = 0;
    int oi = 0;
    int i = 0;
    while(src[i] == delim){
        i++;
    }
    for(; i < strlen(src, 0); i++){
        if(src[i] == delim){
            des[j] = 0;
            j = 0;
            if(index == off){
                outd = oi;
                break;
            }
            off++;
            while(src[i] == delim){
                i++;
            }
            oi = i;
            i--;
        }
        else{
            des[j] = src[i];
            j++;
        }
    }
    if(index != off){
        return (string_t)"";
    }
    return des;
}
#include <idepio.h>
#include <tosfs.h>
#define retbit(var,pos) (((var) & (1<<(pos)))>>(pos))
static uint32_t prgfuns[256] = {
    (uint32_t)readlba48, (uint32_t)writelba48, (uint32_t)putc, (uint32_t)puts, (uint32_t)getchar
};
string_t its(uint32_t it){
    static uint8_t out[12];
    int sz = 0;
    int it2 = it;
    while(it2/10 != 0){
        it2 /= 10;
        sz++;
    }
    sz++;
    out[sz] = '\0';
    it2 = it;
    for(int i = sz-1;i>=0;i--){
        out[i] = (it2%10)+'0';
        it2 /= 10;
    }
    return out;
}
void drawrect(int xc, int yc, int width, int height, uint32_t color){
    for(int ycc = yc; ycc < yc+height; ycc++){
        for(int xcc = xc; xcc < xc+width; xcc++){
            if(xcc < 800 && ycc < 600){
                sub_lfb[xcc+(ycc*800)] = color;
            }
        }
    }
}
struct rect_t{
    int x, y, width, height;
    uint32_t color;
};
rect_t rect(int x, int y, int width, int height, uint32_t color){
    rect_t rectc;
    rectc.x = x; rectc.y = y; rectc.width = width; rectc.height = height; rectc.color = color;
    return rectc;
}
void drawrectt(rect_t rectd){
    int xc = rectd.x; int yc = rectd.y; int width = rectd.width; int height = rectd.height;
    uint32_t color = rectd.color;
    for(int ycc = yc; ycc < yc+height; ycc++){
        for(int xcc = xc; xcc < xc+width; xcc++){
            if(xcc < 800 && ycc < 600){
                sub_lfb[xcc+(ycc*800)] = color;
            }
        }
    }
}
void drawrects(int x, int y, rect_t *rectds, int size){
    for(int srect = 0; srect < size; srect++){
        int xc = rectds[srect].x+x; int yc = rectds[srect].y+y; int width = rectds[srect].width;
        int height = rectds[srect].height; uint32_t color = rectds[srect].color;
        for(int ycc = yc; ycc < yc+height; ycc++){
            for(int xcc = xc; xcc < xc+width; xcc++){
                if(xcc < 800 && ycc < 600){
                    sub_lfb[xcc+(ycc*800)] = color;
                }
            }
        }
    }
}
static uint8_t filenameog[999];
void iloop(){
    uint8_t *filename;
    rect_t titlebar[5];
    titlebar[0] = rect(0, 0, 800, 12, 0xffff0000);
    titlebar[1] = rect(0, 10, 800, 2, 0xff7f7f7f);
    titlebar[2] = rect(0, 0, 800, 1, 0xff7f7f7f);
    titlebar[3] = rect(0, 1, 10, 10, 0xffbfbfbf);
    titlebar[4] = rect(790, 1, 10, 10, 0xffbfbfbf);
    while(1){
        drawrect(0, 0, 800, 10, 0xffff0000);
        drawrect(0, 0, 10, 10, 0xff7f7f7f);
        drawrect(790, 0, 10, 10, 0xff7f7f7f);
        drawrect(0, 0, 2, 10, 0xffbfbfbf);
        drawrect(798, 0, 2, 10, 0xffbfbfbf);
        drawrect(0, 9, 800, 2, 0xffbfbfbf);
        prints(23, 0, (string_t)"Tethered OS Alpha 0.1 - INDEVBUILD", 0, true);
        drawrects(0, 11, titlebar, 5);
        drawrect(0, 24, 800, 576, 0xff007fff);
        prints(0, 30, (string_t)"Yay the cheese man is rising dr stone is good", 0, true);
        update_display();
    }
}
uint32_t lfb2[800+(600*800)];
void loader_main(uint32_t *mbootinfo){
    main_lfb = (uint32_t *)mbootinfo[22];
    load_font((string_t)"testfont.tff");
    oldkey = inb(0x60);
    iloop();
    while(1){}
}
}