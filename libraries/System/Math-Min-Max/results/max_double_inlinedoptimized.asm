; Assembly listing for method Math_Min_Max.Program:Do(double,double):double
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T03] (  3,  3   )  double  ->  mm0
;  V01 arg1         [V01,T02] (  5,  3.50)  double  ->  mm1
;# V02 OutArgs      [V02    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V03 tmp1         [V03,T01] (  8,  8.50)  double  ->  mm0         "Inlining Arg"
;  V04 tmp2         [V04,T00] (  2,  0.50)    long  ->  rax         "Inline return value spill temp"
;* V05 tmp3         [V05    ] (  0,  0   )  double  ->  zero-ref    ld-addr-op "Inlining Arg"
;
; Lcl frame size = 0

G_M19037_IG01:
       55                   push     rbp
       C5F877               vzeroupper
       488BEC               mov      rbp, rsp
                        ;; bbWeight=1    PerfScore 2.25
G_M19037_IG02:
       C5F92EC1             vucomisd xmm0, xmm1
       7725                 ja       SHORT G_M19037_IG05
                        ;; bbWeight=1    PerfScore 2.00
G_M19037_IG03:
       C5F92EC0             vucomisd xmm0, xmm0
       7A1E                 jp       SHORT G_M19037_IG05
       C5F92EC1             vucomisd xmm0, xmm1
       7A13                 jp       SHORT G_M19037_IG04
       7511                 jne      SHORT G_M19037_IG04
       C5F828D0             vmovaps  xmm2, xmm0
       C4E1F97ED0           vmovd    rax, xmm2
       4885C0               test     rax, rax
       7D08                 jge      SHORT G_M19037_IG05
                        ;; bbWeight=0.25 PerfScore 1.88
G_M19037_IG04:
       C5F828C1             vmovaps  xmm0, xmm1
                        ;; bbWeight=0.25 PerfScore 0.06
G_M19037_IG05:
       5D                   pop      rbp
       C3                   ret
                        ;; bbWeight=1    PerfScore 1.50

; Total bytes of code 47, prolog size 7, PerfScore 12.89, (MethodHash=649cb5a2) for method Math_Min_Max.Program:Do(double,double):double
; ============================================================

