#include <kernel.h>
#include <stdint.h>
#include <x86_64/acpi.h>
#include <arch/serial.h>
#include <arch/kernel_string.h>
#include <arch/fast_memcpy.h>

uint64_t FADT_ptr;
uint64_t MADT_ptr;
uint64_t HPET_ptr;
uint64_t SDT_DEV_ptrs[256];

void acpi_init(void){
	// locate edba
	uint16_t ebda_addr = (*((uint16_t *)ACPI_BDA_EBDA_SEG));
	uint8_t *ebda = (uint8_t *)(((uint64_t)ebda_addr)<<4);
	// locate rsdp
	const char *verif_str_rsd = "RSD PTR ";
	static char ebda_str[1024];
	fast_memcpy_q((uint64_t)(&ebda_str[0]), 1024, (uint64_t *)(&ebda[0]));
	int uxsdp = 0;
	int success = 0;
	ACPI_RSDP_t *rsdp;
	int isnv1 = 0;
	ACPI_XSDP_t *xsdp;
	// in edba
	for(uint64_t i = 0; i < 1024; i++){
		if(memget_q(0xe0000+i) == memget_q((uint64_t)(&verif_str_rsd[0]))){
			kernel_printf("y@ebda\n");
			rsdp = (ACPI_RSDP_t *)(&ebda_str[i]);
			// check if checksum is valid
			uint8_t *rsdp_checksum_verif = (uint8_t *)rsdp;
			uint64_t result = 0;
			for(uint64_t byte = 0; byte < sizeof(ACPI_RSDP_t); i++){
				result += rsdp_checksum_verif[byte];
			}
			if((result & 0xff) == 0){
				success = 1;
			}
			else{
				continue;
			}
			if(rsdp->revision > 0){
				isnv1 = 1;
				rsdp_checksum_verif = (uint8_t *)(&rsdp[sizeof(ACPI_RSDP_t)]);
				xsdp = (ACPI_XSDP_t *)(&rsdp[0]);
				result = 0;
				for(uint64_t byte = 0; byte < (sizeof(ACPI_XSDP_t) - sizeof(ACPI_RSDP_t)); byte++){
					result += rsdp_checksum_verif[byte];
				}
				if((result & 0xff) == 0){
					success = 1;
				}
				else{
					success = 0;
					isnv1 = 0;
					continue;
				}
			}
			if(success){
				break;
			}
		}
	}
	// in main BIOS area (0xe0000 to 0xfffff)
	if(!success){
		isnv1 = 0;
		for(uint64_t i = 0; i < (0xfffff - 0xe0000); i++){
			if(memget_q(0xe0000+i) == memget_q((uint64_t)(&verif_str_rsd[0]))){
				kernel_printf("y@MBA\n");
				rsdp = (ACPI_RSDP_t *)(0xe0000+i);
				// check if checksum is valid
				uint64_t result = 0;
				for(uint64_t byte = 0; byte < sizeof(ACPI_RSDP_t); byte++){
					result += memget_b(0xe0000+i+byte);
				}
				if((result & 0xff) == 0){
					success = 1;
				}
				else{
					success = 0;
					continue;
				}
				if(rsdp->revision > 0){
					isnv1 = 1;
					uint64_t rsdp_checksum_verif = 0xe0000 + i + sizeof(ACPI_RSDP_t);
					xsdp = (ACPI_XSDP_t *)rsdp;
					result = 0;
					for(uint64_t byte = sizeof(ACPI_RSDP_t); byte < sizeof(ACPI_XSDP_t); byte++){
						result += memget_b(0xe0000+i+byte);
					}
					if((result & 0xff) == 0){
						uxsdp = 1;
						success = 1;
					}
					else{
						success = 0;
						continue;
					}
				}
				if(success){
					break;
				}
			}
		}
	}
	if(!success){
		kernel_printf("Error: (ACPI) RSDP not found.\n");
		while(1);
	}
	kernel_printf("ACPI_VER = %u.\n", (uint64_t)rsdp->revision);
	if(!uxsdp){
		kernel_printf("Using RSDT.\n");
		kernel_printf("it is at 0x%x.\n", (uint64_t)rsdp->rsdtaddr);
		ACPI_RSDT_SD_t *rsdt = (ACPI_RSDT_SD_t *)((uint64_t)rsdp->rsdtaddr);
		uint64_t rsdt_entry_count = (rsdt->h.length - sizeof(rsdt->h))/4;
		kernel_printf("Number of entries: %u.\n", rsdt_entry_count);
		uint32_t FADT_id = *(uint32_t *)"FACP";
		uint32_t MADT_id = *(uint32_t *)"APIC";
		uint32_t HPET_id = *(uint32_t *)"HPET";
		int dev_no = 0;
		for(uint64_t i = 0; i < rsdt_entry_count; i++){
			ACPI_SD_HEADER_t *entry = (ACPI_SD_HEADER_t *)((uint64_t)rsdt->osdptr[i]);
			if(*(uint32_t *)(&entry->sig[0]) == FADT_id){
				kernel_printf("FADT found with id '%c%c%c%c'.\n", entry->sig[0], entry->sig[1], entry->sig[2], entry->sig[3]);
				SDT_DEV_ptrs[dev_no] = (uint64_t)rsdt->osdptr[i];
				FADT_ptr = rsdt->osdptr[i];
			}
			else if(*(uint32_t *)(&entry->sig[0]) == MADT_id){
				kernel_printf("MADT found with id '%c%c%c%c'.\n", entry->sig[0], entry->sig[1], entry->sig[2], entry->sig[3]);
				SDT_DEV_ptrs[dev_no] = (uint64_t)rsdt->osdptr[i];
				MADT_ptr = rsdt->osdptr[i];
			}
			else if(*(uint32_t *)(&entry->sig[0]) == HPET_id){
				kernel_printf("HPET found with id '%c%c%c%c'.\n", entry->sig[0], entry->sig[1], entry->sig[2], entry->sig[3]);
				SDT_DEV_ptrs[dev_no] = (uint64_t)rsdt->osdptr[i];
				HPET_ptr = rsdt->osdptr[i];
			}
			else{
				kernel_printf("ACPI device found with id '%c%c%c%c'.\n", entry->sig[0], entry->sig[1], entry->sig[2], entry->sig[3]);
				SDT_DEV_ptrs[dev_no] = (uint64_t)rsdt->osdptr[i];
			}
			dev_no++;
		}
		SDT_DEV_ptrs[dev_no] = 0;
	}
	else{
		kernel_printf("Using XSDT.\n");
		kernel_printf("it is at 0x%x.\n", xsdp->xsdtaddr);
		ACPI_XSDT_SD_t *xsdt = (ACPI_XSDT_SD_t *)(xsdp->xsdtaddr);
		uint64_t xsdt_entry_count = (xsdt->h.length - sizeof(xsdt->h))/8;
		kernel_printf("Number of entries: %u.\n", xsdt_entry_count);
		uint32_t FADT_id = *(uint32_t *)"FACP";
		uint32_t MADT_id = *(uint32_t *)"APIC";
		uint32_t HPET_id = *(uint32_t *)"HPET";
		int dev_no = 0;
		for(uint64_t i = 0; i < xsdt_entry_count; i++){
			ACPI_SD_HEADER_t *entry = (ACPI_SD_HEADER_t *)(xsdt->osdptr[i]);
			if(*(uint32_t *)(&entry->sig[0]) == FADT_id){
				kernel_printf("FADT found with id '%c%c%c%c'.\n", entry->sig[0], entry->sig[1], entry->sig[2], entry->sig[3]);
				SDT_DEV_ptrs[dev_no] = xsdt->osdptr[i];
				FADT_ptr = xsdt->osdptr[i];
			}
			else if(*(uint32_t *)(&entry->sig[0]) == MADT_id){
				kernel_printf("MADT found with id '%c%c%c%c'.\n", entry->sig[0], entry->sig[1], entry->sig[2], entry->sig[3]);
				SDT_DEV_ptrs[dev_no] = xsdt->osdptr[i];
				MADT_ptr = xsdt->osdptr[i];
			}
			else if(*(uint32_t *)(&entry->sig[0]) == HPET_id){
				kernel_printf("HPET found with id '%c%c%c%c'.\n", entry->sig[0], entry->sig[1], entry->sig[2], entry->sig[3]);
				SDT_DEV_ptrs[dev_no] = xsdt->osdptr[i];
				HPET_ptr = xsdt->osdptr[i];
			}
			else{
				kernel_printf("ACPI device found with id '%c%c%c%c'.\n", entry->sig[0], entry->sig[1], entry->sig[2], entry->sig[3]);
				SDT_DEV_ptrs[dev_no] = xsdt->osdptr[i];
			}
			dev_no++;
		}
		SDT_DEV_ptrs[dev_no] = 0;
	}
}

uint64_t cpucorecount = 0;

void acpi_walk_madt(void){
	ACPI_MADT_t *madt = (ACPI_MADT_t *)MADT_ptr;
	kernel_printf("Local APIC addr: 0x%x.\n", (uint64_t)madt->apicaddr);
	uint8_t *ptr = (uint8_t *)madt->records;
	uint8_t *end = (uint8_t *)(MADT_ptr + madt->h.length);
	uint64_t corecount = 0;
	while(ptr < end){
		APIC_RECORD_t *record = (APIC_RECORD_t *)ptr;
		uint8_t type = record->type;
		uint8_t length = record->length;
		if(type == 0){
			kernel_printf("PID found at 0x%x: pid, %u.\n", (uint64_t)ptr, (uint64_t)((APIC_PROCLOCAL_t *)ptr)->acpipid);
			corecount++;
		}
		else{
			kernel_printf("Type: %u, Addr: 0x%x.\n", (uint64_t)type, (uint64_t)ptr);
		}
		ptr += length;
		if(length == 0){
			ptr += 2;
		}
	}
	kernel_printf("Number of processor cores: %u.\n", corecount);
	cpucorecount = corecount;
}
