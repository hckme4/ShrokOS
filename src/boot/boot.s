; Constants for multiboot header
.set ALIGN,     1<<0                 ; align all loaded modules on page boundaries
.set MEMINFO,   1<<1                 ; memory map
.set FLAGS,     ALIGN | MEMINFO      ; multiboot 'flag' field
.set MAGIC,     0x1BADB002           ; 'magic number' to find the header
.set CHECKSUM,  -(MAGIC + FLAGS)     ; checksum all this as proof we are multiboot

; Declare multiboot header to mark program as a kernel
.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

; since value of esp is not defined, kernel must provide a stack.
.section .bss
.align 16
stack_bottom:
.skip 16384 ;16 KiB
stack_top:

; linker script to specify _start as entry to kernel. bootloader will jump here
; when kernel has been loaded. no need to ret since bootloader has been unloaded
.section .text
.global _start
.type _start, @function
_start:
	; now loaded into 32-bit protected mode. must set up stack for C later on.
	mov $stack_top, %esp

	; THIS PLACE IS A GOOD SPOT TO INIT THE CPU STATE BEFORE ENTERING HIGH-LEVEL
	; KERNEL CODE!!!

	; Enter the high level kernel, depending on the stack we init'ed earlier.
	call kernel_main

	;if nothing else, disable interrupts, HLT computer and force jumping to HLT if skipped
	cli
1:	hlt
	jmp 1b

; set size of _start symbol to current location '.' minus its start for debugging and call tracing
.size _start, . - _start

