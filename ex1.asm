;; Hello x86 assembly world 
;; With x86 cdecl ABI

        global _start
          
        section .data
        msg db "Hello World", 0xa

        
        section .text

_start:
        call main

        mov ebx, eax            ; Get status code
        mov eax, 1              ; Syscall exit
        int 0x80                
main:
        push ebp                ; Prologue
        mov ebp, esp

        push 12                 ; Push arguments
        push msg
        push 1
        call write              ; Call funtion
        
        add esp, 3*4            ; Clean stack
        mov eax, 0              ; Exit status

        mov esp, ebp            ; Epilogue
        pop ebp

        ret                     

write:
        push ebp                ; Prologue
        mov ebp, esp
         
        push ebx                ; Non-volatile

        mov ebx, [esp+12]       ; file descriptor
        mov ecx, [esp+16]       ; start address
        mov edx, [esp+20]       ; how many bytes
        mov eax, 4              ; syscall write 
        int 0x80                ; perform syscall

        pop ebx

        mov esp, ebp            ;Epilogue
        pop ebp
        ret
