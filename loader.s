global loader

MAGIC_NUMBER equ 0x1BADB002     ; DEFINE THE MAGIC NUMBER CONSTANT
FLAGS        equ 0x0            ; multiboot flags
CHECKSUM     equ -MAGIC_NUMBER  ; calc checksum

KERNEL_STACK_SIZE equ 4096                  ; size of stack in bytes

section .bss                                ; static variables 
align 4                                     ; align at 4 bytes
kernel_stack:                               ; label points to beginning of memory
    resb KERNEL_STACK_SIZE                  ; reserve stack for the kernel

section .text:                  ; start of the code section
align 4
    dd MAGIC_NUMBER             ; writes the magic number to the machine code,
    dd FLAGS                    ; flags,
    dd CHECKSUM                 ; and the checksum

loader:
    mov esp, kernel_stack + KERNEL_STACK_SIZE   ; point esp to the start of the
                                                ; stack (end of memory area)
    mov eax, 0xCAFEBABE         ; the loader label (entry point for linker script)

.loop:
  jmp .loop                     ; loop 5evr
