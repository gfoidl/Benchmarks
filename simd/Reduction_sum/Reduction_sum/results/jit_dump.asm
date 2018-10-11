; Assembly listing for method Benchmarks:Loop_local():double:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  3,  3   )     ref  ->  rdi         this class-hnd
;  V01 loc0         [V01,T01] (  6,  3.50)  simd32  ->  mm0         ld-addr-op
;  V02 loc1         [V02,T02] (  9,  5   )  double  ->  mm1
;* V03 loc2         [V03    ] (  0,  0   )     int  ->  zero-ref
;# V04 OutArgs      [V04    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]
;
; Lcl frame size = 0

G_M39810_IG01:
       55                   push     rbp
       C5F877               vzeroupper
       488BEC               mov      rbp, rsp

G_M39810_IG02:
       C4E17D104708         vmovupd  ymm0, ymmword ptr[rdi+8]
       C4E17C28C8           vmovaps  ymm1, ymm0
       C4E16857D2           vxorps   xmm2, xmm2
       C4E17358CA           vaddsd   xmm1, xmm2
       C4E17C28D0           vmovaps  ymm2, ymm0
       C4E16D73DA08         vpsrldq  ymm2, 8
       C4E17358CA           vaddsd   xmm1, xmm2
       C4E37D19C201         vextractf128 ymm2, ymm0, 1
       C4E17358CA           vaddsd   xmm1, xmm2
       C4E37D19C001         vextractf128 ymm0, ymm0, 1
       C4E17D73D808         vpsrldq  ymm0, 8
       C4E17358C8           vaddsd   xmm1, xmm0
       C4E17828C1           vmovaps  xmm0, xmm1

G_M39810_IG03:
       C5F877               vzeroupper
       5D                   pop      rbp
       C3                   ret

; Total bytes of code 82, prolog size 7 for method Benchmarks:Loop_local():double:this
; ============================================================
; Assembly listing for method Benchmarks:Loop_field():double:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] ( 10,  6   )     ref  ->  rdi         this class-hnd
;  V01 loc0         [V01,T01] ( 15,  8   )  double  ->  mm0
;* V02 loc1         [V02    ] (  0,  0   )     int  ->  zero-ref
;# V03 OutArgs      [V03    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]
;
; Lcl frame size = 0

G_M3565_IG01:
       55                   push     rbp
       C5F877               vzeroupper
       488BEC               mov      rbp, rsp

G_M3565_IG02:
       488D4708             lea      rax, bword ptr [rdi+8]
       C4E17B1000           vmovsd   xmm0, qword ptr [rax]
       C4E17057C9           vxorps   xmm1, xmm1
       C4E17B58C1           vaddsd   xmm0, xmm1
       488D4708             lea      rax, bword ptr [rdi+8]
       C4E17B104808         vmovsd   xmm1, qword ptr [rax+8]
       C4E17B58C1           vaddsd   xmm0, xmm1
       488D4708             lea      rax, bword ptr [rdi+8]
       C4E17B104810         vmovsd   xmm1, qword ptr [rax+16]
       C4E17B58C1           vaddsd   xmm0, xmm1
       488D4708             lea      rax, bword ptr [rdi+8]
       C4E17B104818         vmovsd   xmm1, qword ptr [rax+24]
       C4E17B58C1           vaddsd   xmm0, xmm1

G_M3565_IG03:
       C5F877               vzeroupper
       5D                   pop      rbp
       C3                   ret

; Total bytes of code 76, prolog size 7 for method Benchmarks:Loop_field():double:this
; ============================================================
; Assembly listing for method Benchmarks:Dot():double:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]
;
; Lcl frame size = 0

G_M60947_IG01:
       C5F877               vzeroupper

G_M60947_IG02:
       C4E17D104708         vmovupd  ymm0, ymmword ptr[rdi+8]
       C4E27D190D1E000000   vbroadcastsd ymm1, ymmword ptr[reloc @RWD00]
       C4E17D59C1           vmulpd   ymm0, ymm1
       C4E17D7CC0           vhaddpd  ymm0, ymm0
       C4E37D19C201         vextractf128 ymm2, ymm0, 1
       C4E17958C2           vaddpd   xmm0, xmm2

G_M60947_IG03:
       C5F877               vzeroupper
       C3                   ret

; Total bytes of code 43, prolog size 3 for method Benchmarks:Dot():double:this
; ============================================================
; Assembly listing for method Benchmarks:Intrinsics():double:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  4,  4   )     ref  ->  rdi         this class-hnd
;  V01 loc0         [V01,T04] (  2,  2   )  simd16  ->  mm1
;# V02 OutArgs      [V02    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]
;  V03 tmp1         [V03,T02] (  3,  6   )  simd32  ->  mm0
;  V04 tmp2         [V04,T03] (  3,  6   )  simd32  ->  mm0
;  V05 tmp3         [V05,T01] (  3,  6   )   byref  ->  rax
;
; Lcl frame size = 0

G_M18145_IG01:
       C5F877               vzeroupper

G_M18145_IG02:
       488D4708             lea      rax, bword ptr [rdi+8]
       C4E17D1000           vmovupd  ymm0, ymmword ptr[rax]
       C4E17D7CC0           vhaddpd  ymm0, ymm0, ymm0
       C4E37D19C101         vextractf128 ymm1, ymm0, 1
       C4E17958C1           vaddpd   xmm0, xmm0, xmm1

G_M18145_IG03:
       C5F877               vzeroupper
       C3                   ret

; Total bytes of code 32, prolog size 3 for method Benchmarks:Intrinsics():double:this
; ============================================================
