section .text

global gdt_flush
gdt_flush:
    mov eax, [esp + 4]
    lgdt [eax]

    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov ss, ax
    mov gs, ax
    jmp 0x08:._gdt_flush
    
._gdt_flush:
    ret

global load_idt
load_idt:
    mov eax, [esp + 4]
    lidt [eax]
    ret

global paging_enable
paging_enable:
    mov eax, cr0
    or eax, 0x80000000
    mov cr0, eax
    ret