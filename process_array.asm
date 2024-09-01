; ==========================
; Group member 01: Tinotenda_Chirozvi_22547747
; Group member 02: Tafara_Hwata_22565991
; Group member 03: Devan_Dewet_05169098
; ==========================

section .text
    global processArray

processArray:
    push   rbp
    mov    rbp,rsp
    mov    QWORD [rbp-0x18],rdi
    mov    DWORD [rbp-0x1c],esi
    pxor   xmm0,xmm0
    movsd  QWORD [rbp-0x8],xmm0
    mov    DWORD [rbp-0xc],0x0
    jmp    .j1
  .j2:
    mov    eax,DWORD [rbp-0xc]
    cdqe
    lea    rdx,[rax*4+0x0]
    mov    rax,QWORD [rbp-0x18]
    add    rax,rdx
    movss  xmm0,DWORD [rax]
    pxor   xmm1,xmm1
    cvtss2sd xmm1,xmm0
    mov    eax,DWORD [rbp-0xc]
    cdqe
    add    rax,0x1
    lea    rdx,[rax*4+0x0]
    mov    rax,QWORD [rbp-0x18]
    add    rax,rdx
    movss  xmm0,DWORD [rax]
    cvtss2sd xmm0,xmm0
    mulsd  xmm0,xmm1
    movsd  xmm1,QWORD [rbp-0x8]
    addsd  xmm0,xmm1
    movsd  QWORD [rbp-0x8],xmm0
    add    DWORD [rbp-0xc],0x1
  .j1:
    mov    eax,DWORD [rbp-0x1c]
    sub    eax,0x1
    cmp    DWORD [rbp-0xc],eax
    jl     .j2
    mov    eax,DWORD [rbp-0x1c]
    cdqe
    shl    rax,0x2
    lea    rdx,[rax-0x4]
    mov    rax,QWORD [rbp-0x18]
    add    rax,rdx
    movss  xmm0,DWORD [rax]
    cvtss2sd xmm0,xmm0
    movsd  xmm1,QWORD [rbp-0x8]
    addsd  xmm0,xmm1
    movsd  QWORD [rbp-0x8],xmm0
    movsd  xmm0,QWORD [rbp-0x8]
    movq   rax,xmm0
    movq   xmm0,rax
    pop    rbp
    ret