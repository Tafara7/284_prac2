    section .data
        extern call_strtof  ;
        float_zero: dd 0.0  ; 

    section .text
        global convertStringToFloat

    convertStringToFloat:

        ; Set up the stack frame
        push rbp                ; Save base pointer
        mov rbp, rsp            ; Set stack pointer as  new base pointer

    
        mov rdi, [rbp+16]       ; Move the string pointer (str) into rdi
        xor rax, rax            ; Clear rax 


        call call_strtof       

        ; Check if the conversion succeeded

        movaps xmm1, [float_zero] ; Load 0.0 into xmm1
        ucomiss xmm0, xmm1      ; Compare xmm0 with xmm1 (0.0)
        jne .conversion_success ; If not equal (zero), conversion succeeded

        ; Handle failure
        movss xmm0, [float_zero] ; Load 0.0 into xmm0

    .conversion_success:
        ; Clean up
        mov rsp, rbp            ; Restore stack pointer
        pop rbp                 ; Restore base pointer

        ret                     ;
