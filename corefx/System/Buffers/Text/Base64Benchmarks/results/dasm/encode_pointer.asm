; Assembly listing for method Base64_1:EncodeToUtf8(struct,struct,byref,byref,bool):int
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T19] (  6,  4.25)  struct (16) [rbp-0x38]   do-not-enreg[SF] ld-addr-op
;  V01 arg1         [V01,T23] (  5,  3.25)  struct (16) [rbp-0x48]   do-not-enreg[SF] ld-addr-op
;  V02 arg2         [V02,T20] (  6,  4   )   byref  ->  rbx
;  V03 arg3         [V03,T21] (  6,  4   )   byref  ->  r14
;  V04 arg4         [V04,T105] (  1,  0.50)    bool  ->  [rbp+0x10]
;  V05 loc0         [V05,T25] (  8,  4   )    long  ->  r15
;  V06 loc1         [V06    ] (  1,  0.50)   byref  ->  [rbp-0x50]   must-init pinned
;  V07 loc2         [V07,T41] (  6,  3   )    long  ->  r12
;  V08 loc3         [V08    ] (  1,  0.50)   byref  ->  [rbp-0x58]   must-init pinned
;  V09 loc4         [V09,T03] ( 11, 19.50)    long  ->  rdi
;  V10 loc5         [V10    ] (  4,  2   )     ref  ->  [rbp-0x60]   must-init pinned class-hnd
;  V11 loc6         [V11,T42] (  6,  3   )     int  ->  rsi
;  V12 loc7         [V12,T72] (  3,  1.50)     int  ->  rcx
;  V13 loc8         [V13,T62] (  4,  2   )     int  ->  rax
;  V14 loc9         [V14,T00] ( 28, 35   )    long  ->  rdx         ld-addr-op
;  V15 loc10        [V15,T04] ( 16, 18.50)    long  ->  rcx         ld-addr-op
;  V16 loc11        [V16,T43] (  6,  3   )    long  ->  rsi
;  V17 loc12        [V17,T16] (  8,  7.50)    long  ->   r8
;  V18 loc13        [V18,T08] (  6, 10   )     int  ->  rax
;  V19 loc14        [V19,T22] (  6,  6   )    long  ->  rax
;# V20 OutArgs      [V20    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V21 tmp1         [V21,T44] (  3,  3   )     ref  ->  rax         class-hnd "dup spill"
;  V22 tmp2         [V22,T70] (  3,  1.50)   byref  ->  rdi         "Inline return value spill temp"
;  V23 tmp3         [V23,T74] (  3,  1.25)   byref  ->  rdi         "Inline stloc first use temp"
;* V24 tmp4         [V24    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V25 tmp5         [V25,T71] (  3,  1.50)   byref  ->  rdi         "Inline return value spill temp"
;  V26 tmp6         [V26,T75] (  3,  1.25)   byref  ->  rdi         "Inline stloc first use temp"
;* V27 tmp7         [V27    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V28 tmp8         [V28,T46] (  2,  2.50)  simd32  ->  mm0         "Inline stloc first use temp"
;  V29 tmp9         [V29,T76] (  2,  1   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V30 tmp10        [V30,T47] (  2,  2.50)  simd32  ->  mm1         "Inline stloc first use temp"
;  V31 tmp11        [V31,T48] (  2,  2.50)  simd32  ->  mm2         "Inline stloc first use temp"
;  V32 tmp12        [V32,T49] (  2,  2.50)  simd32  ->  mm3         "Inline stloc first use temp"
;  V33 tmp13        [V33,T50] (  2,  2.50)  simd32  ->  mm4         "Inline stloc first use temp"
;  V34 tmp14        [V34,T51] (  2,  2.50)  simd32  ->  mm5         "Inline stloc first use temp"
;  V35 tmp15        [V35,T52] (  2,  2.50)  simd32  ->  mm6         "Inline stloc first use temp"
;  V36 tmp16        [V36,T53] (  2,  2.50)  simd32  ->  mm7         "Inline stloc first use temp"
;  V37 tmp17        [V37,T09] (  6,  9   )    long  ->  rdx         "Inline stloc first use temp"
;  V38 tmp18        [V38,T17] (  5,  7   )    long  ->  rcx         "Inline stloc first use temp"
;  V39 tmp19        [V39,T24] (  4,  5   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V40 tmp20        [V40,T01] ( 12, 22.50)  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V41 tmp21        [V41,T26] (  2,  4   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V42 tmp22        [V42,T27] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V43 tmp23        [V43,T28] (  2,  4   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V44 tmp24        [V44,T29] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V45 tmp25        [V45,T30] (  2,  4   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V46 tmp26        [V46,T31] (  2,  4   )  simd32  ->  mm10         "Inline stloc first use temp"
;  V47 tmp27        [V47,T32] (  2,  4   )  simd32  ->  mm9         "Inline stloc first use temp"
;  V48 tmp28        [V48,T77] (  2,  1   )  simd32  ->  mm1         "Inline return value spill temp"
;  V49 tmp29        [V49,T78] (  2,  1   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V50 tmp30        [V50,T79] (  2,  1   )  simd32  ->  mm2         "Inline return value spill temp"
;  V51 tmp31        [V51,T80] (  2,  1   )  simd16  ->  mm2         "Inline stloc first use temp"
;  V52 tmp32        [V52,T81] (  2,  1   )  simd32  ->  mm3         "Inline return value spill temp"
;  V53 tmp33        [V53,T82] (  2,  1   )  simd16  ->  mm3         "Inline stloc first use temp"
;  V54 tmp34        [V54,T83] (  2,  1   )  simd32  ->  mm4         "Inline return value spill temp"
;  V55 tmp35        [V55,T84] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V56 tmp36        [V56,T85] (  2,  1   )  simd32  ->  mm5         "Inline return value spill temp"
;  V57 tmp37        [V57,T86] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V58 tmp38        [V58,T87] (  2,  1   )  simd32  ->  mm6         "Inline return value spill temp"
;  V59 tmp39        [V59,T88] (  2,  1   )  simd16  ->  mm6         "Inline stloc first use temp"
;  V60 tmp40        [V60,T54] (  2,  2.50)  simd16  ->  mm0         "Inline stloc first use temp"
;* V61 tmp41        [V61    ] (  0,  0   )  simd16  ->  zero-ref    ld-addr-op "Inline stloc first use temp"
;  V62 tmp42        [V62,T55] (  2,  2.50)  simd16  ->  mm1         "Inline stloc first use temp"
;  V63 tmp43        [V63,T56] (  2,  2.50)  simd16  ->  mm2         "Inline stloc first use temp"
;  V64 tmp44        [V64,T57] (  2,  2.50)  simd16  ->  mm3         "Inline stloc first use temp"
;  V65 tmp45        [V65,T58] (  2,  2.50)  simd16  ->  mm4         "Inline stloc first use temp"
;  V66 tmp46        [V66,T59] (  2,  2.50)  simd16  ->  mm5         "Inline stloc first use temp"
;  V67 tmp47        [V67,T60] (  2,  2.50)  simd16  ->  mm6         "Inline stloc first use temp"
;  V68 tmp48        [V68,T61] (  2,  2.50)  simd16  ->  mm7         "Inline stloc first use temp"
;  V69 tmp49        [V69,T10] (  6,  9   )    long  ->  rdx         "Inline stloc first use temp"
;  V70 tmp50        [V70,T18] (  5,  7   )    long  ->  rcx         "Inline stloc first use temp"
;  V71 tmp51        [V71,T33] (  2,  4   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V72 tmp52        [V72,T05] (  9, 18   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V73 tmp53        [V73,T34] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V74 tmp54        [V74,T35] (  2,  4   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V75 tmp55        [V75,T36] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V76 tmp56        [V76,T37] (  2,  4   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V77 tmp57        [V77,T38] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V78 tmp58        [V78,T39] (  2,  4   )  simd16  ->  mm10         "Inline stloc first use temp"
;  V79 tmp59        [V79,T40] (  2,  4   )  simd16  ->  mm9         "Inline stloc first use temp"
;  V80 tmp60        [V80,T89] (  2,  1   )  simd16  ->  mm1         "Inline return value spill temp"
;  V81 tmp61        [V81,T90] (  2,  1   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V82 tmp62        [V82,T91] (  2,  1   )  simd16  ->  mm2         "Inline return value spill temp"
;  V83 tmp63        [V83,T92] (  2,  1   )  simd16  ->  mm2         "Inline stloc first use temp"
;  V84 tmp64        [V84,T93] (  2,  1   )  simd16  ->  mm3         "Inline return value spill temp"
;  V85 tmp65        [V85,T94] (  2,  1   )  simd16  ->  mm3         "Inline stloc first use temp"
;  V86 tmp66        [V86,T95] (  2,  1   )  simd16  ->  mm4         "Inline return value spill temp"
;  V87 tmp67        [V87,T96] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V88 tmp68        [V88,T97] (  2,  1   )  simd16  ->  mm5         "Inline return value spill temp"
;  V89 tmp69        [V89,T98] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V90 tmp70        [V90,T99] (  2,  1   )  simd16  ->  mm6         "Inline return value spill temp"
;  V91 tmp71        [V91,T100] (  2,  1   )  simd16  ->  mm6         "Inline stloc first use temp"
;* V92 tmp72        [V92    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V93 tmp73        [V93,T11] (  2,  8   )    long  ->   r9         "Inline stloc first use temp"
;  V94 tmp74        [V94,T06] (  2, 16   )    long  ->  rax         "impAppendStmt"
;  V95 tmp75        [V95,T12] (  2,  8   )    long  ->  r10         "Inline stloc first use temp"
;  V96 tmp76        [V96,T02] (  5, 20   )    long  ->  rax         "Inline stloc first use temp"
;  V97 tmp77        [V97,T13] (  2,  8   )    long  ->  r10         "Inline stloc first use temp"
;  V98 tmp78        [V98,T07] (  2, 16   )    long  ->   r9         "impAppendStmt"
;  V99 tmp79        [V99,T14] (  2,  8   )    long  ->  r11         "Inline stloc first use temp"
;  V100 tmp80       [V100,T15] (  2,  8   )    long  ->  rax         "Inline stloc first use temp"
;* V101 tmp81       [V101    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V102 tmp82       [V102    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V103 tmp83       [V103,T73] (  3,  1.50)    long  ->  rax         "Inline stloc first use temp"
;  V104 tmp84       [V104,T101] (  2,  1   )    long  ->  rax         "Inline stloc first use temp"
;  V105 tmp85       [V105,T64] (  2,  2   )    long  ->  rsi         "impAppendStmt"
;* V106 tmp86       [V106    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V107 tmp87       [V107    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V108 tmp88       [V108,T102] (  2,  1   )    long  ->  rsi         "Inline stloc first use temp"
;  V109 tmp89       [V109,T65] (  2,  2   )    long  ->  rax         "impAppendStmt"
;  V110 tmp90       [V110,T63] (  4,  2   )    long  ->  rax         "Inline stloc first use temp"
;  V111 tmp91       [V111,T103] (  2,  1   )    long  ->   r8         "Inline stloc first use temp"
;  V112 tmp92       [V112,T66] (  2,  2   )    long  ->  rsi         "impAppendStmt"
;  V113 tmp93       [V113,T104] (  2,  1   )    long  ->  rax         "Inline stloc first use temp"
;* V114 tmp94       [V114    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V115 tmp95       [V115,T67] (  2,  2   )    long  ->  r15         "Cast away GC"
;  V116 tmp96       [V116,T68] (  2,  2   )    long  ->  r12         "Cast away GC"
;  V117 tmp97       [V117,T69] (  2,  2   )    long  ->  rdi         "Cast away GC"
;* V118 cse0        [V118,T106] (  0,  0   )    long  ->  zero-ref    "ValNumCSE"
;  V119 rat0        [V119,T45] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;
; Lcl frame size = 56

G_M39728_IG01:
       push     rbp
       push     r15
       push     r14
       push     r13
       push     r12
       push     rbx
       sub      rsp, 56
       vzeroupper
       lea      rbp, [rsp+60H]
       mov      r12, rcx
       mov      r13, rdi
       lea      rdi, [rbp-60H]
       mov      ecx, 6
       xor      rax, rax
       rep stosd
       mov      rcx, r12
       mov      rdi, r13
       mov      bword ptr [rbp-38H], rdi
       mov      qword ptr [rbp-30H], rsi
       mov      bword ptr [rbp-48H], rdx
       mov      qword ptr [rbp-40H], rcx
       mov      rbx, r8
       mov      r14, r9

G_M39728_IG02:
       cmp      dword ptr [rbp-30H], 0
       ja       SHORT G_M39728_IG04
       xor      eax, eax
       mov      dword ptr [rbx], eax
       mov      dword ptr [r14], eax

G_M39728_IG03:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39728_IG04:
       xor      rdi, rdi
       cmp      dword ptr [rbp-30H], 0
       je       SHORT G_M39728_IG05
       mov      rdi, bword ptr [rbp-38H]

G_M39728_IG05:
       mov      bword ptr [rbp-50H], rdi
       mov      r15, rdi
       xor      rdi, rdi
       cmp      dword ptr [rbp-40H], 0
       je       SHORT G_M39728_IG06
       mov      rdi, bword ptr [rbp-48H]

G_M39728_IG06:
       mov      bword ptr [rbp-58H], rdi
       mov      r12, rdi
       mov      rdi, 0xD1FFAB1E
       mov      esi, 4
       call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       mov      rax, 0xD1FFAB1E
       mov      rax, gword ptr [rax]
       mov      gword ptr [rbp-60H], rax
       test     rax, rax
       je       SHORT G_M39728_IG07
       mov      rax, gword ptr [rbp-60H]
       cmp      dword ptr [rax+8], 0
       jne      SHORT G_M39728_IG08

G_M39728_IG07:
       xor      rdi, rdi
       jmp      SHORT G_M39728_IG09

G_M39728_IG08:
       mov      rdi, gword ptr [rbp-60H]
       cmp      dword ptr [rdi+8], 0
       jbe      G_M39728_IG28
       mov      rax, gword ptr [rbp-60H]
       lea      rdi, bword ptr [rax+16]

G_M39728_IG09:
       mov      esi, dword ptr [rbp-30H]
       mov      ecx, dword ptr [rbp-40H]
       cmp      esi, 0xD1FFAB1E
       jg       SHORT G_M39728_IG11
       cmp      esi, 0xD1FFAB1E
       ja       G_M39728_IG27

G_M39728_IG10:
       lea      eax, [rsi+2]
       mov      edx, 0xD1FFAB1E
       imul     edx:eax, edx
       mov      eax, edx
       shr      eax, 31
       add      edx, eax
       shl      edx, 2
       cmp      edx, ecx
       jg       SHORT G_M39728_IG11
       mov      eax, esi
       jmp      SHORT G_M39728_IG12

G_M39728_IG11:
       sar      ecx, 2
       lea      eax, [rcx+2*rcx]

G_M39728_IG12:
       mov      rdx, r15
       mov      rcx, r12
       movsxd   rsi, esi
       add      rsi, rdx
       movsxd   r8, eax
       add      r8, rdx
       cmp      eax, 16
       jl       G_M39728_IG17
       lea      rax, [r8-32]
       cmp      rax, r15
       jb       G_M39728_IG15
       mov      rdx, 0xD1FFAB1E
       mov      rcx, gword ptr [rdx]
       vmovupd  ymm0, ymmword ptr[rcx+8]
       mov      edx, 0xD1FFAB1E
       vmovd    xmm1, edx
       vpbroadcastd ymm1, ymm1
       mov      edx, 0xD1FFAB1E
       vmovd    xmm2, edx
       vpbroadcastd ymm2, ymm2
       mov      edx, 0xD1FFAB1E
       vmovd    xmm3, edx
       vpbroadcastd ymm3, ymm3
       mov      edx, 0xD1FFAB1E
       vmovd    xmm4, edx
       vpbroadcastd ymm4, ymm4
       mov      edx, 51
       vmovd    xmm5, edx
       vpbroadcastb ymm5, ymm5
       mov      edx, 25
       vmovd    xmm6, edx
       vpbroadcastb ymm6, ymm6
       mov      rdx, 0xD1FFAB1E
       mov      rdx, gword ptr [rdx]
       vmovupd  ymm7, ymmword ptr[rdx+8]
       mov      rcx, r12
       vmovdqu  ymm8, ymmword ptr[r15]
       mov      rdx, 0xD1FFAB1E
       mov      rdx, gword ptr [rdx]
       vmovupd  ymm9, ymmword ptr[rdx+8]
       vpermd   ymm8, ymm9, ymm8
       lea      rdx, [r15-4]

G_M39728_IG13:
       vpshufb  ymm8, ymm8, ymm0
       vpand    ymm9, ymm8, ymm1
       vpand    ymm8, ymm8, ymm2
       vpmulhuw ymm9, ymm9, ymm3
       vpmullw  ymm8, ymm8, ymm4
       vpor     ymm8, ymm9, ymm8
       vpsubusb ymm9, ymm8, ymm5
       vpcmpgtb ymm10, ymm8, ymm6
       vpsubb   ymm9, ymm9, ymm10
       vpshufb  ymm9, ymm7, ymm9
       vpaddb   ymm8, ymm8, ymm9
       vmovdqu  ymmword ptr[rcx], ymm8
       add      rdx, 24
       add      rcx, 32
       cmp      rdx, rax
       ja       SHORT G_M39728_IG14
       vmovdqu  ymm8, ymmword ptr[rdx]
       jmp      SHORT G_M39728_IG13

G_M39728_IG14:
       add      rdx, 4
       cmp      rdx, rsi
       je       G_M39728_IG21

G_M39728_IG15:
       lea      rax, [r8-16]
       cmp      rax, rdx
       jb       G_M39728_IG17
       mov      r9, 0xD1FFAB1E
       mov      r9, gword ptr [r9]
       vmovupd  xmm0, xmmword ptr [r9+8]
       mov      r9d, 0xD1FFAB1E
       vmovd    xmm1, r9d
       vpbroadcastd xmm1, xmm1
       mov      r9d, 0xD1FFAB1E
       vmovd    xmm2, r9d
       vpbroadcastd xmm2, xmm2
       mov      r9d, 0xD1FFAB1E
       vmovd    xmm3, r9d
       vpbroadcastd xmm3, xmm3
       mov      r9d, 0xD1FFAB1E
       vmovd    xmm4, r9d
       vpbroadcastd xmm4, xmm4
       mov      r9d, 51
       vmovd    xmm5, r9d
       vpbroadcastb xmm5, xmm5
       mov      r9d, 25
       vmovd    xmm6, r9d
       vpbroadcastb xmm6, xmm6
       mov      r9, 0xD1FFAB1E
       mov      r9, gword ptr [r9]
       vmovupd  xmm7, xmmword ptr [r9+8]

G_M39728_IG16:
       vmovdqu  xmm8, xmmword ptr [rdx]
       vpshufb  xmm8, xmm8, xmm0
       vpand    xmm9, xmm8, xmm1
       vpand    xmm8, xmm8, xmm2
       vpmulhuw xmm9, xmm9, xmm3
       vpmullw  xmm8, xmm8, xmm4
       vpor     xmm8, xmm9, xmm8
       vpsubusb xmm9, xmm8, xmm5
       vpcmpgtb xmm10, xmm8, xmm6
       vpsubb   xmm9, xmm9, xmm10
       vpshufb  xmm9, xmm7, xmm9
       vpaddb   xmm8, xmm8, xmm9
       vmovdqu  xmmword ptr [rcx], xmm8
       add      rdx, 12
       add      rcx, 16
       cmp      rdx, rax
       jbe      SHORT G_M39728_IG16
       cmp      rdx, rsi
       je       G_M39728_IG21

G_M39728_IG17:
       add      r8, -2
       cmp      rdx, r8
       jae      G_M39728_IG19

G_M39728_IG18:
       movzx    rax, byte  ptr [rdx]
       mov      eax, eax
       movzx    r9, byte  ptr [rdx+1]
       mov      r9d, r9d
       movzx    r10, byte  ptr [rdx+2]
       mov      r10d, r10d
       shl      rax, 16
       shl      r9, 8
       or       rax, r9
       or       rax, r10
       mov      r9, rax
       shr      r9, 18
       movzx    r9, byte  ptr [rdi+r9]
       mov      r9d, r9d
       mov      r10, rax
       shr      r10, 12
       and      r10, 63
       movzx    r10, byte  ptr [rdi+r10]
       mov      r10d, r10d
       mov      r11, rax
       shr      r11, 6
       and      r11, 63
       movzx    r11, byte  ptr [rdi+r11]
       mov      r11d, r11d
       and      rax, 63
       movzx    rax, byte  ptr [rdi+rax]
       mov      eax, eax
       shl      r10d, 8
       or       r9d, r10d
       shl      r11d, 16
       or       r9d, r11d
       shl      eax, 24
       or       eax, r9d
       mov      dword ptr [rcx], eax
       add      rdx, 3
       add      rcx, 4
       cmp      rdx, r8
       jb       G_M39728_IG18

G_M39728_IG19:
       add      r8, 2
       cmp      r8, rsi
       jne      G_M39728_IG23
       cmp      byte  ptr [rbp+10H], 0
       je       G_M39728_IG25
       lea      rax, [rdx+1]
       cmp      rax, rsi
       jne      SHORT G_M39728_IG20
       movzx    rsi, byte  ptr [rdx]
       mov      eax, esi
       shl      rax, 8
       mov      rsi, rax
       shr      rsi, 10
       movzx    rsi, byte  ptr [rdi+rsi]
       mov      esi, esi
       shr      rax, 4
       and      rax, 63
       movzx    rdi, byte  ptr [rdi+rax]
       mov      eax, edi
       shl      eax, 8
       or       esi, eax
       or       esi, 0xD1FFAB1E
       mov      eax, esi
       or       eax, 0xD1FFAB1E
       mov      dword ptr [rcx], eax
       inc      rdx
       add      rcx, 4
       jmp      SHORT G_M39728_IG21

G_M39728_IG20:
       lea      rax, [rdx+2]
       cmp      rax, rsi
       jne      SHORT G_M39728_IG21
       movzx    rax, byte  ptr [rdx]
       mov      eax, eax
       movzx    rsi, byte  ptr [rdx+1]
       mov      esi, esi
       shl      rax, 16
       shl      rsi, 8
       or       rax, rsi
       mov      rsi, rax
       shr      rsi, 18
       movzx    rsi, byte  ptr [rdi+rsi]
       mov      esi, esi
       mov      r8, rax
       shr      r8, 12
       and      r8, 63
       movzx    r8, byte  ptr [rdi+r8]
       mov      r8d, r8d
       shr      rax, 6
       and      rax, 63
       movzx    rax, byte  ptr [rdi+rax]
       mov      eax, eax
       shl      r8d, 8
       or       esi, r8d
       shl      eax, 16
       or       esi, eax
       mov      eax, esi
       or       eax, 0xD1FFAB1E
       mov      dword ptr [rcx], eax
       add      rdx, 2
       add      rcx, 4

G_M39728_IG21:
       mov      rax, rdx
       sub      rax, r15
       mov      dword ptr [rbx], eax
       mov      rax, rcx
       sub      rax, r12
       mov      dword ptr [r14], eax
       xor      eax, eax

G_M39728_IG22:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39728_IG23:
       mov      rax, rdx
       sub      rax, r15
       mov      dword ptr [rbx], eax
       mov      rax, rcx
       sub      rax, r12
       mov      dword ptr [r14], eax
       mov      eax, 1

G_M39728_IG24:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39728_IG25:
       sub      rdx, r15
       mov      eax, edx
       mov      dword ptr [rbx], eax
       sub      rcx, r12
       mov      eax, ecx
       mov      dword ptr [r14], eax
       mov      eax, 2

G_M39728_IG26:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39728_IG27:
       xor      edi, edi
       call     ThrowHelper:ThrowArgumentOutOfRangeException(int)
       int3

G_M39728_IG28:
       call     CORINFO_HELP_RNGCHKFAIL
       int3

; Total bytes of code 1269, prolog size 69 for method Base64_1:EncodeToUtf8(struct,struct,byref,byref,bool):int
; ============================================================
