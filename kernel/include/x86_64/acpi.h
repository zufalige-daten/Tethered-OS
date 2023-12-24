#pragma once

#include <kernel.h>
#include <stdint.h>

typedef struct{
	char sig[8];
	uint8_t checksum;
	char oemid[6];
	uint8_t revision;
	uint32_t rsdtaddr;
} _packed ACPI_RSDP_t;

typedef struct{
	char sig[8];
	uint8_t checksum;
	char oemid[6];
	uint8_t revision;
	uint32_t rsdtaddr; // deprecated for ver 2.0
	uint32_t length;
	uint64_t xsdtaddr;
	uint8_t extchecksum;
	uint8_t reserved[3];
} _packed ACPI_XSDP_t;

typedef struct{
	char sig[4];
	uint32_t length;
	uint8_t revision;
	uint8_t checksum;
	char oemid[6];
	char oemtableid[8];
	uint32_t oemrevision;
	uint32_t creatorid;
	uint32_t creatorrevision;
} _packed ACPI_SD_HEADER_t;

typedef struct{
	ACPI_SD_HEADER_t h;
	uint32_t osdptr[1]; // note: count = (h.Length - sizeof(h))/4; 1 is just a placeholder.
} _packed ACPI_RSDT_SD_t;

typedef struct{
	ACPI_SD_HEADER_t h;
	uint64_t osdptr[1]; // note: count = (h.Length - sizeof(h))/8; 1 is just a placeholder
} _packed ACPI_XSDT_SD_t;

#define ACPI_BDA_EBDA_SEG 0x40e

void acpi_init(void);

extern uint64_t FADT_ptr;
extern uint64_t MADT_ptr;
extern uint64_t HPET_ptr;
extern uint64_t SDT_DEV_ptrs[256];

typedef struct{
	uint8_t type;
	uint8_t length;
} _packed APIC_RECORD_t;

typedef struct{
	APIC_RECORD_t h; // where t = 0
	uint8_t acpipid;
	uint8_t apicid;
	uint32_t flags; // bit 0: processor enabled; bit 1: online capable.
} _packed APIC_PROCLOCAL_t;

typedef struct{
	APIC_RECORD_t h; // where t = 1
	uint8_t ioapicid;
	uint8_t rsvd0;
	uint32_t ioapicaddr;
	uint32_t gsysinterbase;
} _packed APIC_IOAPIC_t;

typedef struct{
	APIC_RECORD_t h; // where t = 2
	uint8_t bussrc;
	uint8_t irqsrc;
	uint32_t gsysinter;
	uint16_t intflags; // see acpi_intflags
} _packed APIC_IOAPIC_INTSRC_OVERRIDE_t;

typedef struct{
	APIC_RECORD_t h; // where t = 3
	uint8_t nmisrc;
	uint8_t rsvd0;
	uint16_t intflags; // see acpi_intflags
	uint32_t gsysinter;
} _packed APIC_IOAPIC_NMISRC_t;

typedef struct{
	APIC_RECORD_t h; // where t = 4
	uint8_t acpipid; // 0xff: all processors.
	uint16_t intflags; // see acpi_intflags
	uint8_t LINTX; // 0 or 1
} _packed APIC_LOCALAPIC_NMIS_t;

typedef struct{
	APIC_RECORD_t h; // where t = 5
	uint16_t rsvd0;
	uint64_t apicphysaddr;
} _packed APIC_LOCALAPIC_ADDR_OVERRIDE_t;

typedef struct{
	APIC_RECORD_t h; // where t = 9
	uint16_t rsvd0;
	uint32_t x2apicid;
	uint32_t flags; // bit 0: processor enabled; bit 1: online capable.
	uint32_t acpipid;
} _packed APIC_PROCLOCAL_X2APIC_t;

enum acpi_intflags{
	ACTIVE_HIGH_ET = 0,
	ACTIVE_HIGH_LT = 1,
	ACTIVE_LOW_ET = 2,
	ACTIVE_LOW_LT = 3,
};

typedef struct{
	ACPI_SD_HEADER_t h;
	uint32_t apicaddr;
	uint32_t flags; // 1 = dual 8259 legacy pics installed
	APIC_RECORD_t records[1]; // note: 1 is a place holder, as, this is an array with many items of varieng length
} _packed ACPI_MADT_t;

extern uint64_t cpucorecount;

extern void acpi_walk_madt(void);
