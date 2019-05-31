; Assembly listing for method Base64_PR_34529:EncodeToUtf8(struct,struct,byref,byref,bool):int
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00    ] (  5,  4   )  struct (16) [rbp-0x30]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V01 arg1         [V01    ] (  4,  3   )  struct (16) [rbp-0x40]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V02 arg2         [V02,T22] (  6,  4   )   byref  ->   r8
;  V03 arg3         [V03,T23] (  6,  4   )   byref  ->   r9
;  V04 arg4         [V04,T116] (  1,  0.50)    bool  ->  [rbp+0x10]
;  V05 loc0         [V05,T25] (  8,  4   )    long  ->  rdi
;  V06 loc1         [V06    ] (  1,  0.50)   byref  ->  [rbp-0x48]   must-init pinned
;  V07 loc2         [V07,T34] (  6,  3   )    long  ->  rsi
;  V08 loc3         [V08    ] (  1,  0.50)   byref  ->  [rbp-0x50]   must-init pinned
;  V09 loc4         [V09,T35] (  6,  3   )     int  ->  rcx
;  V10 loc5         [V10,T71] (  3,  1.50)     int  ->  r10
;  V11 loc6         [V11,T54] (  4,  2   )     int  ->  rax
;  V12 loc7         [V12,T00] ( 28, 35   )    long  ->  registers   ld-addr-op
;  V13 loc8         [V13,T04] ( 16, 18.50)    long  ->  r10         ld-addr-op
;  V14 loc9         [V14,T36] (  6,  3   )    long  ->  rcx
;  V15 loc10        [V15,T19] (  8,  7.50)    long  ->  r11
;* V16 loc11        [V16,T109] (  0,  0   )   byref  ->  zero-ref
;  V17 loc12        [V17,T11] (  6, 10   )     int  ->  rax
;  V18 loc13        [V18,T24] (  6,  6   )    long  ->  rax
;# V19 OutArgs      [V19    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;* V20 tmp1         [V20    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;* V21 tmp2         [V21    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V22 tmp3         [V22    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V23 tmp4         [V23    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V24 tmp5         [V24,T38] (  2,  2.50)  simd32  ->  mm0         "Inline stloc first use temp"
;* V25 tmp6         [V25    ] (  0,  0   )  simd32  ->  zero-ref    "struct address for call/obj"
;  V26 tmp7         [V26,T39] (  2,  2.50)  simd32  ->  mm1         "Inline stloc first use temp"
;* V27 tmp8         [V27    ] (  0,  0   )  simd32  ->  zero-ref    "struct address for call/obj"
;  V28 tmp9         [V28,T40] (  2,  2.50)  simd32  ->  mm2         "Inline stloc first use temp"
;* V29 tmp10        [V29    ] (  0,  0   )  simd32  ->  zero-ref    "struct address for call/obj"
;  V30 tmp11        [V30,T41] (  2,  2.50)  simd32  ->  mm3         "Inline stloc first use temp"
;* V31 tmp12        [V31    ] (  0,  0   )  simd32  ->  zero-ref    "struct address for call/obj"
;  V32 tmp13        [V32,T42] (  2,  2.50)  simd32  ->  mm4         "Inline stloc first use temp"
;  V33 tmp14        [V33,T43] (  2,  2.50)  simd32  ->  mm5         "Inline stloc first use temp"
;  V34 tmp15        [V34,T44] (  2,  2.50)  simd32  ->  mm6         "Inline stloc first use temp"
;* V35 tmp16        [V35    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V36 tmp17        [V36,T45] (  2,  2.50)  simd32  ->  mm7         "Inline stloc first use temp"
;  V37 tmp18        [V37,T12] (  6,  9   )    long  ->  r10         "Inline stloc first use temp"
;  V38 tmp19        [V38,T20] (  5,  7   )    long  ->  rdx         "Inline stloc first use temp"
;  V39 tmp20        [V39,T01] ( 14, 23.50)  simd32  ->  mm8         "Inline stloc first use temp"
;* V40 tmp21        [V40    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V41 tmp22        [V41,T58] (  2,  2   )  simd32  ->  mm9         "struct address for call/obj"
;  V42 tmp23        [V42,T26] (  2,  4   )  simd32  ->  mm9         "Inline stloc first use temp"
;  V43 tmp24        [V43,T27] (  2,  4   )  simd32  ->  mm9         "Inline stloc first use temp"
;  V44 tmp25        [V44,T28] (  2,  4   )  simd32  ->  mm9         "Inline stloc first use temp"
;  V45 tmp26        [V45,T29] (  2,  4   )  simd32  ->  mm9         "Inline stloc first use temp"
;* V46 tmp27        [V46    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V47 tmp28        [V47    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V48 tmp29        [V48    ] (  0,  0   )  struct (16) zero-ref    "Inlining Arg"
;* V49 tmp30        [V49    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V50 tmp31        [V50    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;  V51 tmp32        [V51,T81] (  2,  1   )  simd32  ->  mm1         "Inline return value spill temp"
;  V52 tmp33        [V52,T82] (  2,  1   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V53 tmp34        [V53,T83] (  2,  1   )  simd32  ->  mm2         "Inline return value spill temp"
;  V54 tmp35        [V54,T84] (  2,  1   )  simd16  ->  mm2         "Inline stloc first use temp"
;  V55 tmp36        [V55,T85] (  2,  1   )  simd32  ->  mm3         "Inline return value spill temp"
;  V56 tmp37        [V56,T86] (  2,  1   )  simd16  ->  mm3         "Inline stloc first use temp"
;  V57 tmp38        [V57,T87] (  2,  1   )  simd32  ->  mm4         "Inline return value spill temp"
;  V58 tmp39        [V58,T88] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V59 tmp40        [V59,T89] (  2,  1   )  simd32  ->  mm5         "Inline return value spill temp"
;  V60 tmp41        [V60,T90] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V61 tmp42        [V61,T91] (  2,  1   )  simd32  ->  mm6         "Inline return value spill temp"
;  V62 tmp43        [V62,T92] (  2,  1   )  simd16  ->  mm6         "Inline stloc first use temp"
;* V63 tmp44        [V63    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V64 tmp45        [V64    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V65 tmp46        [V65    ] (  0,  0   )  struct (16) zero-ref    "Inlining Arg"
;* V66 tmp47        [V66    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V67 tmp48        [V67    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V68 tmp49        [V68    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V69 tmp50        [V69    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V70 tmp51        [V70    ] (  0,  0   )  struct (16) zero-ref    "Inlining Arg"
;* V71 tmp52        [V71    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V72 tmp53        [V72    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V73 tmp54        [V73    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V74 tmp55        [V74,T46] (  2,  2.50)  simd16  ->  mm0         "Inline stloc first use temp"
;* V75 tmp56        [V75    ] (  0,  0   )  simd16  ->  zero-ref    "struct address for call/obj"
;  V76 tmp57        [V76,T47] (  2,  2.50)  simd16  ->  mm1         "Inline stloc first use temp"
;* V77 tmp58        [V77    ] (  0,  0   )  simd16  ->  zero-ref    "struct address for call/obj"
;  V78 tmp59        [V78,T48] (  2,  2.50)  simd16  ->  mm2         "Inline stloc first use temp"
;* V79 tmp60        [V79    ] (  0,  0   )  simd16  ->  zero-ref    "struct address for call/obj"
;  V80 tmp61        [V80,T49] (  2,  2.50)  simd16  ->  mm3         "Inline stloc first use temp"
;* V81 tmp62        [V81    ] (  0,  0   )  simd16  ->  zero-ref    "struct address for call/obj"
;  V82 tmp63        [V82,T50] (  2,  2.50)  simd16  ->  mm4         "Inline stloc first use temp"
;  V83 tmp64        [V83,T51] (  2,  2.50)  simd16  ->  mm5         "Inline stloc first use temp"
;  V84 tmp65        [V84,T52] (  2,  2.50)  simd16  ->  mm6         "Inline stloc first use temp"
;* V85 tmp66        [V85    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V86 tmp67        [V86,T53] (  2,  2.50)  simd16  ->  mm7         "Inline stloc first use temp"
;  V87 tmp68        [V87,T13] (  6,  9   )    long  ->  rdx         "Inline stloc first use temp"
;  V88 tmp69        [V88,T21] (  5,  7   )    long  ->  r10         "Inline stloc first use temp"
;  V89 tmp70        [V89,T02] ( 11, 22   )  simd16  ->  mm8         "Inline stloc first use temp"
;  V90 tmp71        [V90,T30] (  2,  4   )  simd16  ->  mm9         "Inline stloc first use temp"
;  V91 tmp72        [V91,T31] (  2,  4   )  simd16  ->  mm9         "Inline stloc first use temp"
;  V92 tmp73        [V92,T32] (  2,  4   )  simd16  ->  mm9         "Inline stloc first use temp"
;  V93 tmp74        [V93,T33] (  2,  4   )  simd16  ->  mm9         "Inline stloc first use temp"
;* V94 tmp75        [V94    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V95 tmp76        [V95    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V96 tmp77        [V96    ] (  0,  0   )  struct (16) zero-ref    "Inlining Arg"
;* V97 tmp78        [V97    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V98 tmp79        [V98    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;  V99 tmp80        [V99,T93] (  2,  1   )  simd16  ->  mm1         "Inline return value spill temp"
;  V100 tmp81       [V100,T94] (  2,  1   )  simd16  ->  mm1         "Inline stloc first use temp"
;  V101 tmp82       [V101,T95] (  2,  1   )  simd16  ->  mm2         "Inline return value spill temp"
;  V102 tmp83       [V102,T96] (  2,  1   )  simd16  ->  mm2         "Inline stloc first use temp"
;  V103 tmp84       [V103,T97] (  2,  1   )  simd16  ->  mm3         "Inline return value spill temp"
;  V104 tmp85       [V104,T98] (  2,  1   )  simd16  ->  mm3         "Inline stloc first use temp"
;  V105 tmp86       [V105,T99] (  2,  1   )  simd16  ->  mm4         "Inline return value spill temp"
;  V106 tmp87       [V106,T100] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V107 tmp88       [V107,T101] (  2,  1   )  simd16  ->  mm5         "Inline return value spill temp"
;  V108 tmp89       [V108,T102] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V109 tmp90       [V109,T103] (  2,  1   )  simd16  ->  mm6         "Inline return value spill temp"
;  V110 tmp91       [V110,T104] (  2,  1   )  simd16  ->  mm6         "Inline stloc first use temp"
;* V111 tmp92       [V111    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V112 tmp93       [V112    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V113 tmp94       [V113    ] (  0,  0   )  struct (16) zero-ref    "Inlining Arg"
;* V114 tmp95       [V114    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V115 tmp96       [V115    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V116 tmp97       [V116    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V117 tmp98       [V117    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V118 tmp99       [V118    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V119 tmp100      [V119    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V120 tmp101      [V120,T14] (  2,  8   )     int  ->  rbx         "Inline stloc first use temp"
;  V121 tmp102      [V121,T05] (  2, 16   )     int  ->  rax         "impAppendStmt"
;  V122 tmp103      [V122,T15] (  2,  8   )     int  ->  r14         "Inline stloc first use temp"
;  V123 tmp104      [V123,T03] (  5, 20   )     int  ->  rax         "Inline stloc first use temp"
;  V124 tmp105      [V124,T06] (  2, 16   )     int  ->  rbx         "impAppendStmt"
;  V125 tmp106      [V125,T16] (  2,  8   )     int  ->  r14         "Inline stloc first use temp"
;  V126 tmp107      [V126,T17] (  2,  8   )     int  ->  r15         "Inline stloc first use temp"
;  V127 tmp108      [V127,T18] (  2,  8   )     int  ->  rax         "Inline stloc first use temp"
;* V128 tmp109      [V128    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V129 tmp110      [V129,T07] (  2, 16   )    long  ->  rbx         "NewObj constructor temp"
;* V130 tmp111      [V130    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V131 tmp112      [V131    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V132 tmp113      [V132,T08] (  2, 16   )    long  ->  r14         "NewObj constructor temp"
;* V133 tmp114      [V133    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V134 tmp115      [V134    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V135 tmp116      [V135,T09] (  2, 16   )    long  ->  r15         "NewObj constructor temp"
;* V136 tmp117      [V136    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V137 tmp118      [V137    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V138 tmp119      [V138,T10] (  2, 16   )    long  ->  rax         "NewObj constructor temp"
;* V139 tmp120      [V139    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V140 tmp121      [V140    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V141 tmp122      [V141    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V142 tmp123      [V142,T72] (  3,  1.50)     int  ->  rcx         "Inline stloc first use temp"
;  V143 tmp124      [V143,T59] (  2,  2   )     int  ->  rax         "impAppendStmt"
;  V144 tmp125      [V144,T105] (  2,  1   )     int  ->  rcx         "Inline stloc first use temp"
;* V145 tmp126      [V145    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V146 tmp127      [V146,T60] (  2,  2   )    long  ->  rax         "NewObj constructor temp"
;* V147 tmp128      [V147    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V148 tmp129      [V148    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V149 tmp130      [V149,T61] (  2,  2   )    long  ->  rcx         "NewObj constructor temp"
;* V150 tmp131      [V150    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V151 tmp132      [V151    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V152 tmp133      [V152    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V153 tmp134      [V153,T106] (  2,  1   )     int  ->  rcx         "Inline stloc first use temp"
;  V154 tmp135      [V154,T62] (  2,  2   )     int  ->  rax         "impAppendStmt"
;  V155 tmp136      [V155,T55] (  4,  2   )     int  ->  rax         "Inline stloc first use temp"
;  V156 tmp137      [V156,T63] (  2,  2   )     int  ->  rcx         "impAppendStmt"
;  V157 tmp138      [V157,T107] (  2,  1   )     int  ->  r11         "Inline stloc first use temp"
;  V158 tmp139      [V158,T108] (  2,  1   )     int  ->  rax         "Inline stloc first use temp"
;* V159 tmp140      [V159    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V160 tmp141      [V160,T64] (  2,  2   )    long  ->  rcx         "NewObj constructor temp"
;* V161 tmp142      [V161    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V162 tmp143      [V162    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V163 tmp144      [V163,T65] (  2,  2   )    long  ->  r11         "NewObj constructor temp"
;* V164 tmp145      [V164    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V165 tmp146      [V165    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V166 tmp147      [V166,T66] (  2,  2   )    long  ->  rax         "NewObj constructor temp"
;* V167 tmp148      [V167    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V168 tmp149      [V168    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V169 tmp150      [V169,T73] (  0,  0   )   byref  ->  zero-ref    V20._pointer(offs=0x00) P-INDEP "field V20._pointer (fldOffset=0x0)"
;* V170 tmp151      [V170    ] (  0,  0   )     int  ->  zero-ref    V20._length(offs=0x08) P-INDEP "field V20._length (fldOffset=0x8)"
;  V171 tmp152      [V171,T69] (  3,  1.50)   byref  ->  rdi         V21._pointer(offs=0x00) P-INDEP "field V21._pointer (fldOffset=0x0)"
;* V172 tmp153      [V172    ] (  0,  0   )     int  ->  zero-ref    V21._length(offs=0x08) P-INDEP "field V21._length (fldOffset=0x8)"
;  V173 tmp154      [V173,T70] (  3,  1.50)   byref  ->  rsi         V22._pointer(offs=0x00) P-INDEP "field V22._pointer (fldOffset=0x0)"
;* V174 tmp155      [V174    ] (  0,  0   )     int  ->  zero-ref    V22._length(offs=0x08) P-INDEP "field V22._length (fldOffset=0x8)"
;* V175 tmp156      [V175    ] (  0,  0   )   byref  ->  zero-ref    V23._pointer(offs=0x00) P-INDEP "field V23._pointer (fldOffset=0x0)"
;* V176 tmp157      [V176    ] (  0,  0   )     int  ->  zero-ref    V23._length(offs=0x08) P-INDEP "field V23._length (fldOffset=0x8)"
;* V177 tmp158      [V177    ] (  0,  0   )   byref  ->  zero-ref    V35._pointer(offs=0x00) P-INDEP "field V35._pointer (fldOffset=0x0)"
;* V178 tmp159      [V178    ] (  0,  0   )     int  ->  zero-ref    V35._length(offs=0x08) P-INDEP "field V35._length (fldOffset=0x8)"
;* V179 tmp160      [V179    ] (  0,  0   )   byref  ->  zero-ref    V40._pointer(offs=0x00) P-INDEP "field V40._pointer (fldOffset=0x0)"
;* V180 tmp161      [V180    ] (  0,  0   )     int  ->  zero-ref    V40._length(offs=0x08) P-INDEP "field V40._length (fldOffset=0x8)"
;* V181 tmp162      [V181,T110] (  0,  0   )   byref  ->  zero-ref    V46._pointer(offs=0x00) P-INDEP "field V46._pointer (fldOffset=0x0)"
;* V182 tmp163      [V182    ] (  0,  0   )     int  ->  zero-ref    V46._length(offs=0x08) P-INDEP "field V46._length (fldOffset=0x8)"
;* V183 tmp164      [V183,T74] (  0,  0   )   byref  ->  zero-ref    V47._value(offs=0x00) P-INDEP "field V47._value (fldOffset=0x0)"
;* V184 tmp165      [V184    ] (  0,  0   )   byref  ->  zero-ref    V48._pointer(offs=0x00) P-INDEP "field V48._pointer (fldOffset=0x0)"
;* V185 tmp166      [V185    ] (  0,  0   )     int  ->  zero-ref    V48._length(offs=0x08) P-INDEP "field V48._length (fldOffset=0x8)"
;* V186 tmp167      [V186    ] (  0,  0   )   byref  ->  zero-ref    V49._pointer(offs=0x00) P-INDEP "field V49._pointer (fldOffset=0x0)"
;* V187 tmp168      [V187    ] (  0,  0   )     int  ->  zero-ref    V49._length(offs=0x08) P-INDEP "field V49._length (fldOffset=0x8)"
;* V188 tmp169      [V188,T111] (  0,  0   )   byref  ->  zero-ref    V63._pointer(offs=0x00) P-INDEP "field V63._pointer (fldOffset=0x0)"
;* V189 tmp170      [V189    ] (  0,  0   )     int  ->  zero-ref    V63._length(offs=0x08) P-INDEP "field V63._length (fldOffset=0x8)"
;* V190 tmp171      [V190,T75] (  0,  0   )   byref  ->  zero-ref    V64._value(offs=0x00) P-INDEP "field V64._value (fldOffset=0x0)"
;* V191 tmp172      [V191    ] (  0,  0   )   byref  ->  zero-ref    V65._pointer(offs=0x00) P-INDEP "field V65._pointer (fldOffset=0x0)"
;* V192 tmp173      [V192    ] (  0,  0   )     int  ->  zero-ref    V65._length(offs=0x08) P-INDEP "field V65._length (fldOffset=0x8)"
;* V193 tmp174      [V193    ] (  0,  0   )   byref  ->  zero-ref    V66._pointer(offs=0x00) P-INDEP "field V66._pointer (fldOffset=0x0)"
;* V194 tmp175      [V194    ] (  0,  0   )     int  ->  zero-ref    V66._length(offs=0x08) P-INDEP "field V66._length (fldOffset=0x8)"
;* V195 tmp176      [V195,T112] (  0,  0   )   byref  ->  zero-ref    V68._pointer(offs=0x00) P-INDEP "field V68._pointer (fldOffset=0x0)"
;* V196 tmp177      [V196    ] (  0,  0   )     int  ->  zero-ref    V68._length(offs=0x08) P-INDEP "field V68._length (fldOffset=0x8)"
;* V197 tmp178      [V197,T76] (  0,  0   )   byref  ->  zero-ref    V69._value(offs=0x00) P-INDEP "field V69._value (fldOffset=0x0)"
;* V198 tmp179      [V198    ] (  0,  0   )   byref  ->  zero-ref    V70._pointer(offs=0x00) P-INDEP "field V70._pointer (fldOffset=0x0)"
;* V199 tmp180      [V199    ] (  0,  0   )     int  ->  zero-ref    V70._length(offs=0x08) P-INDEP "field V70._length (fldOffset=0x8)"
;* V200 tmp181      [V200    ] (  0,  0   )   byref  ->  zero-ref    V71._pointer(offs=0x00) P-INDEP "field V71._pointer (fldOffset=0x0)"
;* V201 tmp182      [V201    ] (  0,  0   )     int  ->  zero-ref    V71._length(offs=0x08) P-INDEP "field V71._length (fldOffset=0x8)"
;* V202 tmp183      [V202    ] (  0,  0   )   byref  ->  zero-ref    V73._pointer(offs=0x00) P-INDEP "field V73._pointer (fldOffset=0x0)"
;* V203 tmp184      [V203    ] (  0,  0   )     int  ->  zero-ref    V73._length(offs=0x08) P-INDEP "field V73._length (fldOffset=0x8)"
;* V204 tmp185      [V204    ] (  0,  0   )   byref  ->  zero-ref    V85._pointer(offs=0x00) P-INDEP "field V85._pointer (fldOffset=0x0)"
;* V205 tmp186      [V205    ] (  0,  0   )     int  ->  zero-ref    V85._length(offs=0x08) P-INDEP "field V85._length (fldOffset=0x8)"
;* V206 tmp187      [V206,T113] (  0,  0   )   byref  ->  zero-ref    V94._pointer(offs=0x00) P-INDEP "field V94._pointer (fldOffset=0x0)"
;* V207 tmp188      [V207    ] (  0,  0   )     int  ->  zero-ref    V94._length(offs=0x08) P-INDEP "field V94._length (fldOffset=0x8)"
;* V208 tmp189      [V208,T77] (  0,  0   )   byref  ->  zero-ref    V95._value(offs=0x00) P-INDEP "field V95._value (fldOffset=0x0)"
;* V209 tmp190      [V209    ] (  0,  0   )   byref  ->  zero-ref    V96._pointer(offs=0x00) P-INDEP "field V96._pointer (fldOffset=0x0)"
;* V210 tmp191      [V210    ] (  0,  0   )     int  ->  zero-ref    V96._length(offs=0x08) P-INDEP "field V96._length (fldOffset=0x8)"
;* V211 tmp192      [V211    ] (  0,  0   )   byref  ->  zero-ref    V97._pointer(offs=0x00) P-INDEP "field V97._pointer (fldOffset=0x0)"
;* V212 tmp193      [V212    ] (  0,  0   )     int  ->  zero-ref    V97._length(offs=0x08) P-INDEP "field V97._length (fldOffset=0x8)"
;* V213 tmp194      [V213,T114] (  0,  0   )   byref  ->  zero-ref    V111._pointer(offs=0x00) P-INDEP "field V111._pointer (fldOffset=0x0)"
;* V214 tmp195      [V214    ] (  0,  0   )     int  ->  zero-ref    V111._length(offs=0x08) P-INDEP "field V111._length (fldOffset=0x8)"
;* V215 tmp196      [V215,T78] (  0,  0   )   byref  ->  zero-ref    V112._value(offs=0x00) P-INDEP "field V112._value (fldOffset=0x0)"
;* V216 tmp197      [V216    ] (  0,  0   )   byref  ->  zero-ref    V113._pointer(offs=0x00) P-INDEP "field V113._pointer (fldOffset=0x0)"
;* V217 tmp198      [V217    ] (  0,  0   )     int  ->  zero-ref    V113._length(offs=0x08) P-INDEP "field V113._length (fldOffset=0x8)"
;* V218 tmp199      [V218    ] (  0,  0   )   byref  ->  zero-ref    V114._pointer(offs=0x00) P-INDEP "field V114._pointer (fldOffset=0x0)"
;* V219 tmp200      [V219    ] (  0,  0   )     int  ->  zero-ref    V114._length(offs=0x08) P-INDEP "field V114._length (fldOffset=0x8)"
;* V220 tmp201      [V220,T79] (  0,  0   )   byref  ->  zero-ref    V116._pointer(offs=0x00) P-INDEP "field V116._pointer (fldOffset=0x0)"
;* V221 tmp202      [V221    ] (  0,  0   )     int  ->  zero-ref    V116._length(offs=0x08) P-INDEP "field V116._length (fldOffset=0x8)"
;* V222 tmp203      [V222,T80] (  0,  0   )   byref  ->  zero-ref    V117._value(offs=0x00) P-INDEP "field V117._value (fldOffset=0x0)"
;* V223 tmp204      [V223,T115] (  0,  0   )   byref  ->  zero-ref    V118._pointer(offs=0x00) P-INDEP "field V118._pointer (fldOffset=0x0)"
;* V224 tmp205      [V224    ] (  0,  0   )     int  ->  zero-ref    V118._length(offs=0x08) P-INDEP "field V118._length (fldOffset=0x8)"
;  V225 tmp206      [V225,T56] (  2,  2   )   byref  ->  rax         "BlockOp address local"
;  V226 tmp207      [V226,T67] (  2,  2   )    long  ->  rdi         "Cast away GC"
;  V227 tmp208      [V227,T57] (  2,  2   )   byref  ->  rax         "BlockOp address local"
;  V228 tmp209      [V228,T68] (  2,  2   )    long  ->  rsi         "Cast away GC"
;  V229 rat0        [V229,T37] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;
; Lcl frame size = 48

G_M11396_IG01:
       55                   push     rbp
       4157                 push     r15
       4156                 push     r14
       4154                 push     r12
       53                   push     rbx
       4883EC30             sub      rsp, 48
       C5F877               vzeroupper
       488D6C2450           lea      rbp, [rsp+50H]
       33C0                 xor      rax, rax
       488945B8             mov      qword ptr [rbp-48H], rax
       488945B0             mov      qword ptr [rbp-50H], rax
       48897DD0             mov      bword ptr [rbp-30H], rdi
       488975D8             mov      qword ptr [rbp-28H], rsi
       488955C0             mov      bword ptr [rbp-40H], rdx
       48894DC8             mov      qword ptr [rbp-38H], rcx

G_M11396_IG02:
       837DD800             cmp      dword ptr [rbp-28H], 0
       7718                 ja       SHORT G_M11396_IG04
       33C0                 xor      eax, eax
       418900               mov      dword ptr [r8], eax
       418901               mov      dword ptr [r9], eax

G_M11396_IG03:
       C5F877               vzeroupper
       488D65E0             lea      rsp, [rbp-20H]
       5B                   pop      rbx
       415C                 pop      r12
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M11396_IG04:
       488D45D0             lea      rax, bword ptr [rbp-30H]
       488B38               mov      rdi, bword ptr [rax]
       48897DB8             mov      bword ptr [rbp-48H], rdi
       488D45C0             lea      rax, bword ptr [rbp-40H]
       488B30               mov      rsi, bword ptr [rax]
       488975B0             mov      bword ptr [rbp-50H], rsi
       8B4DD8               mov      ecx, dword ptr [rbp-28H]
       448B55C8             mov      r10d, dword ptr [rbp-38H]
       81F9FDFFFF5F         cmp      ecx, 0x5FFFFFFD
       7F2D                 jg       SHORT G_M11396_IG06
       81F9FDFFFF5F         cmp      ecx, 0x5FFFFFFD
       0F871E040000         ja       G_M11396_IG24

G_M11396_IG05:
       8D5102               lea      edx, [rcx+2]
       41BB56555555         mov      r11d, 0x55555556
       418BC3               mov      eax, r11d
       F7EA                 imul     edx:eax, edx
       8BC2                 mov      eax, edx
       C1E81F               shr      eax, 31
       03C2                 add      eax, edx
       C1E002               shl      eax, 2
       413BC2               cmp      eax, r10d
       7F04                 jg       SHORT G_M11396_IG06
       8BC1                 mov      eax, ecx
       EB08                 jmp      SHORT G_M11396_IG07

G_M11396_IG06:
       41C1FA02             sar      r10d, 2
       438D0452             lea      eax, [r10+2*r10]

G_M11396_IG07:
       488BD7               mov      rdx, rdi
       4C8BD6               mov      r10, rsi
       8BC9                 mov      ecx, ecx
       4803CA               add      rcx, rdx
       448BD8               mov      r11d, eax
       4C03DA               add      r11, rdx
       83F810               cmp      eax, 16
       0F8CF1010000         jl       G_M11396_IG12
       498D43E0             lea      rax, [r11-32]
       483BC7               cmp      rax, rdi
       0F8202010000         jb       G_M11396_IG10
       48BA47CB962EA77F0000 mov      rdx, 0x7FA72E96CB47
       C5FD1002             vmovupd  ymm0, ymmword ptr[rdx]
       41BA00FCC00F         mov      r10d, 0xFC0FC00
       C4C1796ECA           vmovd    xmm1, r10d
       C4E27D58C9           vpbroadcastd ymm1, ymm1
       BAF0033F00           mov      edx, 0x3F03F0
       C5F96ED2             vmovd    xmm2, edx
       C4E27D58D2           vpbroadcastd ymm2, ymm2
       BA40000004           mov      edx, 0x4000040
       C5F96EDA             vmovd    xmm3, edx
       C4E27D58DB           vpbroadcastd ymm3, ymm3
       BA10000001           mov      edx, 0x1000010
       C5F96EE2             vmovd    xmm4, edx
       C4E27D58E4           vpbroadcastd ymm4, ymm4
       BA33000000           mov      edx, 51
       C5F96EEA             vmovd    xmm5, edx
       C4E27D78ED           vpbroadcastb ymm5, ymm5
       BA19000000           mov      edx, 25
       C5F96EF2             vmovd    xmm6, edx
       C4E27D78F6           vpbroadcastb ymm6, ymm6
       48BA27CC962EA77F0000 mov      rdx, 0x7FA72E96CC27
       C5FD103A             vmovupd  ymm7, ymmword ptr[rdx]
       488BD6               mov      rdx, rsi
       C57E6F07             vmovdqu  ymm8, ymmword ptr[rdi]
       49BAB7CB962EA77F0000 mov      r10, 0x7FA72E96CBB7
       C4417D100A           vmovupd  ymm9, ymmword ptr[r10]
       C4423536C0           vpermd   ymm8, ymm9, ymm8
       4C8D57FC             lea      r10, [rdi-4]

G_M11396_IG08:
       C4623D00C0           vpshufb  ymm8, ymm8, ymm0
       C53DDBCA             vpand    ymm9, ymm8, ymm2
       C535D5CC             vpmullw  ymm9, ymm9, ymm4
       C53DDBC1             vpand    ymm8, ymm8, ymm1
       C53DE4C3             vpmulhuw ymm8, ymm8, ymm3
       C4413DEBC1           vpor     ymm8, ymm8, ymm9
       C53D64CE             vpcmpgtb ymm9, ymm8, ymm6
       C53DD8D5             vpsubusb ymm10, ymm8, ymm5
       C4412DF8C9           vpsubb   ymm9, ymm10, ymm9
       C4424500C9           vpshufb  ymm9, ymm7, ymm9
       C4413DFCC1           vpaddb   ymm8, ymm8, ymm9
       C57E7F02             vmovdqu  ymmword ptr[rdx], ymm8
       4983C218             add      r10, 24
       4883C220             add      rdx, 32
       4C3BD0               cmp      r10, rax
       770E                 ja       SHORT G_M11396_IG09
       C4417E6F02           vmovdqu  ymm8, ymmword ptr[r10]
       EBB7                 jmp      SHORT G_M11396_IG08

G_M11396_IG09:
       498D4204             lea      rax, [r10+4]
       4C8BD2               mov      r10, rdx
       483BC1               cmp      rax, rcx
       0F845B020000         je       G_M11396_IG17
       488BD0               mov      rdx, rax

G_M11396_IG10:
       498D43F0             lea      rax, [r11-16]
       483BC2               cmp      rax, rdx
       0F82D5000000         jb       G_M11396_IG12
       48BB77CB962EA77F0000 mov      rbx, 0x7FA72E96CB77
       C5F91003             vmovupd  xmm0, xmmword ptr [rbx]
       BB00FCC00F           mov      ebx, 0xFC0FC00
       C5F96ECB             vmovd    xmm1, ebx
       C4E27958C9           vpbroadcastd xmm1, xmm1
       BBF0033F00           mov      ebx, 0x3F03F0
       C5F96ED3             vmovd    xmm2, ebx
       C4E27958D2           vpbroadcastd xmm2, xmm2
       BB40000004           mov      ebx, 0x4000040
       C5F96EDB             vmovd    xmm3, ebx
       C4E27958DB           vpbroadcastd xmm3, xmm3
       BB10000001           mov      ebx, 0x1000010
       C5F96EE3             vmovd    xmm4, ebx
       C4E27958E4           vpbroadcastd xmm4, xmm4
       BB33000000           mov      ebx, 51
       C5F96EEB             vmovd    xmm5, ebx
       C4E27978ED           vpbroadcastb xmm5, xmm5
       BB19000000           mov      ebx, 25
       C5F96EF3             vmovd    xmm6, ebx
       C4E27978F6           vpbroadcastb xmm6, xmm6
       48BBE7CB962EA77F0000 mov      rbx, 0x7FA72E96CBE7
       C5F9103B             vmovupd  xmm7, xmmword ptr [rbx]

G_M11396_IG11:
       C57A6F02             vmovdqu  xmm8, xmmword ptr [rdx]
       C4623900C0           vpshufb  xmm8, xmm8, xmm0
       C539DBCA             vpand    xmm9, xmm8, xmm2
       C531D5CC             vpmullw  xmm9, xmm9, xmm4
       C539DBC1             vpand    xmm8, xmm8, xmm1
       C539E4C3             vpmulhuw xmm8, xmm8, xmm3
       C44139EBC1           vpor     xmm8, xmm8, xmm9
       C53964CE             vpcmpgtb xmm9, xmm8, xmm6
       C539D8D5             vpsubusb xmm10, xmm8, xmm5
       C44129F8C9           vpsubb   xmm9, xmm10, xmm9
       C4424100C9           vpshufb  xmm9, xmm7, xmm9
       C44139FCC1           vpaddb   xmm8, xmm8, xmm9
       C4417A7F02           vmovdqu  xmmword ptr [r10], xmm8
       4883C20C             add      rdx, 12
       4983C210             add      r10, 16
       483BD0               cmp      rdx, rax
       76B9                 jbe      SHORT G_M11396_IG11
       483BD1               cmp      rdx, rcx
       0F8405010000         je       G_M11396_IG15

G_M11396_IG12:
       4983C3FE             add      r11, -2
       493BD3               cmp      rdx, r11
       0F838E000000         jae      G_M11396_IG14

G_M11396_IG13:
       0FB602               movzx    rax, byte  ptr [rdx]
       0FB65A01             movzx    rbx, byte  ptr [rdx+1]
       440FB67202           movzx    r14, byte  ptr [rdx+2]
       C1E010               shl      eax, 16
       C1E308               shl      ebx, 8
       0BC3                 or       eax, ebx
       410BC6               or       eax, r14d
       8BD8                 mov      ebx, eax
       C1EB12               shr      ebx, 18
       49BE07CA962EA77F0000 mov      r14, 0x7FA72E96CA07
       420FB61C33           movzx    rbx, byte  ptr [rbx+r14]
       448BF0               mov      r14d, eax
       41C1EE0C             shr      r14d, 12
       4183E63F             and      r14d, 63
       49BF07CA962EA77F0000 mov      r15, 0x7FA72E96CA07
       470FB6343E           movzx    r14, byte  ptr [r14+r15]
       448BF8               mov      r15d, eax
       41C1EF06             shr      r15d, 6
       4183E73F             and      r15d, 63
       49BC07CA962EA77F0000 mov      r12, 0x7FA72E96CA07
       470FB63C27           movzx    r15, byte  ptr [r15+r12]
       83E03F               and      eax, 63
       420FB60420           movzx    rax, byte  ptr [rax+r12]
       41C1E608             shl      r14d, 8
       410BDE               or       ebx, r14d
       41C1E710             shl      r15d, 16
       410BDF               or       ebx, r15d
       C1E018               shl      eax, 24
       0BC3                 or       eax, ebx
       418902               mov      dword ptr [r10], eax
       4883C203             add      rdx, 3
       4983C204             add      r10, 4
       493BD3               cmp      rdx, r11
       0F8272FFFFFF         jb       G_M11396_IG13

G_M11396_IG14:
       498D4302             lea      rax, [r11+2]
       483BC1               cmp      rax, rcx
       0F85F4000000         jne      G_M11396_IG20
       807D1000             cmp      byte  ptr [rbp+10H], 0
       0F8411010000         je       G_M11396_IG22
       488D4201             lea      rax, [rdx+1]
       483BC1               cmp      rax, rcx
       7548                 jne      SHORT G_M11396_IG16
       0FB60A               movzx    rcx, byte  ptr [rdx]
       C1E108               shl      ecx, 8
       8BC1                 mov      eax, ecx
       C1E80A               shr      eax, 10
       49BB07CA962EA77F0000 mov      r11, 0x7FA72E96CA07
       420FB60418           movzx    rax, byte  ptr [rax+r11]
       C1E904               shr      ecx, 4
       83E13F               and      ecx, 63
       420FB60C19           movzx    rcx, byte  ptr [rcx+r11]
       C1E108               shl      ecx, 8
       0BC1                 or       eax, ecx
       0D00003D00           or       eax, 0x3D0000
       0D0000003D           or       eax, 0x3D000000
       418902               mov      dword ptr [r10], eax
       48FFC2               inc      rdx
       4983C204             add      r10, 4
       488BC2               mov      rax, rdx
       EB78                 jmp      SHORT G_M11396_IG17

G_M11396_IG15:
       488BC2               mov      rax, rdx
       EB73                 jmp      SHORT G_M11396_IG17

G_M11396_IG16:
       488D4202             lea      rax, [rdx+2]
       483BC1               cmp      rax, rcx
       0F8587000000         jne      G_M11396_IG19
       0FB602               movzx    rax, byte  ptr [rdx]
       0FB64A01             movzx    rcx, byte  ptr [rdx+1]
       C1E010               shl      eax, 16
       C1E108               shl      ecx, 8
       0BC1                 or       eax, ecx
       8BC8                 mov      ecx, eax
       C1E912               shr      ecx, 18
       49BB07CA962EA77F0000 mov      r11, 0x7FA72E96CA07
       420FB60C19           movzx    rcx, byte  ptr [rcx+r11]
       448BD8               mov      r11d, eax
       41C1EB0C             shr      r11d, 12
       4183E33F             and      r11d, 63
       48BB07CA962EA77F0000 mov      rbx, 0x7FA72E96CA07
       450FB61C1B           movzx    r11, byte  ptr [r11+rbx]
       C1E806               shr      eax, 6
       83E03F               and      eax, 63
       0FB60418             movzx    rax, byte  ptr [rax+rbx]
       41C1E308             shl      r11d, 8
       410BCB               or       ecx, r11d
       C1E010               shl      eax, 16
       0BC1                 or       eax, ecx
       0D0000003D           or       eax, 0x3D000000
       418902               mov      dword ptr [r10], eax
       4883C202             add      rdx, 2
       4983C204             add      r10, 4
       488BC2               mov      rax, rdx

G_M11396_IG17:
       482BC7               sub      rax, rdi
       418900               mov      dword ptr [r8], eax
       498BC2               mov      rax, r10
       482BC6               sub      rax, rsi
       418901               mov      dword ptr [r9], eax
       33C0                 xor      eax, eax

G_M11396_IG18:
       C5F877               vzeroupper
       488D65E0             lea      rsp, [rbp-20H]
       5B                   pop      rbx
       415C                 pop      r12
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M11396_IG19:
       488BC2               mov      rax, rdx
       EBDA                 jmp      SHORT G_M11396_IG17

G_M11396_IG20:
       488BC2               mov      rax, rdx
       482BC7               sub      rax, rdi
       418900               mov      dword ptr [r8], eax
       498BC2               mov      rax, r10
       482BC6               sub      rax, rsi
       418901               mov      dword ptr [r9], eax
       B801000000           mov      eax, 1

G_M11396_IG21:
       C5F877               vzeroupper
       488D65E0             lea      rsp, [rbp-20H]
       5B                   pop      rbx
       415C                 pop      r12
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M11396_IG22:
       488BC2               mov      rax, rdx
       482BC7               sub      rax, rdi
       418900               mov      dword ptr [r8], eax
       498BC2               mov      rax, r10
       482BC6               sub      rax, rsi
       418901               mov      dword ptr [r9], eax
       B802000000           mov      eax, 2

G_M11396_IG23:
       C5F877               vzeroupper
       488D65E0             lea      rsp, [rbp-20H]
       5B                   pop      rbx
       415C                 pop      r12
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M11396_IG24:
       33FF                 xor      edi, edi
       E8D0E8FFFF           call     ThrowHelper:ThrowArgumentOutOfRangeException(int)
       CC                   int3

; Total bytes of code 1145, prolog size 46 for method Base64_PR_34529:EncodeToUtf8(struct,struct,byref,byref,bool):int
; ============================================================
