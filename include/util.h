#ifndef UTIL_H
#define UTIL_H
#include <types.h>
void memcpy(string_t src, string_t dest, uint32_t sz){
    for(int i = 0; i < sz; i++){
        dest[i] = src[i];
    }
}
void memfill(string_t dest, uint8_t val, uint32_t sz){
    for(int i = 0; i < sz; i++){
        dest[i] = val;
    }
}
#endif