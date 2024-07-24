#include <stdint.h>
#include <x86_64/pio.h>
#include <filesystem/tufs.h>
#include <arch/serial.h>

uint32_t strlen(const char *str){
	uint32_t ret = 0;
	for(; *str; str++, ret++);
	return ret;
}

int strzcmp(const char *str1, const char *str2){
	int str1_len = strlen(str1);
	int str2_len = strlen(str2);
	if(str1_len != str2_len){
		return 0;
	}
	for(int i = 0; i < str1_len; i++){
		if(str1[i] != str2[i]){
			return 0;
		}
	}
	return 1;
}

int memcmp(void *mem1, void *mem2, int size){
	for(int i = 0; i < size; i++){
		if(((uint8_t *)mem1)[i] != ((uint8_t *)mem2)[i]){
			return 0;
		}
	}
	return 1;
}

typedef struct{
	uint8_t attributes;
	uint8_t chsstart[3];
	uint8_t type;
	uint8_t chsend[3];
	uint32_t lbastart;
	uint32_t sizesects;
} __attribute__((packed)) mbr_entry_t;

typedef struct{
	uint32_t udid;
	uint16_t reserved;
} __attribute__((packed)) mbr_header_t;

typedef struct{
	mbr_header_t header;
	mbr_entry_t entries[4];
} __attribute__((packed)) mbr_t;

typedef struct{
	uint8_t reserved[440];
	mbr_t mbr;
	uint16_t bootsig;
} __attribute__((packed)) bootsector_t;

inline void hang(void){
	while(1){
		asm volatile("hlt");
	}
}

bootsector_t bs;

void memset_d(void *dest, uint32_t data, uint32_t n){
	uint32_t *dest_c = (uint32_t *)dest;
	for(; (uint32_t)dest_c < (((uint32_t)dest)+n); dest_c++){
		*dest_c = data;
	}
}

void memcpy(void *dest, void *src, uint32_t s, uint32_t n){
	uint8_t *dest_c = (uint8_t *)dest;
	uint8_t *src_c = (uint8_t *)src;
	for(; (uint32_t)dest_c < (((uint32_t)dest)+(s*n)); dest_c++){
		*dest_c = *src_c;
		src_c++;
	}
}

typedef struct{
	uint8_t lower : 4;
	uint8_t upper : 4;
} __attribute__((packed)) nybbles_t;

uint16_t byte_to_hex(uint8_t byte){
	uint16_t ret = 0;
	char *ret_c = (char *)&ret;
	nybbles_t *nybbles = (nybbles_t *)&byte;
	if(nybbles->lower < 10){
		ret_c[0] = '0' + nybbles->lower;
	}
	else{
		ret_c[0] = 'A' + (nybbles->lower - 10);
	}
	if(nybbles->upper < 10){
		ret_c[1] = '0' + nybbles->upper;
	}
	else{
		ret_c[1] = 'A' + (nybbles->upper - 10);
	}
	return ret;
}

void basic_sleep(uint32_t r){ // sleeps for AN amount of time (very small) recomended: 2
	// range: 150000000
	for(uint32_t i = 0; i < (150000000 * r); i++){
		asm volatile("nop");
	}
}

typedef struct{
	uint32_t drive_number; // depending on device_type
	uint32_t drive_controller; // not used by all drivers
	uint8_t drive_type; // 0: unused (terminate drive check); 1: atapio; 2: USB; 3: sata; 4: floppy
	char graduation[9];
} __attribute__((packed)) drive_t;

