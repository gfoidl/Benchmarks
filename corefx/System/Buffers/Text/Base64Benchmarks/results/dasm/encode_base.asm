; Assembly listing for method Base64_1:EncodeToUtf8(struct,struct,byref,byref,bool):int
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00    ] (  5,  4   )  struct (16) [rbp-0x30]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V01 arg1         [V01    ] (  4,  3   )  struct (16) [rbp-0x40]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V02 arg2         [V02,T28] (  5,  3.50)   byref  ->  rbx
;  V03 arg3         [V03,T29] (  5,  3.50)   byref  ->  r14
;  V04 arg4         [V04,T124] (  1,  0.50)    bool  ->  [rbp+0x10]
;  V05 loc0         [V05,T01] ( 23, 26   )     int  ->  rdi         ld-addr-op
;  V06 loc1         [V06,T05] ( 16, 19   )     int  ->  rsi         ld-addr-op
;  V07 loc2         [V07,T20] ( 10,  8.50)   byref  ->  rcx
;  V08 loc3         [V08,T22] (  8,  7.50)   byref  ->   r8
;  V09 loc4         [V09,T27] ( 11,  5.50)     int  ->   r9
;  V10 loc5         [V10,T89] (  3,  1.50)     int  ->  r10
;  V11 loc6         [V11,T23] ( 11,  9   )     int  ->  rax
;  V12 loc7         [V12,T21] (  6, 10   )     int  ->  r10
;  V13 loc8         [V13,T06] ( 10, 19   )   byref  ->  rdx
;# V14 OutArgs      [V14    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;* V15 tmp1         [V15    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V16 tmp2         [V16    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;  V17 tmp3         [V17,T51] (  2,  2.50)  simd32  ->  mm0         "Inline stloc first use temp"
;  V18 tmp4         [V18,T93] (  2,  1   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V19 tmp5         [V19,T52] (  2,  2.50)  simd32  ->  mm1         "Inline stloc first use temp"
;  V20 tmp6         [V20,T53] (  2,  2.50)  simd32  ->  mm2         "Inline stloc first use temp"
;  V21 tmp7         [V21,T54] (  2,  2.50)  simd32  ->  mm3         "Inline stloc first use temp"
;  V22 tmp8         [V22,T55] (  2,  2.50)  simd32  ->  mm4         "Inline stloc first use temp"
;  V23 tmp9         [V23,T56] (  2,  2.50)  simd32  ->  mm5         "Inline stloc first use temp"
;  V24 tmp10        [V24,T57] (  2,  2.50)  simd32  ->  mm6         "Inline stloc first use temp"
;  V25 tmp11        [V25,T58] (  2,  2.50)  simd32  ->  mm7         "Inline stloc first use temp"
;  V26 tmp12        [V26,T07] (  6, 18   )   byref  ->  rdx         "Inlining Arg"
;* V27 tmp13        [V27,T121] (  0,  0   )   byref  ->  zero-ref    "Inline stloc first use temp"
;  V28 tmp14        [V28,T19] (  5, 14   )   byref  ->  rsi         "Inlining Arg"
;* V29 tmp15        [V29,T122] (  0,  0   )   byref  ->  zero-ref    "Inline stloc first use temp"
;  V30 tmp16        [V30,T49] (  2,  2.50)   byref  ->  rdi         "Inline stloc first use temp"
;  V31 tmp17        [V31,T02] ( 14, 23.50)  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V32 tmp18        [V32,T30] (  2,  4   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V33 tmp19        [V33,T31] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V34 tmp20        [V34,T32] (  2,  4   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V35 tmp21        [V35,T33] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V36 tmp22        [V36,T34] (  2,  4   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V37 tmp23        [V37,T35] (  2,  4   )  simd32  ->  mm10         "Inline stloc first use temp"
;  V38 tmp24        [V38,T36] (  2,  4   )  simd32  ->  mm9         "Inline stloc first use temp"
;  V39 tmp25        [V39,T94] (  2,  1   )  simd32  ->  mm1         "Inline return value spill temp"
;  V40 tmp26        [V40,T95] (  2,  1   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V41 tmp27        [V41,T96] (  2,  1   )  simd32  ->  mm2         "Inline return value spill temp"
;  V42 tmp28        [V42,T97] (  2,  1   )  simd16  ->  mm2         "Inline stloc first use temp"
;  V43 tmp29        [V43,T98] (  2,  1   )  simd32  ->  mm3         "Inline return value spill temp"
;  V44 tmp30        [V44,T99] (  2,  1   )  simd16  ->  mm3         "Inline stloc first use temp"
;  V45 tmp31        [V45,T100] (  2,  1   )  simd32  ->  mm4         "Inline return value spill temp"
;  V46 tmp32        [V46,T101] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V47 tmp33        [V47,T102] (  2,  1   )  simd32  ->  mm5         "Inline return value spill temp"
;  V48 tmp34        [V48,T103] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V49 tmp35        [V49,T104] (  2,  1   )  simd32  ->  mm6         "Inline return value spill temp"
;  V50 tmp36        [V50,T105] (  2,  1   )  simd16  ->  mm6         "Inline stloc first use temp"
;* V51 tmp37        [V51    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V52 tmp38        [V52,T68] (  2,  2   )    long  ->  rdi         "NewObj constructor temp"
;* V53 tmp39        [V53    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V54 tmp40        [V54,T69] (  2,  2   )    long  ->  rdi         ld-addr-op "Inlining Arg"
;  V55 tmp41        [V55,T70] (  2,  2   )    long  ->  rsi         ld-addr-op "Inlining Arg"
;  V56 tmp42        [V56,T59] (  2,  2.50)  simd16  ->  mm0         "Inline stloc first use temp"
;* V57 tmp43        [V57    ] (  0,  0   )  simd16  ->  zero-ref    ld-addr-op "Inline stloc first use temp"
;  V58 tmp44        [V58,T60] (  2,  2.50)  simd16  ->  mm1         "Inline stloc first use temp"
;  V59 tmp45        [V59,T61] (  2,  2.50)  simd16  ->  mm2         "Inline stloc first use temp"
;  V60 tmp46        [V60,T62] (  2,  2.50)  simd16  ->  mm3         "Inline stloc first use temp"
;  V61 tmp47        [V61,T63] (  2,  2.50)  simd16  ->  mm4         "Inline stloc first use temp"
;  V62 tmp48        [V62,T64] (  2,  2.50)  simd16  ->  mm5         "Inline stloc first use temp"
;  V63 tmp49        [V63,T65] (  2,  2.50)  simd16  ->  mm6         "Inline stloc first use temp"
;  V64 tmp50        [V64,T66] (  2,  2.50)  simd16  ->  mm7         "Inline stloc first use temp"
;  V65 tmp51        [V65,T08] (  6, 18   )   byref  ->  rdi         "Inlining Arg"
;  V66 tmp52        [V66,T88] (  3,  1.50)   byref  ->  rdx         "Inline stloc first use temp"
;  V67 tmp53        [V67,T18] (  5, 14   )   byref  ->  rsi         "Inlining Arg"
;* V68 tmp54        [V68,T123] (  0,  0   )   byref  ->  zero-ref    "Inline stloc first use temp"
;  V69 tmp55        [V69,T50] (  2,  2.50)   byref  ->  r10         "Inline stloc first use temp"
;  V70 tmp56        [V70,T03] ( 11, 22   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V71 tmp57        [V71,T37] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V72 tmp58        [V72,T38] (  2,  4   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V73 tmp59        [V73,T39] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V74 tmp60        [V74,T40] (  2,  4   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V75 tmp61        [V75,T41] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V76 tmp62        [V76,T42] (  2,  4   )  simd16  ->  mm10         "Inline stloc first use temp"
;  V77 tmp63        [V77,T43] (  2,  4   )  simd16  ->  mm9         "Inline stloc first use temp"
;  V78 tmp64        [V78,T106] (  2,  1   )  simd16  ->  mm1         "Inline return value spill temp"
;  V79 tmp65        [V79,T107] (  2,  1   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V80 tmp66        [V80,T108] (  2,  1   )  simd16  ->  mm2         "Inline return value spill temp"
;  V81 tmp67        [V81,T109] (  2,  1   )  simd16  ->  mm2         "Inline stloc first use temp"
;  V82 tmp68        [V82,T110] (  2,  1   )  simd16  ->  mm3         "Inline return value spill temp"
;  V83 tmp69        [V83,T111] (  2,  1   )  simd16  ->  mm3         "Inline stloc first use temp"
;  V84 tmp70        [V84,T112] (  2,  1   )  simd16  ->  mm4         "Inline return value spill temp"
;  V85 tmp71        [V85,T113] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V86 tmp72        [V86,T114] (  2,  1   )  simd16  ->  mm5         "Inline return value spill temp"
;  V87 tmp73        [V87,T115] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V88 tmp74        [V88,T116] (  2,  1   )  simd16  ->  mm6         "Inline return value spill temp"
;  V89 tmp75        [V89,T117] (  2,  1   )  simd16  ->  mm6         "Inline stloc first use temp"
;* V90 tmp76        [V90    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V91 tmp77        [V91,T71] (  2,  2   )    long  ->  r10         "NewObj constructor temp"
;* V92 tmp78        [V92    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V93 tmp79        [V93,T72] (  2,  2   )    long  ->  rdi         "Inlining Arg"
;* V94 tmp80        [V94    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;  V95 tmp81        [V95,T73] (  2,  2   )    long  ->  rsi         "Inlining Arg"
;* V96 tmp82        [V96    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;  V97 tmp83        [V97,T74] (  2,  2   )    long  ->  rdi         ld-addr-op "Inlining Arg"
;  V98 tmp84        [V98,T75] (  2,  2   )    long  ->  rsi         ld-addr-op "Inlining Arg"
;  V99 tmp85        [V99,T09] (  2, 16   )    long  ->  r10         "Inlining Arg"
;* V100 tmp86       [V100    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;  V101 tmp87       [V101,T00] (  4, 32   )   byref  ->  r10         "Inlining Arg"
;  V102 tmp88       [V102,T10] (  2, 16   )     int  ->  r11         "impAppendStmt"
;  V103 tmp89       [V103,T11] (  2, 16   )     int  ->  r11         "impAppendStmt"
;  V104 tmp90       [V104,T04] (  5, 20   )     int  ->  r10         "Inline stloc first use temp"
;  V105 tmp91       [V105,T12] (  2, 16   )     int  ->  r11         "impAppendStmt"
;  V106 tmp92       [V106,T24] (  2,  8   )     int  ->  r15         "Inline stloc first use temp"
;  V107 tmp93       [V107,T25] (  2,  8   )     int  ->  r12         "Inline stloc first use temp"
;  V108 tmp94       [V108,T26] (  2,  8   )     int  ->  r10         "Inline stloc first use temp"
;* V109 tmp95       [V109    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V110 tmp96       [V110,T13] (  2, 16   )    long  ->  r11         "NewObj constructor temp"
;* V111 tmp97       [V111    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V112 tmp98       [V112    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V113 tmp99       [V113,T14] (  2, 16   )    long  ->  r15         "NewObj constructor temp"
;* V114 tmp100      [V114    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V115 tmp101      [V115    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V116 tmp102      [V116,T15] (  2, 16   )    long  ->  r12         "NewObj constructor temp"
;* V117 tmp103      [V117    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V118 tmp104      [V118    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V119 tmp105      [V119,T16] (  2, 16   )    long  ->  r10         "NewObj constructor temp"
;* V120 tmp106      [V120    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V121 tmp107      [V121,T17] (  2, 16   )    long  ->  r11         "Inlining Arg"
;* V122 tmp108      [V122    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;* V123 tmp109      [V123    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;  V124 tmp110      [V124,T76] (  2,  2   )    long  ->   r9         "Inlining Arg"
;* V125 tmp111      [V125    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;* V126 tmp112      [V126    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;  V127 tmp113      [V127,T90] (  3,  1.50)     int  ->  rax         "Inline stloc first use temp"
;  V128 tmp114      [V128,T77] (  2,  2   )     int  ->  rcx         "impAppendStmt"
;  V129 tmp115      [V129,T118] (  2,  1   )     int  ->  rdx         "Inline stloc first use temp"
;* V130 tmp116      [V130    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V131 tmp117      [V131,T78] (  2,  2   )    long  ->  rcx         "NewObj constructor temp"
;* V132 tmp118      [V132    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V133 tmp119      [V133    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V134 tmp120      [V134,T79] (  2,  2   )    long  ->  rax         "NewObj constructor temp"
;* V135 tmp121      [V135    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V136 tmp122      [V136,T80] (  2,  2   )    long  ->  rax         "Inlining Arg"
;* V137 tmp123      [V137    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;* V138 tmp124      [V138    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;  V139 tmp125      [V139,T81] (  2,  2   )    long  ->  rax         "Inlining Arg"
;* V140 tmp126      [V140    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;  V141 tmp127      [V141,T44] (  3,  3   )   byref  ->  rax         "Inlining Arg"
;  V142 tmp128      [V142,T82] (  2,  2   )     int  ->  rcx         "impAppendStmt"
;  V143 tmp129      [V143,T67] (  4,  2   )     int  ->  rax         "Inline stloc first use temp"
;  V144 tmp130      [V144,T83] (  2,  2   )     int  ->  rcx         "impAppendStmt"
;  V145 tmp131      [V145,T119] (  2,  1   )     int  ->   r9         "Inline stloc first use temp"
;  V146 tmp132      [V146,T120] (  2,  1   )     int  ->  rax         "Inline stloc first use temp"
;* V147 tmp133      [V147    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V148 tmp134      [V148,T84] (  2,  2   )    long  ->  rcx         "NewObj constructor temp"
;* V149 tmp135      [V149    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V150 tmp136      [V150    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V151 tmp137      [V151,T85] (  2,  2   )    long  ->   r9         "NewObj constructor temp"
;* V152 tmp138      [V152    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V153 tmp139      [V153    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V154 tmp140      [V154,T86] (  2,  2   )    long  ->  rax         "NewObj constructor temp"
;* V155 tmp141      [V155    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V156 tmp142      [V156,T87] (  2,  2   )    long  ->  rax         "Inlining Arg"
;* V157 tmp143      [V157    ] (  0,  0   )    long  ->  zero-ref    "NewObj constructor temp"
;* V158 tmp144      [V158    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;  V159 tmp145      [V159,T91] (  2,  1   )   byref  ->  rcx         V15._pointer(offs=0x00) P-INDEP "field V15._pointer (fldOffset=0x0)"
;* V160 tmp146      [V160    ] (  0,  0   )     int  ->  zero-ref    V15._length(offs=0x08) P-INDEP "field V15._length (fldOffset=0x8)"
;  V161 tmp147      [V161,T92] (  2,  1   )   byref  ->   r8         V16._pointer(offs=0x00) P-INDEP "field V16._pointer (fldOffset=0x0)"
;* V162 tmp148      [V162    ] (  0,  0   )     int  ->  zero-ref    V16._length(offs=0x08) P-INDEP "field V16._length (fldOffset=0x8)"
;  V163 tmp149      [V163,T45] (  3,  3   )   byref  ->  rax         "BlockOp address local"
;  V164 tmp150      [V164,T46] (  3,  3   )   byref  ->  rax         "BlockOp address local"
;  V165 tmp151      [V165,T47] (  3,  3   )     ref  ->  rdx         "arr expr"
;  V166 rat0        [V166,T48] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;
; Lcl frame size = 32

G_M39806_IG01:
       55                   push     rbp
       4157                 push     r15
       4156                 push     r14
       4154                 push     r12
       53                   push     rbx
       4883EC20             sub      rsp, 32
       C5F877               vzeroupper
       488D6C2440           lea      rbp, [rsp+40H]
       48897DD0             mov      bword ptr [rbp-30H], rdi
       488975D8             mov      qword ptr [rbp-28H], rsi
       488955C0             mov      bword ptr [rbp-40H], rdx
       48894DC8             mov      qword ptr [rbp-38H], rcx
       498BD8               mov      rbx, r8
       4D8BF1               mov      r14, r9

G_M39806_IG02:
       48BF98503ECBF47F0000 mov      rdi, 0x7FF4CB3E5098
       BE04000000           mov      esi, 4
       E872981B79           call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       33FF                 xor      edi, edi
       33F6                 xor      esi, esi
       837DD800             cmp      dword ptr [rbp-28H], 0
       0F8626040000         jbe      G_M39806_IG14
       488D45D0             lea      rax, bword ptr [rbp-30H]
       488B08               mov      rcx, bword ptr [rax]
       8B4008               mov      eax, dword ptr [rax+8]
       488D45C0             lea      rax, bword ptr [rbp-40H]
       4C8B00               mov      r8, bword ptr [rax]
       8B4008               mov      eax, dword ptr [rax+8]
       448B4DD8             mov      r9d, dword ptr [rbp-28H]
       448B55C8             mov      r10d, dword ptr [rbp-38H]
       4181F9FDFFFF5F       cmp      r9d, 0x5FFFFFFD
       7F2C                 jg       SHORT G_M39806_IG04
       4181F9FDFFFF5F       cmp      r9d, 0x5FFFFFFD
       0F873F040000         ja       G_M39806_IG20

G_M39806_IG03:
       418D4102             lea      eax, [r9+2]
       BA56555555           mov      edx, 0x55555556
       F7EA                 imul     edx:eax, edx
       8BC2                 mov      eax, edx
       C1E81F               shr      eax, 31
       03D0                 add      edx, eax
       C1E202               shl      edx, 2
       413BD2               cmp      edx, r10d
       7F05                 jg       SHORT G_M39806_IG04
       418BC1               mov      eax, r9d
       EB08                 jmp      SHORT G_M39806_IG05

G_M39806_IG04:
       41C1FA02             sar      r10d, 2
       438D0452             lea      eax, [r10+2*r10]

G_M39806_IG05:
       4183F910             cmp      r9d, 16
       0F8C2F020000         jl       G_M39806_IG10
       83F820               cmp      eax, 32
       0F8C1C010000         jl       G_M39806_IG08
       498BF0               mov      rsi, r8
       48BFB80A00BCF47F0000 mov      rdi, 0x7FF4BC000AB8
       488B3F               mov      rdi, gword ptr [rdi]
       C5FD104708           vmovupd  ymm0, ymmword ptr[rdi+8]
       BF00FCC00F           mov      edi, 0xFC0FC00
       C5F96ECF             vmovd    xmm1, edi
       C4E27D58C9           vpbroadcastd ymm1, ymm1
       BFF0033F00           mov      edi, 0x3F03F0
       C5F96ED7             vmovd    xmm2, edi
       C4E27D58D2           vpbroadcastd ymm2, ymm2
       BF40000004           mov      edi, 0x4000040
       C5F96EDF             vmovd    xmm3, edi
       C4E27D58DB           vpbroadcastd ymm3, ymm3
       BF10000001           mov      edi, 0x1000010
       C5F96EE7             vmovd    xmm4, edi
       C4E27D58E4           vpbroadcastd ymm4, ymm4
       BF33000000           mov      edi, 51
       C5F96EEF             vmovd    xmm5, edi
       C4E27D78ED           vpbroadcastb ymm5, ymm5
       BF19000000           mov      edi, 25
       C5F96EF7             vmovd    xmm6, edi
       C4E27D78F6           vpbroadcastb ymm6, ymm6
       48BFC00A00BCF47F0000 mov      rdi, 0x7FF4BC000AC0
       488B3F               mov      rdi, gword ptr [rdi]
       C5FD107F08           vmovupd  ymm7, ymmword ptr[rdi+8]
       8D78E0               lea      edi, [rax-32]
       8BFF                 mov      edi, edi
       4803F9               add      rdi, rcx
       C57D1001             vmovupd  ymm8, ymmword ptr[rcx]
       48BAB00A00BCF47F0000 mov      rdx, 0x7FF4BC000AB0
       488B12               mov      rdx, gword ptr [rdx]
       C57D104A08           vmovupd  ymm9, ymmword ptr[rdx+8]
       C4423536C0           vpermd   ymm8, ymm9, ymm8
       488D51FC             lea      rdx, bword ptr [rcx-4]

G_M39806_IG06:
       C4623D00C0           vpshufb  ymm8, ymm8, ymm0
       C53DDBC9             vpand    ymm9, ymm8, ymm1
       C53DDBC2             vpand    ymm8, ymm8, ymm2
       C535E4CB             vpmulhuw ymm9, ymm9, ymm3
       C53DD5C4             vpmullw  ymm8, ymm8, ymm4
       C44135EBC0           vpor     ymm8, ymm9, ymm8
       C53DD8CD             vpsubusb ymm9, ymm8, ymm5
       C53D64D6             vpcmpgtb ymm10, ymm8, ymm6
       C44135F8CA           vpsubb   ymm9, ymm9, ymm10
       C4424500C9           vpshufb  ymm9, ymm7, ymm9
       C4413DFCC1           vpaddb   ymm8, ymm8, ymm9
       C57D1106             vmovupd  ymmword ptr[rsi], ymm8
       4883C218             add      rdx, 24
       4883C620             add      rsi, 32
       483BD7               cmp      rdx, rdi
       770E                 ja       SHORT G_M39806_IG07
       C57D1002             vmovupd  ymm8, ymmword ptr[rdx]
       EBB8                 jmp      SHORT G_M39806_IG06

G_M39806_IG07:
       488BFA               mov      rdi, rdx
       482BF9               sub      rdi, rcx
       83C704               add      edi, 4
       492BF0               sub      rsi, r8
       8BD7                 mov      edx, edi
       4D63D1               movsxd   r10, r9d
       493BD2               cmp      rdx, r10
       0F849E020000         je       G_M39806_IG14

G_M39806_IG08:
       8D5710               lea      edx, [rdi+16]
       3BC2                 cmp      eax, edx
       0F8CFF000000         jl       G_M39806_IG10
       48BAA00A00BCF47F0000 mov      rdx, 0x7FF4BC000AA0
       488B12               mov      rdx, gword ptr [rdx]
       C5F9104208           vmovupd  xmm0, xmmword ptr [rdx+8]
       BA00FCC00F           mov      edx, 0xFC0FC00
       C5F96ECA             vmovd    xmm1, edx
       C4E27958C9           vpbroadcastd xmm1, xmm1
       BAF0033F00           mov      edx, 0x3F03F0
       C5F96ED2             vmovd    xmm2, edx
       C4E27958D2           vpbroadcastd xmm2, xmm2
       BA40000004           mov      edx, 0x4000040
       C5F96EDA             vmovd    xmm3, edx
       C4E27958DB           vpbroadcastd xmm3, xmm3
       BA10000001           mov      edx, 0x1000010
       C5F96EE2             vmovd    xmm4, edx
       C4E27958E4           vpbroadcastd xmm4, xmm4
       BA33000000           mov      edx, 51
       C5F96EEA             vmovd    xmm5, edx
       C4E27978ED           vpbroadcastb xmm5, xmm5
       BA19000000           mov      edx, 25
       C5F96EF2             vmovd    xmm6, edx
       C4E27978F6           vpbroadcastb xmm6, xmm6
       48BAA80A00BCF47F0000 mov      rdx, 0x7FF4BC000AA8
       488B12               mov      rdx, gword ptr [rdx]
       C5F9107A08           vmovupd  xmm7, xmmword ptr [rdx+8]
       488BD1               mov      rdx, rcx
       448D50F1             lea      r10d, [rax-15]
       458BD2               mov      r10d, r10d
       4C03D2               add      r10, rdx
       8BFF                 mov      edi, edi
       4803FA               add      rdi, rdx
       8BF6                 mov      esi, esi
       4903F0               add      rsi, r8

G_M39806_IG09:
       C5791007             vmovupd  xmm8, xmmword ptr [rdi]
       C4623900C0           vpshufb  xmm8, xmm8, xmm0
       C539DBC9             vpand    xmm9, xmm8, xmm1
       C539DBC2             vpand    xmm8, xmm8, xmm2
       C531E4CB             vpmulhuw xmm9, xmm9, xmm3
       C539D5C4             vpmullw  xmm8, xmm8, xmm4
       C44131EBC0           vpor     xmm8, xmm9, xmm8
       C539D8CD             vpsubusb xmm9, xmm8, xmm5
       C53964D6             vpcmpgtb xmm10, xmm8, xmm6
       C44131F8CA           vpsubb   xmm9, xmm9, xmm10
       C4424100C9           vpshufb  xmm9, xmm7, xmm9
       C44139FCC1           vpaddb   xmm8, xmm8, xmm9
       C5791106             vmovupd  xmmword ptr [rsi], xmm8
       4883C70C             add      rdi, 12
       4883C610             add      rsi, 16
       493BFA               cmp      rdi, r10
       72BA                 jb       SHORT G_M39806_IG09
       482BF9               sub      rdi, rcx
       492BF0               sub      rsi, r8
       8BD7                 mov      edx, edi
       4D63D1               movsxd   r10, r9d
       493BD2               cmp      rdx, r10
       0F849C010000         je       G_M39806_IG14

G_M39806_IG10:
       83C0FE               add      eax, -2
       48BAD00A00BCF47F0000 mov      rdx, 0x7FF4BC000AD0
       488B12               mov      rdx, gword ptr [rdx]
       837A0800             cmp      dword ptr [rdx+8], 0
       0F86CD010000         jbe      G_M39806_IG21
       4883C210             add      rdx, 16
       448BD7               mov      r10d, edi
       4C63D8               movsxd   r11, eax
       4D3BD3               cmp      r10, r11
       0F8D8D000000         jge      G_M39806_IG12

G_M39806_IG11:
       448BD7               mov      r10d, edi
       4C03D1               add      r10, rcx
       450FB61A             movzx    r11, byte  ptr [r10]
       41C1E310             shl      r11d, 16
       450FB67A01           movzx    r15, byte  ptr [r10+1]
       41C1E708             shl      r15d, 8
       450BDF               or       r11d, r15d
       450FB65202           movzx    r10, byte  ptr [r10+2]
       450BD3               or       r10d, r11d
       458BDA               mov      r11d, r10d
       41C1EB12             shr      r11d, 18
       458BDB               mov      r11d, r11d
       460FB61C1A           movzx    r11, byte  ptr [rdx+r11]
       458BFA               mov      r15d, r10d
       41C1EF0C             shr      r15d, 12
       4183E73F             and      r15d, 63
       458BFF               mov      r15d, r15d
       460FB63C3A           movzx    r15, byte  ptr [rdx+r15]
       458BE2               mov      r12d, r10d
       41C1EC06             shr      r12d, 6
       4183E43F             and      r12d, 63
       458BE4               mov      r12d, r12d
       460FB62422           movzx    r12, byte  ptr [rdx+r12]
       4183E23F             and      r10d, 63
       458BD2               mov      r10d, r10d
       460FB61412           movzx    r10, byte  ptr [rdx+r10]
       41C1E708             shl      r15d, 8
       450BDF               or       r11d, r15d
       41C1E410             shl      r12d, 16
       450BDC               or       r11d, r12d
       41C1E218             shl      r10d, 24
       450BD3               or       r10d, r11d
       448BDE               mov      r11d, esi
       47891418             mov      dword ptr [r8+r11], r10d
       83C604               add      esi, 4
       83C703               add      edi, 3
       3BF8                 cmp      edi, eax
       0F8273FFFFFF         jb       G_M39806_IG11

G_M39806_IG12:
       458D51FE             lea      r10d, [r9-2]
       413BC2               cmp      eax, r10d
       0F85FE000000         jne      G_M39806_IG18
       807D1000             cmp      byte  ptr [rbp+10H], 0
       0F84DA000000         je       G_M39806_IG16
       8BC7                 mov      eax, edi
       458D51FF             lea      r10d, [r9-1]
       4D63D2               movsxd   r10, r10d
       493BC2               cmp      rax, r10
       7546                 jne      SHORT G_M39806_IG13
       448BCF               mov      r9d, edi
       420FB60C09           movzx    rcx, byte  ptr [rcx+r9]
       8BC1                 mov      eax, ecx
       C1E008               shl      eax, 8
       8BC8                 mov      ecx, eax
       C1E90A               shr      ecx, 10
       8BC9                 mov      ecx, ecx
       0FB60C0A             movzx    rcx, byte  ptr [rdx+rcx]
       C1E804               shr      eax, 4
       83E03F               and      eax, 63
       8BC0                 mov      eax, eax
       0FB61402             movzx    rdx, byte  ptr [rdx+rax]
       C1E208               shl      edx, 8
       0BCA                 or       ecx, edx
       81C900003D00         or       ecx, 0x3D0000
       448BD1               mov      r10d, ecx
       4181CA0000003D       or       r10d, 0x3D000000
       8BC6                 mov      eax, esi
       45891400             mov      dword ptr [r8+rax], r10d
       83C604               add      esi, 4
       FFC7                 inc      edi
       EB6F                 jmp      SHORT G_M39806_IG14

G_M39806_IG13:
       448BD7               mov      r10d, edi
       4183C1FE             add      r9d, -2
       4963C1               movsxd   rax, r9d
       4C3BD0               cmp      r10, rax
       7560                 jne      SHORT G_M39806_IG14
       8BC7                 mov      eax, edi
       4803C1               add      rax, rcx
       0FB608               movzx    rcx, byte  ptr [rax]
       C1E110               shl      ecx, 16
       0FB64001             movzx    rax, byte  ptr [rax+1]
       C1E008               shl      eax, 8
       0BC1                 or       eax, ecx
       8BC8                 mov      ecx, eax
       C1E912               shr      ecx, 18
       8BC9                 mov      ecx, ecx
       0FB60C0A             movzx    rcx, byte  ptr [rdx+rcx]
       448BC8               mov      r9d, eax
       41C1E90C             shr      r9d, 12
       4183E13F             and      r9d, 63
       458BC9               mov      r9d, r9d
       460FB60C0A           movzx    r9, byte  ptr [rdx+r9]
       C1E806               shr      eax, 6
       83E03F               and      eax, 63
       8BC0                 mov      eax, eax
       0FB60402             movzx    rax, byte  ptr [rdx+rax]
       41C1E108             shl      r9d, 8
       410BC9               or       ecx, r9d
       C1E010               shl      eax, 16
       0BC8                 or       ecx, eax
       448BD1               mov      r10d, ecx
       4181CA0000003D       or       r10d, 0x3D000000
       8BC6                 mov      eax, esi
       45891400             mov      dword ptr [r8+rax], r10d
       83C604               add      esi, 4
       83C702               add      edi, 2

G_M39806_IG14:
       893B                 mov      dword ptr [rbx], edi
       418936               mov      dword ptr [r14], esi
       33C0                 xor      eax, eax

G_M39806_IG15:
       C5F877               vzeroupper
       488D65E0             lea      rsp, [rbp-20H]
       5B                   pop      rbx
       415C                 pop      r12
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M39806_IG16:
       893B                 mov      dword ptr [rbx], edi
       418936               mov      dword ptr [r14], esi
       B802000000           mov      eax, 2

G_M39806_IG17:
       C5F877               vzeroupper
       488D65E0             lea      rsp, [rbp-20H]
       5B                   pop      rbx
       415C                 pop      r12
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M39806_IG18:
       893B                 mov      dword ptr [rbx], edi
       418936               mov      dword ptr [r14], esi
       B801000000           mov      eax, 1

G_M39806_IG19:
       C5F877               vzeroupper
       488D65E0             lea      rsp, [rbp-20H]
       5B                   pop      rbx
       415C                 pop      r12
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M39806_IG20:
       33FF                 xor      edi, edi
       E812F0FFFF           call     ThrowHelper:ThrowArgumentOutOfRangeException(int)
       CC                   int3

G_M39806_IG21:
       E8E4A01279           call     CORINFO_HELP_RNGCHKFAIL
       CC                   int3

; Total bytes of code 1181, prolog size 42 for method Base64_1:EncodeToUtf8(struct,struct,byref,byref,bool):int
; ============================================================
