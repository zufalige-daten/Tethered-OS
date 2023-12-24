ENTRY(_start)
addr = 0x7e00;
bss_addr = 0x100000;
SECTIONS{
	.text addr : AT(addr) {
		code = .;
		*(.text)
		*(.rodata)
		. = ALIGN(4096);
	}
	.data : AT(addr + (data - code)) {
		data = .;
		*(.data)
		. = ALIGN(4096);
		kernel_end = .;
	}
	.bss : AT(bss_addr){
		. = bss_addr;
		bss = .;
		bss_start = .;
		*(.bss)
		. = ALIGN(4096);
		pmemmap_start = .;
		bss_end = .;
	}
}