void getdrivelist(drive_t *drive_list_buffer, uint32_t max_buffer_len){
	serial_write_string("[Drive Test] Testing drives...\n");
	uint32_t current_drive_index = 0;
	int is_primary_avaliable = 0;
	outb(PRIMARY_ATA_PIO + 3, 0x88);
	if(inb(PRIMARY_ATA_PIO + 3) == 0x88){
		is_primary_avaliable = 1;
	}
	int is_secondary_avaliable = 0;
	outb(SECONDARY_ATA_PIO + 3, 0x88);
	if(inb(SECONDARY_ATA_PIO + 3) == 0x88){
		is_secondary_avaliable = 1;
	}
	if(is_primary_avaliable){
		outb(PRIMARY_ATA_PIO + 6, 0xa0);
		basic_sleep(2);
		uint16_t tmpword = inb(PRIMARY_ATA_PIO + 7);
		if(tmpword & 0x40){
			serial_write_string("[Drive Test] Found primary master by ATAPIO (atp0).\n");
			drive_t temp;
			temp.drive_number = 0;
			temp.drive_controller = PRIMARY_ATA_PIO;
			temp.drive_type = 1;
			memcpy(temp.graduation, "atp", 1, 4);
			drive_list_buffer[current_drive_index] = temp;
			current_drive_index++;
		}
		outb(PRIMARY_ATA_PIO + 6, 0xb0);
		basic_sleep(2);
		tmpword = inb(PRIMARY_ATA_PIO + 7);
		if(tmpword & 0x40){
			serial_write_string("[Drive Test] Found primary slave by ATAPIO (atp1).\n");
			drive_t temp;
			temp.drive_number = 1;
			temp.drive_controller = PRIMARY_ATA_PIO;
			temp.drive_type = 1;
			memcpy(temp.graduation, "atp", 1, 4);
			drive_list_buffer[current_drive_index] = temp;
			current_drive_index++;
		}
	}
	if(is_secondary_avaliable){
		outb(SECONDARY_ATA_PIO + 6, 0xa0);
		basic_sleep(2);
		uint16_t tmpword = inb(SECONDARY_ATA_PIO + 7);
		if(tmpword & 0x40){
			serial_write_string("[Drive Test] Found secondary master by ATAPIO (atp2).\n");
			drive_t temp;
			temp.drive_number = 0;
			temp.drive_controller = SECONDARY_ATA_PIO;
			temp.drive_type = 1;
			memcpy(temp.graduation, "atp", 1, 4);
			drive_list_buffer[current_drive_index] = temp;
			current_drive_index++;
		}
		outb(SECONDARY_ATA_PIO + 6, 0xb0);
		basic_sleep(2);
		tmpword = inb(SECONDARY_ATA_PIO + 7);
		if(tmpword & 0x40){
			serial_write_string("[Drive Test] Found secondary slave by ATAPIO (atp3).\n");
			drive_t temp;
			temp.drive_number = 1;
			temp.drive_controller = SECONDARY_ATA_PIO;
			temp.drive_type = 1;
			memcpy(temp.graduation, "atp", 1, 4);
			drive_list_buffer[current_drive_index] = temp;
			current_drive_index++;
		}
	}
	drive_t temp;
	temp.drive_controller = 0;
	temp.drive_number = 0;
	temp.drive_type = 0;
	drive_list_buffer[current_drive_index] = temp;
	current_drive_index++;
}

uint64_t filename_hash(const char *filename){
	uint64_t ret = 0;
	uint64_t highorder = 0;
	for(uint32_t i = 0; i < strlen(filename); i++){
		highorder = ret & 0xf8000000;
		ret <<= 5;
		ret ^= (highorder >> 27);
		ret ^= (uint64_t)filename[i];
	}
	return ret;
}

void expect(int cond, const char *msg){
	if(!cond){
		serial_write_string("ERROR: ");
		serial_write_string(msg);
		serial_write_char('\n');
		hang();
	}
}

drive_t drives[256];
TUFS1FILEALLOC rootdiralloc;
TUFS1FILEALLOC systemalloc;
TUFS1FILEALLOC kernel___bin_alloc;

void read_drive_sector(drive_t drive, uint64_t lba, void *buffer){
	if(strzcmp(drive.graduation, "atp")){
		read_lba48((uint16_t)drive.drive_controller, (uint8_t)drive.drive_number, lba, buffer);
	}
	else if(strzcmp(drive.graduation, "fld")){
		// TODO: Implement floppy disk DMA.
	}
}

drive_t drive;

TUFS1FILEALLOC tmp;

TUFS1DATASECT datsec;

#define MMAP_TERMINATE 0
#define MMAP_USABLE 1
#define MMAP_FIRMWARE 2
#define MMAP_IO 3

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

