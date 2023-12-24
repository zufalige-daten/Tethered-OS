#pragma once

#include <kernel.h>
#include <stdint.h>

#define PML_XD 1 << 63
#define PML_PS 1 << 7
#define PML_A 1 << 5
#define PML_PCD 1 << 4
#define PML_PWT 1 << 3
#define PML_US 1 << 2
#define PML_RW 1 << 1
#define PML_P 1 << 0
#define PMLN_PAT 1 << 12
#define PML1_PAT 1 << 7

#define pml4_index_from(virt) (virt >> 39)
#define pml3_index_from(virt) ((virt >> 30) & 0b111111111)
#define pml2_index_from(virt) ((virt >> 21) & 0b111111111)
#define pml1_index_from(virt) ((virt >> 12) & 0b111111111)

#define PAT_UC 0
#define PAT_WC 1
#define PAT_WT 4
#define PAT_WP 5
#define PAT_WB 6
#define PAT_UCM 7

#define PML_ATTR_WC PML_PWT
#define PML_ATTR_UCM PML_PCD

#define kernel_pat 0x0000000504070106;

extern void allocate_page(void *paddr, void *vaddr, uint64_t attributes, uint8_t table_level);
