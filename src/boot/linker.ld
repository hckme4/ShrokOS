/* Bootloader looks at this and starts at defined entry point */
ENTRY(_start)

/* Tell where various sections of object files will be put in final kernel image */
SECTIONS
{
	. = 2M;

	/* put multiboot header, required early in image. */
	.text BLOCK(4K) : ALIGN(4K)
	{
		*(.multiboot)
		*(.text)
	}

	/* Read only data */
	.rodata BLOCK(4K) : ALIGN(4K)
	{
		*(.rodata)
	}

	/* read write data (initted) */
	.data BLOCK(4K) : ALIGN(4K)
	{
		*(.data)
	}

	.bss BLOCK(4K) : ALIGN(4K)
	{
		*(COMMON)
		*(.bss)
	}

	/* if compiler produces other sections, update this as needed! */
}
