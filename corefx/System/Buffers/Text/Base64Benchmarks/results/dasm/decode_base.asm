; Assembly listing for method Base64_1:DecodeFromUtf8(struct,struct,byref,byref,bool):int
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00    ] (  7,  5   )  struct (16) [rbp-0x38]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V01 arg1         [V01    ] (  4,  3   )  struct (16) [rbp-0x48]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V02 arg2         [V02,T34] (  6,  4   )   byref  ->  [rbp-0x50]
;  V03 arg3         [V03,T35] (  6,  4   )   byref  ->  [rbp-0x58]
;  V04 arg4         [V04,T97] (  3,  1.50)    bool  ->  r15
;  V05 loc0         [V05,T03] ( 17, 23   )     int  ->  rdi         ld-addr-op
;  V06 loc1         [V06,T04] ( 23, 22.50)     int  ->  rsi         ld-addr-op
;  V07 loc2         [V07,T22] ( 12,  9.50)   byref  ->  rcx
;  V08 loc3         [V08,T24] ( 10,  8.50)   byref  ->   r8
;  V09 loc4         [V09,T31] ( 13,  6.50)     int  ->   r9
;  V10 loc5         [V10,T38] (  8,  4   )     int  ->  r10
;  V11 loc6         [V11,T23] ( 13, 10   )     int  ->  registers
;  V12 loc7         [V12,T98] (  3,  1.50)     int  ->  r12
;  V13 loc8         [V13,T99] (  3,  1.50)     int  ->  r11
;  V14 loc9         [V14,T06] ( 10, 19   )   byref  ->  rdx
;  V15 loc10        [V15,T105] (  2,  1   )     int  ->  rax
;  V16 loc11        [V16,T106] (  2,  1   )     int  ->  r11
;  V17 loc12        [V17,T74] (  4,  2   )     int  ->  rbx
;  V18 loc13        [V18,T100] (  3,  1.50)     int  ->  rcx
;  V19 loc14        [V19,T21] ( 20, 10   )     int  ->  rax
;  V20 loc15        [V20,T75] (  4,  2   )     int  ->  r11
;  V21 loc16        [V21,T05] (  5, 20   )     int  ->  rbx
;  V22 loc17        [V22,T76] (  4,  2   )     int  ->  r11
;  V23 loc18        [V23,T107] (  2,  1   )     int  ->  rdx
;  V24 loc19        [V24,T77] (  4,  2   )     int  ->  rdx
;# V25 OutArgs      [V25    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V26 tmp1         [V26,T101] (  3,  1.50)     int  ->  rax
;* V27 tmp2         [V27    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V28 tmp3         [V28    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;  V29 tmp4         [V29,T08] (  6, 18   )   byref  ->  rdi         "Inlining Arg"
;* V30 tmp5         [V30,T116] (  0,  0   )   byref  ->  zero-ref    "Inline stloc first use temp"
;  V31 tmp6         [V31,T19] (  5, 14   )   byref  ->  rsi         "Inlining Arg"
;* V32 tmp7         [V32,T117] (  0,  0   )   byref  ->  zero-ref    "Inline stloc first use temp"
;  V33 tmp8         [V33,T59] (  2,  2.50)   byref  ->  rax         "Inline stloc first use temp"
;  V34 tmp9         [V34,T61] (  2,  2.50)  simd32  ->  mm0         "Inline stloc first use temp"
;  V35 tmp10        [V35,T62] (  2,  2.50)  simd32  ->  mm1         "Inline stloc first use temp"
;  V36 tmp11        [V36,T63] (  2,  2.50)  simd32  ->  mm2         "Inline stloc first use temp"
;  V37 tmp12        [V37,T32] (  4,  6.50)  simd32  ->  mm3         "Inline stloc first use temp"
;  V38 tmp13        [V38,T25] (  4,  8   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V39 tmp14        [V39,T64] (  2,  2.50)  simd32  ->  mm4         "Inline stloc first use temp"
;  V40 tmp15        [V40,T65] (  2,  2.50)  simd32  ->  mm5         "Inline stloc first use temp"
;  V41 tmp16        [V41,T66] (  2,  2.50)  simd32  ->  mm6         "Inline stloc first use temp"
;  V42 tmp17        [V42,T67] (  2,  2.50)  simd32  ->  mm7         "Inline stloc first use temp"
;  V43 tmp18        [V43,T18] (  7, 14   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V44 tmp19        [V44,T36] (  3,  6   )  simd32  ->  mm9         "Inline stloc first use temp"
;  V45 tmp20        [V45,T40] (  2,  4   )  simd32  ->  mm10         "Inline stloc first use temp"
;  V46 tmp21        [V46,T41] (  2,  4   )  simd32  ->  mm11         "Inline stloc first use temp"
;  V47 tmp22        [V47,T42] (  2,  4   )  simd32  ->  mm12         "Inline stloc first use temp"
;  V48 tmp23        [V48,T43] (  2,  4   )  simd32  ->  mm10         "Inline stloc first use temp"
;  V49 tmp24        [V49,T44] (  2,  4   )  simd32  ->  mm9         "Inline stloc first use temp"
;  V50 tmp25        [V50,T45] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V51 tmp26        [V51,T46] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;* V52 tmp27        [V52    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V53 tmp28        [V53,T78] (  2,  2   )    long  ->  rax         "NewObj constructor temp"
;* V54 tmp29        [V54    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V55 tmp30        [V55,T108] (  2,  1   )  simd32  ->  mm4         "Inline return value spill temp"
;  V56 tmp31        [V56,T109] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V57 tmp32        [V57,T110] (  2,  1   )  simd32  ->  mm5         "Inline return value spill temp"
;  V58 tmp33        [V58,T111] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V59 tmp34        [V59,T79] (  2,  2   )    long  ->  rdi         ld-addr-op "Inlining Arg"
;  V60 tmp35        [V60,T80] (  2,  2   )    long  ->  rsi         ld-addr-op "Inlining Arg"
;  V61 tmp36        [V61,T09] (  6, 18   )   byref  ->  rdi         "Inlining Arg"
;  V62 tmp37        [V62,T102] (  2,  1   )   byref  ->  rax         "Inline stloc first use temp"
;  V63 tmp38        [V63,T20] (  5, 14   )   byref  ->  rsi         "Inlining Arg"
;* V64 tmp39        [V64,T118] (  0,  0   )   byref  ->  zero-ref    "Inline stloc first use temp"
;  V65 tmp40        [V65,T60] (  2,  2.50)   byref  ->  rax         "Inline stloc first use temp"
;  V66 tmp41        [V66,T68] (  2,  2.50)  simd16  ->  mm0         "Inline stloc first use temp"
;  V67 tmp42        [V67,T69] (  2,  2.50)  simd16  ->  mm1         "Inline stloc first use temp"
;  V68 tmp43        [V68,T70] (  2,  2.50)  simd16  ->  mm2         "Inline stloc first use temp"
;  V69 tmp44        [V69,T33] (  4,  6.50)  simd16  ->  mm3         "Inline stloc first use temp"
;  V70 tmp45        [V70,T47] (  2,  4   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V71 tmp46        [V71,T71] (  2,  2.50)  simd16  ->  mm4         "Inline stloc first use temp"
;  V72 tmp47        [V72,T72] (  2,  2.50)  simd16  ->  mm5         "Inline stloc first use temp"
;  V73 tmp48        [V73,T73] (  2,  2.50)  simd16  ->  mm6         "Inline stloc first use temp"
;  V74 tmp49        [V74,T07] (  9, 18   )  simd16  ->  mm7         ld-addr-op "Inline stloc first use temp"
;  V75 tmp50        [V75,T37] (  3,  6   )  simd16  ->  mm8         "Inline stloc first use temp"
;  V76 tmp51        [V76,T48] (  2,  4   )  simd16  ->  mm9         "Inline stloc first use temp"
;  V77 tmp52        [V77,T49] (  2,  4   )  simd16  ->  mm10         "Inline stloc first use temp"
;  V78 tmp53        [V78,T50] (  2,  4   )  simd16  ->  mm11         "Inline stloc first use temp"
;  V79 tmp54        [V79,T51] (  2,  4   )  simd16  ->  mm9         "Inline stloc first use temp"
;  V80 tmp55        [V80,T52] (  2,  4   )  simd16  ->  mm8         "Inline stloc first use temp"
;  V81 tmp56        [V81,T53] (  2,  4   )  simd16  ->  mm7         ld-addr-op "Inline stloc first use temp"
;* V82 tmp57        [V82    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V83 tmp58        [V83,T81] (  2,  2   )    long  ->  rdx         "NewObj constructor temp"
;* V84 tmp59        [V84    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V85 tmp60        [V85,T112] (  2,  1   )  simd16  ->  mm4         "Inline return value spill temp"
;  V86 tmp61        [V86,T113] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V87 tmp62        [V87,T114] (  2,  1   )  simd16  ->  mm5         "Inline return value spill temp"
;  V88 tmp63        [V88,T115] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V89 tmp64        [V89,T82] (  2,  2   )    long  ->  rdi         ld-addr-op "Inlining Arg"
;  V90 tmp65        [V90,T83] (  2,  2   )    long  ->  rsi         ld-addr-op "Inlining Arg"
;  V91 tmp66        [V91,T11] (  2, 16   )    long  ->  r12         "Inlining Arg"
;* V92 tmp67        [V92    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;  V93 tmp68        [V93,T00] (  5, 40   )   byref  ->  r12         "Inlining Arg"
;  V94 tmp69        [V94,T26] (  2,  8   )     int  ->  r13         "Inline stloc first use temp"
;  V95 tmp70        [V95,T27] (  2,  8   )     int  ->  r14         "Inline stloc first use temp"
;  V96 tmp71        [V96,T28] (  2,  8   )     int  ->  rbx         "Inline stloc first use temp"
;  V97 tmp72        [V97,T29] (  2,  8   )     int  ->  r12         "Inline stloc first use temp"
;  V98 tmp73        [V98,T12] (  2, 16   )     int  ->  r13         "impAppendStmt"
;  V99 tmp74        [V99,T02] (  6, 24   )     int  ->  r14         "Inline stloc first use temp"
;  V100 tmp75       [V100,T10] (  4, 16   )     int  ->  rbx         "Inline stloc first use temp"
;  V101 tmp76       [V101,T30] (  2,  8   )     int  ->  r12         "Inline stloc first use temp"
;* V102 tmp77       [V102    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V103 tmp78       [V103,T13] (  2, 16   )    long  ->  r13         "NewObj constructor temp"
;* V104 tmp79       [V104    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V105 tmp80       [V105    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V106 tmp81       [V106,T14] (  2, 16   )    long  ->  r14         "NewObj constructor temp"
;* V107 tmp82       [V107    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V108 tmp83       [V108    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V109 tmp84       [V109,T15] (  2, 16   )    long  ->  rbx         "NewObj constructor temp"
;* V110 tmp85       [V110    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V111 tmp86       [V111    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V112 tmp87       [V112,T16] (  2, 16   )    long  ->  r12         "NewObj constructor temp"
;* V113 tmp88       [V113    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V114 tmp89       [V114,T17] (  2, 16   )    long  ->  r14         "Inlining Arg"
;* V115 tmp90       [V115    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;  V116 tmp91       [V116,T01] (  4, 32   )   byref  ->  r14         "Inlining Arg"
;* V117 tmp92       [V117    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V118 tmp93       [V118,T84] (  2,  2   )    long  ->  rax         "NewObj constructor temp"
;* V119 tmp94       [V119    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V120 tmp95       [V120    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V121 tmp96       [V121,T85] (  2,  2   )    long  ->  r11         "NewObj constructor temp"
;* V122 tmp97       [V122    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V123 tmp98       [V123    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V124 tmp99       [V124,T86] (  2,  2   )    long  ->  rbx         "NewObj constructor temp"
;* V125 tmp100      [V125    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V126 tmp101      [V126    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V127 tmp102      [V127,T87] (  2,  2   )    long  ->  r14         "NewObj constructor temp"
;* V128 tmp103      [V128    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V129 tmp104      [V129    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V130 tmp105      [V130,T88] (  2,  2   )    long  ->  rax         "NewObj constructor temp"
;* V131 tmp106      [V131    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V132 tmp107      [V132    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V133 tmp108      [V133,T89] (  2,  2   )    long  ->  r11         "NewObj constructor temp"
;* V134 tmp109      [V134    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V135 tmp110      [V135    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V136 tmp111      [V136,T90] (  2,  2   )    long  ->  r11         "NewObj constructor temp"
;* V137 tmp112      [V137    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V138 tmp113      [V138    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V139 tmp114      [V139,T91] (  2,  2   )    long  ->  rcx         "NewObj constructor temp"
;* V140 tmp115      [V140    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V141 tmp116      [V141,T92] (  2,  2   )    long  ->  rdx         "Inlining Arg"
;* V142 tmp117      [V142    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;  V143 tmp118      [V143,T39] (  4,  4   )   byref  ->   r8         "Inlining Arg"
;* V144 tmp119      [V144    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V145 tmp120      [V145,T93] (  2,  2   )    long  ->  rcx         "NewObj constructor temp"
;* V146 tmp121      [V146    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V147 tmp122      [V147,T94] (  2,  2   )    long  ->  rdx         "Inlining Arg"
;* V148 tmp123      [V148    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;  V149 tmp124      [V149,T95] (  2,  2   )    long  ->  rdx         "Inlining Arg"
;* V150 tmp125      [V150    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;  V151 tmp126      [V151,T96] (  2,  2   )    long  ->  rdx         "Inlining Arg"
;* V152 tmp127      [V152    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;  V153 tmp128      [V153,T103] (  2,  1   )   byref  ->  rcx         V27._pointer(offs=0x00) P-INDEP "field V27._pointer (fldOffset=0x0)"
;* V154 tmp129      [V154    ] (  0,  0   )     int  ->  zero-ref    V27._length(offs=0x08) P-INDEP "field V27._length (fldOffset=0x8)"
;  V155 tmp130      [V155,T104] (  2,  1   )   byref  ->   r8         V28._pointer(offs=0x00) P-INDEP "field V28._pointer (fldOffset=0x0)"
;* V156 tmp131      [V156    ] (  0,  0   )     int  ->  zero-ref    V28._length(offs=0x08) P-INDEP "field V28._length (fldOffset=0x8)"
;  V157 tmp132      [V157,T54] (  3,  3   )   byref  ->  rax         "BlockOp address local"
;  V158 tmp133      [V158,T55] (  3,  3   )   byref  ->  rax         "BlockOp address local"
;  V159 tmp134      [V159,T56] (  3,  3   )     ref  ->  rdx         "arr expr"
;  V160 rat0        [V160,T57] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;  V161 rat1        [V161,T58] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;
; Lcl frame size = 56

G_M25150_IG01:
       55                   push     rbp
       4157                 push     r15
       4156                 push     r14
       4155                 push     r13
       4154                 push     r12
       53                   push     rbx
       4883EC38             sub      rsp, 56
       C5F877               vzeroupper
       488D6C2460           lea      rbp, [rsp+60H]
       48897DC8             mov      bword ptr [rbp-38H], rdi
       488975D0             mov      qword ptr [rbp-30H], rsi
       488955B8             mov      bword ptr [rbp-48H], rdx
       48894DC0             mov      qword ptr [rbp-40H], rcx
       4C8945B0             mov      bword ptr [rbp-50H], r8
       4C894DA8             mov      bword ptr [rbp-58H], r9
       448B7D10             mov      r15d, dword ptr [rbp+10H]

G_M25150_IG02:
       48BF98505ED5887F0000 mov      rdi, 0x7F88D55E5098
       BE04000000           mov      esi, 4
       E8AACB1B79           call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       33FF                 xor      edi, edi
       33F6                 xor      esi, esi
       837DD000             cmp      dword ptr [rbp-30H], 0
       0F86BE040000         jbe      G_M25150_IG21
       488D45C8             lea      rax, bword ptr [rbp-38H]
       488B08               mov      rcx, bword ptr [rax]
       8B4008               mov      eax, dword ptr [rax+8]
       488D45B8             lea      rax, bword ptr [rbp-48H]
       4C8B00               mov      r8, bword ptr [rax]
       8B4008               mov      eax, dword ptr [rax+8]
       8B45D0               mov      eax, dword ptr [rbp-30H]
       448BC8               mov      r9d, eax
       4183E1FC             and      r9d, -4
       448B55C0             mov      r10d, dword ptr [rbp-40H]
       458BD9               mov      r11d, r9d
       4585DB               test     r11d, r11d
       0F8C2F050000         jl       G_M25150_IG29

G_M25150_IG03:
       418BC3               mov      eax, r11d
       C1F802               sar      eax, 2
       448D2440             lea      r12d, [rax+2*rax]
       418D4424FE           lea      eax, [r12-2]
       443BD0               cmp      r10d, eax
       7D19                 jge      SHORT G_M25150_IG04
       B856555555           mov      eax, 0x55555556
       41F7EA               imul     edx:eax, r10d
       448BDA               mov      r11d, edx
       41C1EB1F             shr      r11d, 31
       4103D3               add      edx, r11d
       448BDA               mov      r11d, edx
       41C1E302             shl      r11d, 2

G_M25150_IG04:
       4183FB2D             cmp      r11d, 45
       0F8C2C010000         jl       G_M25150_IG07
       488BF9               mov      rdi, rcx
       498BF0               mov      rsi, r8
       4183C3D4             add      r11d, -44
       418BC3               mov      eax, r11d
       4803C1               add      rax, rcx
       48BA880A00C0887F0000 mov      rdx, 0x7F88C0000A88
       488B12               mov      rdx, gword ptr [rdx]
       C5FD104208           vmovupd  ymm0, ymmword ptr[rdx+8]
       48BA800A00C0887F0000 mov      rdx, 0x7F88C0000A80
       488B12               mov      rdx, gword ptr [rdx]
       C5FD104A08           vmovupd  ymm1, ymmword ptr[rdx+8]
       48BA900A00C0887F0000 mov      rdx, 0x7F88C0000A90
       488B12               mov      rdx, gword ptr [rdx]
       C5FD105208           vmovupd  ymm2, ymmword ptr[rdx+8]
       48BA980A00C0887F0000 mov      rdx, 0x7F88C0000A98
       488B12               mov      rdx, gword ptr [rdx]
       C5FD105A08           vmovupd  ymm3, ymmword ptr[rdx+8]
       BA40014001           mov      edx, 0x1400140
       C5F96EE2             vmovd    xmm4, edx
       C4E27D58E4           vpbroadcastd ymm4, ymm4
       BA00100100           mov      edx, 0x11000
       C5F96EEA             vmovd    xmm5, edx
       C4E27D58ED           vpbroadcastd ymm5, ymm5
       48BA700A00C0887F0000 mov      rdx, 0x7F88C0000A70
       488B12               mov      rdx, gword ptr [rdx]
       C5FD107208           vmovupd  ymm6, ymmword ptr[rdx+8]
       48BA780A00C0887F0000 mov      rdx, 0x7F88C0000A78
       488B12               mov      rdx, gword ptr [rdx]
       C5FD107A08           vmovupd  ymm7, ymmword ptr[rdx+8]

G_M25150_IG05:
       C57D1007             vmovupd  ymm8, ymmword ptr[rdi]
       C4C13572D004         vpsrld   ymm9, ymm8, 4
       C535DBCB             vpand    ymm9, ymm9, ymm3
       C53DDBD3             vpand    ymm10, ymm8, ymm3
       C4427D00D9           vpshufb  ymm11, ymm0, ymm9
       C4411C57E4           vxorps   ymm12, ymm12, ymm12
       C4427500D2           vpshufb  ymm10, ymm1, ymm10
       C4412DDBD3           vpand    ymm10, ymm10, ymm11
       C4412D64D4           vpcmpgtb ymm10, ymm10, ymm12
       C4C17DD7D2           vpmovmskb edx, ymm10
       85D2                 test     edx, edx
       753D                 jne      SHORT G_M25150_IG06
       C53D74D3             vpcmpeqb ymm10, ymm8, ymm3
       C4412DFCC9           vpaddb   ymm9, ymm10, ymm9
       C4426D00C9           vpshufb  ymm9, ymm2, ymm9
       C4413DFCC1           vpaddb   ymm8, ymm8, ymm9
       C4623D04C4           vpmaddubsw ymm8, ymm8, ymm4
       C53DF5C5             vpmaddwd ymm8, ymm8, ymm5
       C4623D00C6           vpshufb  ymm8, ymm8, ymm6
       C4424536C8           vpermd   ymm9, ymm7, ymm8
       C57D110E             vmovupd  ymmword ptr[rsi], ymm9
       4883C720             add      rdi, 32
       4883C618             add      rsi, 24
       483BF8               cmp      rdi, rax
       7295                 jb       SHORT G_M25150_IG05

G_M25150_IG06:
       482BF9               sub      rdi, rcx
       492BF0               sub      rsi, r8
       8BC7                 mov      eax, edi
       4963D1               movsxd   rdx, r9d
       483BC2               cmp      rax, rdx
       0F8521010000         jne      G_M25150_IG10
       E92D030000           jmp      G_M25150_IG21

G_M25150_IG07:
       4183FB18             cmp      r11d, 24
       0F8C12010000         jl       G_M25150_IG10
       488BF9               mov      rdi, rcx
       498BF0               mov      rsi, r8
       488BC1               mov      rax, rcx
       4183C3E9             add      r11d, -23
       418BD3               mov      edx, r11d
       4803C2               add      rax, rdx
       48BA580A00C0887F0000 mov      rdx, 0x7F88C0000A58
       488B12               mov      rdx, gword ptr [rdx]
       C5F9104208           vmovupd  xmm0, xmmword ptr [rdx+8]
       48BA500A00C0887F0000 mov      rdx, 0x7F88C0000A50
       488B12               mov      rdx, gword ptr [rdx]
       C5F9104A08           vmovupd  xmm1, xmmword ptr [rdx+8]
       48BA600A00C0887F0000 mov      rdx, 0x7F88C0000A60
       488B12               mov      rdx, gword ptr [rdx]
       C5F9105208           vmovupd  xmm2, xmmword ptr [rdx+8]
       48BA680A00C0887F0000 mov      rdx, 0x7F88C0000A68
       488B12               mov      rdx, gword ptr [rdx]
       C5F9105A08           vmovupd  xmm3, xmmword ptr [rdx+8]
       BA40014001           mov      edx, 0x1400140
       C5F96EE2             vmovd    xmm4, edx
       C4E27958E4           vpbroadcastd xmm4, xmm4
       BA00100100           mov      edx, 0x11000
       C5F96EEA             vmovd    xmm5, edx
       C4E27958ED           vpbroadcastd xmm5, xmm5
       48BA480A00C0887F0000 mov      rdx, 0x7F88C0000A48
       488B12               mov      rdx, gword ptr [rdx]
       C5F9107208           vmovupd  xmm6, xmmword ptr [rdx+8]

G_M25150_IG08:
       C5F9103F             vmovupd  xmm7, xmmword ptr [rdi]
       C5B972D704           vpsrld   xmm8, xmm7, 4
       C539DBC3             vpand    xmm8, xmm8, xmm3
       C541DBCB             vpand    xmm9, xmm7, xmm3
       C4427900D0           vpshufb  xmm10, xmm0, xmm8
       C4412057DB           vxorps   xmm11, xmm11, xmm11
       C4427100C9           vpshufb  xmm9, xmm1, xmm9
       C44131DBCA           vpand    xmm9, xmm9, xmm10
       C4413164CB           vpcmpgtb xmm9, xmm9, xmm11
       C4C179D7D1           vpmovmskb edx, xmm9
       85D2                 test     edx, edx
       7539                 jne      SHORT G_M25150_IG09
       C54174CB             vpcmpeqb xmm9, xmm7, xmm3
       C44131FCC0           vpaddb   xmm8, xmm9, xmm8
       C4426900C0           vpshufb  xmm8, xmm2, xmm8
       C4C141FCF8           vpaddb   xmm7, xmm7, xmm8
       C4E24104FC           vpmaddubsw xmm7, xmm7, xmm4
       C5C1F5FD             vpmaddwd xmm7, xmm7, xmm5
       C4E24100FE           vpshufb  xmm7, xmm7, xmm6
       C5F9113E             vmovupd  xmmword ptr [rsi], xmm7
       4883C710             add      rdi, 16
       4883C60C             add      rsi, 12
       483BF8               cmp      rdi, rax
       729B                 jb       SHORT G_M25150_IG08

G_M25150_IG09:
       482BF9               sub      rdi, rcx
       492BF0               sub      rsi, r8
       8BC7                 mov      eax, edi
       4963D1               movsxd   rdx, r9d
       483BC2               cmp      rax, rdx
       0F8411020000         je       G_M25150_IG21

G_M25150_IG10:
       4584FF               test     r15b, r15b
       7504                 jne      SHORT G_M25150_IG11
       33C0                 xor      eax, eax
       EB05                 jmp      SHORT G_M25150_IG12

G_M25150_IG11:
       B804000000           mov      eax, 4

G_M25150_IG12:
       448BD8               mov      r11d, eax
       453BD4               cmp      r10d, r12d
       7C08                 jl       SHORT G_M25150_IG13
       418BC1               mov      eax, r9d
       412BC3               sub      eax, r11d
       EB14                 jmp      SHORT G_M25150_IG14

G_M25150_IG13:
       B856555555           mov      eax, 0x55555556
       41F7EA               imul     edx:eax, r10d
       8BC2                 mov      eax, edx
       C1E81F               shr      eax, 31
       03D0                 add      edx, eax
       8BC2                 mov      eax, edx
       C1E002               shl      eax, 2

G_M25150_IG14:
       48BAC80A00C0887F0000 mov      rdx, 0x7F88C0000AC8
       488B12               mov      rdx, gword ptr [rdx]
       837A0800             cmp      dword ptr [rdx+8], 0
       0F866F020000         jbe      G_M25150_IG30
       4883C210             add      rdx, 16
       448BE7               mov      r12d, edi
       4C63E8               movsxd   r13, eax
       4D3BE5               cmp      r12, r13
       0F8D88000000         jge      G_M25150_IG16

G_M25150_IG15:
       448BE7               mov      r12d, edi
       4C03E1               add      r12, rcx
       450FB62C24           movzx    r13, byte  ptr [r12]
       450FB6742401         movzx    r14, byte  ptr [r12+1]
       410FB65C2402         movzx    rbx, byte  ptr [r12+2]
       450FB6642403         movzx    r12, byte  ptr [r12+3]
       458BED               mov      r13d, r13d
       4E0FBE2C2A           movsx    r13, byte  ptr [rdx+r13]
       458BF6               mov      r14d, r14d
       4E0FBE3432           movsx    r14, byte  ptr [rdx+r14]
       8BDB                 mov      ebx, ebx
       480FBE1C1A           movsx    rbx, byte  ptr [rdx+rbx]
       458BE4               mov      r12d, r12d
       4E0FBE2422           movsx    r12, byte  ptr [rdx+r12]
       41C1E60C             shl      r14d, 12
       C1E306               shl      ebx, 6
       440BF3               or       r14d, ebx
       41C1E512             shl      r13d, 18
       450BEC               or       r13d, r12d
       418BDD               mov      ebx, r13d
       410BDE               or       ebx, r14d
       85DB                 test     ebx, ebx
       0F8CD5010000         jl       G_M25150_IG27
       448BF6               mov      r14d, esi
       4D03F0               add      r14, r8
       448BE3               mov      r12d, ebx
       41C1FC10             sar      r12d, 16
       458826               mov      byte  ptr [r14], r12b
       448BE3               mov      r12d, ebx
       41C1FC08             sar      r12d, 8
       45886601             mov      byte  ptr [r14+1], r12b
       41885E02             mov      byte  ptr [r14+2], bl
       83C603               add      esi, 3
       83C704               add      edi, 4
       3BF8                 cmp      edi, eax
       0F8278FFFFFF         jb       G_M25150_IG15

G_M25150_IG16:
       418BD9               mov      ebx, r9d
       412BDB               sub      ebx, r11d
       3BD8                 cmp      ebx, eax
       0F8540010000         jne      G_M25150_IG23
       8BC7                 mov      eax, edi
       4D63D9               movsxd   r11, r9d
       493BC3               cmp      rax, r11
       750E                 jne      SHORT G_M25150_IG17
       4584FF               test     r15b, r15b
       0F8463010000         je       G_M25150_IG25
       E982010000           jmp      G_M25150_IG27

G_M25150_IG17:
       418D41FC             lea      eax, [r9-4]
       8BC0                 mov      eax, eax
       0FB60401             movzx    rax, byte  ptr [rcx+rax]
       458D59FD             lea      r11d, [r9-3]
       458BDB               mov      r11d, r11d
       460FB61C19           movzx    r11, byte  ptr [rcx+r11]
       418D59FE             lea      ebx, [r9-2]
       8BDB                 mov      ebx, ebx
       0FB61C19             movzx    rbx, byte  ptr [rcx+rbx]
       458D71FF             lea      r14d, [r9-1]
       458BF6               mov      r14d, r14d
       420FB60C31           movzx    rcx, byte  ptr [rcx+r14]
       8BC0                 mov      eax, eax
       480FBE0402           movsx    rax, byte  ptr [rdx+rax]
       458BDB               mov      r11d, r11d
       4E0FBE1C1A           movsx    r11, byte  ptr [rdx+r11]
       C1E012               shl      eax, 18
       41C1E30C             shl      r11d, 12
       410BC3               or       eax, r11d
       83F93D               cmp      ecx, 61
       7451                 je       SHORT G_M25150_IG18
       448BDB               mov      r11d, ebx
       4E0FBE1C1A           movsx    r11, byte  ptr [rdx+r11]
       8BC9                 mov      ecx, ecx
       480FBE140A           movsx    rdx, byte  ptr [rdx+rcx]
       41C1E306             shl      r11d, 6
       0BC2                 or       eax, edx
       410BC3               or       eax, r11d
       85C0                 test     eax, eax
       0F8C18010000         jl       G_M25150_IG27
       8BD6                 mov      edx, esi
       4183C2FD             add      r10d, -3
       4963CA               movsxd   rcx, r10d
       483BD1               cmp      rdx, rcx
       0F8FAC000000         jg       G_M25150_IG23
       8BD6                 mov      edx, esi
       4C03C2               add      r8, rdx
       8BD0                 mov      edx, eax
       C1FA10               sar      edx, 16
       418810               mov      byte  ptr [r8], dl
       8BD0                 mov      edx, eax
       C1FA08               sar      edx, 8
       41885001             mov      byte  ptr [r8+1], dl
       41884002             mov      byte  ptr [r8+2], al
       83C603               add      esi, 3
       EB63                 jmp      SHORT G_M25150_IG20

G_M25150_IG18:
       83FB3D               cmp      ebx, 61
       743E                 je       SHORT G_M25150_IG19
       8BCB                 mov      ecx, ebx
       480FBE140A           movsx    rdx, byte  ptr [rdx+rcx]
       C1E206               shl      edx, 6
       0BC2                 or       eax, edx
       85C0                 test     eax, eax
       0F8CCE000000         jl       G_M25150_IG27
       8BD6                 mov      edx, esi
       4183C2FE             add      r10d, -2
       4963CA               movsxd   rcx, r10d
       483BD1               cmp      rdx, rcx
       7F66                 jg       SHORT G_M25150_IG23
       8BD6                 mov      edx, esi
       8BC8                 mov      ecx, eax
       C1F910               sar      ecx, 16
       41880C10             mov      byte  ptr [r8+rdx], cl
       8D5601               lea      edx, [rsi+1]
       8BD2                 mov      edx, edx
       C1F808               sar      eax, 8
       41880410             mov      byte  ptr [r8+rdx], al
       83C602               add      esi, 2
       EB20                 jmp      SHORT G_M25150_IG20

G_M25150_IG19:
       85C0                 test     eax, eax
       0F8C9C000000         jl       G_M25150_IG27
       8BD6                 mov      edx, esi
       41FFCA               dec      r10d
       4963CA               movsxd   rcx, r10d
       483BD1               cmp      rdx, rcx
       7F35                 jg       SHORT G_M25150_IG23
       8BD6                 mov      edx, esi
       C1F810               sar      eax, 16
       41880410             mov      byte  ptr [r8+rdx], al
       FFC6                 inc      esi

G_M25150_IG20:
       83C704               add      edi, 4
       443B4DD0             cmp      r9d, dword ptr [rbp-30H]
       757B                 jne      SHORT G_M25150_IG27

G_M25150_IG21:
       488B5DB0             mov      rbx, bword ptr [rbp-50H]
       893B                 mov      dword ptr [rbx], edi
       4C8B75A8             mov      r14, bword ptr [rbp-58H]
       418936               mov      dword ptr [r14], esi
       33C0                 xor      eax, eax

G_M25150_IG22:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M25150_IG23:
       443B4DD0             cmp      r9d, dword ptr [rbp-30H]
       0F95C0               setne    al
       0FB6C0               movzx    rax, al
       410FB6D7             movzx    rdx, r15b
       85C2                 test     eax, edx
       7548                 jne      SHORT G_M25150_IG27
       488B5DB0             mov      rbx, bword ptr [rbp-50H]
       893B                 mov      dword ptr [rbx], edi
       4C8B75A8             mov      r14, bword ptr [rbp-58H]
       418936               mov      dword ptr [r14], esi
       B801000000           mov      eax, 1

G_M25150_IG24:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M25150_IG25:
       488B5DB0             mov      rbx, bword ptr [rbp-50H]
       893B                 mov      dword ptr [rbx], edi
       4C8B75A8             mov      r14, bword ptr [rbp-58H]
       418936               mov      dword ptr [r14], esi
       B802000000           mov      eax, 2

G_M25150_IG26:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M25150_IG27:
       488B5DB0             mov      rbx, bword ptr [rbp-50H]
       893B                 mov      dword ptr [rbx], edi
       4C8B75A8             mov      r14, bword ptr [rbp-58H]
       418936               mov      dword ptr [r14], esi
       B803000000           mov      eax, 3

G_M25150_IG28:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M25150_IG29:
       33FF                 xor      edi, edi
       E810F2FFFF           call     ThrowHelper:ThrowArgumentOutOfRangeException(int)
       CC                   int3

G_M25150_IG30:
       E822D31279           call     CORINFO_HELP_RNGCHKFAIL
       CC                   int3

; Total bytes of code 1439, prolog size 50 for method Base64_1:DecodeFromUtf8(struct,struct,byref,byref,bool):int
; ============================================================
