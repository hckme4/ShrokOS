/* constants for the multiboot header. */
.set ALIGN,    1<<0             /* align loaded modules on page boundaries */
.set MEMINFO,  1<<1             /* provide memory map */
.set FLAGS,    ALIGN | MEMINFO  /* this is the Multiboot 'flag' field */
.set MAGIC,    0x1BADB002       /* 'magic number' lets bootloader find the header */
.set CHECKSUM, -(MAGIC + FLAGS) /* checksum of above, to prove we are multiboot */

/* 
Declare multiboot header to mark program as a kernel
*/
.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

/*
Since value of esp is not defined, kernel must provide a stack
*/
.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top:

/*
linker script to specify _start as entry to kernel. bootloader will jump here when
kernel has been loaded. no need to ret since bootloader has been unloaded.
*/
.section .text
.global _start
.type _start, @function
_start:
	/*
	now loaded into 32 bit protected mode, must set up stack for C later on.
	*/
	mov $stack_top, %esp

	/*
	THIS PLACE IS GOOD SPOT TO INIT CPU STATE BEFORE ENTERING HIGH-LEVEL KERNEL CODE
	*/

	/*
	Enter high level kernel, depending on initialized stack performed earlier
	*/
	call kernel_main

	/*
	if system has nothing else, disable interrupts, HLT, and force jumping to HLT if skipped.
	*/
	cli
1:	hlt
	jmp 1b

/*
Set the size of the _start symbol to the current location '.' minus its start.
This is useful when debugging or when you implement call tracing.
*/
.size _start, . - _start
