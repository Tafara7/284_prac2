    ; ==========================
    ; Group member 01: Tinotenda_Chirozvi_22547747
    ; Group member 02: Tafara_Hwata_22565991
    ; Group member 03: Devan_Dewet_05169098
    ; ==========================


section .data
    extern call_strtof
    float_zero: dd 0.0

section .text
    global convertStringToFloat

convertStringToFloat:
    push rbp
    mov rbp, rsp

    ; Directly load address into rdi
    mov rdi, [rbp+16]

    xor rax, rax
    call call_strtof

    ; Check conversion
    movaps xmm1, [float_zero]
    ucomiss xmm0, xmm1
    jne .conversion_success

    movss xmm0, [float_zero]

.conversion_success:
    mov rsp, rbp
    pop rbp
    ret