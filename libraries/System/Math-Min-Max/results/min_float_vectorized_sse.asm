; Assembly listing for method Math_Min_Max.Program:Do(float,float):float
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T01] (  3,  3   )   float  ->  mm0
;  V01 arg1         [V01,T02] (  3,  3   )   float  ->  mm1
;# V02 OutArgs      [V02    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V03 tmp1         [V03,T07] (  2,  2   )   float  ->  mm0         "Inline return value spill temp"
;  V04 tmp2         [V04,T00] (  7,  7   )  simd16  ->  mm0         "Inline stloc first use temp"
;  V05 tmp3         [V05,T03] (  4,  4   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V06 tmp4         [V06,T04] (  4,  4   )  simd16  ->  mm2         "Inline stloc first use temp"
;  V07 tmp5         [V07,T08] (  2,  2   )  simd16  ->  mm3         "Inline stloc first use temp"
;  V08 tmp6         [V08,T05] (  4,  4   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V09 tmp7         [V09,T06] (  3,  3   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V10 tmp8         [V10,T09] (  2,  2   )  simd16  ->  mm2         "Inline stloc first use temp"
;
; Lcl frame size = 0

G_M34552_IG01:
       C5F877               vzeroupper
                        ;; bbWeight=1    PerfScore 1.00
G_M34552_IG02:
       C5FA5DD1             vminss   xmm2, xmm0, xmm1
       C5FAC2D900           vcmpss   xmm3, xmm0, xmm1, 0
       C5F856C9             vorps    xmm1, xmm0, xmm1
       C5F054CB             vandps   xmm1, xmm1, xmm3
       C5E856D1             vorps    xmm2, xmm2, xmm1
       C5FAC2C803           vcmpss   xmm1, xmm0, xmm0, 3
       C5F055D2             vandnps  xmm2, xmm1, xmm2
       C5F054C0             vandps   xmm0, xmm1, xmm0
       C5F856C2             vorps    xmm0, xmm0, xmm2
                        ;; bbWeight=1    PerfScore 11.00
G_M34552_IG03:
       C3                   ret
                        ;; bbWeight=1    PerfScore 1.00

; Total bytes of code 42, prolog size 3, PerfScore 18.10, (MethodHash=1ab87907) for method Math_Min_Max.Program:Do(float,float):float
; ============================================================

