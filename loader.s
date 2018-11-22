global loader

MAGIC_NUMBER equ 0x1BADB002     ; DEFINE THE MAGIC NUMBER CONSTANT
FLAGS        equ 0x0            ; multiboot flags
CHECKSUM     equ -MAGIC_NUMBER  ; calc checksum


section .text:                  ; start of the code section
align 4
    dd MAGIC_NUMBER             ; writes the magic number to the machine code,
    dd FLAGS                    ; flags,
    dd CHECKSUM                 ; and the checksum

loader:
    mov eax, 0xCAFEBABE         ; the loader label (entry point for linker script)

.loop:
  jmp .loop                     ; loop 5evr
