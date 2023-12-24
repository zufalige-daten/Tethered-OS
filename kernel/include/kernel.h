#pragma once

#include <stdint.h>

typedef struct{
	uint32_t drive_number; // depending on device_type
	uint32_t drive_controller; // not used by all drivers
	uint8_t drive_type; // 0: unused (terminate drive check); 1: atapio; 2: USB; 3: sata; 4: floppy
	char graduation[9];
} __attribute__((packed)) drive_t;

#define MMAP_TERMINATE 0
#define MMAP_AVALIABLE 1
#define MMAP_RESERVED 2
#define MMAP_ACPI_RECLAIMABLE 3
#define MMAP_NVS 4
#define MMAP_BADRAM 5

typedef struct{
	uint64_t baseaddr;
	uint64_t size;
	uint32_t type;
} __attribute__((packed)) boot_mmap_entry_t;

typedef struct{
	uint64_t lfb;
	uint32_t lfb_width;
	uint32_t lfb_height;
	uint8_t lfb_bpp;
	drive_t bootdevice;
	uint64_t mem_size;
	boot_mmap_entry_t boot_mmap[256];
} __attribute__((packed)) kernel_header_struct_t;

extern kernel_header_struct_t *khs;
extern uintptr_t stack_top;

#define _packed __attribute__((packed))
#define QUOTE(x) #x
#define BREAK serial_write_string("Break at line " "UNDEFINED" " in file " __FILE__ ".\n"); while(1);
