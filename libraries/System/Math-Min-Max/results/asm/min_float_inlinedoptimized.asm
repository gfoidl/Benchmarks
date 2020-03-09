; Assembly listing for method Math_Min_Max.Program:Do(float,float):float
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T03] (  3,  3   )   float  ->  mm0
;  V01 arg1         [V01,T02] (  5,  3.50)   float  ->  mm1
;# V02 OutArgs      [V02    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V03 tmp1         [V03,T01] (  8,  8.50)   float  ->  mm0         "Inlining Arg"
;  V04 tmp2         [V04,T00] (  2,  0.50)     int  ->  rax         "Inline return value spill temp"
;* V05 tmp3         [V05    ] (  0,  0   )   float  ->  zero-ref    ld-addr-op "Inlining Arg"
;
; Lcl frame size = 0

G_M34552_IG01:
       55                   push     rbp
       C5F877               vzeroupper
       488BEC               mov      rbp, rsp
                        ;; bbWeight=1    PerfScore 2.25
G_M34552_IG02:
       C5F82EC8             vucomiss xmm1, xmm0
       7724                 ja       SHORT G_M34552_IG05
                        ;; bbWeight=1    PerfScore 2.00
G_M34552_IG03:
       C5F82EC0             vucomiss xmm0, xmm0
       7A1D                 jp       SHORT G_M34552_IG05
       C5F82EC1             vucomiss xmm0, xmm1
       7A12                 jp       SHORT G_M34552_IG04
       7510                 jne      SHORT G_M34552_IG04
       C5F828D0             vmovaps  xmm2, xmm0
       C5F97ED0             vmovd    eax, xmm2
       85C0                 test     eax, eax
       7C09                 jl       SHORT G_M34552_IG05
                        ;; bbWeight=0.25 PerfScore 1.88
G_M34552_IG04:
       C5F828C1             vmovaps  xmm0, xmm1
                        ;; bbWeight=0.25 PerfScore 0.06
G_M34552_IG05:
       5D                   pop      rbp
       C3                   ret
                        ;; bbWeight=1    PerfScore 1.50

; Total bytes of code 45, prolog size 7, PerfScore 12.79, (MethodHash=1ab87907) for method Math_Min_Max.Program:Do(float,float):float
; ============================================================

