; Assembly listing for method Base64_1:EncodeToUtf8(struct,struct,byref,byref,bool):int
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T20] (  6,  4.25)  struct (16) [rbp-0x38]   do-not-enreg[SF] ld-addr-op
;  V01 arg1         [V01,T23] (  5,  3.25)  struct (16) [rbp-0x48]   do-not-enreg[SF] ld-addr-op
;  V02 arg2         [V02,T21] (  6,  4   )   byref  ->  rbx
;  V03 arg3         [V03,T22] (  6,  4   )   byref  ->  r14
;  V04 arg4         [V04,T105] (  1,  0.50)    bool  ->  [rbp+0x10]
;  V05 loc0         [V05,T25] (  8,  4   )    long  ->  rdi
;  V06 loc1         [V06    ] (  1,  0.50)   byref  ->  [rbp-0x50]   must-init pinned
;  V07 loc2         [V07,T41] (  6,  3   )    long  ->  rsi
;  V08 loc3         [V08    ] (  1,  0.50)   byref  ->  [rbp-0x58]   must-init pinned
;  V09 loc4         [V09,T03] ( 11, 19.50)    long  ->  rcx
;  V10 loc5         [V10    ] (  4,  2   )     ref  ->  [rbp-0x60]   must-init pinned class-hnd
;  V11 loc6         [V11,T42] (  6,  3   )     int  ->   r8
;  V12 loc7         [V12,T72] (  3,  1.50)     int  ->   r9
;  V13 loc8         [V13,T62] (  4,  2   )     int  ->  rax
;  V14 loc9         [V14,T00] ( 28, 35   )    long  ->  rdx         ld-addr-op
;  V15 loc10        [V15,T04] ( 16, 18.50)    long  ->   r9         ld-addr-op
;  V16 loc11        [V16,T43] (  6,  3   )    long  ->   r8
;  V17 loc12        [V17,T16] (  8,  7.50)    long  ->  r10
;  V18 loc13        [V18,T08] (  6, 10   )    long  ->  rax
;  V19 loc14        [V19,T19] (  7,  6.50)    long  ->  rax
;# V20 OutArgs      [V20    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V21 tmp1         [V21,T44] (  3,  3   )     ref  ->  rax         class-hnd "dup spill"
;  V22 tmp2         [V22,T70] (  3,  1.50)   byref  ->  rax         "Inline return value spill temp"
;  V23 tmp3         [V23,T74] (  3,  1.25)   byref  ->  rax         "Inline stloc first use temp"
;* V24 tmp4         [V24    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V25 tmp5         [V25,T71] (  3,  1.50)   byref  ->  rax         "Inline return value spill temp"
;  V26 tmp6         [V26,T75] (  3,  1.25)   byref  ->  rax         "Inline stloc first use temp"
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
;  V37 tmp17        [V37,T10] (  6,  9   )    long  ->  rdx         "Inline stloc first use temp"
;  V38 tmp18        [V38,T17] (  5,  7   )    long  ->   r9         "Inline stloc first use temp"
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
;  V69 tmp49        [V69,T09] (  7,  9.50)    long  ->  rdx         "Inline stloc first use temp"
;  V70 tmp50        [V70,T18] (  5,  7   )    long  ->   r9         "Inline stloc first use temp"
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
;  V93 tmp73        [V93,T11] (  2,  8   )    long  ->  r11         "Inline stloc first use temp"
;  V94 tmp74        [V94,T06] (  2, 16   )    long  ->  rax         "impAppendStmt"
;  V95 tmp75        [V95,T12] (  2,  8   )    long  ->  r15         "Inline stloc first use temp"
;  V96 tmp76        [V96,T02] (  5, 20   )    long  ->  rax         "Inline stloc first use temp"
;  V97 tmp77        [V97,T13] (  2,  8   )    long  ->  r15         "Inline stloc first use temp"
;  V98 tmp78        [V98,T07] (  2, 16   )    long  ->  r11         "impAppendStmt"
;  V99 tmp79        [V99,T14] (  2,  8   )    long  ->  r12         "Inline stloc first use temp"
;  V100 tmp80       [V100,T15] (  2,  8   )    long  ->  rax         "Inline stloc first use temp"
;* V101 tmp81       [V101    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V102 tmp82       [V102    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V103 tmp83       [V103,T73] (  3,  1.50)    long  ->  rax         "Inline stloc first use temp"
;  V104 tmp84       [V104,T101] (  2,  1   )    long  ->  rax         "Inline stloc first use temp"
;  V105 tmp85       [V105,T64] (  2,  2   )    long  ->   r8         "impAppendStmt"
;* V106 tmp86       [V106    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V107 tmp87       [V107    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V108 tmp88       [V108,T102] (  2,  1   )    long  ->   r8         "Inline stloc first use temp"
;  V109 tmp89       [V109,T65] (  2,  2   )    long  ->  rax         "impAppendStmt"
;  V110 tmp90       [V110,T63] (  4,  2   )    long  ->  rax         "Inline stloc first use temp"
;  V111 tmp91       [V111,T103] (  2,  1   )    long  ->  r10         "Inline stloc first use temp"
;  V112 tmp92       [V112,T66] (  2,  2   )    long  ->   r8         "impAppendStmt"
;  V113 tmp93       [V113,T104] (  2,  1   )    long  ->  rax         "Inline stloc first use temp"
;* V114 tmp94       [V114    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V115 tmp95       [V115,T67] (  2,  2   )    long  ->  rdi         "Cast away GC"
;  V116 tmp96       [V116,T68] (  2,  2   )    long  ->  rsi         "Cast away GC"
;  V117 tmp97       [V117,T69] (  2,  2   )    long  ->  rcx         "Cast away GC"
;  V118 rat0        [V118,T45] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;
; Lcl frame size = 56

G_M39728_IG01:
       55                   push     rbp
       4157                 push     r15
       4156                 push     r14
       4155                 push     r13
       4154                 push     r12
       53                   push     rbx
       4883EC38             sub      rsp, 56
       C5F877               vzeroupper
       488D6C2460           lea      rbp, [rsp+60H]
       4C8BE1               mov      r12, rcx
       4C8BEF               mov      r13, rdi
       488D7DA0             lea      rdi, [rbp-60H]
       B906000000           mov      ecx, 6
       33C0                 xor      rax, rax
       F3AB                 rep stosd
       498BCC               mov      rcx, r12
       498BFD               mov      rdi, r13
       48897DC8             mov      bword ptr [rbp-38H], rdi
       488975D0             mov      qword ptr [rbp-30H], rsi
       488955B8             mov      bword ptr [rbp-48H], rdx
       48894DC0             mov      qword ptr [rbp-40H], rcx
       498BD8               mov      rbx, r8
       4D8BF1               mov      r14, r9

G_M39728_IG02:
       48BF9850B03C407F0000 mov      rdi, 0x7F403CB05098
       BE04000000           mov      esi, 4
       E887191C79           call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       837DD000             cmp      dword ptr [rbp-30H], 0
       7719                 ja       SHORT G_M39728_IG04
       33C0                 xor      eax, eax
       8903                 mov      dword ptr [rbx], eax
       418906               mov      dword ptr [r14], eax

G_M39728_IG03:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M39728_IG04:
       33C0                 xor      rax, rax
       837DD000             cmp      dword ptr [rbp-30H], 0
       7404                 je       SHORT G_M39728_IG05
       488B45C8             mov      rax, bword ptr [rbp-38H]

G_M39728_IG05:
       488945B0             mov      bword ptr [rbp-50H], rax
       488BF8               mov      rdi, rax
       33C0                 xor      rax, rax
       837DC000             cmp      dword ptr [rbp-40H], 0
       7404                 je       SHORT G_M39728_IG06
       488B45B8             mov      rax, bword ptr [rbp-48H]

G_M39728_IG06:
       488945A8             mov      bword ptr [rbp-58H], rax
       488BF0               mov      rsi, rax
       48B8D00A0024407F0000 mov      rax, 0x7F4024000AD0
       488B00               mov      rax, gword ptr [rax]
       488945A0             mov      gword ptr [rbp-60H], rax
       4885C0               test     rax, rax
       740A                 je       SHORT G_M39728_IG07
       488B45A0             mov      rax, gword ptr [rbp-60H]
       83780800             cmp      dword ptr [rax+8], 0
       7504                 jne      SHORT G_M39728_IG08

G_M39728_IG07:
       33C9                 xor      rcx, rcx
       EB16                 jmp      SHORT G_M39728_IG09

G_M39728_IG08:
       488B4DA0             mov      rcx, gword ptr [rbp-60H]
       83790800             cmp      dword ptr [rcx+8], 0
       0F8663040000         jbe      G_M39728_IG29
       488B45A0             mov      rax, gword ptr [rbp-60H]
       488D4810             lea      rcx, bword ptr [rax+16]

G_M39728_IG09:
       448B45D0             mov      r8d, dword ptr [rbp-30H]
       448B4DC0             mov      r9d, dword ptr [rbp-40H]
       4181F8FDFFFF5F       cmp      r8d, 0x5FFFFFFD
       7F2C                 jg       SHORT G_M39728_IG11
       4181F8FDFFFF5F       cmp      r8d, 0x5FFFFFFD
       0F8735040000         ja       G_M39728_IG28

G_M39728_IG10:
       418D4002             lea      eax, [r8+2]
       BA56555555           mov      edx, 0x55555556
       F7EA                 imul     edx:eax, edx
       8BC2                 mov      eax, edx
       C1E81F               shr      eax, 31
       03D0                 add      edx, eax
       C1E202               shl      edx, 2
       413BD1               cmp      edx, r9d
       7F05                 jg       SHORT G_M39728_IG11
       418BC0               mov      eax, r8d
       EB08                 jmp      SHORT G_M39728_IG12

G_M39728_IG11:
       41C1F902             sar      r9d, 2
       438D0449             lea      eax, [r9+2*r9]

G_M39728_IG12:
       488BD7               mov      rdx, rdi
       4C8BCE               mov      r9, rsi
       4D63C0               movsxd   r8, r8d
       4C03C2               add      r8, rdx
       4C63D0               movsxd   r10, eax
       4C03D2               add      r10, rdx
       83F810               cmp      eax, 16
       0F8C09020000         jl       G_M39728_IG18
       498D42E0             lea      rax, [r10-32]
       483BC7               cmp      rax, rdi
       0F8207010000         jb       G_M39728_IG15
       48BAB80A0024407F0000 mov      rdx, 0x7F4024000AB8
       4C8B0A               mov      r9, gword ptr [rdx]
       C4C17D104108         vmovupd  ymm0, ymmword ptr[r9+8]
       BA00FCC00F           mov      edx, 0xFC0FC00
       C5F96ECA             vmovd    xmm1, edx
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
       48BAC00A0024407F0000 mov      rdx, 0x7F4024000AC0
       488B12               mov      rdx, gword ptr [rdx]
       C5FD107A08           vmovupd  ymm7, ymmword ptr[rdx+8]
       4C8BCE               mov      r9, rsi
       C57E6F07             vmovdqu  ymm8, ymmword ptr[rdi]
       48BAB00A0024407F0000 mov      rdx, 0x7F4024000AB0
       488B12               mov      rdx, gword ptr [rdx]
       C57D104A08           vmovupd  ymm9, ymmword ptr[rdx+8]
       C4423536C0           vpermd   ymm8, ymm9, ymm8
       488D57FC             lea      rdx, [rdi-4]

G_M39728_IG13:
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
       C4417E7F01           vmovdqu  ymmword ptr[r9], ymm8
       4883C218             add      rdx, 24
       4983C120             add      r9, 32
       483BD0               cmp      rdx, rax
       770D                 ja       SHORT G_M39728_IG14
       C57E6F02             vmovdqu  ymm8, ymmword ptr[rdx]
       EBB7                 jmp      SHORT G_M39728_IG13

G_M39728_IG14:
       4883C204             add      rdx, 4
       493BD0               cmp      rdx, r8
       0F846B020000         je       G_M39728_IG22

G_M39728_IG15:
       498D42F0             lea      rax, [r10-16]
       483BC2               cmp      rax, rdx
       0F82E8000000         jb       G_M39728_IG18
       49BBA00A0024407F0000 mov      r11, 0x7F4024000AA0
       4D8B1B               mov      r11, gword ptr [r11]
       C4C179104308         vmovupd  xmm0, xmmword ptr [r11+8]
       41BB00FCC00F         mov      r11d, 0xFC0FC00
       C4C1796ECB           vmovd    xmm1, r11d
       C4E27958C9           vpbroadcastd xmm1, xmm1
       41BBF0033F00         mov      r11d, 0x3F03F0
       C4C1796ED3           vmovd    xmm2, r11d
       C4E27958D2           vpbroadcastd xmm2, xmm2
       41BB40000004         mov      r11d, 0x4000040
       C4C1796EDB           vmovd    xmm3, r11d
       C4E27958DB           vpbroadcastd xmm3, xmm3
       41BB10000001         mov      r11d, 0x1000010
       C4C1796EE3           vmovd    xmm4, r11d
       C4E27958E4           vpbroadcastd xmm4, xmm4
       41BB33000000         mov      r11d, 51
       C4C1796EEB           vmovd    xmm5, r11d
       C4E27978ED           vpbroadcastb xmm5, xmm5
       41BB19000000         mov      r11d, 25
       C4C1796EF3           vmovd    xmm6, r11d
       C4E27978F6           vpbroadcastb xmm6, xmm6
       49BBA80A0024407F0000 mov      r11, 0x7F4024000AA8
       4D8B1B               mov      r11, gword ptr [r11]
       C4C179107B08         vmovupd  xmm7, xmmword ptr [r11+8]
       483BD0               cmp      rdx, rax
       7754                 ja       SHORT G_M39728_IG17

G_M39728_IG16:
       C57A6F02             vmovdqu  xmm8, xmmword ptr [rdx]
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
       C4417A7F01           vmovdqu  xmmword ptr [r9], xmm8
       4883C20C             add      rdx, 12
       4983C110             add      r9, 16
       483BD0               cmp      rdx, rax
       76B9                 jbe      SHORT G_M39728_IG16

G_M39728_IG17:
       493BD0               cmp      rdx, r8
       0F8476010000         je       G_M39728_IG22

G_M39728_IG18:
       4983C2FE             add      r10, -2
       493BD2               cmp      rdx, r10
       0F838B000000         jae      G_M39728_IG20

G_M39728_IG19:
       0FB602               movzx    rax, byte  ptr [rdx]
       8BC0                 mov      eax, eax
       440FB65A01           movzx    r11, byte  ptr [rdx+1]
       458BDB               mov      r11d, r11d
       440FB67A02           movzx    r15, byte  ptr [rdx+2]
       458BFF               mov      r15d, r15d
       48C1E010             shl      rax, 16
       49C1E308             shl      r11, 8
       490BC3               or       rax, r11
       490BC7               or       rax, r15
       4C8BD8               mov      r11, rax
       49C1EB12             shr      r11, 18
       460FB61C19           movzx    r11, byte  ptr [rcx+r11]
       458BDB               mov      r11d, r11d
       4C8BF8               mov      r15, rax
       49C1EF0C             shr      r15, 12
       4983E73F             and      r15, 63
       460FB63C39           movzx    r15, byte  ptr [rcx+r15]
       458BFF               mov      r15d, r15d
       4C8BE0               mov      r12, rax
       49C1EC06             shr      r12, 6
       4983E43F             and      r12, 63
       460FB62421           movzx    r12, byte  ptr [rcx+r12]
       458BE4               mov      r12d, r12d
       4883E03F             and      rax, 63
       0FB60401             movzx    rax, byte  ptr [rcx+rax]
       8BC0                 mov      eax, eax
       49C1E708             shl      r15, 8
       4D0BDF               or       r11, r15
       49C1E410             shl      r12, 16
       4D0BDC               or       r11, r12
       48C1E018             shl      rax, 24
       490BC3               or       rax, r11
       498901               mov      qword ptr [r9], rax
       4883C203             add      rdx, 3
       4983C104             add      r9, 4
       493BD2               cmp      rdx, r10
       0F8275FFFFFF         jb       G_M39728_IG19

G_M39728_IG20:
       4983C202             add      r10, 2
       4D3BD0               cmp      r10, r8
       0F85F6000000         jne      G_M39728_IG24
       807D1000             cmp      byte  ptr [rbp+10H], 0
       0F8414010000         je       G_M39728_IG26
       488D4201             lea      rax, [rdx+1]
       493BC0               cmp      rax, r8
       754B                 jne      SHORT G_M39728_IG21
       440FB602             movzx    r8, byte  ptr [rdx]
       418BC0               mov      eax, r8d
       48C1E008             shl      rax, 8
       4C8BC0               mov      r8, rax
       49C1E80A             shr      r8, 10
       460FB60401           movzx    r8, byte  ptr [rcx+r8]
       458BC0               mov      r8d, r8d
       48C1E804             shr      rax, 4
       4883E03F             and      rax, 63
       0FB60C01             movzx    rcx, byte  ptr [rcx+rax]
       8BC1                 mov      eax, ecx
       48C1E008             shl      rax, 8
       4C0BC0               or       r8, rax
       4981C800003D00       or       r8, 0x3D0000
       498BC0               mov      rax, r8
       480D0000003D         or       rax, 0x3D000000
       498901               mov      qword ptr [r9], rax
       48FFC2               inc      rdx
       4983C104             add      r9, 4
       EB73                 jmp      SHORT G_M39728_IG22

G_M39728_IG21:
       488D4202             lea      rax, [rdx+2]
       493BC0               cmp      rax, r8
       756A                 jne      SHORT G_M39728_IG22
       0FB602               movzx    rax, byte  ptr [rdx]
       8BC0                 mov      eax, eax
       440FB64201           movzx    r8, byte  ptr [rdx+1]
       458BC0               mov      r8d, r8d
       48C1E010             shl      rax, 16
       49C1E008             shl      r8, 8
       490BC0               or       rax, r8
       4C8BC0               mov      r8, rax
       49C1E812             shr      r8, 18
       460FB60401           movzx    r8, byte  ptr [rcx+r8]
       458BC0               mov      r8d, r8d
       4C8BD0               mov      r10, rax
       49C1EA0C             shr      r10, 12
       4983E23F             and      r10, 63
       460FB61411           movzx    r10, byte  ptr [rcx+r10]
       458BD2               mov      r10d, r10d
       48C1E806             shr      rax, 6
       4883E03F             and      rax, 63
       0FB60401             movzx    rax, byte  ptr [rcx+rax]
       8BC0                 mov      eax, eax
       49C1E208             shl      r10, 8
       4D0BC2               or       r8, r10
       48C1E010             shl      rax, 16
       4C0BC0               or       r8, rax
       498BC0               mov      rax, r8
       480D0000003D         or       rax, 0x3D000000
       498901               mov      qword ptr [r9], rax
       4883C202             add      rdx, 2
       4983C104             add      r9, 4

G_M39728_IG22:
       488BC2               mov      rax, rdx
       482BC7               sub      rax, rdi
       8903                 mov      dword ptr [rbx], eax
       498BC1               mov      rax, r9
       482BC6               sub      rax, rsi
       418906               mov      dword ptr [r14], eax
       33C0                 xor      eax, eax

G_M39728_IG23:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M39728_IG24:
       488BC2               mov      rax, rdx
       482BC7               sub      rax, rdi
       8903                 mov      dword ptr [rbx], eax
       498BC1               mov      rax, r9
       482BC6               sub      rax, rsi
       418906               mov      dword ptr [r14], eax
       B801000000           mov      eax, 1

G_M39728_IG25:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M39728_IG26:
       482BD7               sub      rdx, rdi
       8BC2                 mov      eax, edx
       8903                 mov      dword ptr [rbx], eax
       4C2BCE               sub      r9, rsi
       418BC1               mov      eax, r9d
       418906               mov      dword ptr [r14], eax
       B802000000           mov      eax, 2

G_M39728_IG27:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M39728_IG28:
       33FF                 xor      edi, edi
       E8A9D6FFFF           call     ThrowHelper:ThrowArgumentOutOfRangeException(int)
       CC                   int3

G_M39728_IG29:
       E89B211379           call     CORINFO_HELP_RNGCHKFAIL
       CC                   int3

; Total bytes of code 1302, prolog size 69 for method Base64_1:EncodeToUtf8(struct,struct,byref,byref,bool):int
; ============================================================
