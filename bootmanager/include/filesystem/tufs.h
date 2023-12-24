#pragma once

#include <stdint.h>

#define _packed __attribute__((packed))

typedef struct{
	uint8_t Sig[4]; // must be equal to "TUFS"
	uint64_t LFSect;
	uint64_t PSISect;
	uint64_t PSSect;
	uint8_t PName[11];
	uint16_t RSCount;
	uint64_t RDSect;
	uint16_t VNumber;
	uint8_t Res[461];
} _packed TUFS1HEADER;

enum used{
	unused = 0,
	filealloc = 1,
	datasect = 2,
	spandesc = 3,
	spanfoot = 4,
};

enum attributes{
	hidden = 1 << 0,
	span = 1 << 1,
	directory = 1 << 2,
	symblink = 1 << 3,
};

enum permissions{
	canread = 1 << 0,
	canwrite = 1 << 1,
	cancreate = 1 << 2,
	candelete = 1 << 3,
	isoverride = 1 << 4,
};

#define max_filenamesize 441

typedef struct{
	uint8_t Used;
	uint8_t FAttributes;
	int32_t FLMTime;
	int32_t FLRTime;
	int32_t FCTime;
	uint64_t FSIBytes;
	uint64_t FSSect;
	uint8_t UPerms;
	uint8_t OGUsername[16];
	uint64_t FNHash;
	uint64_t PSect;
	uint8_t FName[max_filenamesize];
	uint64_t NFIDSect; // if 0: last file in directory
} _packed TUFS1FILEALLOC;

typedef struct{
	uint8_t Used;
	uint8_t FRFData[503];
	uint64_t NFRSect;
} _packed TUFS1DATASECT;

typedef struct{
	uint8_t Used;
	uint64_t NOSRFSpan;
	uint8_t Rsvd[503];
} _packed TUFS1SPANDESC;

extern TUFS1HEADER fs_header;
