; Assembly listing for method Base64_1:DecodeFromUtf8(struct,struct,byref,byref,bool):int
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00    ] (  7,  5   )  struct (16) [rbp-0x38]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V01 arg1         [V01    ] (  4,  3   )  struct (16) [rbp-0x48]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V02 arg2         [V02,T21] (  7,  4.50)   byref  ->  rbx
;  V03 arg3         [V03,T22] (  7,  4.50)   byref  ->  r14
;  V04 arg4         [V04,T81] (  3,  1.50)    bool  ->  [rbp+0x10]
;  V05 loc0         [V05,T30] (  9,  4.50)    long  ->  r12
;  V06 loc1         [V06    ] (  1,  0.50)   byref  ->  [rbp-0x50]   must-init pinned
;  V07 loc2         [V07,T31] (  8,  4   )    long  ->  r13
;  V08 loc3         [V08    ] (  1,  0.50)   byref  ->  [rbp-0x58]   must-init pinned
;* V09 loc4         [V09,T101] (  0,  0   )   byref  ->  zero-ref
;  V10 loc5         [V10,T47] (  7,  3.50)     int  ->  [rbp-0x5C]
;  V11 loc6         [V11,T48] (  6,  3   )     int  ->  [rbp-0x60]
;  V12 loc7         [V12,T29] ( 10,  5   )     int  ->   r9
;  V13 loc8         [V13,T82] (  3,  1.50)     int  ->  [rbp-0x64]
;  V14 loc9         [V14,T00] ( 24, 36.50)    long  ->  [rbp-0x70]   ld-addr-op
;  V15 loc10        [V15,T01] ( 28, 31.50)    long  ->  [rbp-0x78]   ld-addr-op
;  V16 loc11        [V16,T32] (  8,  4   )    long  ->  [rbp-0x80]
;  V17 loc12        [V17,T23] (  6,  6.50)    long  ->  [rbp-0x88]
;  V18 loc13        [V18,T83] (  3,  1.50)     int  ->  [rbp-0x8C]
;  V19 loc14        [V19,T89] (  2,  1   )     int  ->  rdi
;  V20 loc15        [V20,T90] (  2,  1   )     int  ->  rsi
;  V21 loc16        [V21,T66] (  4,  2   )     int  ->  rcx
;  V22 loc17        [V22,T84] (  3,  1.50)     int  ->   r8
;  V23 loc18        [V23,T07] ( 20, 10   )     int  ->  rdi
;  V24 loc19        [V24,T67] (  4,  2   )     int  ->  rsi
;  V25 loc20        [V25,T68] (  4,  2   )    long  ->  rsi
;  V26 loc21        [V26,T26] (  6,  6   )    long  ->  [rbp-0x98]
;  V27 loc22        [V27,T03] (  5, 20   )     int  ->  rdi
;  V28 loc23        [V28,T69] (  4,  2   )     int  ->  rcx
;  V29 loc24        [V29,T91] (  2,  1   )     int  ->   r8
;  V30 loc25        [V30,T70] (  4,  2   )     int  ->  rcx
;# V31 OutArgs      [V31    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;* V32 tmp1         [V32    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V33 tmp2         [V33,T85] (  3,  1.50)     int  ->  rdi
;* V34 tmp3         [V34    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V35 tmp4         [V35    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V36 tmp5         [V36    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V37 tmp6         [V37    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V38 tmp7         [V38    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;  V39 tmp8         [V39,T53] (  2,  2.50)  simd32  ->  mm0         "Inline stloc first use temp"
;  V40 tmp9         [V40,T54] (  2,  2.50)  simd32  ->  mm1         "Inline stloc first use temp"
;  V41 tmp10        [V41,T55] (  2,  2.50)  simd32  ->  mm2         "Inline stloc first use temp"
;  V42 tmp11        [V42,T24] (  4,  6.50)  simd32  ->  mm3         "Inline stloc first use temp"
;  V43 tmp12        [V43,T11] (  4,  8   )  simd32  ->  mm10         ld-addr-op "Inline stloc first use temp"
;  V44 tmp13        [V44,T56] (  2,  2.50)  simd32  ->  mm4         "Inline stloc first use temp"
;  V45 tmp14        [V45,T57] (  2,  2.50)  simd32  ->  mm5         "Inline stloc first use temp"
;  V46 tmp15        [V46,T58] (  2,  2.50)  simd32  ->  mm6         "Inline stloc first use temp"
;  V47 tmp16        [V47,T59] (  2,  2.50)  simd32  ->  mm7         "Inline stloc first use temp"
;  V48 tmp17        [V48,T09] (  6,  9   )    long  ->  rax         "Inline stloc first use temp"
;  V49 tmp18        [V49,T19] (  5,  7   )    long  ->  rdx         "Inline stloc first use temp"
;  V50 tmp19        [V50,T12] (  4,  8   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V51 tmp20        [V51,T08] (  5, 10   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V52 tmp21        [V52,T27] (  3,  6   )  simd32  ->  mm10         "Inline stloc first use temp"
;  V53 tmp22        [V53,T33] (  2,  4   )  simd32  ->  mm8         "Inline stloc first use temp"
;  V54 tmp23        [V54,T34] (  2,  4   )  simd32  ->  mm11         "Inline stloc first use temp"
;  V55 tmp24        [V55,T35] (  2,  4   )  simd32  ->  mm12         "Inline stloc first use temp"
;  V56 tmp25        [V56,T36] (  2,  4   )  simd32  ->  mm8         "Inline stloc first use temp"
;  V57 tmp26        [V57,T37] (  2,  4   )  simd32  ->  mm8         "Inline stloc first use temp"
;  V58 tmp27        [V58,T38] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V59 tmp28        [V59,T39] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V60 tmp29        [V60,T92] (  2,  1   )  simd32  ->  mm4         "Inline return value spill temp"
;  V61 tmp30        [V61,T93] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V62 tmp31        [V62,T94] (  2,  1   )  simd32  ->  mm5         "Inline return value spill temp"
;  V63 tmp32        [V63,T95] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V64 tmp33        [V64,T60] (  2,  2.50)  simd16  ->  mm0         "Inline stloc first use temp"
;  V65 tmp34        [V65,T61] (  2,  2.50)  simd16  ->  mm1         "Inline stloc first use temp"
;  V66 tmp35        [V66,T62] (  2,  2.50)  simd16  ->  mm2         "Inline stloc first use temp"
;  V67 tmp36        [V67,T25] (  4,  6.50)  simd16  ->  mm3         "Inline stloc first use temp"
;  V68 tmp37        [V68,T40] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V69 tmp38        [V69,T63] (  2,  2.50)  simd16  ->  mm4         "Inline stloc first use temp"
;  V70 tmp39        [V70,T64] (  2,  2.50)  simd16  ->  mm5         "Inline stloc first use temp"
;  V71 tmp40        [V71,T65] (  2,  2.50)  simd16  ->  mm6         "Inline stloc first use temp"
;  V72 tmp41        [V72,T10] (  6,  9   )    long  ->  rax         "Inline stloc first use temp"
;  V73 tmp42        [V73,T20] (  5,  7   )    long  ->  rdx         "Inline stloc first use temp"
;  V74 tmp43        [V74,T13] (  4,  8   )  simd16  ->  mm7         ld-addr-op "Inline stloc first use temp"
;  V75 tmp44        [V75,T06] (  7, 14   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V76 tmp45        [V76,T28] (  3,  6   )  simd16  ->  mm9         "Inline stloc first use temp"
;  V77 tmp46        [V77,T41] (  2,  4   )  simd16  ->  mm7         "Inline stloc first use temp"
;  V78 tmp47        [V78,T42] (  2,  4   )  simd16  ->  mm10         "Inline stloc first use temp"
;  V79 tmp48        [V79,T43] (  2,  4   )  simd16  ->  mm11         "Inline stloc first use temp"
;  V80 tmp49        [V80,T44] (  2,  4   )  simd16  ->  mm7         "Inline stloc first use temp"
;  V81 tmp50        [V81,T45] (  2,  4   )  simd16  ->  mm7         "Inline stloc first use temp"
;  V82 tmp51        [V82,T46] (  2,  4   )  simd16  ->  mm7         ld-addr-op "Inline stloc first use temp"
;  V83 tmp52        [V83,T96] (  2,  1   )  simd16  ->  mm4         "Inline return value spill temp"
;  V84 tmp53        [V84,T97] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V85 tmp54        [V85,T98] (  2,  1   )  simd16  ->  mm5         "Inline return value spill temp"
;  V86 tmp55        [V86,T99] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;* V87 tmp56        [V87    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V88 tmp57        [V88,T14] (  2,  8   )    long  ->  r10         "Inline stloc first use temp"
;  V89 tmp58        [V89,T15] (  2,  8   )    long  ->  r15         "Inline stloc first use temp"
;  V90 tmp59        [V90,T16] (  2,  8   )    long  ->  rdi         "Inline stloc first use temp"
;  V91 tmp60        [V91,T17] (  2,  8   )    long  ->   r8         "Inline stloc first use temp"
;  V92 tmp61        [V92,T05] (  2, 16   )     int  ->  rcx         "impAppendStmt"
;  V93 tmp62        [V93,T02] (  6, 24   )     int  ->  r10         "Inline stloc first use temp"
;  V94 tmp63        [V94,T04] (  4, 16   )     int  ->  rdi         "Inline stloc first use temp"
;  V95 tmp64        [V95,T18] (  2,  8   )     int  ->   r8         "Inline stloc first use temp"
;* V96 tmp65        [V96    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;* V97 tmp66        [V97    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;* V98 tmp67        [V98    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;* V99 tmp68        [V99    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;* V100 tmp69       [V100    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V101 tmp70       [V101    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V102 tmp71       [V102,T71] (  2,  2   )    long  ->  rdi         "NewObj constructor temp"
;* V103 tmp72       [V103    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V104 tmp73       [V104    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V105 tmp74       [V105,T72] (  2,  2   )    long  ->  rsi         "NewObj constructor temp"
;* V106 tmp75       [V106    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V107 tmp76       [V107    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V108 tmp77       [V108,T73] (  2,  2   )    long  ->  rcx         "NewObj constructor temp"
;* V109 tmp78       [V109    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V110 tmp79       [V110    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V111 tmp80       [V111,T74] (  2,  2   )    long  ->   r8         "NewObj constructor temp"
;* V112 tmp81       [V112    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V113 tmp82       [V113    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V114 tmp83       [V114    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V115 tmp84       [V115,T75] (  2,  2   )    long  ->  rcx         "NewObj constructor temp"
;* V116 tmp85       [V116    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V117 tmp86       [V117,T76] (  2,  2   )     int  ->  rax         "Single return block return value"
;* V118 tmp87       [V118,T86] (  0,  0   )   byref  ->  zero-ref    V32._pointer(offs=0x00) P-INDEP "field V32._pointer (fldOffset=0x0)"
;* V119 tmp88       [V119    ] (  0,  0   )     int  ->  zero-ref    V32._length(offs=0x08) P-INDEP "field V32._length (fldOffset=0x8)"
;  V120 tmp89       [V120,T79] (  3,  1.50)   byref  ->  rdx         V34._pointer(offs=0x00) P-INDEP "field V34._pointer (fldOffset=0x0)"
;* V121 tmp90       [V121    ] (  0,  0   )     int  ->  zero-ref    V34._length(offs=0x08) P-INDEP "field V34._length (fldOffset=0x8)"
;  V122 tmp91       [V122,T80] (  3,  1.50)   byref  ->  rdx         V35._pointer(offs=0x00) P-INDEP "field V35._pointer (fldOffset=0x0)"
;* V123 tmp92       [V123    ] (  0,  0   )     int  ->  zero-ref    V35._length(offs=0x08) P-INDEP "field V35._length (fldOffset=0x8)"
;* V124 tmp93       [V124,T87] (  0,  0   )   byref  ->  zero-ref    V36._pointer(offs=0x00) P-INDEP "field V36._pointer (fldOffset=0x0)"
;* V125 tmp94       [V125    ] (  0,  0   )     int  ->  zero-ref    V36._length(offs=0x08) P-INDEP "field V36._length (fldOffset=0x8)"
;* V126 tmp95       [V126,T88] (  0,  0   )   byref  ->  zero-ref    V37._value(offs=0x00) P-INDEP "field V37._value (fldOffset=0x0)"
;* V127 tmp96       [V127,T102] (  0,  0   )   byref  ->  zero-ref    V38._pointer(offs=0x00) P-INDEP "field V38._pointer (fldOffset=0x0)"
;* V128 tmp97       [V128    ] (  0,  0   )     int  ->  zero-ref    V38._length(offs=0x08) P-INDEP "field V38._length (fldOffset=0x8)"
;  V129 tmp98       [V129,T49] (  3,  3   )   byref  ->  rax         "BlockOp address local"
;  V130 tmp99       [V130,T77] (  2,  2   )    long  ->  r12         "Cast away GC"
;  V131 tmp100      [V131,T50] (  3,  3   )   byref  ->  rax         "BlockOp address local"
;  V132 tmp101      [V132,T78] (  2,  2   )    long  ->  r13         "Cast away GC"
;* V133 cse0        [V133,T100] (  0,  0   )    long  ->  zero-ref    "ValNumCSE"
;  V134 rat0        [V134,T51] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;  V135 rat1        [V135,T52] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;
; Lcl frame size = 120

G_M25094_IG01:
       push     rbp
       push     r15
       push     r14
       push     r13
       push     r12
       push     rbx
       sub      rsp, 120
       vzeroupper
       lea      rbp, [rsp+A0H]
       xor      rax, rax
       mov      qword ptr [rbp-50H], rax
       mov      qword ptr [rbp-58H], rax
       mov      bword ptr [rbp-38H], rdi
       mov      qword ptr [rbp-30H], rsi
       mov      bword ptr [rbp-48H], rdx
       mov      qword ptr [rbp-40H], rcx
       mov      rbx, r8
       mov      r14, r9
       mov      r15d, dword ptr [rbp+10H]

G_M25094_IG02:
       cmp      dword ptr [rbp-30H], 0
       ja       SHORT G_M25094_IG03
       xor      eax, eax
       mov      dword ptr [rbx], eax
       mov      dword ptr [r14], eax
       jmp      G_M25094_IG24

G_M25094_IG03:
       lea      rax, bword ptr [rbp-38H]
       mov      rdx, bword ptr [rax]
       mov      eax, dword ptr [rax+8]
       mov      bword ptr [rbp-50H], rdx
       mov      r12, rdx
       lea      rax, bword ptr [rbp-48H]
       mov      rdx, bword ptr [rax]
       mov      eax, dword ptr [rax+8]
       mov      bword ptr [rbp-58H], rdx
       mov      r13, rdx
       mov      eax, dword ptr [rbp-30H]
       mov      ecx, eax
       and      ecx, -4
       mov      r8d, dword ptr [rbp-40H]
       mov      r9d, ecx
       test     r9d, r9d
       jl       G_M25094_IG32

G_M25094_IG04:
       mov      eax, r9d
       sar      eax, 2
       lea      r10d, [rax+2*rax]
       mov      dword ptr [rbp-64H], r10d
       lea      eax, [r10-2]
       cmp      r8d, eax
       jge      SHORT G_M25094_IG05
       mov      eax, 0xD1FFAB1E
       mov      dword ptr [rbp-60H], r8d
       imul     edx:eax, r8d
       mov      r9d, edx
       shr      r9d, 31
       add      edx, r9d
       mov      r9d, edx
       shl      r9d, 2
       mov      r8d, dword ptr [rbp-60H]

G_M25094_IG05:
       mov      rax, r12
       mov      rdx, r13
       mov      dword ptr [rbp-5CH], ecx
       movsxd   rdi, ecx
       lea      r11, [rax+rdi]
       mov      qword ptr [rbp-80H], r11
       movsxd   rdi, r9d
       lea      rsi, [rax+rdi]
       cmp      r9d, 24
       jl       G_M25094_IG11
       mov      qword ptr [rbp-88H], rsi
       lea      r9, [rsi-45]
       mov      qword ptr [rbp-98H], r9
       cmp      r9, r12
       jb       G_M25094_IG08
       mov      dword ptr [rbp-60H], r8d
       mov      rdi, 0xD1FFAB1E
       mov      esi, 4
       call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       mov      rdi, 0xD1FFAB1E
       mov      rdi, gword ptr [rdi]
       vmovupd  ymm0, ymmword ptr[rdi+8]
       mov      rdi, 0xD1FFAB1E
       mov      rdi, gword ptr [rdi]
       vmovupd  ymm1, ymmword ptr[rdi+8]
       mov      rdi, 0xD1FFAB1E
       mov      rdi, gword ptr [rdi]
       vmovupd  ymm2, ymmword ptr[rdi+8]
       mov      rdi, 0xD1FFAB1E
       mov      rdi, gword ptr [rdi]
       vmovupd  ymm3, ymmword ptr[rdi+8]
       mov      edi, 0xD1FFAB1E
       vmovd    xmm4, edi
       vpbroadcastd ymm4, ymm4
       mov      edi, 0x11000
       vmovd    xmm5, edi
       vpbroadcastd ymm5, ymm5
       mov      rdi, 0xD1FFAB1E
       mov      rdi, gword ptr [rdi]
       vmovupd  ymm6, ymmword ptr[rdi+8]
       mov      rdi, 0xD1FFAB1E
       mov      rdi, gword ptr [rdi]
       vmovupd  ymm7, ymmword ptr[rdi+8]
       mov      rax, r12
       mov      rdx, r13

G_M25094_IG06:
       vmovdqu  ymm8, ymmword ptr[rax]
       vmovaps  ymm9, ymm8
       vpsrld   ymm10, ymm8, 4
       vpand    ymm10, ymm10, ymm3
       vpand    ymm8, ymm8, ymm3
       vpshufb  ymm11, ymm0, ymm10
       vxorps   ymm12, ymm12, ymm12
       vpshufb  ymm8, ymm1, ymm8
       vpand    ymm8, ymm8, ymm11
       vpcmpgtb ymm8, ymm8, ymm12
       vpmovmskb edi, ymm8
       test     edi, edi
       jne      SHORT G_M25094_IG07
       vpcmpeqb ymm8, ymm9, ymm3
       vpaddb   ymm8, ymm8, ymm10
       vpshufb  ymm8, ymm2, ymm8
       vpaddb   ymm9, ymm9, ymm8
       vpmaddubsw ymm8, ymm9, ymm4
       vpmaddwd ymm8, ymm8, ymm5
       vpshufb  ymm8, ymm8, ymm6
       vpermd   ymm10, ymm7, ymm8
       vmovdqu  ymmword ptr[rdx], ymm10
       add      rax, 32
       add      rdx, 24
       mov      rcx, qword ptr [rbp-98H]
       cmp      rax, rcx
       mov      qword ptr [rbp-98H], rcx
       jbe      SHORT G_M25094_IG06

G_M25094_IG07:
       mov      qword ptr [rbp-78H], rdx
       cmp      rax, qword ptr [rbp-80H]
       mov      r8d, dword ptr [rbp-60H]
       je       G_M25094_IG23
       mov      rdx, qword ptr [rbp-78H]

G_M25094_IG08:
       mov      rsi, qword ptr [rbp-88H]
       lea      rdi, [rsi-24]
       mov      r9, rdi
       mov      qword ptr [rbp-98H], r9
       mov      qword ptr [rbp-70H], rax
       cmp      r9, rax
       jb       G_M25094_IG12
       mov      qword ptr [rbp-78H], rdx
       mov      dword ptr [rbp-60H], r8d
       mov      rdi, 0xD1FFAB1E
       mov      esi, 4
       call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       mov      rax, 0xD1FFAB1E
       mov      rax, gword ptr [rax]
       vmovupd  xmm0, xmmword ptr [rax+8]
       mov      rax, 0xD1FFAB1E
       mov      rax, gword ptr [rax]
       vmovupd  xmm1, xmmword ptr [rax+8]
       mov      rax, 0xD1FFAB1E
       mov      rax, gword ptr [rax]
       vmovupd  xmm2, xmmword ptr [rax+8]
       mov      rax, 0xD1FFAB1E
       mov      rax, gword ptr [rax]
       vmovupd  xmm3, xmmword ptr [rax+8]
       mov      eax, 0xD1FFAB1E
       vmovd    xmm4, eax
       vpbroadcastd xmm4, xmm4
       mov      eax, 0x11000
       vmovd    xmm5, eax
       vpbroadcastd xmm5, xmm5
       mov      rax, 0xD1FFAB1E
       mov      rax, gword ptr [rax]
       vmovupd  xmm6, xmmword ptr [rax+8]
       mov      rax, qword ptr [rbp-70H]
       mov      rdx, qword ptr [rbp-78H]

G_M25094_IG09:
       vmovdqu  xmm7, xmmword ptr [rax]
       vmovaps  xmm8, xmm7
       vpsrld   xmm9, xmm7, 4
       vpand    xmm9, xmm9, xmm3
       vpand    xmm7, xmm7, xmm3
       vpshufb  xmm10, xmm0, xmm9
       vxorps   xmm11, xmm11, xmm11
       vpshufb  xmm7, xmm1, xmm7
       vpand    xmm7, xmm7, xmm10
       vpcmpgtb xmm7, xmm7, xmm11
       vpmovmskb edi, xmm7
       test     edi, edi
       jne      SHORT G_M25094_IG10
       vpcmpeqb xmm7, xmm8, xmm3
       vpaddb   xmm7, xmm7, xmm9
       vpshufb  xmm7, xmm2, xmm7
       vpaddb   xmm8, xmm8, xmm7
       vpmaddubsw xmm8, xmm8, xmm4
       vpmaddwd xmm7, xmm8, xmm5
       vpshufb  xmm8, xmm7, xmm6
       vmovdqu  xmmword ptr [rdx], xmm8
       add      rax, 16
       add      rdx, 12
       mov      rdi, qword ptr [rbp-98H]
       cmp      rax, rdi
       mov      qword ptr [rbp-98H], rdi
       jbe      SHORT G_M25094_IG09

G_M25094_IG10:
       mov      qword ptr [rbp-78H], rdx
       mov      qword ptr [rbp-70H], rax
       mov      rdi, qword ptr [rbp-80H]
       cmp      rax, rdi
       mov      qword ptr [rbp-80H], rdi
       mov      rax, qword ptr [rbp-70H]
       mov      r8d, dword ptr [rbp-60H]
       je       G_M25094_IG23
       mov      rdx, qword ptr [rbp-78H]

G_M25094_IG11:
       mov      dword ptr [rbp+10H], r15d
       test     r15b, r15b
       jne      SHORT G_M25094_IG13
       xor      edi, edi
       jmp      SHORT G_M25094_IG14

G_M25094_IG12:
       mov      rax, qword ptr [rbp-70H]
       jmp      SHORT G_M25094_IG11

G_M25094_IG13:
       mov      edi, 4

G_M25094_IG14:
       mov      r10d, dword ptr [rbp-64H]
       cmp      r8d, r10d
       jl       SHORT G_M25094_IG15
       mov      ecx, dword ptr [rbp-5CH]
       mov      dword ptr [rbp-8CH], edi
       mov      r9d, ecx
       sub      r9d, edi
       jmp      SHORT G_M25094_IG16

G_M25094_IG15:
       mov      qword ptr [rbp-70H], rax
       mov      qword ptr [rbp-78H], rdx
       mov      r9d, 0xD1FFAB1E
       mov      dword ptr [rbp-60H], r8d
       mov      eax, r9d
       imul     edx:eax, r8d
       mov      eax, edx
       shr      eax, 31
       add      edx, eax
       mov      r9d, edx
       shl      r9d, 2
       mov      dword ptr [rbp-8CH], edi
       mov      rax, qword ptr [rbp-70H]
       mov      rdx, qword ptr [rbp-78H]
       mov      r8d, dword ptr [rbp-60H]

G_M25094_IG16:
       movsxd   rsi, r9d
       add      rsi, r12
       cmp      rax, rsi
       mov      dword ptr [rbp-60H], r8d
       jae      G_M25094_IG18

G_M25094_IG17:
       movzx    r10, byte  ptr [rax]
       mov      r10d, r10d
       movzx    r15, byte  ptr [rax+1]
       mov      r15d, r15d
       movzx    rdi, byte  ptr [rax+2]
       mov      edi, edi
       movzx    r8, byte  ptr [rax+3]
       mov      r8d, r8d
       mov      rcx, 0xD1FFAB1E
       movsx    rcx, byte  ptr [r10+rcx]
       mov      r10, 0xD1FFAB1E
       movsx    r10, byte  ptr [r15+r10]
       mov      r15, 0xD1FFAB1E
       movsx    rdi, byte  ptr [rdi+r15]
       movsx    r8, byte  ptr [r8+r15]
       shl      r10d, 12
       shl      edi, 6
       or       r10d, edi
       shl      ecx, 18
       or       ecx, r8d
       mov      edi, ecx
       or       edi, r10d
       test     edi, edi
       jl       G_M25094_IG30
       mov      ecx, edi
       sar      ecx, 16
       mov      byte  ptr [rdx], cl
       mov      ecx, edi
       sar      ecx, 8
       mov      byte  ptr [rdx+1], cl
       mov      byte  ptr [rdx+2], dil
       add      rax, 4
       add      rdx, 3
       cmp      rax, rsi
       jb       G_M25094_IG17

G_M25094_IG18:
       mov      r15d, dword ptr [rbp-5CH]
       mov      edi, r15d
       sub      edi, dword ptr [rbp-8CH]
       cmp      edi, r9d
       jne      G_M25094_IG26
       mov      r11, qword ptr [rbp-80H]
       cmp      rax, r11
       jne      SHORT G_M25094_IG19
       cmp      byte  ptr [rbp+10H], 0
       je       G_M25094_IG28
       jmp      G_M25094_IG30

G_M25094_IG19:
       movzx    rdi, byte  ptr [r11-4]
       movzx    rsi, byte  ptr [r11-3]
       movzx    rcx, byte  ptr [r11-2]
       movzx    r8, byte  ptr [r11-1]
       mov      edi, edi
       mov      r9, 0xD1FFAB1E
       movsx    rdi, byte  ptr [rdi+r9]
       mov      esi, esi
       movsx    rsi, byte  ptr [rsi+r9]
       shl      edi, 18
       shl      esi, 12
       or       edi, esi
       mov      esi, dword ptr [rbp-60H]
       movsxd   rsi, esi
       add      rsi, r13
       cmp      r8d, 61
       je       SHORT G_M25094_IG20
       mov      ecx, ecx
       mov      r9, 0xD1FFAB1E
       movsx    rcx, byte  ptr [rcx+r9]
       mov      r8d, r8d
       movsx    r8, byte  ptr [r8+r9]
       shl      ecx, 6
       or       edi, r8d
       or       edi, ecx
       test     edi, edi
       jl       G_M25094_IG30
       lea      rcx, [rdx+3]
       cmp      rcx, rsi
       ja       G_M25094_IG26
       mov      esi, edi
       sar      esi, 16
       mov      byte  ptr [rdx], sil
       mov      esi, edi
       sar      esi, 8
       mov      byte  ptr [rdx+1], sil
       mov      byte  ptr [rdx+2], dil
       add      rdx, 3
       jmp      SHORT G_M25094_IG22

G_M25094_IG20:
       cmp      ecx, 61
       je       SHORT G_M25094_IG21
       mov      ecx, ecx
       mov      r8, 0xD1FFAB1E
       movsx    rcx, byte  ptr [rcx+r8]
       shl      ecx, 6
       or       edi, ecx
       test     edi, edi
       jl       G_M25094_IG30
       lea      rcx, [rdx+2]
       cmp      rcx, rsi
       ja       SHORT G_M25094_IG26
       mov      esi, edi
       sar      esi, 16
       mov      byte  ptr [rdx], sil
       sar      edi, 8
       mov      byte  ptr [rdx+1], dil
       add      rdx, 2
       jmp      SHORT G_M25094_IG22

G_M25094_IG21:
       test     edi, edi
       jl       G_M25094_IG30
       lea      rcx, [rdx+1]
       cmp      rcx, rsi
       ja       SHORT G_M25094_IG26
       sar      edi, 16
       mov      byte  ptr [rdx], dil
       inc      rdx

G_M25094_IG22:
       add      rax, 4
       cmp      r15d, dword ptr [rbp-30H]
       jne      G_M25094_IG30
       mov      qword ptr [rbp-78H], rdx

G_M25094_IG23:
       sub      rax, r12
       mov      dword ptr [rbx], eax
       mov      rdx, qword ptr [rbp-78H]
       mov      rax, rdx
       sub      rax, r13
       mov      dword ptr [r14], eax

G_M25094_IG24:
       xor      eax, eax

G_M25094_IG25:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M25094_IG26:
       cmp      r15d, dword ptr [rbp-30H]
       setne    dil
       movzx    rdi, dil
       mov      r15d, dword ptr [rbp+10H]
       movzx    rsi, r15b
       test     edi, esi
       jne      SHORT G_M25094_IG30
       sub      rax, r12
       mov      dword ptr [rbx], eax
       mov      rax, rdx
       sub      rax, r13
       mov      dword ptr [r14], eax
       mov      eax, 1

G_M25094_IG27:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M25094_IG28:
       sub      rax, r12
       mov      dword ptr [rbx], eax
       mov      rax, rdx
       sub      rax, r13
       mov      dword ptr [r14], eax
       mov      eax, 2

G_M25094_IG29:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M25094_IG30:
       sub      rax, r12
       mov      dword ptr [rbx], eax
       sub      rdx, r13
       mov      eax, edx
       mov      dword ptr [r14], eax
       mov      eax, 3

G_M25094_IG31:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M25094_IG32:
       xor      edi, edi
       call     ThrowHelper:ThrowArgumentOutOfRangeException(int)
       int3

; Total bytes of code 1666, prolog size 61 for method Base64_1:DecodeFromUtf8(struct,struct,byref,byref,bool):int
; ============================================================
