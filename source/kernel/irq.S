extern irq_handler

%macro IRQ_NAME 1
dd irq%1
%endmacro

%macro IRQ 1
irq%1:
    push 0
    push %1
    jmp irq_common
%endmacro

irq_common:
    pushad

    push ds
    push es
    push fs
    push gs 

    push ebx
    mov bx,0x10 ; load the kernel code segment
    mov ds,bx
    pop ebx

    mov eax, esp
    push esp

    call irq_handler

    mov esp, eax

    pop gs
    pop fs
    pop es
    pop ds

    popad
    
    add esp, 8 ; pop errcode and int number
    
    iret

IRQ 0 
IRQ 1 
IRQ 2 
IRQ 3 
IRQ 4 
IRQ 5 
IRQ 6 
IRQ 7 
IRQ 8 
IRQ 9 
IRQ 10
IRQ 11
IRQ 12
IRQ 13
IRQ 14
IRQ 15

global irq_vector
irq_vector:
    IRQ_NAME 0
    IRQ_NAME 1
    IRQ_NAME 2
    IRQ_NAME 3
    IRQ_NAME 4
    IRQ_NAME 5
    IRQ_NAME 6
    IRQ_NAME 7
    IRQ_NAME 8
    IRQ_NAME 9
    IRQ_NAME 10
    IRQ_NAME 11
    IRQ_NAME 12
    IRQ_NAME 13
    IRQ_NAME 14
    IRQ_NAME 15
