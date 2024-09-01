section .data
    extern call_strtof
    float_zero: dd 0.0

section .text
    global convertStringToFloat

convertStringToFloat:
    push rbp                ; Save base pointer
    mov rbp, rsp            ; Set base pointer
    
    ; Argument is already in rdi, so no need to move it
    
    call call_strtof        ; Call the C function to convert string to float
    
    ; Check if conversion succeeded
    pxor xmm1, xmm1          ; Set xmm1 to 0.0 efficiently
    ucomiss xmm0, xmm1       ; Compare the result (in xmm0) with 0.0
    jne .conversion_success  ; Jump if xmm0 is not zero

    ; If conversion failed, load 0.0 into xmm0
    movss xmm0, [float_zero]

.conversion_success:
    pop rbp                 ; Restore base pointer
    ret                     ; Return, with xmm0 containing the result
