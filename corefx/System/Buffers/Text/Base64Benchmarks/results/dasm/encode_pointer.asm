; Assembly listing for method Base64_1:EncodeToUtf8(struct,struct,byref,byref,bool):int
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00    ] (  5,  4   )  struct (16) [rbp-0x38]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V01 arg1         [V01    ] (  4,  3   )  struct (16) [rbp-0x48]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V02 arg2         [V02,T22] (  6,  4   )   byref  ->  rbx
;  V03 arg3         [V03,T23] (  6,  4   )   byref  ->  r14
;  V04 arg4         [V04,T114] (  1,  0.50)    bool  ->  [rbp+0x10]
;  V05 loc0         [V05,T26] (  8,  4   )    long  ->  r15
;  V06 loc1         [V06    ] (  1,  0.50)   byref  ->  [rbp-0x50]   must-init pinned
;  V07 loc2         [V07,T42] (  6,  3   )    long  ->  r12
;  V08 loc3         [V08    ] (  1,  0.50)   byref  ->  [rbp-0x58]   must-init pinned
;  V09 loc4         [V09,T43] (  6,  3   )     int  ->  rdi
;  V10 loc5         [V10,T78] (  3,  1.50)     int  ->  rsi
;  V11 loc6         [V11,T64] (  4,  2   )     int  ->  rax
;  V12 loc7         [V12,T00] ( 28, 35   )    long  ->  r13         ld-addr-op
;  V13 loc8         [V13,T03] ( 16, 18.50)    long  ->  [rbp-0x60]   ld-addr-op
;  V14 loc9         [V14,T44] (  6,  3   )    long  ->  [rbp-0x68]
;  V15 loc10        [V15,T19] (  8,  7.50)    long  ->  [rbp-0x70]
;* V16 loc11        [V16,T112] (  0,  0   )   byref  ->  zero-ref
;  V17 loc12        [V17,T11] (  6, 10   )     int  ->  rax
;  V18 loc13        [V18,T24] (  6,  6   )    long  ->  [rbp-0x78]
;# V19 OutArgs      [V19    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;* V20 tmp1         [V20    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V21 tmp2         [V21    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V22 tmp3         [V22    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;  V23 tmp4         [V23,T48] (  2,  2.50)  simd32  ->  mm0         "Inline stloc first use temp"
;  V24 tmp5         [V24,T82] (  2,  1   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V25 tmp6         [V25,T49] (  2,  2.50)  simd32  ->  mm1         "Inline stloc first use temp"
;  V26 tmp7         [V26,T50] (  2,  2.50)  simd32  ->  mm2         "Inline stloc first use temp"
;  V27 tmp8         [V27,T51] (  2,  2.50)  simd32  ->  mm3         "Inline stloc first use temp"
;  V28 tmp9         [V28,T52] (  2,  2.50)  simd32  ->  mm4         "Inline stloc first use temp"
;  V29 tmp10        [V29,T53] (  2,  2.50)  simd32  ->  mm5         "Inline stloc first use temp"
;  V30 tmp11        [V30,T54] (  2,  2.50)  simd32  ->  mm6         "Inline stloc first use temp"
;  V31 tmp12        [V31,T55] (  2,  2.50)  simd32  ->  mm7         "Inline stloc first use temp"
;  V32 tmp13        [V32,T12] (  6,  9   )    long  ->  rdi         "Inline stloc first use temp"
;  V33 tmp14        [V33,T20] (  5,  7   )    long  ->  rdx         "Inline stloc first use temp"
;  V34 tmp15        [V34,T25] (  4,  5   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V35 tmp16        [V35,T01] ( 12, 22.50)  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V36 tmp17        [V36,T27] (  2,  4   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V37 tmp18        [V37,T28] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V38 tmp19        [V38,T29] (  2,  4   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V39 tmp20        [V39,T30] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V40 tmp21        [V40,T31] (  2,  4   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V41 tmp22        [V41,T32] (  2,  4   )  simd32  ->  mm10         "Inline stloc first use temp"
;  V42 tmp23        [V42,T33] (  2,  4   )  simd32  ->  mm9         "Inline stloc first use temp"
;  V43 tmp24        [V43,T83] (  2,  1   )  simd32  ->  mm1         "Inline return value spill temp"
;  V44 tmp25        [V44,T84] (  2,  1   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V45 tmp26        [V45,T85] (  2,  1   )  simd32  ->  mm2         "Inline return value spill temp"
;  V46 tmp27        [V46,T86] (  2,  1   )  simd16  ->  mm2         "Inline stloc first use temp"
;  V47 tmp28        [V47,T87] (  2,  1   )  simd32  ->  mm3         "Inline return value spill temp"
;  V48 tmp29        [V48,T88] (  2,  1   )  simd16  ->  mm3         "Inline stloc first use temp"
;  V49 tmp30        [V49,T89] (  2,  1   )  simd32  ->  mm4         "Inline return value spill temp"
;  V50 tmp31        [V50,T90] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V51 tmp32        [V51,T91] (  2,  1   )  simd32  ->  mm5         "Inline return value spill temp"
;  V52 tmp33        [V52,T92] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V53 tmp34        [V53,T93] (  2,  1   )  simd32  ->  mm6         "Inline return value spill temp"
;  V54 tmp35        [V54,T94] (  2,  1   )  simd16  ->  mm6         "Inline stloc first use temp"
;  V55 tmp36        [V55,T56] (  2,  2.50)  simd16  ->  mm0         "Inline stloc first use temp"
;* V56 tmp37        [V56    ] (  0,  0   )  simd16  ->  zero-ref    ld-addr-op "Inline stloc first use temp"
;  V57 tmp38        [V57,T57] (  2,  2.50)  simd16  ->  mm1         "Inline stloc first use temp"
;  V58 tmp39        [V58,T58] (  2,  2.50)  simd16  ->  mm2         "Inline stloc first use temp"
;  V59 tmp40        [V59,T59] (  2,  2.50)  simd16  ->  mm3         "Inline stloc first use temp"
;  V60 tmp41        [V60,T60] (  2,  2.50)  simd16  ->  mm4         "Inline stloc first use temp"
;  V61 tmp42        [V61,T61] (  2,  2.50)  simd16  ->  mm5         "Inline stloc first use temp"
;  V62 tmp43        [V62,T62] (  2,  2.50)  simd16  ->  mm6         "Inline stloc first use temp"
;  V63 tmp44        [V63,T63] (  2,  2.50)  simd16  ->  mm7         "Inline stloc first use temp"
;  V64 tmp45        [V64,T13] (  6,  9   )    long  ->  r13         "Inline stloc first use temp"
;  V65 tmp46        [V65,T21] (  5,  7   )    long  ->  rdx         "Inline stloc first use temp"
;  V66 tmp47        [V66,T34] (  2,  4   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V67 tmp48        [V67,T04] (  9, 18   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V68 tmp49        [V68,T35] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V69 tmp50        [V69,T36] (  2,  4   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V70 tmp51        [V70,T37] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V71 tmp52        [V71,T38] (  2,  4   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V72 tmp53        [V72,T39] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V73 tmp54        [V73,T40] (  2,  4   )  simd16  ->  mm10         "Inline stloc first use temp"
;  V74 tmp55        [V74,T41] (  2,  4   )  simd16  ->  mm9         "Inline stloc first use temp"
;  V75 tmp56        [V75,T95] (  2,  1   )  simd16  ->  mm1         "Inline return value spill temp"
;  V76 tmp57        [V76,T96] (  2,  1   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V77 tmp58        [V77,T97] (  2,  1   )  simd16  ->  mm2         "Inline return value spill temp"
;  V78 tmp59        [V78,T98] (  2,  1   )  simd16  ->  mm2         "Inline stloc first use temp"
;  V79 tmp60        [V79,T99] (  2,  1   )  simd16  ->  mm3         "Inline return value spill temp"
;  V80 tmp61        [V80,T100] (  2,  1   )  simd16  ->  mm3         "Inline stloc first use temp"
;  V81 tmp62        [V81,T101] (  2,  1   )  simd16  ->  mm4         "Inline return value spill temp"
;  V82 tmp63        [V82,T102] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V83 tmp64        [V83,T103] (  2,  1   )  simd16  ->  mm5         "Inline return value spill temp"
;  V84 tmp65        [V84,T104] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V85 tmp66        [V85,T105] (  2,  1   )  simd16  ->  mm6         "Inline return value spill temp"
;  V86 tmp67        [V86,T106] (  2,  1   )  simd16  ->  mm6         "Inline stloc first use temp"
;* V87 tmp68        [V87    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V88 tmp69        [V88    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V89 tmp70        [V89    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V90 tmp71        [V90,T14] (  2,  8   )    long  ->  rdi         "Inline stloc first use temp"
;  V91 tmp72        [V91,T05] (  2, 16   )    long  ->  rax         "impAppendStmt"
;  V92 tmp73        [V92,T15] (  2,  8   )    long  ->  rsi         "Inline stloc first use temp"
;  V93 tmp74        [V93,T02] (  5, 20   )    long  ->  rax         "Inline stloc first use temp"
;  V94 tmp75        [V94,T06] (  2, 16   )    long  ->  rdi         "impAppendStmt"
;  V95 tmp76        [V95,T16] (  2,  8   )    long  ->  rsi         "Inline stloc first use temp"
;  V96 tmp77        [V96,T17] (  2,  8   )    long  ->   r9         "Inline stloc first use temp"
;  V97 tmp78        [V97,T18] (  2,  8   )    long  ->  rax         "Inline stloc first use temp"
;* V98 tmp79        [V98    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V99 tmp80        [V99,T07] (  2, 16   )    long  ->  rdi         "NewObj constructor temp"
;* V100 tmp81       [V100    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V101 tmp82       [V101    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V102 tmp83       [V102,T08] (  2, 16   )    long  ->  rsi         "NewObj constructor temp"
;* V103 tmp84       [V103    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V104 tmp85       [V104    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V105 tmp86       [V105,T09] (  2, 16   )    long  ->   r9         "NewObj constructor temp"
;* V106 tmp87       [V106    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V107 tmp88       [V107    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V108 tmp89       [V108,T10] (  2, 16   )    long  ->  rax         "NewObj constructor temp"
;* V109 tmp90       [V109    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V110 tmp91       [V110    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V111 tmp92       [V111    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V112 tmp93       [V112,T79] (  3,  1.50)    long  ->  rax         "Inline stloc first use temp"
;  V113 tmp94       [V113,T66] (  2,  2   )    long  ->  rdi         "impAppendStmt"
;  V114 tmp95       [V114,T107] (  2,  1   )    long  ->  rax         "Inline stloc first use temp"
;* V115 tmp96       [V115    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V116 tmp97       [V116,T67] (  2,  2   )    long  ->  rdi         "NewObj constructor temp"
;* V117 tmp98       [V117    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V118 tmp99       [V118    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V119 tmp100      [V119,T68] (  2,  2   )    long  ->  rax         "NewObj constructor temp"
;* V120 tmp101      [V120    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V121 tmp102      [V121    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V122 tmp103      [V122    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V123 tmp104      [V123,T108] (  2,  1   )    long  ->  rdi         "Inline stloc first use temp"
;  V124 tmp105      [V124,T69] (  2,  2   )    long  ->  rax         "impAppendStmt"
;  V125 tmp106      [V125,T65] (  4,  2   )    long  ->  rax         "Inline stloc first use temp"
;  V126 tmp107      [V126,T70] (  2,  2   )    long  ->  rdi         "impAppendStmt"
;  V127 tmp108      [V127,T109] (  2,  1   )    long  ->  rsi         "Inline stloc first use temp"
;  V128 tmp109      [V128,T110] (  2,  1   )    long  ->  rax         "Inline stloc first use temp"
;* V129 tmp110      [V129    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V130 tmp111      [V130,T71] (  2,  2   )    long  ->  rdi         "NewObj constructor temp"
;* V131 tmp112      [V131    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V132 tmp113      [V132    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V133 tmp114      [V133,T72] (  2,  2   )    long  ->  rsi         "NewObj constructor temp"
;* V134 tmp115      [V134    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V135 tmp116      [V135    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V136 tmp117      [V136,T73] (  2,  2   )    long  ->  rax         "NewObj constructor temp"
;* V137 tmp118      [V137    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V138 tmp119      [V138    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V139 tmp120      [V139,T80] (  0,  0   )   byref  ->  zero-ref    V20._pointer(offs=0x00) P-INDEP "field V20._pointer (fldOffset=0x0)"
;* V140 tmp121      [V140    ] (  0,  0   )     int  ->  zero-ref    V20._length(offs=0x08) P-INDEP "field V20._length (fldOffset=0x8)"
;  V141 tmp122      [V141,T76] (  3,  1.50)   byref  ->  rdx         V21._pointer(offs=0x00) P-INDEP "field V21._pointer (fldOffset=0x0)"
;* V142 tmp123      [V142    ] (  0,  0   )     int  ->  zero-ref    V21._length(offs=0x08) P-INDEP "field V21._length (fldOffset=0x8)"
;  V143 tmp124      [V143,T77] (  3,  1.50)   byref  ->  rdx         V22._pointer(offs=0x00) P-INDEP "field V22._pointer (fldOffset=0x0)"
;* V144 tmp125      [V144    ] (  0,  0   )     int  ->  zero-ref    V22._length(offs=0x08) P-INDEP "field V22._length (fldOffset=0x8)"
;* V145 tmp126      [V145,T81] (  0,  0   )   byref  ->  zero-ref    V87._value(offs=0x00) P-INDEP "field V87._value (fldOffset=0x0)"
;* V146 tmp127      [V146,T113] (  0,  0   )   byref  ->  zero-ref    V88._pointer(offs=0x00) P-INDEP "field V88._pointer (fldOffset=0x0)"
;* V147 tmp128      [V147    ] (  0,  0   )     int  ->  zero-ref    V88._length(offs=0x08) P-INDEP "field V88._length (fldOffset=0x8)"
;  V148 tmp129      [V148,T45] (  3,  3   )   byref  ->  rax         "BlockOp address local"
;  V149 tmp130      [V149,T74] (  2,  2   )    long  ->  r15         "Cast away GC"
;  V150 tmp131      [V150,T46] (  3,  3   )   byref  ->  rax         "BlockOp address local"
;  V151 tmp132      [V151,T75] (  2,  2   )    long  ->  r12         "Cast away GC"
;* V152 cse0        [V152,T111] (  0,  0   )    long  ->  zero-ref    "ValNumCSE"
;  V153 rat0        [V153,T47] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;
; Lcl frame size = 88

G_M39757_IG01:
       push     rbp
       push     r15
       push     r14
       push     r13
       push     r12
       push     rbx
       sub      rsp, 88
       vzeroupper
       lea      rbp, [rsp+80H]
       xor      rax, rax
       mov      qword ptr [rbp-50H], rax
       mov      qword ptr [rbp-58H], rax
       mov      bword ptr [rbp-38H], rdi
       mov      qword ptr [rbp-30H], rsi
       mov      bword ptr [rbp-48H], rdx
       mov      qword ptr [rbp-40H], rcx
       mov      rbx, r8
       mov      r14, r9

G_M39757_IG02:
       cmp      dword ptr [rbp-30H], 0
       ja       SHORT G_M39757_IG04
       xor      eax, eax
       mov      dword ptr [rbx], eax
       mov      dword ptr [r14], eax

G_M39757_IG03:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39757_IG04:
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
       mov      edi, dword ptr [rbp-30H]
       mov      esi, dword ptr [rbp-40H]
       cmp      edi, 0xD1FFAB1E
       jg       SHORT G_M39757_IG06
       cmp      edi, 0xD1FFAB1E
       ja       G_M39757_IG25

G_M39757_IG05:
       lea      eax, [rdi+2]
       mov      edx, 0xD1FFAB1E
       imul     edx:eax, edx
       mov      eax, edx
       shr      eax, 31
       add      edx, eax
       shl      edx, 2
       cmp      edx, esi
       jg       SHORT G_M39757_IG06
       mov      eax, edi
       jmp      SHORT G_M39757_IG07

G_M39757_IG06:
       sar      esi, 2
       lea      eax, [rsi+2*rsi]

G_M39757_IG07:
       mov      r13, r15
       mov      rdx, r12
       movsxd   rdi, edi
       lea      rcx, [rdi+r13]
       mov      qword ptr [rbp-68H], rcx
       movsxd   rdi, eax
       lea      r8, [rdi+r13]
       cmp      eax, 16
       jl       G_M39757_IG12
       mov      qword ptr [rbp-70H], r8
       lea      rax, [r8-32]
       mov      qword ptr [rbp-78H], rax
       cmp      rax, r15
       jb       G_M39757_IG10
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

G_M39757_IG08:
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
       mov      r13, qword ptr [rbp-78H]
       cmp      rdi, r13
       ja       SHORT G_M39757_IG09
       vmovdqu  ymm8, ymmword ptr[rdi]
       mov      qword ptr [rbp-78H], r13
       jmp      SHORT G_M39757_IG08

G_M39757_IG09:
       lea      r13, [rdi+4]
       mov      qword ptr [rbp-60H], rdx
       cmp      r13, qword ptr [rbp-68H]
       je       G_M39757_IG18
       mov      rdx, qword ptr [rbp-60H]

G_M39757_IG10:
       mov      r8, qword ptr [rbp-70H]
       lea      rdi, [r8-16]
       mov      rax, rdi
       mov      qword ptr [rbp-78H], rax
       cmp      rax, r13
       jb       G_M39757_IG16
       mov      qword ptr [rbp-60H], rdx
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
       mov      rdx, qword ptr [rbp-60H]

G_M39757_IG11:
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
       mov      rax, qword ptr [rbp-78H]
       cmp      r13, rax
       mov      qword ptr [rbp-78H], rax
       jbe      SHORT G_M39757_IG11
       mov      rax, qword ptr [rbp-68H]
       cmp      r13, rax
       mov      qword ptr [rbp-68H], rax
       mov      r8, qword ptr [rbp-70H]
       je       G_M39757_IG15

G_M39757_IG12:
       add      r8, -2
       cmp      r13, r8
       jae      G_M39757_IG14

G_M39757_IG13:
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
       jb       G_M39757_IG13

G_M39757_IG14:
       add      r8, 2
       mov      rcx, qword ptr [rbp-68H]
       cmp      r8, rcx
       jne      G_M39757_IG21
       cmp      byte  ptr [rbp+10H], 0
       je       G_M39757_IG23
       lea      rax, [r13+1]
       cmp      rax, rcx
       jne      SHORT G_M39757_IG17
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
       mov      qword ptr [rbp-60H], rdx
       jmp      G_M39757_IG18

G_M39757_IG15:
       mov      qword ptr [rbp-60H], rdx
       jmp      G_M39757_IG18

G_M39757_IG16:
       mov      r8, qword ptr [rbp-70H]
       jmp      G_M39757_IG12

G_M39757_IG17:
       lea      rax, [r13+2]
       cmp      rax, rcx
       jne      G_M39757_IG20
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
       mov      qword ptr [rbp-60H], rdx

G_M39757_IG18:
       mov      rax, r13
       sub      rax, r15
       mov      dword ptr [rbx], eax
       mov      rdx, qword ptr [rbp-60H]
       mov      rax, rdx
       sub      rax, r12
       mov      dword ptr [r14], eax
       xor      eax, eax

G_M39757_IG19:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39757_IG20:
       mov      qword ptr [rbp-60H], rdx
       jmp      SHORT G_M39757_IG18

G_M39757_IG21:
       mov      rax, r13
       sub      rax, r15
       mov      dword ptr [rbx], eax
       mov      rax, rdx
       sub      rax, r12
       mov      dword ptr [r14], eax
       mov      eax, 1

G_M39757_IG22:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39757_IG23:
       sub      r13, r15
       mov      eax, r13d
       mov      dword ptr [rbx], eax
       sub      rdx, r12
       mov      eax, edx
       mov      dword ptr [r14], eax
       mov      eax, 2

G_M39757_IG24:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M39757_IG25:
       xor      edi, edi
       call     ThrowHelper:ThrowArgumentOutOfRangeException(int)
       int3

; Total bytes of code 1370, prolog size 57 for method Base64_1:EncodeToUtf8(struct,struct,byref,byref,bool):int
; ============================================================
