; Assembly listing for method Math_Min_Max.Program:Do(double,double):double
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T01] (  3,  3   )  double  ->  mm0
;  V01 arg1         [V01,T02] (  3,  3   )  double  ->  mm1
;# V02 OutArgs      [V02    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V03 tmp1         [V03,T07] (  2,  2   )  double  ->  mm0         "Inline return value spill temp"
;  V04 tmp2         [V04,T00] (  7,  7   )  simd16  ->  mm0         "Inline stloc first use temp"
;  V05 tmp3         [V05,T03] (  4,  4   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V06 tmp4         [V06,T04] (  4,  4   )  simd16  ->  mm2         "Inline stloc first use temp"
;  V07 tmp5         [V07,T05] (  3,  3   )  simd16  ->  mm3         "Inline stloc first use temp"
;  V08 tmp6         [V08,T08] (  2,  2   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V09 tmp7         [V09,T09] (  2,  2   )  simd16  ->  mm2         "Inline stloc first use temp"
;  V10 tmp8         [V10,T06] (  3,  3   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V11 tmp9         [V11,T10] (  2,  2   )  simd16  ->  mm2         "Inline stloc first use temp"
;
; Lcl frame size = 0

G_M19037_IG01:
       C5F877               vzeroupper
                        ;; bbWeight=1    PerfScore 1.00
G_M19037_IG02:
       C5FB5FD1             vmaxsd   xmm2, xmm0, xmm1
       C5FBC2D900           vcmpsd   xmm3, xmm0, xmm1, 0
       C5F954C9             vandpd   xmm1, xmm0, xmm1
       C5E155D2             vandnpd  xmm2, xmm3, xmm2
       C5E154C9             vandpd   xmm1, xmm3, xmm1
       C5F156D2             vorpd    xmm2, xmm1, xmm2
       C5FBC2C803           vcmpsd   xmm1, xmm0, xmm0, 3
       C5F155D2             vandnpd  xmm2, xmm1, xmm2
       C5F154C0             vandpd   xmm0, xmm1, xmm0
       C5F956C2             vorpd    xmm0, xmm0, xmm2
                        ;; bbWeight=1    PerfScore 11.33
G_M19037_IG03:
       C3                   ret
                        ;; bbWeight=1    PerfScore 1.00

; Total bytes of code 46, prolog size 3, PerfScore 18.93, (MethodHash=649cb5a2) for method Math_Min_Max.Program:Do(double,double):double
; ============================================================

