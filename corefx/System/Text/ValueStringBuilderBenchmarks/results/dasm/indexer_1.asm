; Assembly listing for method Program:Do(struct,int):byref
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 arg0         [V00    ] (  1,  1   )  struct (32) [rsp+0x08]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V01 arg1         [V01,T01] (  3,  3   )     int  ->  rdi        
;# V02 OutArgs      [V02    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;* V03 tmp1         [V03    ] (  0,  0   )  struct (16) zero-ref   
;* V04 tmp2         [V04    ] (  0,  0   )  struct ( 8) zero-ref    ld-addr-op
;* V05 tmp3         [V05    ] (  0,  0   )   byref  ->  zero-ref   
;  V06 tmp4         [V06,T02] (  2,  2   )   byref  ->  rsi         V03._pointer(offs=0x00) P-INDEP
;* V07 tmp5         [V07    ] (  0,  0   )     int  ->  zero-ref    V03._length(offs=0x08) P-INDEP
;* V08 tmp6         [V08    ] (  0,  0   )   byref  ->  zero-ref    V04._value(offs=0x00) P-INDEP
;  V09 tmp7         [V09,T00] (  3,  6   )   byref  ->  rax        
;
; Lcl frame size = 0

G_M56186_IG01:

G_M56186_IG02:
       488D442418           lea      rax, bword ptr [rsp+18H]
       488B30               mov      rsi, bword ptr [rax]
       8B4008               mov      eax, dword ptr [rax+8]
       4863C7               movsxd   rax, edi
       488D0446             lea      rax, bword ptr [rsi+2*rax]

G_M56186_IG03:
       C3                   ret      

; Total bytes of code 19, prolog size 0 for method Program:Do(struct,int):byref
; ============================================================