extern void jmpkernel(void);

extern kernel_header_struct_t khs;

uint64_t kernel_pml4_table = 0x1000;
uint64_t kernel_pml3_table = 0x2000;

void usave(uint32_t addr, uint32_t data){
	asm volatile(
		"mov dword ptr [eax], ebx\n"
		::
		"a" (addr),
		"b" (data)
	);
}

#include <multiboot.h>
#include <stdarg.h>

char *strrev(char *input, char *output){
	uint64_t len = strlen(input);
	uint64_t i = 0;
	uint64_t z = len;
	for(; i < len; i++){
		output[i] = input[z - 1];
		z--;
	}
	output[i] = '\0';
	return output;
}

const char *ntoh = "0123456789abcdef";

char *u64toh(uint64_t value, char *buffer){
	static char buffer_n[17];
	uint64_t i = 0;
	for(; value != 0; i++){
		buffer_n[i] = ntoh[(value % 16)];
		value /= 16;
	}
	buffer_n[i] = '\0';
	strrev(buffer_n, buffer);
	return buffer;
}

char *u64tos(uint64_t value, char *buffer){
	static char buffer_n[21];
	uint64_t i = 0;
	for(; value != 0; i++){
		buffer_n[i] = ntoh[(value % 10)];
		value /= 10;
	}
	buffer_n[i] = '\0';
	strrev(buffer_n, buffer);
	return buffer;
}

void kernel_printf(const char *format, ...){ // note: works over serial, todo: implement working through the display
	va_list args;
	va_start(args, format);
	uint64_t len = strlen(format);
	for(uint64_t i = 0; i < len; i++){
		switch(format[i]){
			case '%':
				i++;
				if(i >= len){
					serial_write_char('%');
					break;
				}
				switch(format[i]){
					case '%':
						serial_write_char('%');
						break;
					case 'c':
						char c = (char)va_arg(args, int);
						serial_write_char(c);
						break;
					case 's':
						char *s = va_arg(args, char *);
						serial_write_string(s);
						break;
					case 'u':
						uint64_t u = va_arg(args, uint64_t);
						char buffer_u[21];
						serial_write_string(u64tos(u, buffer_u));
						break;
					case 'x':
						uint64_t x = va_arg(args, uint64_t);
						char buffer_x[17];
						serial_write_string(u64toh(x, buffer_x));
						break;
					default:
						serial_write_char(format[i]);
						break;
				}
				break;
			default:
				serial_write_char(format[i]);
				break;
		}
	}
}

