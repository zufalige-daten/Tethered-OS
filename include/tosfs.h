#ifndef TOSFS_H
#define TOSFS_H
#include <idepio.h>
#include <types.h>
uint64_t baotl(string_t src, int startindex){
    uint8_t fatszs[8];
    fatszs[0]=src[startindex];
    fatszs[1]=src[startindex+1];
    fatszs[2]=src[startindex+2];
    fatszs[3]=src[startindex+3];
    fatszs[4]=src[startindex+4];
    fatszs[5]=src[startindex+5];
    fatszs[6]=src[startindex+6];
    fatszs[7]=src[startindex+7];
    uint64_t *fatszs2 = (uint64_t*)fatszs;
    return fatszs2[0];
}
uint16_t baots(string_t src, int startindex){
    uint8_t fatszs[2];
    fatszs[0]=src[startindex];
    fatszs[1]=src[startindex+1];
    uint16_t *fatszs2 = (uint16_t*)fatszs;
    return fatszs2[0];
}
void listfiles(string_t dir){
    uint8_t buffer[512];
    readlba48(TOSFS_START, 0, buffer);
    uint64_t fatsz = baotl(buffer, 12);
    int nli = 1;
    for(int lba = 1; lba < fatsz+1; lba++){
        readlba48(TOSFS_START+lba, 0, buffer);
        for(int ee = 0; ee < 2; ee++){
            if(buffer[ee*256] == 1){
                puts_c(buffer, (ee*256)+9, 0x03);
                puts_c((string_t)", ", 0, 0x03);
                uint8_t filenm[256-9];
                for(int yy = 0; yy < 256-9; yy++){
                    filenm[yy] = buffer[(ee*256)+9+yy];
                }
            }
        }
    }
    x -= 2;
    puts((string_t)"  ", 0);
    x -= 2;
    putc('\n');
}
uint32_t file_size(string_t filename){
    uint32_t filesize = 0;
    uint8_t buffer[512];
        readlba48(TOSFS_START, 0, buffer);
        uint64_t fatsz = baotl(buffer, 12);
        for(int lba = 1; lba < fatsz+1; lba++){
            readlba48(TOSFS_START+lba, 0, buffer);
            for(int ee = 0; ee < 2; ee++){
                if(buffer[ee*256] == 1){
                    uint8_t filenm[256-9];
                    for(int yy = 0; yy < 256-9; yy++){
                        filenm[yy] = buffer[(ee*256)+9+yy];
                    }
                    uint64_t filestart = baotl(buffer, (ee*256)+1);
                    if(strcmp(filenm, filename)){
                        uint64_t filelba = filestart;
                        while(filelba != 0){
                            readlba48(TOSFS_START+filelba, 0, buffer);
                            uint16_t filesz = 0;
                            filelba = baotl(buffer, 3);
                            if(filelba == 0){
                                filesz = baots(buffer, 1);
                                filesize += filesz;
                            }
                            else{
                                filesize += 501;
                            }
                        }
                    }
                }
            }
        }
    return filesize;
}
uint32_t file_read(string_t filename, string_t filebuf){
    uint32_t sz = 0;
    sz = file_size(filename);
    uint8_t buffer[512];
        readlba48(TOSFS_START, 0, buffer);
        uint64_t fatsz = baotl(buffer, 12);
        for(int lba = 1; lba < fatsz+1; lba++){
            readlba48(TOSFS_START+lba, 0, buffer);
            for(int ee = 0; ee < 2; ee++){
                if(buffer[ee*256] == 1){
                    uint8_t filenm[256-9];
                    for(int yy = 0; yy < 256-9; yy++){
                        filenm[yy] = buffer[(ee*256)+9+yy];
                    }
                    uint64_t filestart = baotl(buffer, (ee*256)+1);
                    if(strcmp(filenm, filename)){
                        uint64_t filelba = filestart;
                        uint32_t loadoff = 0;
                        while(filelba != 0){
                            readlba48(TOSFS_START+filelba, 0, buffer);
                            uint16_t filesz = 0;
                            filelba = baotl(buffer, 3);
                            if(filelba == 0){
                                filesz = baots(buffer, 1);
                                for(int er = 0; er < filesz; er++){
                                    filebuf[loadoff+er] = buffer[11+er];
                                }
                            }
                            else{
                                for(int er = 0; er < 501; er++){
                                    filebuf[loadoff+er] = buffer[11+er];
                                }
                            }
                            loadoff += 501;
                        }
                    }
                }
            }
        }
    return sz;
}
#endif