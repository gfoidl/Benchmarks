; Assembly listing for method Base64_1:EncodeToUtf8(struct,struct,byref,byref,bool):int
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00    ] (  5,  4   )  struct (16) [rbp-0x38]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V01 arg1         [V01    ] (  4,  3   )  struct (16) [rbp-0x48]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V02 arg2         [V02,T18] (  6,  4   )   byref  ->  rbx
;  V03 arg3         [V03,T19] (  6,  4   )   byref  ->  r14
;  V04 arg4         [V04,T106] (  1,  0.50)    bool  ->  [rbp+0x10]
;  V05 loc0         [V05,T22] (  8,  4   )    long  ->  r15
;  V06 loc1         [V06    ] (  1,  0.50)   byref  ->  [rbp-0x50]   must-init pinned
;  V07 loc2         [V07,T38] (  6,  3   )    long  ->  r12
;  V08 loc3         [V08    ] (  1,  0.50)   byref  ->  [rbp-0x58]   must-init pinned
;* V09 loc4         [V09,T107] (  0,  0   )    long  ->  zero-ref
;  V10 loc5         [V10    ] (  1,  0.50)   byref  ->  [rbp-0x60]   must-init pinned
;  V11 loc6         [V11,T39] (  6,  3   )     int  ->  rdi
;  V12 loc7         [V12,T69] (  3,  1.50)     int  ->  rsi
;  V13 loc8         [V13,T60] (  4,  2   )     int  ->  rax
;  V14 loc9         [V14,T00] ( 28, 35   )    long  ->  r13         ld-addr-op
;  V15 loc10        [V15,T03] ( 16, 18.50)    long  ->  [rbp-0x68]   ld-addr-op
;  V16 loc11        [V16,T40] (  6,  3   )    long  ->  [rbp-0x70]
;  V17 loc12        [V17,T15] (  8,  7.50)    long  ->  [rbp-0x78]
;  V18 loc13        [V18,T07] (  6, 10   )     int  ->  rax
;  V19 loc14        [V19,T20] (  6,  6   )    long  ->  [rbp-0x80]
;# V20 OutArgs      [V20    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;* V21 tmp1         [V21    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;* V22 tmp2         [V22    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V23 tmp3         [V23    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V24 tmp4         [V24    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V25 tmp5         [V25    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V26 tmp6         [V26    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;  V27 tmp7         [V27,T44] (  2,  2.50)  simd32  ->  mm0         "Inline stloc first use temp"
;  V28 tmp8         [V28,T74] (  2,  1   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V29 tmp9         [V29,T45] (  2,  2.50)  simd32  ->  mm1         "Inline stloc first use temp"
;  V30 tmp10        [V30,T46] (  2,  2.50)  simd32  ->  mm2         "Inline stloc first use temp"
;  V31 tmp11        [V31,T47] (  2,  2.50)  simd32  ->  mm3         "Inline stloc first use temp"
;  V32 tmp12        [V32,T48] (  2,  2.50)  simd32  ->  mm4         "Inline stloc first use temp"
;  V33 tmp13        [V33,T49] (  2,  2.50)  simd32  ->  mm5         "Inline stloc first use temp"
;  V34 tmp14        [V34,T50] (  2,  2.50)  simd32  ->  mm6         "Inline stloc first use temp"
;  V35 tmp15        [V35,T51] (  2,  2.50)  simd32  ->  mm7         "Inline stloc first use temp"
;  V36 tmp16        [V36,T08] (  6,  9   )    long  ->  rdi         "Inline stloc first use temp"
;  V37 tmp17        [V37,T16] (  5,  7   )    long  ->  rdx         "Inline stloc first use temp"
;  V38 tmp18        [V38,T21] (  4,  5   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V39 tmp19        [V39,T01] ( 12, 22.50)  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V40 tmp20        [V40,T23] (  2,  4   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V41 tmp21        [V41,T24] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V42 tmp22        [V42,T25] (  2,  4   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V43 tmp23        [V43,T26] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V44 tmp24        [V44,T27] (  2,  4   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V45 tmp25        [V45,T28] (  2,  4   )  simd32  ->  mm10         "Inline stloc first use temp"
;  V46 tmp26        [V46,T29] (  2,  4   )  simd32  ->  mm9         "Inline stloc first use temp"
;  V47 tmp27        [V47,T75] (  2,  1   )  simd32  ->  mm1         "Inline return value spill temp"
;  V48 tmp28        [V48,T76] (  2,  1   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V49 tmp29        [V49,T77] (  2,  1   )  simd32  ->  mm2         "Inline return value spill temp"
;  V50 tmp30        [V50,T78] (  2,  1   )  simd16  ->  mm2         "Inline stloc first use temp"
;  V51 tmp31        [V51,T79] (  2,  1   )  simd32  ->  mm3         "Inline return value spill temp"
;  V52 tmp32        [V52,T80] (  2,  1   )  simd16  ->  mm3         "Inline stloc first use temp"
;  V53 tmp33        [V53,T81] (  2,  1   )  simd32  ->  mm4         "Inline return value spill temp"
;  V54 tmp34        [V54,T82] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V55 tmp35        [V55,T83] (  2,  1   )  simd32  ->  mm5         "Inline return value spill temp"
;  V56 tmp36        [V56,T84] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V57 tmp37        [V57,T85] (  2,  1   )  simd32  ->  mm6         "Inline return value spill temp"
;  V58 tmp38        [V58,T86] (  2,  1   )  simd16  ->  mm6         "Inline stloc first use temp"
;  V59 tmp39        [V59,T52] (  2,  2.50)  simd16  ->  mm0         "Inline stloc first use temp"
;* V60 tmp40        [V60    ] (  0,  0   )  simd16  ->  zero-ref    ld-addr-op "Inline stloc first use temp"
;  V61 tmp41        [V61,T53] (  2,  2.50)  simd16  ->  mm1         "Inline stloc first use temp"
;  V62 tmp42        [V62,T54] (  2,  2.50)  simd16  ->  mm2         "Inline stloc first use temp"
;  V63 tmp43        [V63,T55] (  2,  2.50)  simd16  ->  mm3         "Inline stloc first use temp"
;  V64 tmp44        [V64,T56] (  2,  2.50)  simd16  ->  mm4         "Inline stloc first use temp"
;  V65 tmp45        [V65,T57] (  2,  2.50)  simd16  ->  mm5         "Inline stloc first use temp"
;  V66 tmp46        [V66,T58] (  2,  2.50)  simd16  ->  mm6         "Inline stloc first use temp"
;  V67 tmp47        [V67,T59] (  2,  2.50)  simd16  ->  mm7         "Inline stloc first use temp"
;  V68 tmp48        [V68,T09] (  6,  9   )    long  ->  r13         "Inline stloc first use temp"
;  V69 tmp49        [V69,T17] (  5,  7   )    long  ->  rdx         "Inline stloc first use temp"
;  V70 tmp50        [V70,T30] (  2,  4   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V71 tmp51        [V71,T04] (  9, 18   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V72 tmp52        [V72,T31] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V73 tmp53        [V73,T32] (  2,  4   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V74 tmp54        [V74,T33] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V75 tmp55        [V75,T34] (  2,  4   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V76 tmp56        [V76,T35] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V77 tmp57        [V77,T36] (  2,  4   )  simd16  ->  mm10         "Inline stloc first use temp"
;  V78 tmp58        [V78,T37] (  2,  4   )  simd16  ->  mm9         "Inline stloc first use temp"
;  V79 tmp59        [V79,T87] (  2,  1   )  simd16  ->  mm1         "Inline return value spill temp"
;  V80 tmp60        [V80,T88] (  2,  1   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V81 tmp61        [V81,T89] (  2,  1   )  simd16  ->  mm2         "Inline return value spill temp"
;  V82 tmp62        [V82,T90] (  2,  1   )  simd16  ->  mm2         "Inline stloc first use temp"
;  V83 tmp63        [V83,T91] (  2,  1   )  simd16  ->  mm3         "Inline return value spill temp"
;  V84 tmp64        [V84,T92] (  2,  1   )  simd16  ->  mm3         "Inline stloc first use temp"
;  V85 tmp65        [V85,T93] (  2,  1   )  simd16  ->  mm4         "Inline return value spill temp"
;  V86 tmp66        [V86,T94] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V87 tmp67        [V87,T95] (  2,  1   )  simd16  ->  mm5         "Inline return value spill temp"
;  V88 tmp68        [V88,T96] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V89 tmp69        [V89,T97] (  2,  1   )  simd16  ->  mm6         "Inline return value spill temp"
;  V90 tmp70        [V90,T98] (  2,  1   )  simd16  ->  mm6         "Inline stloc first use temp"
;* V91 tmp71        [V91    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V92 tmp72        [V92,T10] (  2,  8   )    long  ->  rdi         "Inline stloc first use temp"
;  V93 tmp73        [V93,T05] (  2, 16   )    long  ->  rax         "impAppendStmt"
;  V94 tmp74        [V94,T11] (  2,  8   )    long  ->  rsi         "Inline stloc first use temp"
;  V95 tmp75        [V95,T02] (  5, 20   )    long  ->  rax         "Inline stloc first use temp"
;  V96 tmp76        [V96,T12] (  2,  8   )    long  ->  rsi         "Inline stloc first use temp"
;  V97 tmp77        [V97,T06] (  2, 16   )    long  ->  rdi         "impAppendStmt"
;  V98 tmp78        [V98,T13] (  2,  8   )    long  ->   r9         "Inline stloc first use temp"
;  V99 tmp79        [V99,T14] (  2,  8   )    long  ->  rax         "Inline stloc first use temp"
;* V100 tmp80       [V100    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V101 tmp81       [V101    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V102 tmp82       [V102,T70] (  3,  1.50)    long  ->  rax         "Inline stloc first use temp"
;  V103 tmp83       [V103,T99] (  2,  1   )    long  ->  rax         "Inline stloc first use temp"
;  V104 tmp84       [V104,T62] (  2,  2   )    long  ->  rdi         "impAppendStmt"
;* V105 tmp85       [V105    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V106 tmp86       [V106    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V107 tmp87       [V107,T100] (  2,  1   )    long  ->  rdi         "Inline stloc first use temp"
;  V108 tmp88       [V108,T63] (  2,  2   )    long  ->  rax         "impAppendStmt"
;  V109 tmp89       [V109,T61] (  4,  2   )    long  ->  rax         "Inline stloc first use temp"
;  V110 tmp90       [V110,T101] (  2,  1   )    long  ->  rsi         "Inline stloc first use temp"
;  V111 tmp91       [V111,T64] (  2,  2   )    long  ->  rdi         "impAppendStmt"
;  V112 tmp92       [V112,T102] (  2,  1   )    long  ->  rax         "Inline stloc first use temp"
;* V113 tmp93       [V113    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V114 tmp94       [V114,T71] (  0,  0   )   byref  ->  zero-ref    V21._pointer(offs=0x00) P-INDEP "field V21._pointer (fldOffset=0x0)"
;* V115 tmp95       [V115    ] (  0,  0   )     int  ->  zero-ref    V21._length(offs=0x08) P-INDEP "field V21._length (fldOffset=0x8)"
;  V116 tmp96       [V116,T67] (  3,  1.50)   byref  ->  rdx         V22._pointer(offs=0x00) P-INDEP "field V22._pointer (fldOffset=0x0)"
;* V117 tmp97       [V117    ] (  0,  0   )     int  ->  zero-ref    V22._length(offs=0x08) P-INDEP "field V22._length (fldOffset=0x8)"
;  V118 tmp98       [V118,T68] (  3,  1.50)   byref  ->  rdx         V23._pointer(offs=0x00) P-INDEP "field V23._pointer (fldOffset=0x0)"
;* V119 tmp99       [V119    ] (  0,  0   )     int  ->  zero-ref    V23._length(offs=0x08) P-INDEP "field V23._length (fldOffset=0x8)"
;* V120 tmp100      [V120,T72] (  0,  0   )   byref  ->  zero-ref    V24._pointer(offs=0x00) P-INDEP "field V24._pointer (fldOffset=0x0)"
;* V121 tmp101      [V121    ] (  0,  0   )     int  ->  zero-ref    V24._length(offs=0x08) P-INDEP "field V24._length (fldOffset=0x8)"
;* V122 tmp102      [V122,T73] (  0,  0   )   byref  ->  zero-ref    V25._value(offs=0x00) P-INDEP "field V25._value (fldOffset=0x0)"
;* V123 tmp103      [V123,T105] (  0,  0   )   byref  ->  zero-ref    V26._pointer(offs=0x00) P-INDEP "field V26._pointer (fldOffset=0x0)"
;* V124 tmp104      [V124    ] (  0,  0   )     int  ->  zero-ref    V26._length(offs=0x08) P-INDEP "field V26._length (fldOffset=0x8)"
;  V125 tmp105      [V125,T41] (  3,  3   )   byref  ->  rax         "BlockOp address local"
;  V126 tmp106      [V126,T65] (  2,  2   )    long  ->  r15         "Cast away GC"
;  V127 tmp107      [V127,T42] (  3,  3   )   byref  ->  rax         "BlockOp address local"
;  V128 tmp108      [V128,T66] (  2,  2   )    long  ->  r12         "Cast away GC"
;* V129 tmp109      [V129,T104] (  0,  0   )    long  ->  zero-ref    "Cast away GC"
;* V130 cse0        [V130,T103] (  0,  0   )    long  ->  zero-ref    "ValNumCSE"
;  V131 rat0        [V131,T43] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;
; Lcl frame size = 88

G_M39731_IG01:
       push     rbp
       push     r15
       push     r14
       push     r13
       push     r12
       push     rbx
       sub      rsp, 88
       vzeroupper
       lea      rbp, [rsp+80H]
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

G_M39731_IG02:
       cmp      dword ptr [rbp-30H], 0
       ja       SHORT G_M39731_IG04
       xor      eax, eax
       mov      dword ptr [rbx], eax
       mov      dword ptr [r14], eax

G_M39731_IG03:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39731_IG04:
       lea      rax, bword ptr [rbp-38H]
       mov      rdx, bword ptr [rax]
       mov      eax, dword ptr [rax+8]
       mov      bword ptr [rbp-50H], rdx
       mov      r15, rdx
       lea      rax, bword ptr [rbp-48H]
       mov      rdx, bword ptr [rax]
       mov      eax, dword ptr [rax+8]
       mov      bword ptr [rbp-58H], rdx
       mov      r12, rdx
       mov      rax, 0xD1FFAB1E
       mov      bword ptr [rbp-60H], rax
       mov      edi, dword ptr [rbp-30H]
       mov      esi, dword ptr [rbp-40H]
       cmp      edi, 0xD1FFAB1E
       jg       SHORT G_M39731_IG06
       cmp      edi, 0xD1FFAB1E
       ja       G_M39731_IG25

G_M39731_IG05:
       lea      eax, [rdi+2]
       mov      edx, 0xD1FFAB1E
       imul     edx:eax, edx
       mov      eax, edx
       shr      eax, 31
       add      edx, eax
       shl      edx, 2
       cmp      edx, esi
       jg       SHORT G_M39731_IG06
       mov      eax, edi
       jmp      SHORT G_M39731_IG07

G_M39731_IG06:
       sar      esi, 2
       lea      eax, [rsi+2*rsi]

G_M39731_IG07:
       mov      r13, r15
       mov      rdx, r12
       movsxd   rdi, edi
       lea      rcx, [rdi+r13]
       mov      qword ptr [rbp-70H], rcx
       movsxd   rdi, eax
       lea      r8, [rdi+r13]
       cmp      eax, 16
       jl       G_M39731_IG12
       mov      qword ptr [rbp-78H], r8
       lea      rax, [r8-32]
       mov      qword ptr [rbp-80H], rax
       cmp      rax, r15
       jb       G_M39731_IG10
       mov      rdi, 0xD1FFAB1E
       mov      esi, 4
       call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       mov      rdi, 0xD1FFAB1E
       mov      rdi, gword ptr [rdi]
       vmovupd  ymm0, ymmword ptr[rdi+8]
       mov      edi, 0xD1FFAB1E
       vmovd    xmm1, edi
       vpbroadcastd ymm1, ymm1
       mov      edi, 0xD1FFAB1E
       vmovd    xmm2, edi
       vpbroadcastd ymm2, ymm2
       mov      edi, 0xD1FFAB1E
       vmovd    xmm3, edi
       vpbroadcastd ymm3, ymm3
       mov      edi, 0xD1FFAB1E
       vmovd    xmm4, edi
       vpbroadcastd ymm4, ymm4
       mov      edi, 51
       vmovd    xmm5, edi
       vpbroadcastb ymm5, ymm5
       mov      edi, 25
       vmovd    xmm6, edi
       vpbroadcastb ymm6, ymm6
       mov      rdi, 0xD1FFAB1E
       mov      rdi, gword ptr [rdi]
       vmovupd  ymm7, ymmword ptr[rdi+8]
       mov      rdx, r12
       vmovdqu  ymm8, ymmword ptr[r15]
       mov      rdi, 0xD1FFAB1E
       mov      rdi, gword ptr [rdi]
       vmovupd  ymm9, ymmword ptr[rdi+8]
       vpermd   ymm8, ymm9, ymm8
       lea      rdi, [r15-4]

G_M39731_IG08:
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
       vmovdqu  ymmword ptr[rdx], ymm8
       add      rdi, 24
       add      rdx, 32
       mov      r13, qword ptr [rbp-80H]
       cmp      rdi, r13
       ja       SHORT G_M39731_IG09
       vmovdqu  ymm8, ymmword ptr[rdi]
       mov      qword ptr [rbp-80H], r13
       jmp      SHORT G_M39731_IG08

G_M39731_IG09:
       lea      r13, [rdi+4]
       mov      qword ptr [rbp-68H], rdx
       cmp      r13, qword ptr [rbp-70H]
       je       G_M39731_IG18
       mov      rdx, qword ptr [rbp-68H]

G_M39731_IG10:
       mov      r8, qword ptr [rbp-78H]
       lea      rdi, [r8-16]
       mov      rax, rdi
       mov      qword ptr [rbp-80H], rax
       cmp      rax, r13
       jb       G_M39731_IG16
       mov      qword ptr [rbp-68H], rdx
       mov      rdi, 0xD1FFAB1E
       mov      esi, 4
       call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       mov      rax, 0xD1FFAB1E
       mov      rax, gword ptr [rax]
       vmovupd  xmm0, xmmword ptr [rax+8]
       mov      eax, 0xD1FFAB1E
       vmovd    xmm1, eax
       vpbroadcastd xmm1, xmm1
       mov      eax, 0xD1FFAB1E
       vmovd    xmm2, eax
       vpbroadcastd xmm2, xmm2
       mov      eax, 0xD1FFAB1E
       vmovd    xmm3, eax
       vpbroadcastd xmm3, xmm3
       mov      eax, 0xD1FFAB1E
       vmovd    xmm4, eax
       vpbroadcastd xmm4, xmm4
       mov      eax, 51
       vmovd    xmm5, eax
       vpbroadcastb xmm5, xmm5
       mov      eax, 25
       vmovd    xmm6, eax
       vpbroadcastb xmm6, xmm6
       mov      rax, 0xD1FFAB1E
       mov      rax, gword ptr [rax]
       vmovupd  xmm7, xmmword ptr [rax+8]
       mov      rdx, qword ptr [rbp-68H]

G_M39731_IG11:
       vmovdqu  xmm8, xmmword ptr [r13]
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
       vmovdqu  xmmword ptr [rdx], xmm8
       add      r13, 12
       add      rdx, 16
       mov      rax, qword ptr [rbp-80H]
       cmp      r13, rax
       mov      qword ptr [rbp-80H], rax
       jbe      SHORT G_M39731_IG11
       mov      rax, qword ptr [rbp-70H]
       cmp      r13, rax
       mov      qword ptr [rbp-70H], rax
       mov      r8, qword ptr [rbp-78H]
       je       G_M39731_IG15

G_M39731_IG12:
       add      r8, -2
       cmp      r13, r8
       jae      G_M39731_IG14

G_M39731_IG13:
       movzx    rax, byte  ptr [r13]
       mov      eax, eax
       movzx    rdi, byte  ptr [r13+1]
       mov      edi, edi
       movzx    rsi, byte  ptr [r13+2]
       mov      esi, esi
       shl      rax, 16
       shl      rdi, 8
       or       rax, rdi
       or       rax, rsi
       mov      rdi, rax
       shr      rdi, 18
       mov      rsi, 0xD1FFAB1E
       movzx    rdi, byte  ptr [rdi+rsi]
       mov      edi, edi
       mov      rsi, rax
       shr      rsi, 12
       and      rsi, 63
       mov      r9, 0xD1FFAB1E
       movzx    rsi, byte  ptr [rsi+r9]
       mov      esi, esi
       mov      r9, rax
       shr      r9, 6
       and      r9, 63
       mov      r10, 0xD1FFAB1E
       movzx    r9, byte  ptr [r9+r10]
       mov      r9d, r9d
       and      rax, 63
       movzx    rax, byte  ptr [rax+r10]
       mov      eax, eax
       shl      esi, 8
       or       edi, esi
       shl      r9d, 16
       or       edi, r9d
       shl      eax, 24
       or       eax, edi
       mov      dword ptr [rdx], eax
       add      r13, 3
       add      rdx, 4
       cmp      r13, r8
       jb       G_M39731_IG13

G_M39731_IG14:
       add      r8, 2
       mov      rcx, qword ptr [rbp-70H]
       cmp      r8, rcx
       jne      G_M39731_IG21
       cmp      byte  ptr [rbp+10H], 0
       je       G_M39731_IG23
       lea      rax, [r13+1]
       cmp      rax, rcx
       jne      SHORT G_M39731_IG17
       movzx    rcx, byte  ptr [r13]
       mov      eax, ecx
       shl      rax, 8
       mov      rdi, rax
       shr      rdi, 10
       mov      rsi, 0xD1FFAB1E
       movzx    rdi, byte  ptr [rdi+rsi]
       mov      edi, edi
       shr      rax, 4
       and      rax, 63
       movzx    rax, byte  ptr [rax+rsi]
       mov      eax, eax
       shl      eax, 8
       or       edi, eax
       or       edi, 0xD1FFAB1E
       mov      eax, edi
       or       eax, 0xD1FFAB1E
       mov      dword ptr [rdx], eax
       inc      r13
       add      rdx, 4
       mov      qword ptr [rbp-68H], rdx
       jmp      G_M39731_IG18

G_M39731_IG15:
       mov      qword ptr [rbp-68H], rdx
       jmp      G_M39731_IG18

G_M39731_IG16:
       mov      r8, qword ptr [rbp-78H]
       jmp      G_M39731_IG12

G_M39731_IG17:
       lea      rax, [r13+2]
       cmp      rax, rcx
       jne      G_M39731_IG20
       movzx    rax, byte  ptr [r13]
       mov      eax, eax
       movzx    rdi, byte  ptr [r13+1]
       mov      edi, edi
       shl      rax, 16
       shl      rdi, 8
       or       rax, rdi
       mov      rdi, rax
       shr      rdi, 18
       mov      rsi, 0xD1FFAB1E
       movzx    rdi, byte  ptr [rdi+rsi]
       mov      edi, edi
       mov      rsi, rax
       shr      rsi, 12
       and      rsi, 63
       mov      rcx, 0xD1FFAB1E
       movzx    rsi, byte  ptr [rsi+rcx]
       mov      esi, esi
       shr      rax, 6
       and      rax, 63
       movzx    rax, byte  ptr [rax+rcx]
       mov      eax, eax
       shl      esi, 8
       or       edi, esi
       shl      eax, 16
       or       edi, eax
       mov      eax, edi
       or       eax, 0xD1FFAB1E
       mov      dword ptr [rdx], eax
       add      r13, 2
       add      rdx, 4
       mov      qword ptr [rbp-68H], rdx

G_M39731_IG18:
       mov      rax, r13
       sub      rax, r15
       mov      dword ptr [rbx], eax
       mov      rdx, qword ptr [rbp-68H]
       mov      rax, rdx
       sub      rax, r12
       mov      dword ptr [r14], eax
       xor      eax, eax

G_M39731_IG19:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39731_IG20:
       mov      qword ptr [rbp-68H], rdx
       jmp      SHORT G_M39731_IG18

G_M39731_IG21:
       mov      rax, r13
       sub      rax, r15
       mov      dword ptr [rbx], eax
       mov      rax, rdx
       sub      rax, r12
       mov      dword ptr [r14], eax
       mov      eax, 1

G_M39731_IG22:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39731_IG23:
       sub      r13, r15
       mov      eax, r13d
       mov      dword ptr [rbx], eax
       sub      rdx, r12
       mov      eax, edx
       mov      dword ptr [r14], eax
       mov      eax, 2

G_M39731_IG24:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39731_IG25:
       xor      edi, edi
       call     ThrowHelper:ThrowArgumentOutOfRangeException(int)
       int3

; Total bytes of code 1399, prolog size 72 for method Base64_1:EncodeToUtf8(struct,struct,byref,byref,bool):int
; ============================================================
