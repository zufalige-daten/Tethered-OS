#pragma once

#include <stdint.h>

#define PRIMARY_ATA_PIO 0x01f0
#define SECONDARY_ATA_PIO 0x0170

extern void read_lba48(uint16_t base_controller, uint8_t drive, uint64_t lba, void *buffer);
extern void write_lba48(uint16_t base_controller, uint8_t drive, uint64_t lba, void *buffer);
