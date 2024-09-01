section .data
    extern call_strtof
    float_zero: dd 0.0

section .text
    global convertStringToFloat

convertStringToFloat:
  
    push rbp
    mov rbp, rsp

    call call_strtof

    ; check if conversion worked

    pxor xmm1, xmm1          ; Set xmm1 to 0.0 (more efficient than movaps)
    ucomiss xmm0, xmm1       ; Compare xmm0 with 0.0
    jne .conversion_success  ; If not equal (zero), conversion succeeded

  
    movss xmm0, [float_zero] ; Load 0.0 into xmm0

.conversion_success:

    pop rbp

    ret