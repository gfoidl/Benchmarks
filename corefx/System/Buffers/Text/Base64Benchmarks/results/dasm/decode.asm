; Assembly listing for method Base64_PR_34529:DecodeFromUtf8(struct,struct,byref,byref,bool):int
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
;  V04 arg4         [V04,T79] (  3,  1.50)    bool  ->  [rbp+0x10]
;  V05 loc0         [V05,T31] (  9,  4.50)    long  ->  r12
;  V06 loc1         [V06    ] (  1,  0.50)   byref  ->  [rbp-0x50]   must-init pinned
;  V07 loc2         [V07,T32] (  8,  4   )    long  ->  r13
;  V08 loc3         [V08    ] (  1,  0.50)   byref  ->  [rbp-0x58]   must-init pinned
;  V09 loc4         [V09,T44] (  7,  3.50)     int  ->  [rbp-0x5C]
;  V10 loc5         [V10,T45] (  6,  3   )     int  ->  [rbp-0x60]
;  V11 loc6         [V11,T30] ( 10,  5   )     int  ->   r9
;  V12 loc7         [V12,T80] (  3,  1.50)     int  ->  [rbp-0x64]
;  V13 loc8         [V13,T00] ( 24, 36.50)    long  ->  [rbp-0x70]   ld-addr-op
;  V14 loc9         [V14,T01] ( 28, 31.50)    long  ->  [rbp-0x78]   ld-addr-op
;  V15 loc10        [V15,T33] (  8,  4   )    long  ->  [rbp-0x80]
;  V16 loc11        [V16,T24] (  6,  6.50)    long  ->  [rbp-0x88]
;  V17 loc12        [V17,T81] (  3,  1.50)     int  ->  [rbp-0x8C]
;* V18 loc13        [V18,T107] (  0,  0   )   byref  ->  zero-ref
;  V19 loc14        [V19,T96] (  2,  1   )     int  ->  rdi
;  V20 loc15        [V20,T97] (  2,  1   )     int  ->  rsi
;  V21 loc16        [V21,T61] (  4,  2   )     int  ->  rcx
;  V22 loc17        [V22,T82] (  3,  1.50)     int  ->   r8
;  V23 loc18        [V23,T12] ( 20, 10   )     int  ->  rdi
;  V24 loc19        [V24,T62] (  4,  2   )     int  ->  rsi
;  V25 loc20        [V25,T63] (  4,  2   )    long  ->  rsi
;  V26 loc21        [V26,T27] (  6,  6   )    long  ->  [rbp-0x98]
;  V27 loc22        [V27,T03] (  5, 20   )     int  ->  rcx
;  V28 loc23        [V28,T64] (  4,  2   )     int  ->  rcx
;  V29 loc24        [V29,T98] (  2,  1   )     int  ->   r8
;  V30 loc25        [V30,T65] (  4,  2   )     int  ->  rcx
;# V31 OutArgs      [V31    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V32 tmp1         [V32,T83] (  3,  1.50)     int  ->  rdi
;* V33 tmp2         [V33    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;* V34 tmp3         [V34    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V35 tmp4         [V35    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V36 tmp5         [V36    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V37 tmp6         [V37,T48] (  2,  2.50)  simd32  ->  [rbp-0xD0]   "Inline stloc first use temp"
;* V38 tmp7         [V38    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V39 tmp8         [V39,T49] (  2,  2.50)  simd32  ->  [rbp-0xF0]   "Inline stloc first use temp"
;* V40 tmp9         [V40    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V41 tmp10        [V41,T50] (  2,  2.50)  simd32  ->  [rbp-0x110]   "Inline stloc first use temp"
;  V42 tmp11        [V42,T25] (  4,  6.50)  simd32  ->  mm0         "Inline stloc first use temp"
;* V43 tmp12        [V43    ] (  0,  0   )  simd32  ->  zero-ref    "struct address for call/obj"
;  V44 tmp13        [V44,T51] (  2,  2.50)  simd32  ->  mm1         "Inline stloc first use temp"
;* V45 tmp14        [V45    ] (  0,  0   )  simd32  ->  zero-ref    "struct address for call/obj"
;  V46 tmp15        [V46,T52] (  2,  2.50)  simd32  ->  mm2         "Inline stloc first use temp"
;* V47 tmp16        [V47    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V48 tmp17        [V48,T53] (  2,  2.50)  simd32  ->  mm3         "Inline stloc first use temp"
;* V49 tmp18        [V49    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V50 tmp19        [V50,T68] (  2,  2   )  simd32  ->  mm4         "struct address for call/obj"
;  V51 tmp20        [V51,T54] (  2,  2.50)  simd32  ->  mm4         "Inline stloc first use temp"
;  V52 tmp21        [V52,T13] (  6,  9   )    long  ->  rdi         "Inline stloc first use temp"
;  V53 tmp22        [V53,T20] (  5,  7   )    long  ->  rsi         "Inline stloc first use temp"
;  V54 tmp23        [V54,T04] (  9, 18   )  simd32  ->  mm5         "Inline stloc first use temp"
;  V55 tmp24        [V55,T28] (  3,  6   )  simd32  ->  mm6         "Inline stloc first use temp"
;  V56 tmp25        [V56,T34] (  2,  4   )  simd32  ->  mm7         "Inline stloc first use temp"
;  V57 tmp26        [V57,T35] (  2,  4   )  simd32  ->  mm9         "Inline stloc first use temp"
;  V58 tmp27        [V58,T36] (  2,  4   )  simd32  ->  mm10         "Inline stloc first use temp"
;  V59 tmp28        [V59,T37] (  2,  4   )  simd32  ->  mm7         "Inline stloc first use temp"
;  V60 tmp29        [V60,T38] (  2,  4   )  simd32  ->  mm6         "Inline stloc first use temp"
;* V61 tmp30        [V61    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V62 tmp31        [V62    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V63 tmp32        [V63    ] (  0,  0   )  struct (16) zero-ref    "Inlining Arg"
;* V64 tmp33        [V64    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V65 tmp34        [V65    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V66 tmp35        [V66    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V67 tmp36        [V67    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V68 tmp37        [V68    ] (  0,  0   )  struct (16) zero-ref    "Inlining Arg"
;* V69 tmp38        [V69    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V70 tmp39        [V70    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V71 tmp40        [V71    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V72 tmp41        [V72    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V73 tmp42        [V73    ] (  0,  0   )  struct (16) zero-ref    "Inlining Arg"
;* V74 tmp43        [V74    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V75 tmp44        [V75    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;  V76 tmp45        [V76,T99] (  2,  1   )  simd32  ->  mm1         "Inline return value spill temp"
;  V77 tmp46        [V77,T100] (  2,  1   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V78 tmp47        [V78,T101] (  2,  1   )  simd32  ->  mm2         "Inline return value spill temp"
;  V79 tmp48        [V79,T102] (  2,  1   )  simd16  ->  mm2         "Inline stloc first use temp"
;* V80 tmp49        [V80    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V81 tmp50        [V81    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V82 tmp51        [V82    ] (  0,  0   )  struct (16) zero-ref    "Inlining Arg"
;* V83 tmp52        [V83    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V84 tmp53        [V84    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V85 tmp54        [V85    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V86 tmp55        [V86    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V87 tmp56        [V87    ] (  0,  0   )  struct (16) zero-ref    "Inlining Arg"
;* V88 tmp57        [V88    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V89 tmp58        [V89    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V90 tmp59        [V90    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V91 tmp60        [V91,T55] (  2,  2.50)  simd16  ->  [rbp-0x120]   "Inline stloc first use temp"
;* V92 tmp61        [V92    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V93 tmp62        [V93,T56] (  2,  2.50)  simd16  ->  [rbp-0x130]   "Inline stloc first use temp"
;* V94 tmp63        [V94    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V95 tmp64        [V95,T57] (  2,  2.50)  simd16  ->  [rbp-0x140]   "Inline stloc first use temp"
;  V96 tmp65        [V96,T26] (  4,  6.50)  simd16  ->  mm0         "Inline stloc first use temp"
;* V97 tmp66        [V97    ] (  0,  0   )  simd16  ->  zero-ref    "struct address for call/obj"
;  V98 tmp67        [V98,T58] (  2,  2.50)  simd16  ->  mm1         "Inline stloc first use temp"
;* V99 tmp68        [V99    ] (  0,  0   )  simd16  ->  zero-ref    "struct address for call/obj"
;  V100 tmp69       [V100,T59] (  2,  2.50)  simd16  ->  mm2         "Inline stloc first use temp"
;* V101 tmp70       [V101    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V102 tmp71       [V102,T60] (  2,  2.50)  simd16  ->  mm3         "Inline stloc first use temp"
;  V103 tmp72       [V103,T14] (  6,  9   )    long  ->  rax         "Inline stloc first use temp"
;  V104 tmp73       [V104,T21] (  5,  7   )    long  ->  rdx         "Inline stloc first use temp"
;  V105 tmp74       [V105,T05] (  9, 18   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V106 tmp75       [V106,T29] (  3,  6   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V107 tmp76       [V107,T39] (  2,  4   )  simd16  ->  mm6         "Inline stloc first use temp"
;  V108 tmp77       [V108,T40] (  2,  4   )  simd16  ->  mm8         "Inline stloc first use temp"
;  V109 tmp78       [V109,T41] (  2,  4   )  simd16  ->  mm9         "Inline stloc first use temp"
;  V110 tmp79       [V110,T42] (  2,  4   )  simd16  ->  mm6         "Inline stloc first use temp"
;  V111 tmp80       [V111,T43] (  2,  4   )  simd16  ->  mm5         "Inline stloc first use temp"
;* V112 tmp81       [V112    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V113 tmp82       [V113    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V114 tmp83       [V114    ] (  0,  0   )  struct (16) zero-ref    "Inlining Arg"
;* V115 tmp84       [V115    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V116 tmp85       [V116    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V117 tmp86       [V117    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V118 tmp87       [V118    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V119 tmp88       [V119    ] (  0,  0   )  struct (16) zero-ref    "Inlining Arg"
;* V120 tmp89       [V120    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V121 tmp90       [V121    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V122 tmp91       [V122    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V123 tmp92       [V123    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V124 tmp93       [V124    ] (  0,  0   )  struct (16) zero-ref    "Inlining Arg"
;* V125 tmp94       [V125    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V126 tmp95       [V126    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;  V127 tmp96       [V127,T103] (  2,  1   )  simd16  ->  mm1         "Inline return value spill temp"
;  V128 tmp97       [V128,T104] (  2,  1   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V129 tmp98       [V129,T105] (  2,  1   )  simd16  ->  mm2         "Inline return value spill temp"
;  V130 tmp99       [V130,T106] (  2,  1   )  simd16  ->  mm2         "Inline stloc first use temp"
;* V131 tmp100      [V131    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V132 tmp101      [V132    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V133 tmp102      [V133    ] (  0,  0   )  struct (16) zero-ref    "Inlining Arg"
;* V134 tmp103      [V134    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V135 tmp104      [V135    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V136 tmp105      [V136    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V137 tmp106      [V137    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V138 tmp107      [V138    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V139 tmp108      [V139    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V140 tmp109      [V140,T15] (  2,  8   )     int  ->  r10         "Inline stloc first use temp"
;  V141 tmp110      [V141,T16] (  2,  8   )     int  ->  r15         "Inline stloc first use temp"
;  V142 tmp111      [V142,T17] (  2,  8   )     int  ->  rdi         "Inline stloc first use temp"
;  V143 tmp112      [V143,T18] (  2,  8   )     int  ->   r8         "Inline stloc first use temp"
;  V144 tmp113      [V144,T07] (  2, 16   )     int  ->  rcx         "impAppendStmt"
;  V145 tmp114      [V145,T02] (  6, 24   )     int  ->  r10         "Inline stloc first use temp"
;  V146 tmp115      [V146,T06] (  4, 16   )     int  ->  rdi         "Inline stloc first use temp"
;  V147 tmp116      [V147,T19] (  2,  8   )     int  ->   r8         "Inline stloc first use temp"
;* V148 tmp117      [V148    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V149 tmp118      [V149,T08] (  2, 16   )    long  ->  r10         "NewObj constructor temp"
;* V150 tmp119      [V150    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V151 tmp120      [V151    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V152 tmp121      [V152,T09] (  2, 16   )    long  ->  r10         "NewObj constructor temp"
;* V153 tmp122      [V153    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V154 tmp123      [V154    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V155 tmp124      [V155,T10] (  2, 16   )    long  ->  rdi         "NewObj constructor temp"
;* V156 tmp125      [V156    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V157 tmp126      [V157    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V158 tmp127      [V158,T11] (  2, 16   )    long  ->   r8         "NewObj constructor temp"
;* V159 tmp128      [V159    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V160 tmp129      [V160    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V161 tmp130      [V161    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V162 tmp131      [V162,T69] (  2,  2   )    long  ->  rdi         "NewObj constructor temp"
;* V163 tmp132      [V163    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V164 tmp133      [V164    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V165 tmp134      [V165,T70] (  2,  2   )    long  ->  rsi         "NewObj constructor temp"
;* V166 tmp135      [V166    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V167 tmp136      [V167    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V168 tmp137      [V168,T71] (  2,  2   )    long  ->  rcx         "NewObj constructor temp"
;* V169 tmp138      [V169    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V170 tmp139      [V170    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V171 tmp140      [V171,T72] (  2,  2   )    long  ->   r8         "NewObj constructor temp"
;* V172 tmp141      [V172    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V173 tmp142      [V173    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V174 tmp143      [V174    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V175 tmp144      [V175,T73] (  2,  2   )    long  ->  rcx         "NewObj constructor temp"
;* V176 tmp145      [V176    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V177 tmp146      [V177,T74] (  2,  2   )     int  ->  rax         "Single return block return value"
;* V178 tmp147      [V178,T84] (  0,  0   )   byref  ->  zero-ref    V33._pointer(offs=0x00) P-INDEP "field V33._pointer (fldOffset=0x0)"
;* V179 tmp148      [V179    ] (  0,  0   )     int  ->  zero-ref    V33._length(offs=0x08) P-INDEP "field V33._length (fldOffset=0x8)"
;  V180 tmp149      [V180,T77] (  3,  1.50)   byref  ->  r12         V34._pointer(offs=0x00) P-INDEP "field V34._pointer (fldOffset=0x0)"
;* V181 tmp150      [V181    ] (  0,  0   )     int  ->  zero-ref    V34._length(offs=0x08) P-INDEP "field V34._length (fldOffset=0x8)"
;  V182 tmp151      [V182,T78] (  3,  1.50)   byref  ->  r13         V35._pointer(offs=0x00) P-INDEP "field V35._pointer (fldOffset=0x0)"
;* V183 tmp152      [V183    ] (  0,  0   )     int  ->  zero-ref    V35._length(offs=0x08) P-INDEP "field V35._length (fldOffset=0x8)"
;* V184 tmp153      [V184    ] (  0,  0   )   byref  ->  zero-ref    V36._pointer(offs=0x00) P-INDEP "field V36._pointer (fldOffset=0x0)"
;* V185 tmp154      [V185    ] (  0,  0   )     int  ->  zero-ref    V36._length(offs=0x08) P-INDEP "field V36._length (fldOffset=0x8)"
;* V186 tmp155      [V186    ] (  0,  0   )   byref  ->  zero-ref    V38._pointer(offs=0x00) P-INDEP "field V38._pointer (fldOffset=0x0)"
;* V187 tmp156      [V187    ] (  0,  0   )     int  ->  zero-ref    V38._length(offs=0x08) P-INDEP "field V38._length (fldOffset=0x8)"
;* V188 tmp157      [V188    ] (  0,  0   )   byref  ->  zero-ref    V40._pointer(offs=0x00) P-INDEP "field V40._pointer (fldOffset=0x0)"
;* V189 tmp158      [V189    ] (  0,  0   )     int  ->  zero-ref    V40._length(offs=0x08) P-INDEP "field V40._length (fldOffset=0x8)"
;* V190 tmp159      [V190    ] (  0,  0   )   byref  ->  zero-ref    V47._pointer(offs=0x00) P-INDEP "field V47._pointer (fldOffset=0x0)"
;* V191 tmp160      [V191    ] (  0,  0   )     int  ->  zero-ref    V47._length(offs=0x08) P-INDEP "field V47._length (fldOffset=0x8)"
;* V192 tmp161      [V192    ] (  0,  0   )   byref  ->  zero-ref    V49._pointer(offs=0x00) P-INDEP "field V49._pointer (fldOffset=0x0)"
;* V193 tmp162      [V193    ] (  0,  0   )     int  ->  zero-ref    V49._length(offs=0x08) P-INDEP "field V49._length (fldOffset=0x8)"
;* V194 tmp163      [V194,T108] (  0,  0   )   byref  ->  zero-ref    V61._pointer(offs=0x00) P-INDEP "field V61._pointer (fldOffset=0x0)"
;* V195 tmp164      [V195    ] (  0,  0   )     int  ->  zero-ref    V61._length(offs=0x08) P-INDEP "field V61._length (fldOffset=0x8)"
;* V196 tmp165      [V196,T85] (  0,  0   )   byref  ->  zero-ref    V62._value(offs=0x00) P-INDEP "field V62._value (fldOffset=0x0)"
;* V197 tmp166      [V197    ] (  0,  0   )   byref  ->  zero-ref    V63._pointer(offs=0x00) P-INDEP "field V63._pointer (fldOffset=0x0)"
;* V198 tmp167      [V198    ] (  0,  0   )     int  ->  zero-ref    V63._length(offs=0x08) P-INDEP "field V63._length (fldOffset=0x8)"
;* V199 tmp168      [V199    ] (  0,  0   )   byref  ->  zero-ref    V64._pointer(offs=0x00) P-INDEP "field V64._pointer (fldOffset=0x0)"
;* V200 tmp169      [V200    ] (  0,  0   )     int  ->  zero-ref    V64._length(offs=0x08) P-INDEP "field V64._length (fldOffset=0x8)"
;* V201 tmp170      [V201,T109] (  0,  0   )   byref  ->  zero-ref    V66._pointer(offs=0x00) P-INDEP "field V66._pointer (fldOffset=0x0)"
;* V202 tmp171      [V202    ] (  0,  0   )     int  ->  zero-ref    V66._length(offs=0x08) P-INDEP "field V66._length (fldOffset=0x8)"
;* V203 tmp172      [V203,T86] (  0,  0   )   byref  ->  zero-ref    V67._value(offs=0x00) P-INDEP "field V67._value (fldOffset=0x0)"
;* V204 tmp173      [V204    ] (  0,  0   )   byref  ->  zero-ref    V68._pointer(offs=0x00) P-INDEP "field V68._pointer (fldOffset=0x0)"
;* V205 tmp174      [V205    ] (  0,  0   )     int  ->  zero-ref    V68._length(offs=0x08) P-INDEP "field V68._length (fldOffset=0x8)"
;* V206 tmp175      [V206    ] (  0,  0   )   byref  ->  zero-ref    V69._pointer(offs=0x00) P-INDEP "field V69._pointer (fldOffset=0x0)"
;* V207 tmp176      [V207    ] (  0,  0   )     int  ->  zero-ref    V69._length(offs=0x08) P-INDEP "field V69._length (fldOffset=0x8)"
;* V208 tmp177      [V208,T110] (  0,  0   )   byref  ->  zero-ref    V71._pointer(offs=0x00) P-INDEP "field V71._pointer (fldOffset=0x0)"
;* V209 tmp178      [V209    ] (  0,  0   )     int  ->  zero-ref    V71._length(offs=0x08) P-INDEP "field V71._length (fldOffset=0x8)"
;* V210 tmp179      [V210,T87] (  0,  0   )   byref  ->  zero-ref    V72._value(offs=0x00) P-INDEP "field V72._value (fldOffset=0x0)"
;* V211 tmp180      [V211    ] (  0,  0   )   byref  ->  zero-ref    V73._pointer(offs=0x00) P-INDEP "field V73._pointer (fldOffset=0x0)"
;* V212 tmp181      [V212    ] (  0,  0   )     int  ->  zero-ref    V73._length(offs=0x08) P-INDEP "field V73._length (fldOffset=0x8)"
;* V213 tmp182      [V213    ] (  0,  0   )   byref  ->  zero-ref    V74._pointer(offs=0x00) P-INDEP "field V74._pointer (fldOffset=0x0)"
;* V214 tmp183      [V214    ] (  0,  0   )     int  ->  zero-ref    V74._length(offs=0x08) P-INDEP "field V74._length (fldOffset=0x8)"
;* V215 tmp184      [V215,T111] (  0,  0   )   byref  ->  zero-ref    V80._pointer(offs=0x00) P-INDEP "field V80._pointer (fldOffset=0x0)"
;* V216 tmp185      [V216    ] (  0,  0   )     int  ->  zero-ref    V80._length(offs=0x08) P-INDEP "field V80._length (fldOffset=0x8)"
;* V217 tmp186      [V217,T88] (  0,  0   )   byref  ->  zero-ref    V81._value(offs=0x00) P-INDEP "field V81._value (fldOffset=0x0)"
;* V218 tmp187      [V218    ] (  0,  0   )   byref  ->  zero-ref    V82._pointer(offs=0x00) P-INDEP "field V82._pointer (fldOffset=0x0)"
;* V219 tmp188      [V219    ] (  0,  0   )     int  ->  zero-ref    V82._length(offs=0x08) P-INDEP "field V82._length (fldOffset=0x8)"
;* V220 tmp189      [V220    ] (  0,  0   )   byref  ->  zero-ref    V83._pointer(offs=0x00) P-INDEP "field V83._pointer (fldOffset=0x0)"
;* V221 tmp190      [V221    ] (  0,  0   )     int  ->  zero-ref    V83._length(offs=0x08) P-INDEP "field V83._length (fldOffset=0x8)"
;* V222 tmp191      [V222,T112] (  0,  0   )   byref  ->  zero-ref    V85._pointer(offs=0x00) P-INDEP "field V85._pointer (fldOffset=0x0)"
;* V223 tmp192      [V223    ] (  0,  0   )     int  ->  zero-ref    V85._length(offs=0x08) P-INDEP "field V85._length (fldOffset=0x8)"
;* V224 tmp193      [V224,T89] (  0,  0   )   byref  ->  zero-ref    V86._value(offs=0x00) P-INDEP "field V86._value (fldOffset=0x0)"
;* V225 tmp194      [V225    ] (  0,  0   )   byref  ->  zero-ref    V87._pointer(offs=0x00) P-INDEP "field V87._pointer (fldOffset=0x0)"
;* V226 tmp195      [V226    ] (  0,  0   )     int  ->  zero-ref    V87._length(offs=0x08) P-INDEP "field V87._length (fldOffset=0x8)"
;* V227 tmp196      [V227    ] (  0,  0   )   byref  ->  zero-ref    V88._pointer(offs=0x00) P-INDEP "field V88._pointer (fldOffset=0x0)"
;* V228 tmp197      [V228    ] (  0,  0   )     int  ->  zero-ref    V88._length(offs=0x08) P-INDEP "field V88._length (fldOffset=0x8)"
;* V229 tmp198      [V229    ] (  0,  0   )   byref  ->  zero-ref    V90._pointer(offs=0x00) P-INDEP "field V90._pointer (fldOffset=0x0)"
;* V230 tmp199      [V230    ] (  0,  0   )     int  ->  zero-ref    V90._length(offs=0x08) P-INDEP "field V90._length (fldOffset=0x8)"
;* V231 tmp200      [V231    ] (  0,  0   )   byref  ->  zero-ref    V92._pointer(offs=0x00) P-INDEP "field V92._pointer (fldOffset=0x0)"
;* V232 tmp201      [V232    ] (  0,  0   )     int  ->  zero-ref    V92._length(offs=0x08) P-INDEP "field V92._length (fldOffset=0x8)"
;* V233 tmp202      [V233    ] (  0,  0   )   byref  ->  zero-ref    V94._pointer(offs=0x00) P-INDEP "field V94._pointer (fldOffset=0x0)"
;* V234 tmp203      [V234    ] (  0,  0   )     int  ->  zero-ref    V94._length(offs=0x08) P-INDEP "field V94._length (fldOffset=0x8)"
;* V235 tmp204      [V235    ] (  0,  0   )   byref  ->  zero-ref    V101._pointer(offs=0x00) P-INDEP "field V101._pointer (fldOffset=0x0)"
;* V236 tmp205      [V236    ] (  0,  0   )     int  ->  zero-ref    V101._length(offs=0x08) P-INDEP "field V101._length (fldOffset=0x8)"
;* V237 tmp206      [V237,T113] (  0,  0   )   byref  ->  zero-ref    V112._pointer(offs=0x00) P-INDEP "field V112._pointer (fldOffset=0x0)"
;* V238 tmp207      [V238    ] (  0,  0   )     int  ->  zero-ref    V112._length(offs=0x08) P-INDEP "field V112._length (fldOffset=0x8)"
;* V239 tmp208      [V239,T90] (  0,  0   )   byref  ->  zero-ref    V113._value(offs=0x00) P-INDEP "field V113._value (fldOffset=0x0)"
;* V240 tmp209      [V240    ] (  0,  0   )   byref  ->  zero-ref    V114._pointer(offs=0x00) P-INDEP "field V114._pointer (fldOffset=0x0)"
;* V241 tmp210      [V241    ] (  0,  0   )     int  ->  zero-ref    V114._length(offs=0x08) P-INDEP "field V114._length (fldOffset=0x8)"
;* V242 tmp211      [V242    ] (  0,  0   )   byref  ->  zero-ref    V115._pointer(offs=0x00) P-INDEP "field V115._pointer (fldOffset=0x0)"
;* V243 tmp212      [V243    ] (  0,  0   )     int  ->  zero-ref    V115._length(offs=0x08) P-INDEP "field V115._length (fldOffset=0x8)"
;* V244 tmp213      [V244,T114] (  0,  0   )   byref  ->  zero-ref    V117._pointer(offs=0x00) P-INDEP "field V117._pointer (fldOffset=0x0)"
;* V245 tmp214      [V245    ] (  0,  0   )     int  ->  zero-ref    V117._length(offs=0x08) P-INDEP "field V117._length (fldOffset=0x8)"
;* V246 tmp215      [V246,T91] (  0,  0   )   byref  ->  zero-ref    V118._value(offs=0x00) P-INDEP "field V118._value (fldOffset=0x0)"
;* V247 tmp216      [V247    ] (  0,  0   )   byref  ->  zero-ref    V119._pointer(offs=0x00) P-INDEP "field V119._pointer (fldOffset=0x0)"
;* V248 tmp217      [V248    ] (  0,  0   )     int  ->  zero-ref    V119._length(offs=0x08) P-INDEP "field V119._length (fldOffset=0x8)"
;* V249 tmp218      [V249    ] (  0,  0   )   byref  ->  zero-ref    V120._pointer(offs=0x00) P-INDEP "field V120._pointer (fldOffset=0x0)"
;* V250 tmp219      [V250    ] (  0,  0   )     int  ->  zero-ref    V120._length(offs=0x08) P-INDEP "field V120._length (fldOffset=0x8)"
;* V251 tmp220      [V251,T115] (  0,  0   )   byref  ->  zero-ref    V122._pointer(offs=0x00) P-INDEP "field V122._pointer (fldOffset=0x0)"
;* V252 tmp221      [V252    ] (  0,  0   )     int  ->  zero-ref    V122._length(offs=0x08) P-INDEP "field V122._length (fldOffset=0x8)"
;* V253 tmp222      [V253,T92] (  0,  0   )   byref  ->  zero-ref    V123._value(offs=0x00) P-INDEP "field V123._value (fldOffset=0x0)"
;* V254 tmp223      [V254    ] (  0,  0   )   byref  ->  zero-ref    V124._pointer(offs=0x00) P-INDEP "field V124._pointer (fldOffset=0x0)"
;* V255 tmp224      [V255    ] (  0,  0   )     int  ->  zero-ref    V124._length(offs=0x08) P-INDEP "field V124._length (fldOffset=0x8)"
;* V256 tmp225      [V256    ] (  0,  0   )   byref  ->  zero-ref    V125._pointer(offs=0x00) P-INDEP "field V125._pointer (fldOffset=0x0)"
;* V257 tmp226      [V257    ] (  0,  0   )     int  ->  zero-ref    V125._length(offs=0x08) P-INDEP "field V125._length (fldOffset=0x8)"
;* V258 tmp227      [V258,T116] (  0,  0   )   byref  ->  zero-ref    V131._pointer(offs=0x00) P-INDEP "field V131._pointer (fldOffset=0x0)"
;* V259 tmp228      [V259    ] (  0,  0   )     int  ->  zero-ref    V131._length(offs=0x08) P-INDEP "field V131._length (fldOffset=0x8)"
;* V260 tmp229      [V260,T93] (  0,  0   )   byref  ->  zero-ref    V132._value(offs=0x00) P-INDEP "field V132._value (fldOffset=0x0)"
;* V261 tmp230      [V261    ] (  0,  0   )   byref  ->  zero-ref    V133._pointer(offs=0x00) P-INDEP "field V133._pointer (fldOffset=0x0)"
;* V262 tmp231      [V262    ] (  0,  0   )     int  ->  zero-ref    V133._length(offs=0x08) P-INDEP "field V133._length (fldOffset=0x8)"
;* V263 tmp232      [V263    ] (  0,  0   )   byref  ->  zero-ref    V134._pointer(offs=0x00) P-INDEP "field V134._pointer (fldOffset=0x0)"
;* V264 tmp233      [V264    ] (  0,  0   )     int  ->  zero-ref    V134._length(offs=0x08) P-INDEP "field V134._length (fldOffset=0x8)"
;* V265 tmp234      [V265,T94] (  0,  0   )   byref  ->  zero-ref    V136._pointer(offs=0x00) P-INDEP "field V136._pointer (fldOffset=0x0)"
;* V266 tmp235      [V266    ] (  0,  0   )     int  ->  zero-ref    V136._length(offs=0x08) P-INDEP "field V136._length (fldOffset=0x8)"
;* V267 tmp236      [V267,T95] (  0,  0   )   byref  ->  zero-ref    V137._value(offs=0x00) P-INDEP "field V137._value (fldOffset=0x0)"
;* V268 tmp237      [V268,T117] (  0,  0   )   byref  ->  zero-ref    V138._pointer(offs=0x00) P-INDEP "field V138._pointer (fldOffset=0x0)"
;* V269 tmp238      [V269    ] (  0,  0   )     int  ->  zero-ref    V138._length(offs=0x08) P-INDEP "field V138._length (fldOffset=0x8)"
;  V270 tmp239      [V270,T66] (  2,  2   )   byref  ->  rax         "BlockOp address local"
;  V271 tmp240      [V271,T75] (  2,  2   )    long  ->  r12         "Cast away GC"
;  V272 tmp241      [V272,T67] (  2,  2   )   byref  ->  rax         "BlockOp address local"
;  V273 tmp242      [V273,T76] (  2,  2   )    long  ->  r13         "Cast away GC"
;  V274 rat0        [V274,T46] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;  V275 rat1        [V275,T47] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;
; Lcl frame size = 280

G_M55122_IG01:
       55                   push     rbp
       4157                 push     r15
       4156                 push     r14
       4155                 push     r13
       4154                 push     r12
       53                   push     rbx
       4881EC18010000       sub      rsp, 280
       C5F877               vzeroupper
       488DAC2440010000     lea      rbp, [rsp+140H]
       33C0                 xor      rax, rax
       488945B0             mov      qword ptr [rbp-50H], rax
       488945A8             mov      qword ptr [rbp-58H], rax
       48897DC8             mov      bword ptr [rbp-38H], rdi
       488975D0             mov      qword ptr [rbp-30H], rsi
       488955B8             mov      bword ptr [rbp-48H], rdx
       48894DC0             mov      qword ptr [rbp-40H], rcx
       498BD8               mov      rbx, r8
       4D8BF1               mov      r14, r9
       448B7D10             mov      r15d, dword ptr [rbp+10H]

G_M55122_IG02:
       837DD000             cmp      dword ptr [rbp-30H], 0
       770C                 ja       SHORT G_M55122_IG03
       33C0                 xor      eax, eax
       8903                 mov      dword ptr [rbx], eax
       418906               mov      dword ptr [r14], eax
       E925060000           jmp      G_M55122_IG25

G_M55122_IG03:
       488D45C8             lea      rax, bword ptr [rbp-38H]
       4C8B20               mov      r12, bword ptr [rax]
       4C8965B0             mov      bword ptr [rbp-50H], r12
       488D45B8             lea      rax, bword ptr [rbp-48H]
       4C8B28               mov      r13, bword ptr [rax]
       4C896DA8             mov      bword ptr [rbp-58H], r13
       8B4DD0               mov      ecx, dword ptr [rbp-30H]
       83E1FC               and      ecx, -4
       448B45C0             mov      r8d, dword ptr [rbp-40H]
       448BC9               mov      r9d, ecx
       4585C9               test     r9d, r9d
       0F8C94060000         jl       G_M55122_IG33

G_M55122_IG04:
       418BC1               mov      eax, r9d
       C1F802               sar      eax, 2
       448D1440             lea      r10d, [rax+2*rax]
       4489559C             mov      dword ptr [rbp-64H], r10d
       418D42FE             lea      eax, [r10-2]
       443BC0               cmp      r8d, eax
       7D20                 jge      SHORT G_M55122_IG05
       BA56555555           mov      edx, 0x55555556
       448945A0             mov      dword ptr [rbp-60H], r8d
       8BC2                 mov      eax, edx
       41F7E8               imul     edx:eax, r8d
       448BCA               mov      r9d, edx
       41C1E91F             shr      r9d, 31
       4403CA               add      r9d, edx
       41C1E102             shl      r9d, 2
       448B45A0             mov      r8d, dword ptr [rbp-60H]

G_M55122_IG05:
       498BC4               mov      rax, r12
       498BD5               mov      rdx, r13
       894DA4               mov      dword ptr [rbp-5CH], ecx
       448BD9               mov      r11d, ecx
       4C03D8               add      r11, rax
       4C895D80             mov      qword ptr [rbp-80H], r11
       418BF1               mov      esi, r9d
       4803F0               add      rsi, rax
       4183F918             cmp      r9d, 24
       0F8C4F030000         jl       G_M55122_IG11
       4889B578FFFFFF       mov      qword ptr [rbp-88H], rsi
       4C8D4ED3             lea      r9, [rsi-45]
       4C898D68FFFFFF       mov      qword ptr [rbp-98H], r9
       4D3BCC               cmp      r9, r12
       0F828C010000         jb       G_M55122_IG08
       448945A0             mov      dword ptr [rbp-60H], r8d
       48BF87CB962EA77F0000 mov      rdi, 0x7FA72E96CB87
       C5FD1007             vmovupd  ymm0, ymmword ptr[rdi]
       C5FD118530FFFFFF     vmovupd  ymmword ptr[rbp-D0H], ymm0
       48BFC7C9962EA77F0000 mov      rdi, 0x7FA72E96C9C7
       C5FD100F             vmovupd  ymm1, ymmword ptr[rdi]
       C5FD118D10FFFFFF     vmovupd  ymmword ptr[rbp-F0H], ymm1
       48BFE7C9962EA77F0000 mov      rdi, 0x7FA72E96C9E7
       C5FD1017             vmovupd  ymm2, ymmword ptr[rdi]
       C5FD1195F0FEFFFF     vmovupd  ymmword ptr[rbp-110H], ymm2
       48BFB00E1BB4A67F0000 mov      rdi, 0x7FA6B41B0EB0
       BE07000000           mov      esi, 7
       E81327BF78           call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       48BF280B009CA67F0000 mov      rdi, 0x7FA69C000B28
       488B3F               mov      rdi, gword ptr [rdi]
       C5FD104708           vmovupd  ymm0, ymmword ptr[rdi+8]
       BF40014001           mov      edi, 0x1400140
       C5F96ECF             vmovd    xmm1, edi
       C4E27D58C9           vpbroadcastd ymm1, ymm1
       BF00100100           mov      edi, 0x11000
       C5F96ED7             vmovd    xmm2, edi
       C4E27D58D2           vpbroadcastd ymm2, ymm2
       48BF07CC962EA77F0000 mov      rdi, 0x7FA72E96CC07
       C5FD101F             vmovupd  ymm3, ymmword ptr[rdi]
       48BF47CC962EA77F0000 mov      rdi, 0x7FA72E96CC47
       C5FD1027             vmovupd  ymm4, ymmword ptr[rdi]
       498BFC               mov      rdi, r12
       498BF5               mov      rsi, r13

G_M55122_IG06:
       C5FE6F2F             vmovdqu  ymm5, ymmword ptr[rdi]
       C5CD72D504           vpsrld   ymm6, ymm5, 4
       C5CDDBF0             vpand    ymm6, ymm6, ymm0
       C5D5DBF8             vpand    ymm7, ymm5, ymm0
       C57D108530FFFFFF     vmovupd  ymm8, ymmword ptr[rbp-D0H]
       C4623D00CE           vpshufb  ymm9, ymm8, ymm6
       C4412C57D2           vxorps   ymm10, ymm10, ymm10
       C57D109D10FFFFFF     vmovupd  ymm11, ymmword ptr[rbp-F0H]
       C4E22500FF           vpshufb  ymm7, ymm11, ymm7
       C4C145DBF9           vpand    ymm7, ymm7, ymm9
       C4C14564FA           vpcmpgtb ymm7, ymm7, ymm10
       C5FDD7C7             vpmovmskb eax, ymm7
       85C0                 test     eax, eax
       7577                 jne      SHORT G_M55122_IG07
       C5D574F8             vpcmpeqb ymm7, ymm5, ymm0
       C5C5FCF6             vpaddb   ymm6, ymm7, ymm6
       C5FD10BDF0FEFFFF     vmovupd  ymm7, ymmword ptr[rbp-110H]
       C4E24500F6           vpshufb  ymm6, ymm7, ymm6
       C5D5FCEE             vpaddb   ymm5, ymm5, ymm6
       C4E25504E9           vpmaddubsw ymm5, ymm5, ymm1
       C5D5F5EA             vpmaddwd ymm5, ymm5, ymm2
       C4E25500EB           vpshufb  ymm5, ymm5, ymm3
       C4E25D36ED           vpermd   ymm5, ymm4, ymm5
       C5FE7F2E             vmovdqu  ymmword ptr[rsi], ymm5
       4883C720             add      rdi, 32
       4883C618             add      rsi, 24
       488B8568FFFFFF       mov      rax, qword ptr [rbp-98H]
       483BF8               cmp      rdi, rax
       48898568FFFFFF       mov      qword ptr [rbp-98H], rax
       C57D118530FFFFFF     vmovupd  ymmword ptr[rbp-D0H], ymm8
       C57D119D10FFFFFF     vmovupd  ymmword ptr[rbp-F0H], ymm11
       C5FD11BDF0FEFFFF     vmovupd  ymmword ptr[rbp-110H], ymm7
       0F8657FFFFFF         jbe      G_M55122_IG06

G_M55122_IG07:
       488BD7               mov      rdx, rdi
       48897588             mov      qword ptr [rbp-78H], rsi
       483B5580             cmp      rdx, qword ptr [rbp-80H]
       448B45A0             mov      r8d, dword ptr [rbp-60H]
       0F84EA030000         je       G_M55122_IG24
       488BC2               mov      rax, rdx
       488B5588             mov      rdx, qword ptr [rbp-78H]

G_M55122_IG08:
       488BB578FFFFFF       mov      rsi, qword ptr [rbp-88H]
       4883C6E8             add      rsi, -24
       4C8BCE               mov      r9, rsi
       4C898D68FFFFFF       mov      qword ptr [rbp-98H], r9
       48894590             mov      qword ptr [rbp-70H], rax
       4C3BC8               cmp      r9, rax
       0F829C010000         jb       G_M55122_IG13
       48895588             mov      qword ptr [rbp-78H], rdx
       448945A0             mov      dword ptr [rbp-60H], r8d
       48BF67CB962EA77F0000 mov      rdi, 0x7FA72E96CB67
       C5F91007             vmovupd  xmm0, xmmword ptr [rdi]
       C5F92985E0FEFFFF     vmovapd  xmmword ptr [rbp-120H], xmm0
       48BFD7CB962EA77F0000 mov      rdi, 0x7FA72E96CBD7
       C5F9100F             vmovupd  xmm1, xmmword ptr [rdi]
       C5F9298DD0FEFFFF     vmovapd  xmmword ptr [rbp-130H], xmm1
       48BFA7CB962EA77F0000 mov      rdi, 0x7FA72E96CBA7
       C5F91017             vmovupd  xmm2, xmmword ptr [rdi]
       C5F92995C0FEFFFF     vmovapd  xmmword ptr [rbp-140H], xmm2
       48BFB00E1BB4A67F0000 mov      rdi, 0x7FA6B41B0EB0
       BE07000000           mov      esi, 7
       E87E25BF78           call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       48B8200B009CA67F0000 mov      rax, 0x7FA69C000B20
       488B00               mov      rax, gword ptr [rax]
       C5F9104008           vmovupd  xmm0, xmmword ptr [rax+8]
       B840014001           mov      eax, 0x1400140
       C5F96EC8             vmovd    xmm1, eax
       C4E27958C9           vpbroadcastd xmm1, xmm1
       B800100100           mov      eax, 0x11000
       C5F96ED0             vmovd    xmm2, eax
       C4E27958D2           vpbroadcastd xmm2, xmm2
       48B8F7CB962EA77F0000 mov      rax, 0x7FA72E96CBF7
       C5F91018             vmovupd  xmm3, xmmword ptr [rax]
       488B4590             mov      rax, qword ptr [rbp-70H]
       488B5588             mov      rdx, qword ptr [rbp-78H]

G_M55122_IG09:
       C5FA6F20             vmovdqu  xmm4, xmmword ptr [rax]
       C5D172D404           vpsrld   xmm5, xmm4, 4
       C5D1DBE8             vpand    xmm5, xmm5, xmm0
       C5D9DBF0             vpand    xmm6, xmm4, xmm0
       C5F928BDE0FEFFFF     vmovapd  xmm7, xmmword ptr [rbp-120H]
       C4624100C5           vpshufb  xmm8, xmm7, xmm5
       C4413057C9           vxorps   xmm9, xmm9, xmm9
       C5792895D0FEFFFF     vmovapd  xmm10, xmmword ptr [rbp-130H]
       C4E22900F6           vpshufb  xmm6, xmm10, xmm6
       C4C149DBF0           vpand    xmm6, xmm6, xmm8
       C4C14964F1           vpcmpgtb xmm6, xmm6, xmm9
       C5F9D7FE             vpmovmskb edi, xmm6
       85FF                 test     edi, edi
       7572                 jne      SHORT G_M55122_IG10
       C5D974F0             vpcmpeqb xmm6, xmm4, xmm0
       C5C9FCED             vpaddb   xmm5, xmm6, xmm5
       C5F928B5C0FEFFFF     vmovapd  xmm6, xmmword ptr [rbp-140H]
       C4E24900ED           vpshufb  xmm5, xmm6, xmm5
       C5D9FCE5             vpaddb   xmm4, xmm4, xmm5
       C4E25904E1           vpmaddubsw xmm4, xmm4, xmm1
       C5D9F5E2             vpmaddwd xmm4, xmm4, xmm2
       C4E25900E3           vpshufb  xmm4, xmm4, xmm3
       C5FA7F22             vmovdqu  xmmword ptr [rdx], xmm4
       4883C010             add      rax, 16
       4883C20C             add      rdx, 12
       488BBD68FFFFFF       mov      rdi, qword ptr [rbp-98H]
       483BC7               cmp      rax, rdi
       4889BD68FFFFFF       mov      qword ptr [rbp-98H], rdi
       C5F929BDE0FEFFFF     vmovapd  xmmword ptr [rbp-120H], xmm7
       C5792995D0FEFFFF     vmovapd  xmmword ptr [rbp-130H], xmm10
       C5F929B5C0FEFFFF     vmovapd  xmmword ptr [rbp-140H], xmm6
       0F865CFFFFFF         jbe      G_M55122_IG09

G_M55122_IG10:
       488BF8               mov      rdi, rax
       48895588             mov      qword ptr [rbp-78H], rdx
       48897D90             mov      qword ptr [rbp-70H], rdi
       4C8B5D80             mov      r11, qword ptr [rbp-80H]
       493BFB               cmp      rdi, r11
       4C895D80             mov      qword ptr [rbp-80H], r11
       448B45A0             mov      r8d, dword ptr [rbp-60H]
       7415                 je       SHORT G_M55122_IG12
       488B4590             mov      rax, qword ptr [rbp-70H]
       488B5588             mov      rdx, qword ptr [rbp-78H]

G_M55122_IG11:
       44897D10             mov      dword ptr [rbp+10H], r15d
       4584FF               test     r15b, r15b
       7513                 jne      SHORT G_M55122_IG14
       33FF                 xor      edi, edi
       EB14                 jmp      SHORT G_M55122_IG15

G_M55122_IG12:
       488B5590             mov      rdx, qword ptr [rbp-70H]
       E925020000           jmp      G_M55122_IG24

G_M55122_IG13:
       488B4590             mov      rax, qword ptr [rbp-70H]
       EBE4                 jmp      SHORT G_M55122_IG11

G_M55122_IG14:
       BF04000000           mov      edi, 4

G_M55122_IG15:
       448B559C             mov      r10d, dword ptr [rbp-64H]
       453BC2               cmp      r8d, r10d
       7C11                 jl       SHORT G_M55122_IG16
       8B4DA4               mov      ecx, dword ptr [rbp-5CH]
       89BD74FFFFFF         mov      dword ptr [rbp-8CH], edi
       448BC9               mov      r9d, ecx
       442BCF               sub      r9d, edi
       EB38                 jmp      SHORT G_M55122_IG17

G_M55122_IG16:
       48894590             mov      qword ptr [rbp-70H], rax
       48895588             mov      qword ptr [rbp-78H], rdx
       41B956555555         mov      r9d, 0x55555556
       448945A0             mov      dword ptr [rbp-60H], r8d
       418BC1               mov      eax, r9d
       41F7E8               imul     edx:eax, r8d
       448BCA               mov      r9d, edx
       41C1E91F             shr      r9d, 31
       4403CA               add      r9d, edx
       41C1E102             shl      r9d, 2
       89BD74FFFFFF         mov      dword ptr [rbp-8CH], edi
       488B4590             mov      rax, qword ptr [rbp-70H]
       488B5588             mov      rdx, qword ptr [rbp-78H]
       448B45A0             mov      r8d, dword ptr [rbp-60H]

G_M55122_IG17:
       418BF1               mov      esi, r9d
       4903F4               add      rsi, r12
       483BC6               cmp      rax, rsi
       448945A0             mov      dword ptr [rbp-60H], r8d
       0F8386000000         jae      G_M55122_IG19

G_M55122_IG18:
       440FB610             movzx    r10, byte  ptr [rax]
       440FB67801           movzx    r15, byte  ptr [rax+1]
       400FB67802           movzx    rdi, byte  ptr [rax+2]
       440FB64003           movzx    r8, byte  ptr [rax+3]
       458BD2               mov      r10d, r10d
       48B947CA962EA77F0000 mov      rcx, 0x7FA72E96CA47
       490FBE0C0A           movsx    rcx, byte  ptr [r10+rcx]
       458BD7               mov      r10d, r15d
       49BF47CA962EA77F0000 mov      r15, 0x7FA72E96CA47
       4F0FBE143A           movsx    r10, byte  ptr [r10+r15]
       8BFF                 mov      edi, edi
       4A0FBE3C3F           movsx    rdi, byte  ptr [rdi+r15]
       458BC0               mov      r8d, r8d
       4F0FBE0438           movsx    r8, byte  ptr [r8+r15]
       41C1E20C             shl      r10d, 12
       C1E706               shl      edi, 6
       440BD7               or       r10d, edi
       C1E112               shl      ecx, 18
       410BC8               or       ecx, r8d
       410BCA               or       ecx, r10d
       85C9                 test     ecx, ecx
       0F8CDF010000         jl       G_M55122_IG31
       8BF9                 mov      edi, ecx
       C1FF10               sar      edi, 16
       40883A               mov      byte  ptr [rdx], dil
       8BF9                 mov      edi, ecx
       C1FF08               sar      edi, 8
       40887A01             mov      byte  ptr [rdx+1], dil
       884A02               mov      byte  ptr [rdx+2], cl
       4883C004             add      rax, 4
       4883C203             add      rdx, 3
       483BC6               cmp      rax, rsi
       0F827AFFFFFF         jb       G_M55122_IG18

G_M55122_IG19:
       448B7DA4             mov      r15d, dword ptr [rbp-5CH]
       418BFF               mov      edi, r15d
       2BBD74FFFFFF         sub      edi, dword ptr [rbp-8CH]
       413BF9               cmp      edi, r9d
       0F8542010000         jne      G_M55122_IG27
       4C8B5D80             mov      r11, qword ptr [rbp-80H]
       493BC3               cmp      rax, r11
       750F                 jne      SHORT G_M55122_IG20
       807D1000             cmp      byte  ptr [rbp+10H], 0
       0F846C010000         je       G_M55122_IG29
       E98C010000           jmp      G_M55122_IG31

G_M55122_IG20:
       410FB67BFC           movzx    rdi, byte  ptr [r11-4]
       410FB673FD           movzx    rsi, byte  ptr [r11-3]
       410FB64BFE           movzx    rcx, byte  ptr [r11-2]
       450FB643FF           movzx    r8, byte  ptr [r11-1]
       8BFF                 mov      edi, edi
       49B947CA962EA77F0000 mov      r9, 0x7FA72E96CA47
       4A0FBE3C0F           movsx    rdi, byte  ptr [rdi+r9]
       8BF6                 mov      esi, esi
       4A0FBE340E           movsx    rsi, byte  ptr [rsi+r9]
       C1E712               shl      edi, 18
       C1E60C               shl      esi, 12
       0BFE                 or       edi, esi
       8B75A0               mov      esi, dword ptr [rbp-60H]
       4903F5               add      rsi, r13
       4183F83D             cmp      r8d, 61
       7451                 je       SHORT G_M55122_IG21
       8BC9                 mov      ecx, ecx
       49B947CA962EA77F0000 mov      r9, 0x7FA72E96CA47
       4A0FBE0C09           movsx    rcx, byte  ptr [rcx+r9]
       458BC0               mov      r8d, r8d
       4F0FBE0408           movsx    r8, byte  ptr [r8+r9]
       C1E106               shl      ecx, 6
       410BF8               or       edi, r8d
       0BF9                 or       edi, ecx
       85FF                 test     edi, edi
       0F8C23010000         jl       G_M55122_IG31
       488D4A03             lea      rcx, [rdx+3]
       483BCE               cmp      rcx, rsi
       0F87B4000000         ja       G_M55122_IG27
       8BF7                 mov      esi, edi
       C1FE10               sar      esi, 16
       408832               mov      byte  ptr [rdx], sil
       8BF7                 mov      esi, edi
       C1FE08               sar      esi, 8
       40887201             mov      byte  ptr [rdx+1], sil
       40887A02             mov      byte  ptr [rdx+2], dil
       4883C203             add      rdx, 3
       EB5B                 jmp      SHORT G_M55122_IG23

G_M55122_IG21:
       83F93D               cmp      ecx, 61
       743C                 je       SHORT G_M55122_IG22
       8BC9                 mov      ecx, ecx
       49B847CA962EA77F0000 mov      r8, 0x7FA72E96CA47
       4A0FBE0C01           movsx    rcx, byte  ptr [rcx+r8]
       C1E106               shl      ecx, 6
       0BF9                 or       edi, ecx
       85FF                 test     edi, edi
       0F8CD8000000         jl       G_M55122_IG31
       488D4A02             lea      rcx, [rdx+2]
       483BCE               cmp      rcx, rsi
       776D                 ja       SHORT G_M55122_IG27
       8BF7                 mov      esi, edi
       C1FE10               sar      esi, 16
       408832               mov      byte  ptr [rdx], sil
       C1FF08               sar      edi, 8
       40887A01             mov      byte  ptr [rdx+1], dil
       4883C202             add      rdx, 2
       EB1A                 jmp      SHORT G_M55122_IG23

G_M55122_IG22:
       85FF                 test     edi, edi
       0F8CB2000000         jl       G_M55122_IG31
       488D4A01             lea      rcx, [rdx+1]
       483BCE               cmp      rcx, rsi
       7747                 ja       SHORT G_M55122_IG27
       C1FF10               sar      edi, 16
       40883A               mov      byte  ptr [rdx], dil
       48FFC2               inc      rdx

G_M55122_IG23:
       4883C004             add      rax, 4
       443B7DD0             cmp      r15d, dword ptr [rbp-30H]
       0F8592000000         jne      G_M55122_IG31
       48895588             mov      qword ptr [rbp-78H], rdx
       488BD0               mov      rdx, rax

G_M55122_IG24:
       488BC2               mov      rax, rdx
       492BC4               sub      rax, r12
       8903                 mov      dword ptr [rbx], eax
       488B4D88             mov      rcx, qword ptr [rbp-78H]
       488BC1               mov      rax, rcx
       492BC5               sub      rax, r13
       418906               mov      dword ptr [r14], eax

G_M55122_IG25:
       33C0                 xor      eax, eax

G_M55122_IG26:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M55122_IG27:
       443B7DD0             cmp      r15d, dword ptr [rbp-30H]
       400F95C7             setne    dil
       400FB6FF             movzx    rdi, dil
       448B7D10             mov      r15d, dword ptr [rbp+10H]
       410FB6F7             movzx    rsi, r15b
       85FE                 test     edi, esi
       754A                 jne      SHORT G_M55122_IG31
       492BC4               sub      rax, r12
       8903                 mov      dword ptr [rbx], eax
       488BC2               mov      rax, rdx
       492BC5               sub      rax, r13
       418906               mov      dword ptr [r14], eax
       B801000000           mov      eax, 1

G_M55122_IG28:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M55122_IG29:
       492BC4               sub      rax, r12
       8903                 mov      dword ptr [rbx], eax
       488BC2               mov      rax, rdx
       492BC5               sub      rax, r13
       418906               mov      dword ptr [r14], eax
       B802000000           mov      eax, 2

G_M55122_IG30:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M55122_IG31:
       492BC4               sub      rax, r12
       8903                 mov      dword ptr [rbx], eax
       488BC2               mov      rax, rdx
       492BC5               sub      rax, r13
       418906               mov      dword ptr [r14], eax
       B803000000           mov      eax, 3

G_M55122_IG32:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M55122_IG33:
       33FF                 xor      edi, edi
       E828DCFFFF           call     ThrowHelper:ThrowArgumentOutOfRangeException(int)
       CC                   int3

; Total bytes of code 1761, prolog size 64 for method Base64_PR_34529:DecodeFromUtf8(struct,struct,byref,byref,bool):int
; ============================================================
