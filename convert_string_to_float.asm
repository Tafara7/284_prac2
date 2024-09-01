section .data
    global convertStringToFloat
    errno dd 0

section .bss
    endPtr resq 1

section .text
    extern strtof
    extern __errno_location

convertStringToFloat:

    xorps xmm0, xmm0

    ; Call strtof
    lea rsi, [endPtr]  
    mov rdi, rdi       
    call strtof

    ; Store the result in xmm0
    movaps xmm0, xmm0

    call __errno_location
    mov rax, [rax]
    test eax, eax      
    jnz .error         ;

    ; Return the result
    ret

.error:
    xorps xmm0, xmm0
    ret