void boot_main(uint32_t *multibootinfo){
	init_serial();
	serial_write_string("Serial initialised.\n");
	serial_write_string("Boot manager executing start successefull.\n");
	boot_mmap_entry_t mmap[256];
	uint64_t mem_size = 0;
	multiboot_info_t *mbd = (multiboot_info_t *)multibootinfo;
	for(uint32_t i = 0; i < (mbd->mmap_length - sizeof(multiboot_memory_map_t)); i += sizeof(multiboot_memory_map_t)){
		multiboot_memory_map_t *mmmt = (multiboot_memory_map_t *)(mbd->mmap_addr + i);
		uint64_t addr = mmmt->addr;
		uint64_t len = mmmt->len;
		mmap[(i / sizeof(multiboot_memory_map_t))].baseaddr = addr;
		mmap[(i / sizeof(multiboot_memory_map_t))].size = len;
		mmap[(i / sizeof(multiboot_memory_map_t))].type = mmmt->type;
		if(i == ((mbd->mmap_length - (2 * sizeof(multiboot_memory_map_t))))){
			mem_size = addr + len;
		}
	}
	mmap[(mbd->mmap_length / sizeof(multiboot_memory_map_t))].type = 0;
	// load lfb, width, height, and bpp
	uint64_t lfb = ((uint64_t)multibootinfo[22]) | (((uint64_t)multibootinfo[23]) << 32);
	uint32_t lfb_width = multibootinfo[100/4];
	uint32_t lfb_height = multibootinfo[104/4];
	uint8_t lfb_bpp = (uint8_t)multibootinfo[108/4];
	// get boot device (device with a valid mbr, mbr entry[any].mbr_entry_type == 0x89 (MBR_TETHERED_OS_SYSTEM))
	getdrivelist(drives, 256);
	uint32_t drives_length = 0;
	for(; drives[drives_length].drive_type != 0; drives_length++);
	uint64_t partition_start_lba = 0;
	uint64_t partition_number = 0;
	for(uint32_t drive_index = 0; drive_index < drives_length; drive_index++){
		if(drives[drive_index].drive_type == 1){
			read_drive_sector(drives[drive_index], 0, &bs);
			if(bs.bootsig == 0xaa55){
				for(uint32_t mbr_index = 0; mbr_index < 4; mbr_index++){
					if(bs.mbr.entries[mbr_index].type == 0x89){
						partition_start_lba = (uint64_t)bs.mbr.entries[mbr_index].lbastart;
						partition_number = mbr_index;
						serial_write_string("Found valid MBR with mbr entry type 0x89 (MBR_TETHERED_OS_SYSTEM) on drive and partition ");
						serial_write_string(drives[drive_index].graduation);
						serial_write_char(((uint8_t)drives[drive_index].drive_number) + '0');
						serial_write_string("p");
						serial_write_char(((uint8_t)partition_number) + '0');
						serial_write_string(".\n");
						drive = drives[drive_index];
						break;
					}
				}
			}
		}
		if(partition_start_lba != 0){
			break;
		}
	}
	if(partition_start_lba == 0){
		serial_write_string("[FATAL ERROR] Fatal error: No partition in MBR found with marked partition type needed of MBR_TETHERED_OS_SYSTEM (0x89).\n");
		hang();
	}
	// load tufs header
	read_drive_sector(drive, partition_start_lba+1, &fs_header);
	if(!memcmp(fs_header.Sig, "TUFS", 4)){
		serial_write_string("[FATAL ERROR] Fatal error: MBR_TETHERED_OS_SYSTEM marked partition invalide filesystem format (expected TUFS).\n");
		hang();
	}
	// locate kernel (/system/kernel.bin)
	const char *fname_lookup_1 = "system";
	const char *fname_lookup_2 = "kernel.bin";
	uint64_t fname_lookup_hash_1 = filename_hash(fname_lookup_1);
	uint64_t fname_lookup_hash_2 = filename_hash(fname_lookup_2);
	// locate file system marked as a directory in the root directory
	uint64_t rootdirlba = fs_header.RDSect;
	read_drive_sector(drive, rootdirlba, &rootdiralloc);
	if(rootdiralloc.FSIBytes == 0){
		serial_write_string("[FATAL ERROR] Fatal error: MBR_TETHERED_OS_SYSTEM marked partition formatted with TUFS contains no files in it's root directory, it is not possible to access the kernel.\n");
		hang();
	}
	uint64_t current_lba = rootdiralloc.FSSect;
	uint64_t systemalloc_lba = 0;
	read_drive_sector(drive, rootdiralloc.FSSect, &systemalloc);
	for(uint64_t fentry = 0; fentry < rootdiralloc.FSIBytes; fentry++){
		if(systemalloc.FNHash == fname_lookup_hash_1){
			if(strzcmp((char *)systemalloc.FName, fname_lookup_1)){
				if(!(systemalloc.FAttributes & directory)){
					serial_write_string("[FATAL ERROR] Fatal error: 'system' file on root is not a directory and therefore the kernel cannot be accessed.\n");
					hang();
				}
				if(systemalloc.FSIBytes == 0){
					serial_write_string("[FATAL ERROR] Fatal error: 'system' directory on root contains no file entries and as such the kernel cannot be located.\n");
					hang();
				}
				serial_write_string("[Kernel Location] 'system' directory on root successefully located.\n");
				systemalloc_lba = systemalloc.FSSect;
				break;
			}
		}
		current_lba = systemalloc.NFIDSect;
		read_drive_sector(drive, systemalloc.NFIDSect, &systemalloc);
	}
	// locate the file kernel.bin
	current_lba = systemalloc_lba;
	uint64_t kernel___bin_lba = 0;
	read_drive_sector(drive, current_lba, &kernel___bin_alloc);
	for(uint64_t fentry = 0; fentry < systemalloc.FSIBytes; fentry++){
		if(kernel___bin_alloc.FNHash == fname_lookup_hash_2){
			if(strzcmp((char *)kernel___bin_alloc.FName, fname_lookup_2)){
				if(kernel___bin_alloc.FAttributes & directory){
					serial_write_string("[FATAL ERROR] Fatal error: 'kernel.bin' directory on 'system' on root is not a file and therefore the kernel cannot be accessed.\n");
					hang();
				}
				if(kernel___bin_alloc.FSIBytes == 0){
					serial_write_string("[FATAL ERROR] Fatal error: 'kernel.bin' file on 'system' on root has a size of zero and as such the kernel cannot be loaded.\n");
					hang();
				}
				serial_write_string("[Kernel Location] 'kernel.bin' file on 'system' on root successefully located.\n");
				kernel___bin_lba = current_lba;
				break;
			}
		}
		current_lba = kernel___bin_alloc.NFIDSect;
		read_drive_sector(drive, kernel___bin_alloc.NFIDSect, &kernel___bin_alloc);
	}
	if(kernel___bin_lba == 0){
		serial_write_string("[FATAL ERROR] Fatal error: 'kernel.bin' file on 'system' on root does not exist and as such the kernel cannot be located.\n");
		hang();
	}
	// load the kernel into memory address 0x7e00
	uint8_t *kernel_load_point = (uint8_t *)0x7e00;
	uint32_t load_index = 0;
	read_drive_sector(drive, kernel___bin_lba, &tmp);
	if(tmp.FSIBytes != 0){
		uint32_t fsize = tmp.FSIBytes;
		uint32_t excess = fsize % 503;
		uint32_t current_fsize = fsize - excess;
		read_drive_sector(drive, tmp.FSSect, &datsec);
		if(current_fsize == 0){
			for(uint32_t i = 0; i < excess; i++){
				kernel_load_point[load_index] = datsec.FRFData[i];
				load_index++;
			}
		}
		else{
			for(uint32_t i = 0; i < 503; i++){
				kernel_load_point[load_index] = datsec.FRFData[i];
				load_index++;
			}
			current_fsize -= 503;
			while(1){
				read_drive_sector(drive, datsec.NFRSect, &datsec);
				if(current_fsize == 0){
					for(uint32_t i = 0; i < excess; i++){
						kernel_load_point[load_index] = datsec.FRFData[i];
						load_index++;
					}
					break;
				}
				else{
					for(uint32_t i = 0; i < 503; i++){
						kernel_load_point[load_index] = datsec.FRFData[i];
						load_index++;
					}
					current_fsize -= 503;
				}
			}
		}
	}
	serial_write_string("Successefully loaded kernel at address 0x7e00.\n");
	serial_write_string("Identity mapping the first 1 GiB...\n");
	for(uint32_t i = 0; i < 4096; i++){
		usave(0x1000 + (i * 4), 0);
	}
	#define PML_XD 1 << 63
	#define PML_PS 1 << 7
	#define PML_A 1 << 5
	#define PML_PCD 1 << 4
	#define PML_PWT 1 << 3
	#define PML_US 1 << 2
	#define PML_RW 1 << 1
	#define PML_P 1 << 0
	usave((uint32_t)kernel_pml4_table, 0x2003);
	usave((uint32_t)kernel_pml3_table, 0 | PML_P | PML_RW | PML_PS);
	serial_write_string("Jumping to kernel bootstrap...\n");
	// load kernel header struct then jump to kernel
	khs.bootdevice = drive;
	khs.lfb = lfb;
	khs.lfb_bpp = lfb_bpp;
	khs.lfb_height = lfb_height;
	khs.lfb_width = lfb_width;
	khs.mem_size = mem_size;
	asm volatile("rep movsd" :: "S" ((uint32_t)(&mmap[0])), "D" ((uint32_t)(&khs.boot_mmap[0])), "c" (256));
	jmpkernel();
}
