#include <memory/bitarray.h>
#include <stdint.h>
#include <kernel.h>

void setbit(uint64_t bitarray_ptr, uint64_t offset, int32_t bit){
	uint64_t byteoffset = offset/8;
	uint64_t suboffset = offset%8;
	uint8_t initialbyte = 0;
	asm volatile("mov al, byte ptr [rsi]" : "=a" (initialbyte) : "S" (bitarray_ptr+byteoffset));
	initialbyte = (initialbyte & (~(1 << suboffset))) | (bit << suboffset);
	asm volatile("mov byte ptr [rdi], al" :: "D" (bitarray_ptr+byteoffset), "a" (initialbyte));
}

int32_t getbit(uint64_t bitarray_ptr, uint64_t offset){
	uint64_t byteoffset = offset/8;
	uint64_t suboffset = offset%8;
	int32_t ret = 0;
	asm volatile("mov al, byte ptr [rsi]" : "=a" (ret) : "S" (bitarray_ptr+byteoffset));
	ret >>= suboffset;
	ret &= 1;
	return ret;
}

uint64_t findzbit(uint64_t bitarray_ptr, uint64_t baseoffset, uint64_t maxlength){
	uint64_t ret = ~0;
	for(uint64_t i = baseoffset; i < maxlength; i++){
		if(getbit(bitarray_ptr, i) == 0){
			ret = i;
			break;
		}
	}
	return ret;
}

uint64_t rfindzbit(uint64_t bitarray_ptr, uint64_t baseoffset){
	uint64_t ret = ~0;
	for(int i = baseoffset-1; i >= 0; i--){
		if(getbit(bitarray_ptr, i) == 0){
			ret = i;
			break;
		}
	}
	return ret;
}
