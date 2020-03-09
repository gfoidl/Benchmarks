; Assembly listing for method Math_Min_Max.Program:Do(double,double):double
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T00] (  3,  3   )  double  ->  mm0
;  V01 arg1         [V01,T01] (  3,  3   )  double  ->  mm1
;# V02 OutArgs      [V02    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;
; Lcl frame size = 8

G_M19037_IG01:
       50                   push     rax
       C5F877               vzeroupper
                        ;; bbWeight=1    PerfScore 2.00
G_M19037_IG02:
       E847FCFFFF           call     Math_Min_Max.Variants.Default:Min(double,double):double
       90                   nop
                        ;; bbWeight=1    PerfScore 1.25
G_M19037_IG03:
       4883C408             add      rsp, 8
       C3                   ret
                        ;; bbWeight=1    PerfScore 1.25

; Total bytes of code 15, prolog size 4, PerfScore 6.00, (MethodHash=649cb5a2) for method Math_Min_Max.Program:Do(double,double):double
; ============================================================

; Assembly listing for method Math_Min_Max.Variants.Default:Min(double,double):double
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T00] (  9,  6   )  double  ->  mm0
;  V01 arg1         [V01,T01] (  6,  4.50)  double  ->  mm1
;# V02 OutArgs      [V02    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V03 tmp1         [V03,T02] (  2,  2   )  double  ->  [rbp-0x08]   do-not-enreg[F] ld-addr-op "Inlining Arg"
;
; Lcl frame size = 16

G_M22761_IG01:
       55                   push     rbp
       4883EC10             sub      rsp, 16
       C5F877               vzeroupper
       488D6C2410           lea      rbp, [rsp+10H]
                        ;; bbWeight=1    PerfScore 2.75
G_M22761_IG02:
       C5F92EC8             vucomisd xmm1, xmm0
       770A                 ja       SHORT G_M22761_IG04
                        ;; bbWeight=1    PerfScore 2.00
G_M22761_IG03:
       C5F92EC0             vucomisd xmm0, xmm0
       7A03                 jp       SHORT G_M22761_IG04
       7407                 je       SHORT G_M22761_IG05
                        ;; bbWeight=0.50 PerfScore 1.50
G_M22761_IG04:
       488D6500             lea      rsp, [rbp]
       5D                   pop      rbp
       C3                   ret
                        ;; bbWeight=0.50 PerfScore 1.00
G_M22761_IG05:
       C5F92EC1             vucomisd xmm0, xmm1
       7A21                 jp       SHORT G_M22761_IG08
       751F                 jne      SHORT G_M22761_IG08
       C5FB1145F8           vmovsd   qword ptr [rbp-08H], xmm0
       48837DF800           cmp      qword ptr [rbp-08H], 0
       7C0D                 jl       SHORT G_M22761_IG07
       C5F828C1             vmovaps  xmm0, xmm1
                        ;; bbWeight=0.50 PerfScore 2.88
G_M22761_IG06:
       488D6500             lea      rsp, [rbp]
       5D                   pop      rbp
       C3                   ret
                        ;; bbWeight=0.50 PerfScore 1.00
G_M22761_IG07:
       488D6500             lea      rsp, [rbp]
       5D                   pop      rbp
       C3                   ret
                        ;; bbWeight=0.50 PerfScore 1.00
G_M22761_IG08:
       C5F828C1             vmovaps  xmm0, xmm1
                        ;; bbWeight=0.50 PerfScore 0.12
G_M22761_IG09:
       488D6500             lea      rsp, [rbp]
       5D                   pop      rbp
       C3                   ret
                        ;; bbWeight=0.50 PerfScore 1.00

; Total bytes of code 79, prolog size 13, PerfScore 21.75, (MethodHash=3a65a716) for method Math_Min_Max.Variants.Default:Min(double,double):double
; ============================================================

