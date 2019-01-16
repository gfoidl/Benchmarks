; Assembly listing for method Base64_1:EncodeToUtf8(struct,struct,byref,byref,bool):int
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00    ] (  5,  4   )  struct (16) [rbp-0x30]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V01 arg1         [V01    ] (  4,  3   )  struct (16) [rbp-0x40]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V02 arg2         [V02,T23] (  6,  4   )   byref  ->  rbx
;  V03 arg3         [V03,T24] (  6,  4   )   byref  ->  r14
;  V04 arg4         [V04,T111] (  1,  0.50)    bool  ->  [rbp+0x10]
;  V05 loc0         [V05,T27] (  8,  4   )    long  ->  r15
;  V06 loc1         [V06    ] (  1,  0.50)   byref  ->  [rbp-0x48]   must-init pinned
;  V07 loc2         [V07,T43] (  6,  3   )    long  ->  r12
;  V08 loc3         [V08    ] (  1,  0.50)   byref  ->  [rbp-0x50]   must-init pinned
;  V09 loc4         [V09,T03] ( 10, 19   )   byref  ->  rdi
;  V10 loc5         [V10,T44] (  6,  3   )     int  ->  rsi
;  V11 loc6         [V11,T80] (  3,  1.50)     int  ->  rcx
;  V12 loc7         [V12,T66] (  4,  2   )     int  ->  rax
;  V13 loc8         [V13,T00] ( 28, 35   )    long  ->  rdx         ld-addr-op
;  V14 loc9         [V14,T04] ( 16, 18.50)    long  ->  rcx         ld-addr-op
;  V15 loc10        [V15,T45] (  6,  3   )    long  ->  rsi
;  V16 loc11        [V16,T20] (  8,  7.50)    long  ->   r8
;  V17 loc12        [V17,T12] (  6, 10   )     int  ->  rax
;  V18 loc13        [V18,T25] (  6,  6   )    long  ->  rax
;# V19 OutArgs      [V19    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;* V20 tmp1         [V20    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V21 tmp2         [V21    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;  V22 tmp3         [V22,T50] (  2,  2.50)  simd32  ->  mm0         "Inline stloc first use temp"
;  V23 tmp4         [V23,T82] (  2,  1   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V24 tmp5         [V24,T51] (  2,  2.50)  simd32  ->  mm1         "Inline stloc first use temp"
;  V25 tmp6         [V25,T52] (  2,  2.50)  simd32  ->  mm2         "Inline stloc first use temp"
;  V26 tmp7         [V26,T53] (  2,  2.50)  simd32  ->  mm3         "Inline stloc first use temp"
;  V27 tmp8         [V27,T54] (  2,  2.50)  simd32  ->  mm4         "Inline stloc first use temp"
;  V28 tmp9         [V28,T55] (  2,  2.50)  simd32  ->  mm5         "Inline stloc first use temp"
;  V29 tmp10        [V29,T56] (  2,  2.50)  simd32  ->  mm6         "Inline stloc first use temp"
;  V30 tmp11        [V30,T57] (  2,  2.50)  simd32  ->  mm7         "Inline stloc first use temp"
;  V31 tmp12        [V31,T13] (  6,  9   )    long  ->  rdx         "Inline stloc first use temp"
;  V32 tmp13        [V32,T21] (  5,  7   )    long  ->  rcx         "Inline stloc first use temp"
;  V33 tmp14        [V33,T26] (  4,  5   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V34 tmp15        [V34,T01] ( 12, 22.50)  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V35 tmp16        [V35,T28] (  2,  4   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V36 tmp17        [V36,T29] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V37 tmp18        [V37,T30] (  2,  4   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V38 tmp19        [V38,T31] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V39 tmp20        [V39,T32] (  2,  4   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V40 tmp21        [V40,T33] (  2,  4   )  simd32  ->  mm10         "Inline stloc first use temp"
;  V41 tmp22        [V41,T34] (  2,  4   )  simd32  ->  mm9         "Inline stloc first use temp"
;  V42 tmp23        [V42,T83] (  2,  1   )  simd32  ->  mm1         "Inline return value spill temp"
;  V43 tmp24        [V43,T84] (  2,  1   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V44 tmp25        [V44,T85] (  2,  1   )  simd32  ->  mm2         "Inline return value spill temp"
;  V45 tmp26        [V45,T86] (  2,  1   )  simd16  ->  mm2         "Inline stloc first use temp"
;  V46 tmp27        [V46,T87] (  2,  1   )  simd32  ->  mm3         "Inline return value spill temp"
;  V47 tmp28        [V47,T88] (  2,  1   )  simd16  ->  mm3         "Inline stloc first use temp"
;  V48 tmp29        [V48,T89] (  2,  1   )  simd32  ->  mm4         "Inline return value spill temp"
;  V49 tmp30        [V49,T90] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V50 tmp31        [V50,T91] (  2,  1   )  simd32  ->  mm5         "Inline return value spill temp"
;  V51 tmp32        [V51,T92] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V52 tmp33        [V52,T93] (  2,  1   )  simd32  ->  mm6         "Inline return value spill temp"
;  V53 tmp34        [V53,T94] (  2,  1   )  simd16  ->  mm6         "Inline stloc first use temp"
;  V54 tmp35        [V54,T58] (  2,  2.50)  simd16  ->  mm0         "Inline stloc first use temp"
;* V55 tmp36        [V55    ] (  0,  0   )  simd16  ->  zero-ref    ld-addr-op "Inline stloc first use temp"
;  V56 tmp37        [V56,T59] (  2,  2.50)  simd16  ->  mm1         "Inline stloc first use temp"
;  V57 tmp38        [V57,T60] (  2,  2.50)  simd16  ->  mm2         "Inline stloc first use temp"
;  V58 tmp39        [V58,T61] (  2,  2.50)  simd16  ->  mm3         "Inline stloc first use temp"
;  V59 tmp40        [V59,T62] (  2,  2.50)  simd16  ->  mm4         "Inline stloc first use temp"
;  V60 tmp41        [V60,T63] (  2,  2.50)  simd16  ->  mm5         "Inline stloc first use temp"
;  V61 tmp42        [V61,T64] (  2,  2.50)  simd16  ->  mm6         "Inline stloc first use temp"
;  V62 tmp43        [V62,T65] (  2,  2.50)  simd16  ->  mm7         "Inline stloc first use temp"
;  V63 tmp44        [V63,T14] (  6,  9   )    long  ->  rdx         "Inline stloc first use temp"
;  V64 tmp45        [V64,T22] (  5,  7   )    long  ->  rcx         "Inline stloc first use temp"
;  V65 tmp46        [V65,T35] (  2,  4   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V66 tmp47        [V66,T05] (  9, 18   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V67 tmp48        [V67,T36] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V68 tmp49        [V68,T37] (  2,  4   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V69 tmp50        [V69,T38] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V70 tmp51        [V70,T39] (  2,  4   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V71 tmp52        [V71,T40] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V72 tmp53        [V72,T41] (  2,  4   )  simd16  ->  mm10         "Inline stloc first use temp"
;  V73 tmp54        [V73,T42] (  2,  4   )  simd16  ->  mm9         "Inline stloc first use temp"
;  V74 tmp55        [V74,T95] (  2,  1   )  simd16  ->  mm1         "Inline return value spill temp"
;  V75 tmp56        [V75,T96] (  2,  1   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V76 tmp57        [V76,T97] (  2,  1   )  simd16  ->  mm2         "Inline return value spill temp"
;  V77 tmp58        [V77,T98] (  2,  1   )  simd16  ->  mm2         "Inline stloc first use temp"
;  V78 tmp59        [V78,T99] (  2,  1   )  simd16  ->  mm3         "Inline return value spill temp"
;  V79 tmp60        [V79,T100] (  2,  1   )  simd16  ->  mm3         "Inline stloc first use temp"
;  V80 tmp61        [V80,T101] (  2,  1   )  simd16  ->  mm4         "Inline return value spill temp"
;  V81 tmp62        [V81,T102] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V82 tmp63        [V82,T103] (  2,  1   )  simd16  ->  mm5         "Inline return value spill temp"
;  V83 tmp64        [V83,T104] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V84 tmp65        [V84,T105] (  2,  1   )  simd16  ->  mm6         "Inline return value spill temp"
;  V85 tmp66        [V85,T106] (  2,  1   )  simd16  ->  mm6         "Inline stloc first use temp"
;* V86 tmp67        [V86    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V87 tmp68        [V87,T15] (  2,  8   )    long  ->   r9         "Inline stloc first use temp"
;  V88 tmp69        [V88,T06] (  2, 16   )    long  ->  rax         "impAppendStmt"
;  V89 tmp70        [V89,T16] (  2,  8   )    long  ->  r10         "Inline stloc first use temp"
;  V90 tmp71        [V90,T02] (  5, 20   )    long  ->  rax         "Inline stloc first use temp"
;  V91 tmp72        [V91,T07] (  2, 16   )    long  ->   r9         "impAppendStmt"
;  V92 tmp73        [V92,T17] (  2,  8   )    long  ->  r10         "Inline stloc first use temp"
;  V93 tmp74        [V93,T18] (  2,  8   )    long  ->  r11         "Inline stloc first use temp"
;  V94 tmp75        [V94,T19] (  2,  8   )    long  ->  rax         "Inline stloc first use temp"
;* V95 tmp76        [V95    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V96 tmp77        [V96,T08] (  2, 16   )    long  ->   r9         "NewObj constructor temp"
;* V97 tmp78        [V97    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V98 tmp79        [V98    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V99 tmp80        [V99,T09] (  2, 16   )    long  ->  r10         "NewObj constructor temp"
;* V100 tmp81       [V100    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V101 tmp82       [V101    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V102 tmp83       [V102,T10] (  2, 16   )    long  ->  r11         "NewObj constructor temp"
;* V103 tmp84       [V103    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V104 tmp85       [V104    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V105 tmp86       [V105,T11] (  2, 16   )    long  ->  rax         "NewObj constructor temp"
;* V106 tmp87       [V106    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V107 tmp88       [V107    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V108 tmp89       [V108    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V109 tmp90       [V109,T81] (  3,  1.50)    long  ->  rax         "Inline stloc first use temp"
;  V110 tmp91       [V110,T68] (  2,  2   )    long  ->  rsi         "impAppendStmt"
;  V111 tmp92       [V111,T107] (  2,  1   )    long  ->  rax         "Inline stloc first use temp"
;* V112 tmp93       [V112    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V113 tmp94       [V113,T69] (  2,  2   )    long  ->  rsi         "NewObj constructor temp"
;* V114 tmp95       [V114    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V115 tmp96       [V115    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V116 tmp97       [V116,T70] (  2,  2   )    long  ->  rax         "NewObj constructor temp"
;* V117 tmp98       [V117    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V118 tmp99       [V118    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V119 tmp100      [V119    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V120 tmp101      [V120,T108] (  2,  1   )    long  ->  rsi         "Inline stloc first use temp"
;  V121 tmp102      [V121,T71] (  2,  2   )    long  ->  rax         "impAppendStmt"
;  V122 tmp103      [V122,T67] (  4,  2   )    long  ->  rax         "Inline stloc first use temp"
;  V123 tmp104      [V123,T72] (  2,  2   )    long  ->  rsi         "impAppendStmt"
;  V124 tmp105      [V124,T109] (  2,  1   )    long  ->   r8         "Inline stloc first use temp"
;  V125 tmp106      [V125,T110] (  2,  1   )    long  ->  rax         "Inline stloc first use temp"
;* V126 tmp107      [V126    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V127 tmp108      [V127,T73] (  2,  2   )    long  ->  rsi         "NewObj constructor temp"
;* V128 tmp109      [V128    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V129 tmp110      [V129    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V130 tmp111      [V130,T74] (  2,  2   )    long  ->   r8         "NewObj constructor temp"
;* V131 tmp112      [V131    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V132 tmp113      [V132    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V133 tmp114      [V133,T75] (  2,  2   )    long  ->  rax         "NewObj constructor temp"
;* V134 tmp115      [V134    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V135 tmp116      [V135    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V136 tmp117      [V136,T78] (  3,  1.50)   byref  ->  rsi         V20._pointer(offs=0x00) P-INDEP "field V20._pointer (fldOffset=0x0)"
;* V137 tmp118      [V137    ] (  0,  0   )     int  ->  zero-ref    V20._length(offs=0x08) P-INDEP "field V20._length (fldOffset=0x8)"
;  V138 tmp119      [V138,T79] (  3,  1.50)   byref  ->  rsi         V21._pointer(offs=0x00) P-INDEP "field V21._pointer (fldOffset=0x0)"
;* V139 tmp120      [V139    ] (  0,  0   )     int  ->  zero-ref    V21._length(offs=0x08) P-INDEP "field V21._length (fldOffset=0x8)"
;  V140 tmp121      [V140,T46] (  3,  3   )   byref  ->  rdi         "BlockOp address local"
;  V141 tmp122      [V141,T76] (  2,  2   )    long  ->  r15         "Cast away GC"
;  V142 tmp123      [V142,T47] (  3,  3   )   byref  ->  rdi         "BlockOp address local"
;  V143 tmp124      [V143,T77] (  2,  2   )    long  ->  r12         "Cast away GC"
;  V144 tmp125      [V144,T48] (  3,  3   )     ref  ->  rax         "arr expr"
;* V145 cse0        [V145,T112] (  0,  0   )    long  ->  zero-ref    "ValNumCSE"
;  V146 rat0        [V146,T49] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;
; Lcl frame size = 48

G_M39753_IG01:
       push     rbp
       push     r15
       push     r14
       push     r12
       push     rbx
       sub      rsp, 48
       vzeroupper
       lea      rbp, [rsp+50H]
       xor      rax, rax
       mov      qword ptr [rbp-48H], rax
       mov      qword ptr [rbp-50H], rax
       mov      bword ptr [rbp-30H], rdi
       mov      qword ptr [rbp-28H], rsi
       mov      bword ptr [rbp-40H], rdx
       mov      qword ptr [rbp-38H], rcx
       mov      rbx, r8
       mov      r14, r9

G_M39753_IG02:
       cmp      dword ptr [rbp-28H], 0
       ja       SHORT G_M39753_IG04
       xor      eax, eax
       mov      dword ptr [rbx], eax
       mov      dword ptr [r14], eax

G_M39753_IG03:
       vzeroupper
       lea      rsp, [rbp-20H]
       pop      rbx
       pop      r12
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39753_IG04:
       lea      rdi, bword ptr [rbp-30H]
       mov      rsi, bword ptr [rdi]
       mov      edi, dword ptr [rdi+8]
       mov      bword ptr [rbp-48H], rsi
       mov      r15, rsi
       lea      rdi, bword ptr [rbp-40H]
       mov      rsi, bword ptr [rdi]
       mov      edi, dword ptr [rdi+8]
       mov      bword ptr [rbp-50H], rsi
       mov      r12, rsi
       mov      rdi, 0xD1FFAB1E
       mov      esi, 4
       call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       mov      rax, 0xD1FFAB1E
       mov      rax, gword ptr [rax]
       cmp      dword ptr [rax+8], 0
       jbe      G_M39753_IG23
       lea      rdi, bword ptr [rax+16]
       mov      esi, dword ptr [rbp-28H]
       mov      ecx, dword ptr [rbp-38H]
       cmp      esi, 0xD1FFAB1E
       jg       SHORT G_M39753_IG06
       cmp      esi, 0xD1FFAB1E
       ja       G_M39753_IG22

G_M39753_IG05:
       lea      eax, [rsi+2]
       mov      edx, 0xD1FFAB1E
       imul     edx:eax, edx
       mov      eax, edx
       shr      eax, 31
       add      edx, eax
       shl      edx, 2
       cmp      edx, ecx
       jg       SHORT G_M39753_IG06
       mov      eax, esi
       jmp      SHORT G_M39753_IG07

G_M39753_IG06:
       sar      ecx, 2
       lea      eax, [rcx+2*rcx]

G_M39753_IG07:
       mov      rdx, r15
       mov      rcx, r12
       movsxd   rsi, esi
       add      rsi, rdx
       movsxd   r8, eax
       add      r8, rdx
       cmp      eax, 16
       jl       G_M39753_IG12
       lea      rax, [r8-32]
       cmp      rax, r15
       jb       G_M39753_IG10
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

G_M39753_IG08:
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
       ja       SHORT G_M39753_IG09
       vmovdqu  ymm8, ymmword ptr[rdx]
       jmp      SHORT G_M39753_IG08

G_M39753_IG09:
       add      rdx, 4
       cmp      rdx, rsi
       je       G_M39753_IG16

G_M39753_IG10:
       lea      rax, [r8-16]
       cmp      rax, rdx
       jb       G_M39753_IG12
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

G_M39753_IG11:
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
       jbe      SHORT G_M39753_IG11
       cmp      rdx, rsi
       je       G_M39753_IG16

G_M39753_IG12:
       add      r8, -2
       cmp      rdx, r8
       jae      G_M39753_IG14

G_M39753_IG13:
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
       jb       G_M39753_IG13

G_M39753_IG14:
       add      r8, 2
       cmp      r8, rsi
       jne      G_M39753_IG18
       cmp      byte  ptr [rbp+10H], 0
       je       G_M39753_IG20
       lea      rax, [rdx+1]
       cmp      rax, rsi
       jne      SHORT G_M39753_IG15
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
       jmp      SHORT G_M39753_IG16

G_M39753_IG15:
       lea      rax, [rdx+2]
       cmp      rax, rsi
       jne      SHORT G_M39753_IG16
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

G_M39753_IG16:
       mov      rax, rdx
       sub      rax, r15
       mov      dword ptr [rbx], eax
       mov      rax, rcx
       sub      rax, r12
       mov      dword ptr [r14], eax
       xor      eax, eax

G_M39753_IG17:
       vzeroupper
       lea      rsp, [rbp-20H]
       pop      rbx
       pop      r12
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39753_IG18:
       mov      rax, rdx
       sub      rax, r15
       mov      dword ptr [rbx], eax
       mov      rax, rcx
       sub      rax, r12
       mov      dword ptr [r14], eax
       mov      eax, 1

G_M39753_IG19:
       vzeroupper
       lea      rsp, [rbp-20H]
       pop      rbx
       pop      r12
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39753_IG20:
       sub      rdx, r15
       mov      eax, edx
       mov      dword ptr [rbx], eax
       sub      rcx, r12
       mov      eax, ecx
       mov      dword ptr [r14], eax
       mov      eax, 2

G_M39753_IG21:
       vzeroupper
       lea      rsp, [rbp-20H]
       pop      rbx
       pop      r12
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39753_IG22:
       xor      edi, edi
       call     ThrowHelper:ThrowArgumentOutOfRangeException(int)
       int3

G_M39753_IG23:
       call     CORINFO_HELP_RNGCHKFAIL
       int3

; Total bytes of code 1209, prolog size 52 for method Base64_1:EncodeToUtf8(struct,struct,byref,byref,bool):int
; ============================================================
