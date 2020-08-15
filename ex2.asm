    global _start
        
    section .data
    msg db "Hello", 0xa

    
    section .text

_start:
    call main

    mov ebx, eax
    mov eax, 1
    int 0x80
main:
    push    rbp
    mov     rbp, rsp
    mov     edx, 6
    mov     esi, OFFSET FLAT:.LC0
    mov     edi, 1
    call    write
    mov     eax, 0
    pop     rbp
    ret