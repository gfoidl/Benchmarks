; Assembly listing for method Base64_1:DecodeFromUtf8(struct,struct,byref,byref,bool):int
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T20] (  8,  5.25)  struct (16) [rbp-0x38]   do-not-enreg[SF] ld-addr-op
;  V01 arg1         [V01,T31] (  5,  3.25)  struct (16) [rbp-0x48]   do-not-enreg[SF] ld-addr-op
;  V02 arg2         [V02,T23] (  7,  4.50)   byref  ->  rbx
;  V03 arg3         [V03,T24] (  7,  4.50)   byref  ->  r14
;  V04 arg4         [V04,T79] (  3,  1.50)    bool  ->  [rbp+0x10]
;  V05 loc0         [V05,T32] (  9,  4.50)    long  ->  rdi
;  V06 loc1         [V06    ] (  1,  0.50)   byref  ->  [rbp-0x50]   must-init pinned
;  V07 loc2         [V07,T34] (  8,  4   )    long  ->  rsi
;  V08 loc3         [V08    ] (  1,  0.50)   byref  ->  [rbp-0x58]   must-init pinned
;  V09 loc4         [V09,T04] ( 11, 19.50)    long  ->  rcx
;  V10 loc5         [V10    ] (  4,  2   )     ref  ->  [rbp-0x60]   must-init pinned class-hnd
;  V11 loc6         [V11,T50] (  7,  3.50)     int  ->   r8
;  V12 loc7         [V12,T51] (  6,  3   )     int  ->  [rbp-0x64]
;  V13 loc8         [V13,T33] (  9,  4.50)     int  ->  registers
;  V14 loc9         [V14,T80] (  3,  1.50)     int  ->  r11
;  V15 loc10        [V15,T00] ( 24, 36.50)    long  ->  r12         ld-addr-op
;  V16 loc11        [V16,T01] ( 28, 31.50)    long  ->  r13         ld-addr-op
;  V17 loc12        [V17,T35] (  8,  4   )    long  ->  [rbp-0x70]
;  V18 loc13        [V18,T25] (  6,  6.50)    long  ->  rdx
;  V19 loc14        [V19,T81] (  3,  1.50)    bool  ->  [rbp-0x74]
;  V20 loc15        [V20,T68] (  4,  2   )    long  ->  rdx
;  V21 loc16        [V21,T86] (  2,  1   )     int  ->   r9
;  V22 loc17        [V22,T87] (  2,  1   )     int  ->  r10
;  V23 loc18        [V23,T69] (  4,  2   )     int  ->  r11
;  V24 loc19        [V24,T82] (  3,  1.50)     int  ->  rax
;  V25 loc20        [V25,T08] ( 20, 10   )     int  ->   r9
;  V26 loc21        [V26,T70] (  4,  2   )     int  ->  r10
;  V27 loc22        [V27,T28] (  6,  6   )    long  ->  r10
;  V28 loc23        [V28,T03] (  5, 20   )     int  ->   r9
;  V29 loc24        [V29,T71] (  4,  2   )     int  ->  r10
;  V30 loc25        [V30,T88] (  2,  1   )     int  ->  rcx
;  V31 loc26        [V31,T72] (  4,  2   )     int  ->  rax
;# V32 OutArgs      [V32    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V33 tmp1         [V33,T52] (  3,  3   )     ref  ->  rax         class-hnd "dup spill"
;  V34 tmp2         [V34,T83] (  3,  1.50)     int  ->  rdx
;  V35 tmp3         [V35,T77] (  3,  1.50)   byref  ->  rax         "Inline return value spill temp"
;  V36 tmp4         [V36,T84] (  3,  1.25)   byref  ->  rax         "Inline stloc first use temp"
;* V37 tmp5         [V37    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V38 tmp6         [V38,T78] (  3,  1.50)   byref  ->  rax         "Inline return value spill temp"
;  V39 tmp7         [V39,T85] (  3,  1.25)   byref  ->  rax         "Inline stloc first use temp"
;* V40 tmp8         [V40    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V41 tmp9         [V41,T55] (  2,  2.50)  simd32  ->  mm0         "Inline stloc first use temp"
;  V42 tmp10        [V42,T56] (  2,  2.50)  simd32  ->  mm1         "Inline stloc first use temp"
;  V43 tmp11        [V43,T57] (  2,  2.50)  simd32  ->  mm2         "Inline stloc first use temp"
;  V44 tmp12        [V44,T26] (  4,  6.50)  simd32  ->  mm3         "Inline stloc first use temp"
;  V45 tmp13        [V45,T12] (  4,  8   )  simd32  ->  mm10         ld-addr-op "Inline stloc first use temp"
;  V46 tmp14        [V46,T58] (  2,  2.50)  simd32  ->  mm4         "Inline stloc first use temp"
;  V47 tmp15        [V47,T59] (  2,  2.50)  simd32  ->  mm5         "Inline stloc first use temp"
;  V48 tmp16        [V48,T60] (  2,  2.50)  simd32  ->  mm6         "Inline stloc first use temp"
;  V49 tmp17        [V49,T61] (  2,  2.50)  simd32  ->  mm7         "Inline stloc first use temp"
;  V50 tmp18        [V50,T10] (  6,  9   )    long  ->  r12         "Inline stloc first use temp"
;  V51 tmp19        [V51,T21] (  5,  7   )    long  ->  r13         "Inline stloc first use temp"
;  V52 tmp20        [V52,T13] (  4,  8   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V53 tmp21        [V53,T09] (  5, 10   )  simd32  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V54 tmp22        [V54,T29] (  3,  6   )  simd32  ->  mm10         "Inline stloc first use temp"
;  V55 tmp23        [V55,T36] (  2,  4   )  simd32  ->  mm8         "Inline stloc first use temp"
;  V56 tmp24        [V56,T37] (  2,  4   )  simd32  ->  mm11         "Inline stloc first use temp"
;  V57 tmp25        [V57,T38] (  2,  4   )  simd32  ->  mm12         "Inline stloc first use temp"
;  V58 tmp26        [V58,T39] (  2,  4   )  simd32  ->  mm8         "Inline stloc first use temp"
;  V59 tmp27        [V59,T40] (  2,  4   )  simd32  ->  mm8         "Inline stloc first use temp"
;  V60 tmp28        [V60,T41] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V61 tmp29        [V61,T42] (  2,  4   )  simd32  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V62 tmp30        [V62,T89] (  2,  1   )  simd32  ->  mm4         "Inline return value spill temp"
;  V63 tmp31        [V63,T90] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V64 tmp32        [V64,T91] (  2,  1   )  simd32  ->  mm5         "Inline return value spill temp"
;  V65 tmp33        [V65,T92] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;  V66 tmp34        [V66,T62] (  2,  2.50)  simd16  ->  mm0         "Inline stloc first use temp"
;  V67 tmp35        [V67,T63] (  2,  2.50)  simd16  ->  mm1         "Inline stloc first use temp"
;  V68 tmp36        [V68,T64] (  2,  2.50)  simd16  ->  mm2         "Inline stloc first use temp"
;  V69 tmp37        [V69,T27] (  4,  6.50)  simd16  ->  mm3         "Inline stloc first use temp"
;  V70 tmp38        [V70,T43] (  2,  4   )  simd16  ->  mm9         ld-addr-op "Inline stloc first use temp"
;  V71 tmp39        [V71,T65] (  2,  2.50)  simd16  ->  mm4         "Inline stloc first use temp"
;  V72 tmp40        [V72,T66] (  2,  2.50)  simd16  ->  mm5         "Inline stloc first use temp"
;  V73 tmp41        [V73,T67] (  2,  2.50)  simd16  ->  mm6         "Inline stloc first use temp"
;  V74 tmp42        [V74,T11] (  6,  9   )    long  ->  r12         "Inline stloc first use temp"
;  V75 tmp43        [V75,T22] (  5,  7   )    long  ->  r13         "Inline stloc first use temp"
;  V76 tmp44        [V76,T14] (  4,  8   )  simd16  ->  mm7         ld-addr-op "Inline stloc first use temp"
;  V77 tmp45        [V77,T07] (  7, 14   )  simd16  ->  mm8         ld-addr-op "Inline stloc first use temp"
;  V78 tmp46        [V78,T30] (  3,  6   )  simd16  ->  mm9         "Inline stloc first use temp"
;  V79 tmp47        [V79,T44] (  2,  4   )  simd16  ->  mm7         "Inline stloc first use temp"
;  V80 tmp48        [V80,T45] (  2,  4   )  simd16  ->  mm10         "Inline stloc first use temp"
;  V81 tmp49        [V81,T46] (  2,  4   )  simd16  ->  mm11         "Inline stloc first use temp"
;  V82 tmp50        [V82,T47] (  2,  4   )  simd16  ->  mm7         "Inline stloc first use temp"
;  V83 tmp51        [V83,T48] (  2,  4   )  simd16  ->  mm7         "Inline stloc first use temp"
;  V84 tmp52        [V84,T49] (  2,  4   )  simd16  ->  mm7         ld-addr-op "Inline stloc first use temp"
;  V85 tmp53        [V85,T93] (  2,  1   )  simd16  ->  mm4         "Inline return value spill temp"
;  V86 tmp54        [V86,T94] (  2,  1   )  simd16  ->  mm4         "Inline stloc first use temp"
;  V87 tmp55        [V87,T95] (  2,  1   )  simd16  ->  mm5         "Inline return value spill temp"
;  V88 tmp56        [V88,T96] (  2,  1   )  simd16  ->  mm5         "Inline stloc first use temp"
;* V89 tmp57        [V89    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V90 tmp58        [V90,T15] (  2,  8   )    long  ->  r11         "Inline stloc first use temp"
;  V91 tmp59        [V91,T16] (  2,  8   )    long  ->  r15         "Inline stloc first use temp"
;  V92 tmp60        [V92,T17] (  2,  8   )    long  ->  r10         "Inline stloc first use temp"
;  V93 tmp61        [V93,T18] (  2,  8   )    long  ->   r9         "Inline stloc first use temp"
;  V94 tmp62        [V94,T02] (  6, 24   )     int  ->  r15         "Inline stloc first use temp"
;  V95 tmp63        [V95,T06] (  2, 16   )     int  ->  r11         "impAppendStmt"
;  V96 tmp64        [V96,T05] (  4, 16   )     int  ->  r10         "Inline stloc first use temp"
;  V97 tmp65        [V97,T19] (  2,  8   )     int  ->   r9         "Inline stloc first use temp"
;* V98 tmp66        [V98    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V99 tmp67        [V99    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V100 tmp68       [V100,T73] (  2,  2   )     int  ->  rax         "Single return block return value"
;  V101 tmp69       [V101,T74] (  2,  2   )    long  ->  rdi         "Cast away GC"
;  V102 tmp70       [V102,T75] (  2,  2   )    long  ->  rsi         "Cast away GC"
;  V103 tmp71       [V103,T76] (  2,  2   )    long  ->  rcx         "Cast away GC"
;  V104 rat0        [V104,T53] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;  V105 rat1        [V105,T54] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;
; Lcl frame size = 88

G_M25064_IG01:
       55                   push     rbp
       4157                 push     r15
       4156                 push     r14
       4155                 push     r13
       4154                 push     r12
       53                   push     rbx
       4883EC58             sub      rsp, 88
       C5F877               vzeroupper
       488DAC2480000000     lea      rbp, [rsp+80H]
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

G_M25064_IG02:
       48BF98501827A27F0000 mov      rdi, 0x7FA227185098
       BE04000000           mov      esi, 4
       E8E4AF1B79           call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       837DD000             cmp      dword ptr [rbp-30H], 0
       770C                 ja       SHORT G_M25064_IG03
       33C0                 xor      eax, eax
       8903                 mov      dword ptr [rbx], eax
       418906               mov      dword ptr [r14], eax
       E909050000           jmp      G_M25064_IG28

G_M25064_IG03:
       33C0                 xor      rax, rax
       837DD000             cmp      dword ptr [rbp-30H], 0
       7404                 je       SHORT G_M25064_IG04
       488B45C8             mov      rax, bword ptr [rbp-38H]

G_M25064_IG04:
       488945B0             mov      bword ptr [rbp-50H], rax
       488BF8               mov      rdi, rax
       33C0                 xor      rax, rax
       837DC000             cmp      dword ptr [rbp-40H], 0
       7404                 je       SHORT G_M25064_IG05
       488B45B8             mov      rax, bword ptr [rbp-48H]

G_M25064_IG05:
       488945A8             mov      bword ptr [rbp-58H], rax
       488BF0               mov      rsi, rax
       48B8C80A0010A27F0000 mov      rax, 0x7FA210000AC8
       488B00               mov      rax, gword ptr [rax]
       488945A0             mov      gword ptr [rbp-60H], rax
       4885C0               test     rax, rax
       740A                 je       SHORT G_M25064_IG06
       488B45A0             mov      rax, gword ptr [rbp-60H]
       83780800             cmp      dword ptr [rax+8], 0
       7504                 jne      SHORT G_M25064_IG07

G_M25064_IG06:
       33C9                 xor      rcx, rcx
       EB16                 jmp      SHORT G_M25064_IG08

G_M25064_IG07:
       488B4DA0             mov      rcx, gword ptr [rbp-60H]
       83790800             cmp      dword ptr [rcx+8], 0
       0F865B050000         jbe      G_M25064_IG37
       488B45A0             mov      rax, gword ptr [rbp-60H]
       488D4810             lea      rcx, bword ptr [rax+16]

G_M25064_IG08:
       8B45D0               mov      eax, dword ptr [rbp-30H]
       448BC0               mov      r8d, eax
       4183E0FC             and      r8d, -4
       448B4DC0             mov      r9d, dword ptr [rbp-40H]
       458BD0               mov      r10d, r8d
       4585D2               test     r10d, r10d
       0F8C31050000         jl       G_M25064_IG36

G_M25064_IG09:
       418BC2               mov      eax, r10d
       C1F802               sar      eax, 2
       448D1C40             lea      r11d, [rax+2*rax]
       418D43FE             lea      eax, [r11-2]
       443BC8               cmp      r9d, eax
       7D19                 jge      SHORT G_M25064_IG10
       B856555555           mov      eax, 0x55555556
       41F7E9               imul     edx:eax, r9d
       448BD2               mov      r10d, edx
       41C1EA1F             shr      r10d, 31
       4103D2               add      edx, r10d
       448BD2               mov      r10d, edx
       41C1E202             shl      r10d, 2

G_M25064_IG10:
       4C8BE7               mov      r12, rdi
       4C8BEE               mov      r13, rsi
       4963C0               movsxd   rax, r8d
       4903C4               add      rax, r12
       4963D2               movsxd   rdx, r10d
       4903D4               add      rdx, r12
       4183FA18             cmp      r10d, 24
       0F8C44020000         jl       G_M25064_IG16
       4C8D52D3             lea      r10, [rdx-45]
       4C3BD7               cmp      r10, rdi
       0F8227010000         jb       G_M25064_IG13
       49BC880A0010A27F0000 mov      r12, 0x7FA210000A88
       4D8B2C24             mov      r13, gword ptr [r12]
       C4C17D104508         vmovupd  ymm0, ymmword ptr[r13+8]
       49BC800A0010A27F0000 mov      r12, 0x7FA210000A80
       4D8B2424             mov      r12, gword ptr [r12]
       C4C17D104C2408       vmovupd  ymm1, ymmword ptr[r12+8]
       49BC900A0010A27F0000 mov      r12, 0x7FA210000A90
       4D8B2424             mov      r12, gword ptr [r12]
       C4C17D10542408       vmovupd  ymm2, ymmword ptr[r12+8]
       49BC980A0010A27F0000 mov      r12, 0x7FA210000A98
       4D8B2424             mov      r12, gword ptr [r12]
       C4C17D105C2408       vmovupd  ymm3, ymmword ptr[r12+8]
       41BC40014001         mov      r12d, 0x1400140
       C4C1796EE4           vmovd    xmm4, r12d
       C4E27D58E4           vpbroadcastd ymm4, ymm4
       41BC00100100         mov      r12d, 0x11000
       C4C1796EEC           vmovd    xmm5, r12d
       C4E27D58ED           vpbroadcastd ymm5, ymm5
       49BC700A0010A27F0000 mov      r12, 0x7FA210000A70
       4D8B2424             mov      r12, gword ptr [r12]
       C4C17D10742408       vmovupd  ymm6, ymmword ptr[r12+8]
       49BC780A0010A27F0000 mov      r12, 0x7FA210000A78
       4D8B2424             mov      r12, gword ptr [r12]
       C4C17D107C2408       vmovupd  ymm7, ymmword ptr[r12+8]
       4C8BE7               mov      r12, rdi
       4C8BEE               mov      r13, rsi

G_M25064_IG11:
       C4417E6F0424         vmovdqu  ymm8, ymmword ptr[r12]
       C4417C28C8           vmovaps  ymm9, ymm8
       C4C12D72D004         vpsrld   ymm10, ymm8, 4
       C52DDBD3             vpand    ymm10, ymm10, ymm3
       C53DDBC3             vpand    ymm8, ymm8, ymm3
       C4427D00DA           vpshufb  ymm11, ymm0, ymm10
       C4411C57E4           vxorps   ymm12, ymm12, ymm12
       C4427500C0           vpshufb  ymm8, ymm1, ymm8
       C4413DDBC3           vpand    ymm8, ymm8, ymm11
       C4413D64C4           vpcmpgtb ymm8, ymm8, ymm12
       C4417DD7F8           vpmovmskb r15d, ymm8
       4585FF               test     r15d, r15d
       753D                 jne      SHORT G_M25064_IG12
       C53574C3             vpcmpeqb ymm8, ymm9, ymm3
       C4413DFCC2           vpaddb   ymm8, ymm8, ymm10
       C4426D00C0           vpshufb  ymm8, ymm2, ymm8
       C44135FCC8           vpaddb   ymm9, ymm9, ymm8
       C4623504C4           vpmaddubsw ymm8, ymm9, ymm4
       C53DF5C5             vpmaddwd ymm8, ymm8, ymm5
       C4623D00C6           vpshufb  ymm8, ymm8, ymm6
       C4424536D0           vpermd   ymm10, ymm7, ymm8
       C4417E7F5500         vmovdqu  ymmword ptr[r13], ymm10
       4983C420             add      r12, 32
       4983C518             add      r13, 24
       4D3BE2               cmp      r12, r10
       768B                 jbe      SHORT G_M25064_IG11

G_M25064_IG12:
       4C3BE0               cmp      r12, rax
       0F8402030000         je       G_M25064_IG27

G_M25064_IG13:
       4C8D52E8             lea      r10, [rdx-24]
       4D3BD4               cmp      r10, r12
       0F8203010000         jb       G_M25064_IG16
       48BA580A0010A27F0000 mov      rdx, 0x7FA210000A58
       488B12               mov      rdx, gword ptr [rdx]
       C5F9104208           vmovupd  xmm0, xmmword ptr [rdx+8]
       48BA500A0010A27F0000 mov      rdx, 0x7FA210000A50
       488B12               mov      rdx, gword ptr [rdx]
       C5F9104A08           vmovupd  xmm1, xmmword ptr [rdx+8]
       48BA600A0010A27F0000 mov      rdx, 0x7FA210000A60
       488B12               mov      rdx, gword ptr [rdx]
       C5F9105208           vmovupd  xmm2, xmmword ptr [rdx+8]
       48BA680A0010A27F0000 mov      rdx, 0x7FA210000A68
       488B12               mov      rdx, gword ptr [rdx]
       C5F9105A08           vmovupd  xmm3, xmmword ptr [rdx+8]
       BA40014001           mov      edx, 0x1400140
       C5F96EE2             vmovd    xmm4, edx
       C4E27958E4           vpbroadcastd xmm4, xmm4
       BA00100100           mov      edx, 0x11000
       C5F96EEA             vmovd    xmm5, edx
       C4E27958ED           vpbroadcastd xmm5, xmm5
       48BA480A0010A27F0000 mov      rdx, 0x7FA210000A48
       488B12               mov      rdx, gword ptr [rdx]
       C5F9107208           vmovupd  xmm6, xmmword ptr [rdx+8]

G_M25064_IG14:
       C4C17A6F3C24         vmovdqu  xmm7, xmmword ptr [r12]
       C57828C7             vmovaps  xmm8, xmm7
       C5B172D704           vpsrld   xmm9, xmm7, 4
       C531DBCB             vpand    xmm9, xmm9, xmm3
       C5C1DBFB             vpand    xmm7, xmm7, xmm3
       C4427900D1           vpshufb  xmm10, xmm0, xmm9
       C4412057DB           vxorps   xmm11, xmm11, xmm11
       C4E27100FF           vpshufb  xmm7, xmm1, xmm7
       C4C141DBFA           vpand    xmm7, xmm7, xmm10
       C4C14164FB           vpcmpgtb xmm7, xmm7, xmm11
       C5F9D7D7             vpmovmskb edx, xmm7
       85D2                 test     edx, edx
       753B                 jne      SHORT G_M25064_IG15
       C5B974FB             vpcmpeqb xmm7, xmm8, xmm3
       C4C141FCF9           vpaddb   xmm7, xmm7, xmm9
       C4E26900FF           vpshufb  xmm7, xmm2, xmm7
       C539FCC7             vpaddb   xmm8, xmm8, xmm7
       C4623904C4           vpmaddubsw xmm8, xmm8, xmm4
       C5B9F5FD             vpmaddwd xmm7, xmm8, xmm5
       C4624100C6           vpshufb  xmm8, xmm7, xmm6
       C4417A7F4500         vmovdqu  xmmword ptr [r13], xmm8
       4983C410             add      r12, 16
       4983C50C             add      r13, 12
       4D3BE2               cmp      r12, r10
       7695                 jbe      SHORT G_M25064_IG14

G_M25064_IG15:
       48894590             mov      qword ptr [rbp-70H], rax           ; unnecessary stack-operation
       4C3BE0               cmp      r12, rax
       488B4590             mov      rax, qword ptr [rbp-70H]           ; unnecessary stack-operation
       0F84F2010000         je       G_M25064_IG27

G_M25064_IG16:
       453BCB               cmp      r9d, r11d
       7C14                 jl       SHORT G_M25064_IG19
       4533D2               xor      r10d, r10d
       807D1000             cmp      byte  ptr [rbp+10H], 0
       7505                 jne      SHORT G_M25064_IG17
       418BD0               mov      edx, r8d
       EB04                 jmp      SHORT G_M25064_IG18

G_M25064_IG17:
       418D50FC             lea      edx, [r8-4]

G_M25064_IG18:
       EB32                 jmp      SHORT G_M25064_IG20

G_M25064_IG19:
       48894590             mov      qword ptr [rbp-70H], rax
       BA56555555           mov      edx, 0x55555556
       44894D9C             mov      dword ptr [rbp-64H], r9d
       8BC2                 mov      eax, edx
       41F7E9               imul     edx:eax, r9d
       448BD2               mov      r10d, edx
       41C1EA1F             shr      r10d, 31
       4103D2               add      edx, r10d
       C1E202               shl      edx, 2
       C7458C01000000       mov      dword ptr [rbp-74H], 1
       488B4590             mov      rax, qword ptr [rbp-70H]
       448B4D9C             mov      r9d, dword ptr [rbp-64H]
       448B558C             mov      r10d, dword ptr [rbp-74H]

G_M25064_IG20:
       4863D2               movsxd   rdx, edx
       4803D7               add      rdx, rdi
       4C3BE2               cmp      r12, rdx
       44894D9C             mov      dword ptr [rbp-64H], r9d
       4489558C             mov      dword ptr [rbp-74H], r10d
       0F837F000000         jae      G_M25064_IG22

G_M25064_IG21:
       450FB61C24           movzx    r11, byte  ptr [r12]
       458BDB               mov      r11d, r11d
       450FB67C2401         movzx    r15, byte  ptr [r12+1]
       458BFF               mov      r15d, r15d
       450FB6542402         movzx    r10, byte  ptr [r12+2]
       458BD2               mov      r10d, r10d
       450FB64C2403         movzx    r9, byte  ptr [r12+3]
       458BC9               mov      r9d, r9d
       4E0FBE1C19           movsx    r11, byte  ptr [rcx+r11]
       4E0FBE3C39           movsx    r15, byte  ptr [rcx+r15]
       4E0FBE1411           movsx    r10, byte  ptr [rcx+r10]
       4E0FBE0C09           movsx    r9, byte  ptr [rcx+r9]
       41C1E70C             shl      r15d, 12
       41C1E206             shl      r10d, 6
       450BFA               or       r15d, r10d
       41C1E312             shl      r11d, 18
       450BD9               or       r11d, r9d
       458BCB               mov      r9d, r11d
       450BCF               or       r9d, r15d
       4585C9               test     r9d, r9d
       0F8CC3010000         jl       G_M25064_IG34
       458BD1               mov      r10d, r9d
       41C1FA10             sar      r10d, 16
       45885500             mov      byte  ptr [r13], r10b
       458BD1               mov      r10d, r9d
       41C1FA08             sar      r10d, 8
       45885501             mov      byte  ptr [r13+1], r10b
       45884D02             mov      byte  ptr [r13+2], r9b
       4983C404             add      r12, 4
       4983C503             add      r13, 3
       4C3BE2               cmp      r12, rdx
       7281                 jb       SHORT G_M25064_IG21

G_M25064_IG22:
       837D8C00             cmp      dword ptr [rbp-74H], 0
       0F852C010000         jne      G_M25064_IG30
       4C3BE0               cmp      r12, rax
       750F                 jne      SHORT G_M25064_IG23
       807D1000             cmp      byte  ptr [rbp+10H], 0
       0F845B010000         je       G_M25064_IG32
       E97E010000           jmp      G_M25064_IG34

G_M25064_IG23:
       448B4D9C             mov      r9d, dword ptr [rbp-64H]
       4963D1               movsxd   rdx, r9d
       4803D6               add      rdx, rsi
       440FB648FC           movzx    r9, byte  ptr [rax-4]
       440FB650FD           movzx    r10, byte  ptr [rax-3]
       440FB658FE           movzx    r11, byte  ptr [rax-2]
       0FB640FF             movzx    rax, byte  ptr [rax-1]
       458BC9               mov      r9d, r9d
       4E0FBE0C09           movsx    r9, byte  ptr [rcx+r9]
       458BD2               mov      r10d, r10d
       4E0FBE1411           movsx    r10, byte  ptr [rcx+r10]
       41C1E112             shl      r9d, 18
       41C1E20C             shl      r10d, 12
       450BCA               or       r9d, r10d
       83F83D               cmp      eax, 61
       744D                 je       SHORT G_M25064_IG24
       458BDB               mov      r11d, r11d
       4E0FBE1419           movsx    r10, byte  ptr [rcx+r11]
       8BC0                 mov      eax, eax
       480FBE0C01           movsx    rcx, byte  ptr [rcx+rax]
       41C1E206             shl      r10d, 6
       440BC9               or       r9d, ecx
       450BCA               or       r9d, r10d
       4585C9               test     r9d, r9d
       0F8C1F010000         jl       G_M25064_IG34
       498D4503             lea      rax, [r13+3]
       483BC2               cmp      rax, rdx
       0F87AC000000         ja       G_M25064_IG30
       418BD1               mov      edx, r9d
       C1FA10               sar      edx, 16
       41885500             mov      byte  ptr [r13], dl
       418BC1               mov      eax, r9d
       C1F808               sar      eax, 8
       41884501             mov      byte  ptr [r13+1], al
       45884D02             mov      byte  ptr [r13+2], r9b
       4983C503             add      r13, 3
       EB5B                 jmp      SHORT G_M25064_IG26

G_M25064_IG24:
       4183FB3D             cmp      r11d, 61
       7438                 je       SHORT G_M25064_IG25
       418BC3               mov      eax, r11d
       480FBE0401           movsx    rax, byte  ptr [rcx+rax]
       C1E006               shl      eax, 6
       440BC8               or       r9d, eax
       4585C9               test     r9d, r9d
       0F8CD7000000         jl       G_M25064_IG34
       498D4502             lea      rax, [r13+2]
       483BC2               cmp      rax, rdx
       7768                 ja       SHORT G_M25064_IG30
       418BD1               mov      edx, r9d
       C1FA10               sar      edx, 16
       41885500             mov      byte  ptr [r13], dl
       41C1F908             sar      r9d, 8
       45884D01             mov      byte  ptr [r13+1], r9b
       4983C502             add      r13, 2
       EB1D                 jmp      SHORT G_M25064_IG26

G_M25064_IG25:
       4585C9               test     r9d, r9d
       0F8CAD000000         jl       G_M25064_IG34
       498D4501             lea      rax, [r13+1]
       483BC2               cmp      rax, rdx
       773E                 ja       SHORT G_M25064_IG30
       41C1F910             sar      r9d, 16
       45884D00             mov      byte  ptr [r13], r9b
       49FFC5               inc      r13

G_M25064_IG26:
       4983C404             add      r12, 4
       443B45D0             cmp      r8d, dword ptr [rbp-30H]
       0F858B000000         jne      G_M25064_IG34

G_M25064_IG27:
       498BC4               mov      rax, r12
       482BC7               sub      rax, rdi
       8903                 mov      dword ptr [rbx], eax
       498BC5               mov      rax, r13
       482BC6               sub      rax, rsi
       418906               mov      dword ptr [r14], eax

G_M25064_IG28:
       33C0                 xor      eax, eax

G_M25064_IG29:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M25064_IG30:
       443B45D0             cmp      r8d, dword ptr [rbp-30H]
       0F95C0               setne    al
       0FB6C0               movzx    rax, al
       448B7D10             mov      r15d, dword ptr [rbp+10H]
       410FB6D7             movzx    rdx, r15b
       85C2                 test     eax, edx
       7550                 jne      SHORT G_M25064_IG34
       498BC4               mov      rax, r12
       482BC7               sub      rax, rdi
       8903                 mov      dword ptr [rbx], eax
       498BC5               mov      rax, r13
       482BC6               sub      rax, rsi
       418906               mov      dword ptr [r14], eax
       B801000000           mov      eax, 1

G_M25064_IG31:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M25064_IG32:
       498BC4               mov      rax, r12
       482BC7               sub      rax, rdi
       8903                 mov      dword ptr [rbx], eax
       498BC5               mov      rax, r13
       482BC6               sub      rax, rsi
       418906               mov      dword ptr [r14], eax
       B802000000           mov      eax, 2

G_M25064_IG33:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M25064_IG34:
       4C2BE7               sub      r12, rdi
       418BC4               mov      eax, r12d
       8903                 mov      dword ptr [rbx], eax
       4C2BEE               sub      r13, rsi
       418BC5               mov      eax, r13d
       418906               mov      dword ptr [r14], eax
       B803000000           mov      eax, 3

G_M25064_IG35:
       C5F877               vzeroupper
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret

G_M25064_IG36:
       33FF                 xor      edi, edi
       E8DFDAFFFF           call     ThrowHelper:ThrowArgumentOutOfRangeException(int)
       CC                   int3

G_M25064_IG37:
       E801B71279           call     CORINFO_HELP_RNGCHKFAIL
       CC                   int3

; Total bytes of code 1552, prolog size 72 for method Base64_1:DecodeFromUtf8(struct,struct,byref,byref,bool):int
; ============================================================
