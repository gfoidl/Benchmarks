; Assembly listing for method Base64_1:DecodeFromUtf8(struct,struct,byref,byref,bool):int
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00    ] (  7,  5   )  struct (16) [rbp-0x38]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V01 arg1         [V01    ] (  4,  3   )  struct (16) [rbp-0x48]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V02 arg2         [V02,T22] (  7,  4.50)   byref  ->  rbx
;  V03 arg3         [V03,T23] (  7,  4.50)   byref  ->  r14
;  V04 arg4         [V04,T83] (  3,  1.50)    bool  ->  [rbp+0x10]
;  V05 loc0         [V05,T31] (  9,  4.50)    long  ->  r12
;  V06 loc1         [V06    ] (  1,  0.50)   byref  ->  [rbp-0x50]   must-init pinned
;  V07 loc2         [V07,T32] (  8,  4   )    long  ->  r13
;  V08 loc3         [V08    ] (  1,  0.50)   byref  ->  [rbp-0x58]   must-init pinned
;  V09 loc4         [V09,T04] ( 10, 19   )   byref  ->  rdi
;  V10 loc5         [V10,T48] (  7,  3.50)     int  ->  rsi
;  V11 loc6         [V11,T49] (  6,  3   )     int  ->  [rbp-0x5C]
;  V12 loc7         [V12,T30] ( 10,  5   )     int  ->  registers
;  V13 loc8         [V13,T84] (  3,  1.50)     int  ->   r9
;  V14 loc9         [V14,T00] ( 24, 36.50)    long  ->  r10         ld-addr-op
;  V15 loc10        [V15,T01] ( 28, 31.50)    long  ->  r11         ld-addr-op
;  V16 loc11        [V16,T33] (  8,  4   )    long  ->  [rbp-0x68]
;  V17 loc12        [V17,T24] (  6,  6.50)    long  ->  registers
;  V18 loc13        [V18,T85] (  3,  1.50)     int  ->  [rbp-0x6C]
;  V19 loc14        [V19,T88] (  2,  1   )     int  ->  rax
;  V20 loc15        [V20,T89] (  2,  1   )     int  ->  rdx
;  V21 loc16        [V21,T68] (  4,  2   )     int  ->   r8
;  V22 loc17        [V22,T86] (  3,  1.50)     int  ->  rcx
;  V23 loc18        [V23,T08] ( 20, 10   )     int  ->  rax
;  V24 loc19        [V24,T69] (  4,  2   )     int  ->  rdx
;  V25 loc20        [V25,T70] (  4,  2   )    long  ->  rdx
;  V26 loc21        [V26,T27] (  6,  6   )    long  ->   r8
;  V27 loc22        [V27,T03] (  5, 20   )     int  ->  rax
;  V28 loc23        [V28,T71] (  4,  2   )     int  ->   r8
;  V29 loc24        [V29,T90] (  2,  1   )     int  ->  rdi
;  V30 loc25        [V30,T72] (  4,  2   )     int  ->  rdi
;# V31 OutArgs      [V31    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V32 tmp1         [V32,T87] (  3,  1.50)     int  ->  rdx
;* V33 tmp2         [V33    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V34 tmp3         [V34    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;  V35 tmp4         [V35,T55] (  2,  2.50)  simd32  ->  mm0         "Inline stloc first use temp"
;  V36 tmp5         [V36,T56] (  2,  2.50)  simd32  ->  mm1         "Inline stloc first use temp"
;  V37 tmp6         [V37,T57] (  2,  2.50)  simd32  ->  mm2         "Inline stloc first use temp"
;  V38 tmp7         [V38,T25] (  4,  6.50)  simd32  ->  mm3         "Inline stloc first use temp"
;  V39 tmp8         [V39,T12] (  4,  8   )  simd32  ->  mm10         ld-addr-op "Inline stloc first use temp"
;  V40 tmp9         [V40,T58] (  2,  2.50)  simd32  ->  mm4         "Inline stloc first use temp"
;  V41 tmp10        [V41,T59] (  2,  2.50)  simd32  ->  mm5         "Inline stloc first use temp"
;  V42 tmp11        [V42,T60] (  2,  2.50)  simd32  ->  mm6         "Inline stloc first use temp"
;  V43 tmp12        [V43,T61] (  2,  2.50)  simd32  ->  mm7         "Inline stloc first use temp"
;  V44 tmp13        [V44,T10] (  6,  9   )    long  ->  r10         "Inline stloc first use temp"
;  V45 tmp14        [V45,T20] (  5,  7   )    long  ->  r11         "Inline stloc first use temp"
;  V46 tmp15        [V46,T13] (  4,  8   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V47 tmp16        [V47,T09] (  5, 10   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V48 tmp17        [V48,T28] (  3,  6   )  simd32  ->  mm10         "Inline stloc first use temp"
;  V49 tmp18        [V49,T34] (  2,  4   )  simd32  ->  mm8         "Inline stloc first use temp"
;  V50 tmp19        [V50,T35] (  2,  4   )  simd32  ->  mm11         "Inline stloc first use temp"
;  V51 tmp20        [V51,T36] (  2,  4   )  simd32  ->  mm12         "Inline stloc first use temp"
;  V52 tmp21        [V52,T37] (  2,  4   )  simd32  ->  mm8         "Inline stloc first use temp"
;  V53 tmp22        [V53,T38] (  2,  4   )  simd32  ->  mm8         "Inline stloc first use temp"
;  V54 tmp23        [V54,T39] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V55 tmp24        [V55,T40] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V56 tmp25        [V56,T91] (  2,  1   )  simd32  ->  mm4         "Inline return value spill temp"
;  V57 tmp26        [V57,T92] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V58 tmp27        [V58,T93] (  2,  1   )  simd32  ->  mm5         "Inline return value spill temp"
;  V59 tmp28        [V59,T94] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V60 tmp29        [V60,T62] (  2,  2.50)  simd16  ->  mm0         "Inline stloc first use temp"
;  V61 tmp30        [V61,T63] (  2,  2.50)  simd16  ->  mm1         "Inline stloc first use temp"
;  V62 tmp31        [V62,T64] (  2,  2.50)  simd16  ->  mm2         "Inline stloc first use temp"
;  V63 tmp32        [V63,T26] (  4,  6.50)  simd16  ->  mm3         "Inline stloc first use temp"
;  V64 tmp33        [V64,T41] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V65 tmp34        [V65,T65] (  2,  2.50)  simd16  ->  mm4         "Inline stloc first use temp"
;  V66 tmp35        [V66,T66] (  2,  2.50)  simd16  ->  mm5         "Inline stloc first use temp"
;  V67 tmp36        [V67,T67] (  2,  2.50)  simd16  ->  mm6         "Inline stloc first use temp"
;  V68 tmp37        [V68,T11] (  6,  9   )    long  ->  r10         "Inline stloc first use temp"
;  V69 tmp38        [V69,T21] (  5,  7   )    long  ->  r11         "Inline stloc first use temp"
;  V70 tmp39        [V70,T14] (  4,  8   )  simd16  ->  mm7         ld-addr-op "Inline stloc first use temp"
;  V71 tmp40        [V71,T07] (  7, 14   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V72 tmp41        [V72,T29] (  3,  6   )  simd16  ->  mm9         "Inline stloc first use temp"
;  V73 tmp42        [V73,T42] (  2,  4   )  simd16  ->  mm7         "Inline stloc first use temp"
;  V74 tmp43        [V74,T43] (  2,  4   )  simd16  ->  mm10         "Inline stloc first use temp"
;  V75 tmp44        [V75,T44] (  2,  4   )  simd16  ->  mm11         "Inline stloc first use temp"
;  V76 tmp45        [V76,T45] (  2,  4   )  simd16  ->  mm7         "Inline stloc first use temp"
;  V77 tmp46        [V77,T46] (  2,  4   )  simd16  ->  mm7         "Inline stloc first use temp"
;  V78 tmp47        [V78,T47] (  2,  4   )  simd16  ->  mm7         ld-addr-op "Inline stloc first use temp"
;  V79 tmp48        [V79,T95] (  2,  1   )  simd16  ->  mm4         "Inline return value spill temp"
;  V80 tmp49        [V80,T96] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V81 tmp50        [V81,T97] (  2,  1   )  simd16  ->  mm5         "Inline return value spill temp"
;  V82 tmp51        [V82,T98] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;* V83 tmp52        [V83    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V84 tmp53        [V84,T15] (  2,  8   )    long  ->  r15         "Inline stloc first use temp"
;  V85 tmp54        [V85,T16] (  2,  8   )    long  ->   r8         "Inline stloc first use temp"
;  V86 tmp55        [V86,T17] (  2,  8   )    long  ->  rcx         "Inline stloc first use temp"
;  V87 tmp56        [V87,T18] (  2,  8   )    long  ->  rax         "Inline stloc first use temp"
;  V88 tmp57        [V88,T06] (  2, 16   )     int  ->  r15         "impAppendStmt"
;  V89 tmp58        [V89,T02] (  6, 24   )     int  ->   r8         "Inline stloc first use temp"
;  V90 tmp59        [V90,T05] (  4, 16   )     int  ->  rcx         "Inline stloc first use temp"
;  V91 tmp60        [V91,T19] (  2,  8   )     int  ->  rax         "Inline stloc first use temp"
;* V92 tmp61        [V92    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;* V93 tmp62        [V93    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;* V94 tmp63        [V94    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;* V95 tmp64        [V95    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;* V96 tmp65        [V96    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V97 tmp66        [V97    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V98 tmp67        [V98,T73] (  2,  2   )    long  ->  rax         "NewObj constructor temp"
;* V99 tmp68        [V99    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V100 tmp69       [V100    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V101 tmp70       [V101,T74] (  2,  2   )    long  ->  rdx         "NewObj constructor temp"
;* V102 tmp71       [V102    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V103 tmp72       [V103    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V104 tmp73       [V104,T75] (  2,  2   )    long  ->   r8         "NewObj constructor temp"
;* V105 tmp74       [V105    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V106 tmp75       [V106    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V107 tmp76       [V107,T76] (  2,  2   )    long  ->  rcx         "NewObj constructor temp"
;* V108 tmp77       [V108    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V109 tmp78       [V109    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V110 tmp79       [V110    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V111 tmp80       [V111,T77] (  2,  2   )    long  ->  rcx         "NewObj constructor temp"
;* V112 tmp81       [V112    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V113 tmp82       [V113,T78] (  2,  2   )     int  ->  rax         "Single return block return value"
;  V114 tmp83       [V114,T81] (  3,  1.50)   byref  ->  rsi         V33._pointer(offs=0x00) P-INDEP "field V33._pointer (fldOffset=0x0)"
;* V115 tmp84       [V115    ] (  0,  0   )     int  ->  zero-ref    V33._length(offs=0x08) P-INDEP "field V33._length (fldOffset=0x8)"
;  V116 tmp85       [V116,T82] (  3,  1.50)   byref  ->  rsi         V34._pointer(offs=0x00) P-INDEP "field V34._pointer (fldOffset=0x0)"
;* V117 tmp86       [V117    ] (  0,  0   )     int  ->  zero-ref    V34._length(offs=0x08) P-INDEP "field V34._length (fldOffset=0x8)"
;  V118 tmp87       [V118,T50] (  3,  3   )   byref  ->  rdi         "BlockOp address local"
;  V119 tmp88       [V119,T79] (  2,  2   )    long  ->  r12         "Cast away GC"
;  V120 tmp89       [V120,T51] (  3,  3   )   byref  ->  rdi         "BlockOp address local"
;  V121 tmp90       [V121,T80] (  2,  2   )    long  ->  r13         "Cast away GC"
;  V122 tmp91       [V122,T52] (  3,  3   )     ref  ->  rax         "arr expr"
;* V123 cse0        [V123,T99] (  0,  0   )    long  ->  zero-ref    "ValNumCSE"
;  V124 rat0        [V124,T53] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;  V125 rat1        [V125,T54] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;
; Lcl frame size = 72

G_M25089_IG01:
       push     rbp
       push     r15
       push     r14
       push     r13
       push     r12
       push     rbx
       sub      rsp, 72
       vzeroupper
       lea      rbp, [rsp+70H]
       xor      rax, rax
       mov      qword ptr [rbp-50H], rax
       mov      qword ptr [rbp-58H], rax
       mov      bword ptr [rbp-38H], rdi
       mov      qword ptr [rbp-30H], rsi
       mov      bword ptr [rbp-48H], rdx
       mov      qword ptr [rbp-40H], rcx
       mov      rbx, r8
       mov      r14, r9

G_M25089_IG02:
       cmp      dword ptr [rbp-30H], 0
       ja       SHORT G_M25089_IG03
       xor      edi, edi
       mov      dword ptr [rbx], edi
       mov      dword ptr [r14], edi
       jmp      G_M25089_IG23

G_M25089_IG03:
       lea      rdi, bword ptr [rbp-38H]
       mov      rsi, bword ptr [rdi]
       mov      edi, dword ptr [rdi+8]
       mov      bword ptr [rbp-50H], rsi
       mov      r12, rsi
       lea      rdi, bword ptr [rbp-48H]
       mov      rsi, bword ptr [rdi]
       mov      edi, dword ptr [rdi+8]
       mov      bword ptr [rbp-58H], rsi
       mov      r13, rsi
       mov      rdi, 0xD1FFAB1E
       mov      esi, 4
       call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       mov      rax, 0xD1FFAB1E
       mov      rax, gword ptr [rax]
       cmp      dword ptr [rax+8], 0
       jbe      G_M25089_IG32
       lea      rdi, bword ptr [rax+16]
       mov      eax, dword ptr [rbp-30H]
       mov      esi, eax
       and      esi, -4
       mov      ecx, dword ptr [rbp-40H]
       mov      r8d, esi
       test     r8d, r8d
       jl       G_M25089_IG31

G_M25089_IG04:
       mov      eax, r8d
       sar      eax, 2
       lea      r9d, [rax+2*rax]
       lea      eax, [r9-2]
       cmp      ecx, eax
       jge      SHORT G_M25089_IG05
       mov      eax, 0xD1FFAB1E
       imul     edx:eax, ecx
       mov      r8d, edx
       shr      r8d, 31
       add      edx, r8d
       mov      r8d, edx
       shl      r8d, 2

G_M25089_IG05:
       mov      r10, r12
       mov      r11, r13
       movsxd   rax, esi
       add      rax, r10
       movsxd   rdx, r8d
       add      rdx, r10
       cmp      r8d, 24
       jl       G_M25089_IG11
       lea      r8, [rdx-45]
       cmp      r8, r12
       jb       G_M25089_IG08
       mov      r10, 0xD1FFAB1E
       mov      r11, gword ptr [r10]
       vmovupd  ymm0, ymmword ptr[r11+8]
       mov      r10, 0xD1FFAB1E
       mov      r10, gword ptr [r10]
       vmovupd  ymm1, ymmword ptr[r10+8]
       mov      r10, 0xD1FFAB1E
       mov      r10, gword ptr [r10]
       vmovupd  ymm2, ymmword ptr[r10+8]
       mov      r10, 0xD1FFAB1E
       mov      r10, gword ptr [r10]
       vmovupd  ymm3, ymmword ptr[r10+8]
       mov      r10d, 0xD1FFAB1E
       vmovd    xmm4, r10d
       vpbroadcastd ymm4, ymm4
       mov      r10d, 0x11000
       vmovd    xmm5, r10d
       vpbroadcastd ymm5, ymm5
       mov      r10, 0xD1FFAB1E
       mov      r10, gword ptr [r10]
       vmovupd  ymm6, ymmword ptr[r10+8]
       mov      r10, 0xD1FFAB1E
       mov      r10, gword ptr [r10]
       vmovupd  ymm7, ymmword ptr[r10+8]
       mov      r10, r12
       mov      r11, r13

G_M25089_IG06:
       vmovdqu  ymm8, ymmword ptr[r10]
       vmovaps  ymm9, ymm8
       vpsrld   ymm10, ymm8, 4
       vpand    ymm10, ymm10, ymm3
       vpand    ymm8, ymm8, ymm3
       vpshufb  ymm11, ymm0, ymm10
       vxorps   ymm12, ymm12, ymm12
       vpshufb  ymm8, ymm1, ymm8
       vpand    ymm8, ymm8, ymm11
       vpcmpgtb ymm8, ymm8, ymm12
       vpmovmskb r15d, ymm8
       test     r15d, r15d
       jne      SHORT G_M25089_IG07
       vpcmpeqb ymm8, ymm9, ymm3
       vpaddb   ymm8, ymm8, ymm10
       vpshufb  ymm8, ymm2, ymm8
       vpaddb   ymm9, ymm9, ymm8
       vpmaddubsw ymm8, ymm9, ymm4
       vpmaddwd ymm8, ymm8, ymm5
       vpshufb  ymm8, ymm8, ymm6
       vpermd   ymm10, ymm7, ymm8
       vmovdqu  ymmword ptr[r11], ymm10
       add      r10, 32
       add      r11, 24
       cmp      r10, r8
       jbe      SHORT G_M25089_IG06

G_M25089_IG07:
       cmp      r10, rax
       je       G_M25089_IG22

G_M25089_IG08:
       lea      r8, [rdx-24]
       cmp      r8, r10
       jb       G_M25089_IG11
       mov      rdx, 0xD1FFAB1E
       mov      rdx, gword ptr [rdx]
       vmovupd  xmm0, xmmword ptr [rdx+8]
       mov      rdx, 0xD1FFAB1E
       mov      rdx, gword ptr [rdx]
       vmovupd  xmm1, xmmword ptr [rdx+8]
       mov      rdx, 0xD1FFAB1E
       mov      rdx, gword ptr [rdx]
       vmovupd  xmm2, xmmword ptr [rdx+8]
       mov      rdx, 0xD1FFAB1E
       mov      rdx, gword ptr [rdx]
       vmovupd  xmm3, xmmword ptr [rdx+8]
       mov      edx, 0xD1FFAB1E
       vmovd    xmm4, edx
       vpbroadcastd xmm4, xmm4
       mov      edx, 0x11000
       vmovd    xmm5, edx
       vpbroadcastd xmm5, xmm5
       mov      rdx, 0xD1FFAB1E
       mov      rdx, gword ptr [rdx]
       vmovupd  xmm6, xmmword ptr [rdx+8]

G_M25089_IG09:
       vmovdqu  xmm7, xmmword ptr [r10]
       vmovaps  xmm8, xmm7
       vpsrld   xmm9, xmm7, 4
       vpand    xmm9, xmm9, xmm3
       vpand    xmm7, xmm7, xmm3
       vpshufb  xmm10, xmm0, xmm9
       vxorps   xmm11, xmm11, xmm11
       vpshufb  xmm7, xmm1, xmm7
       vpand    xmm7, xmm7, xmm10
       vpcmpgtb xmm7, xmm7, xmm11
       vpmovmskb edx, xmm7
       test     edx, edx
       jne      SHORT G_M25089_IG10
       vpcmpeqb xmm7, xmm8, xmm3
       vpaddb   xmm7, xmm7, xmm9
       vpshufb  xmm7, xmm2, xmm7
       vpaddb   xmm8, xmm8, xmm7
       vpmaddubsw xmm8, xmm8, xmm4
       vpmaddwd xmm7, xmm8, xmm5
       vpshufb  xmm8, xmm7, xmm6
       vmovdqu  xmmword ptr [r11], xmm8
       add      r10, 16
       add      r11, 12
       cmp      r10, r8
       jbe      SHORT G_M25089_IG09

G_M25089_IG10:
       mov      qword ptr [rbp-68H], rax
       cmp      r10, rax
       mov      rax, qword ptr [rbp-68H]
       je       G_M25089_IG22

G_M25089_IG11:
       cmp      byte  ptr [rbp+10H], 0
       jne      SHORT G_M25089_IG12
       xor      edx, edx
       jmp      SHORT G_M25089_IG13

G_M25089_IG12:
       mov      edx, 4

G_M25089_IG13:
       mov      r8d, edx
       cmp      ecx, r9d
       jl       SHORT G_M25089_IG14
       mov      dword ptr [rbp-6CH], r8d
       mov      edx, esi
       sub      edx, r8d
       jmp      SHORT G_M25089_IG15

G_M25089_IG14:
       mov      qword ptr [rbp-68H], rax
       mov      edx, 0xD1FFAB1E
       mov      dword ptr [rbp-5CH], ecx
       mov      eax, edx
       imul     edx:eax, ecx
       mov      eax, edx
       shr      eax, 31
       add      edx, eax
       shl      edx, 2
       mov      dword ptr [rbp-6CH], r8d
       mov      rax, qword ptr [rbp-68H]
       mov      ecx, dword ptr [rbp-5CH]

G_M25089_IG15:
       movsxd   r9, edx
       add      r9, r12
       cmp      r10, r9
       mov      qword ptr [rbp-68H], rax
       mov      dword ptr [rbp-5CH], ecx
       jae      SHORT G_M25089_IG17

G_M25089_IG16:
       movzx    r15, byte  ptr [r10]
       mov      r15d, r15d
       movzx    r8, byte  ptr [r10+1]
       mov      r8d, r8d
       movzx    rcx, byte  ptr [r10+2]
       mov      ecx, ecx
       movzx    rax, byte  ptr [r10+3]
       mov      eax, eax
       movsx    r15, byte  ptr [rdi+r15]
       movsx    r8, byte  ptr [rdi+r8]
       movsx    rcx, byte  ptr [rdi+rcx]
       movsx    rax, byte  ptr [rdi+rax]
       shl      r8d, 12
       shl      ecx, 6
       or       r8d, ecx
       shl      r15d, 18
       or       r15d, eax
       mov      eax, r15d
       or       eax, r8d
       test     eax, eax
       jl       G_M25089_IG29
       mov      ecx, eax
       sar      ecx, 16
       mov      byte  ptr [r11], cl
       mov      ecx, eax
       sar      ecx, 8
       mov      byte  ptr [r11+1], cl
       mov      byte  ptr [r11+2], al
       add      r10, 4
       add      r11, 3
       cmp      r10, r9
       jb       SHORT G_M25089_IG16

G_M25089_IG17:
       mov      eax, esi
       sub      eax, dword ptr [rbp-6CH]
       cmp      eax, edx
       jne      G_M25089_IG25
       mov      rcx, qword ptr [rbp-68H]
       cmp      r10, rcx
       jne      SHORT G_M25089_IG18
       cmp      byte  ptr [rbp+10H], 0
       je       G_M25089_IG27
       jmp      G_M25089_IG29

G_M25089_IG18:
       movzx    rax, byte  ptr [rcx-4]
       movzx    rdx, byte  ptr [rcx-3]
       movzx    r8, byte  ptr [rcx-2]
       movzx    rcx, byte  ptr [rcx-1]
       mov      eax, eax
       movsx    rax, byte  ptr [rdi+rax]
       mov      edx, edx
       movsx    rdx, byte  ptr [rdi+rdx]
       shl      eax, 18
       shl      edx, 12
       or       eax, edx
       mov      edx, dword ptr [rbp-5CH]
       movsxd   rdx, edx
       add      rdx, r13
       cmp      ecx, 61
       je       SHORT G_M25089_IG19
       mov      r8d, r8d
       movsx    r8, byte  ptr [rdi+r8]
       mov      ecx, ecx
       movsx    rdi, byte  ptr [rdi+rcx]
       shl      r8d, 6
       or       eax, edi
       or       eax, r8d
       test     eax, eax
       jl       G_M25089_IG29
       lea      rdi, [r11+3]
       cmp      rdi, rdx
       ja       G_M25089_IG25
       mov      edx, eax
       sar      edx, 16
       mov      byte  ptr [r11], dl
       mov      edi, eax
       sar      edi, 8
       mov      byte  ptr [r11+1], dil
       mov      byte  ptr [r11+2], al
       add      r11, 3
       jmp      SHORT G_M25089_IG21

G_M25089_IG19:
       cmp      r8d, 61
       je       SHORT G_M25089_IG20
       mov      ecx, r8d
       movsx    rdi, byte  ptr [rdi+rcx]
       shl      edi, 6
       or       eax, edi
       test     eax, eax
       jl       G_M25089_IG29
       lea      rdi, [r11+2]
       cmp      rdi, rdx
       ja       SHORT G_M25089_IG25
       mov      edx, eax
       sar      edx, 16
       mov      byte  ptr [r11], dl
       sar      eax, 8
       mov      byte  ptr [r11+1], al
       add      r11, 2
       jmp      SHORT G_M25089_IG21

G_M25089_IG20:
       test     eax, eax
       jl       G_M25089_IG29
       lea      rdi, [r11+1]
       cmp      rdi, rdx
       ja       SHORT G_M25089_IG25
       sar      eax, 16
       mov      byte  ptr [r11], al
       inc      r11

G_M25089_IG21:
       add      r10, 4
       cmp      esi, dword ptr [rbp-30H]
       jne      G_M25089_IG29

G_M25089_IG22:
       mov      rax, r10
       sub      rax, r12
       mov      dword ptr [rbx], eax
       mov      rax, r11
       sub      rax, r13
       mov      dword ptr [r14], eax

G_M25089_IG23:
       xor      eax, eax

G_M25089_IG24:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M25089_IG25:
       cmp      esi, dword ptr [rbp-30H]
       setne    al
       movzx    rax, al
       mov      r15d, dword ptr [rbp+10H]
       movzx    rdi, r15b
       test     eax, edi
       jne      SHORT G_M25089_IG29
       mov      rax, r10
       sub      rax, r12
       mov      dword ptr [rbx], eax
       mov      rax, r11
       sub      rax, r13
       mov      dword ptr [r14], eax
       mov      eax, 1

G_M25089_IG26:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M25089_IG27:
       mov      rax, r10
       sub      rax, r12
       mov      dword ptr [rbx], eax
       mov      rax, r11
       sub      rax, r13
       mov      dword ptr [r14], eax
       mov      eax, 2

G_M25089_IG28:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M25089_IG29:
       sub      r10, r12
       mov      eax, r10d
       mov      dword ptr [rbx], eax
       sub      r11, r13
       mov      eax, r11d
       mov      dword ptr [r14], eax
       mov      eax, 3

G_M25089_IG30:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M25089_IG31:
       xor      edi, edi
       call     ThrowHelper:ThrowArgumentOutOfRangeException(int)
       int3

G_M25089_IG32:
       call     CORINFO_HELP_RNGCHKFAIL
       int3

; Total bytes of code 1441, prolog size 54 for method Base64_1:DecodeFromUtf8(struct,struct,byref,byref,bool):int
; ============================================================
