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
;  V05 loc0         [V05,T32] (  9,  4.50)    long  ->  r12
;  V06 loc1         [V06    ] (  1,  0.50)   byref  ->  [rbp-0x50]   must-init pinned
;  V07 loc2         [V07,T34] (  8,  4   )    long  ->  r13
;  V08 loc3         [V08    ] (  1,  0.50)   byref  ->  [rbp-0x58]   must-init pinned
;  V09 loc4         [V09,T04] ( 11, 19.50)    long  ->  rdi
;  V10 loc5         [V10    ] (  4,  2   )     ref  ->  [rbp-0x60]   must-init pinned class-hnd
;  V11 loc6         [V11,T50] (  7,  3.50)     int  ->  rsi
;  V12 loc7         [V12,T51] (  6,  3   )     int  ->  [rbp-0x64]
;  V13 loc8         [V13,T33] (  9,  4.50)     int  ->  registers
;  V14 loc9         [V14,T80] (  3,  1.50)     int  ->   r9
;  V15 loc10        [V15,T00] ( 24, 36.50)    long  ->  r10         ld-addr-op
;  V16 loc11        [V16,T01] ( 28, 31.50)    long  ->  r11         ld-addr-op
;  V17 loc12        [V17,T35] (  8,  4   )    long  ->  [rbp-0x70]
;  V18 loc13        [V18,T25] (  6,  6.50)    long  ->  rdx
;  V19 loc14        [V19,T81] (  3,  1.50)    bool  ->  [rbp-0x74]
;  V20 loc15        [V20,T86] (  2,  1   )     int  ->  rdx
;  V21 loc16        [V21,T87] (  2,  1   )     int  ->  rcx
;  V22 loc17        [V22,T68] (  4,  2   )     int  ->   r8
;  V23 loc18        [V23,T82] (  3,  1.50)     int  ->  rax
;  V24 loc19        [V24,T08] ( 20, 10   )     int  ->  rdx
;  V25 loc20        [V25,T69] (  4,  2   )     int  ->  rcx
;  V26 loc21        [V26,T70] (  4,  2   )    long  ->  rcx
;  V27 loc22        [V27,T28] (  6,  6   )    long  ->   r8
;  V28 loc23        [V28,T03] (  5, 20   )     int  ->  rcx
;  V29 loc24        [V29,T71] (  4,  2   )     int  ->   r8
;  V30 loc25        [V30,T88] (  2,  1   )     int  ->  rdi
;  V31 loc26        [V31,T72] (  4,  2   )     int  ->  rax
;# V32 OutArgs      [V32    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V33 tmp1         [V33,T52] (  3,  3   )     ref  ->  rax         class-hnd "dup spill"
;  V34 tmp2         [V34,T83] (  3,  1.50)     int  ->  rdx
;  V35 tmp3         [V35,T77] (  3,  1.50)   byref  ->  rdi         "Inline return value spill temp"
;  V36 tmp4         [V36,T84] (  3,  1.25)   byref  ->  rdi         "Inline stloc first use temp"
;* V37 tmp5         [V37    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V38 tmp6         [V38,T78] (  3,  1.50)   byref  ->  rdi         "Inline return value spill temp"
;  V39 tmp7         [V39,T85] (  3,  1.25)   byref  ->  rdi         "Inline stloc first use temp"
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
;  V50 tmp18        [V50,T10] (  6,  9   )    long  ->  r10         "Inline stloc first use temp"
;  V51 tmp19        [V51,T21] (  5,  7   )    long  ->  r11         "Inline stloc first use temp"
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
;  V74 tmp42        [V74,T11] (  6,  9   )    long  ->  r10         "Inline stloc first use temp"
;  V75 tmp43        [V75,T22] (  5,  7   )    long  ->  r11         "Inline stloc first use temp"
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
;  V90 tmp58        [V90,T15] (  2,  8   )    long  ->   r9         "Inline stloc first use temp"
;  V91 tmp59        [V91,T16] (  2,  8   )    long  ->  r15         "Inline stloc first use temp"
;  V92 tmp60        [V92,T17] (  2,  8   )    long  ->   r8         "Inline stloc first use temp"
;  V93 tmp61        [V93,T18] (  2,  8   )    long  ->  rcx         "Inline stloc first use temp"
;  V94 tmp62        [V94,T02] (  6, 24   )     int  ->  r15         "Inline stloc first use temp"
;  V95 tmp63        [V95,T06] (  2, 16   )     int  ->   r9         "impAppendStmt"
;  V96 tmp64        [V96,T05] (  4, 16   )     int  ->   r8         "Inline stloc first use temp"
;  V97 tmp65        [V97,T19] (  2,  8   )     int  ->  rcx         "Inline stloc first use temp"
;* V98 tmp66        [V98    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;* V99 tmp67        [V99    ] (  0,  0   )    long  ->  zero-ref    "Inlining Arg"
;  V100 tmp68       [V100,T73] (  2,  2   )     int  ->  rax         "Single return block return value"
;  V101 tmp69       [V101,T74] (  2,  2   )    long  ->  r12         "Cast away GC"
;  V102 tmp70       [V102,T75] (  2,  2   )    long  ->  r13         "Cast away GC"
;  V103 tmp71       [V103,T76] (  2,  2   )    long  ->  rdi         "Cast away GC"
;* V104 cse0        [V104,T97] (  0,  0   )    long  ->  zero-ref    "ValNumCSE"
;  V105 rat0        [V105,T53] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;  V106 rat1        [V106,T54] (  3,  3   )     int  ->  rdx         "ReplaceWithLclVar is creating a new local variable"
;
; Lcl frame size = 88

G_M25064_IG01:
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

G_M25064_IG02:
       cmp      dword ptr [rbp-30H], 0
       ja       SHORT G_M25064_IG03
       xor      edi, edi
       mov      dword ptr [rbx], edi
       mov      dword ptr [r14], edi
       jmp      G_M25064_IG28

G_M25064_IG03:
       xor      rdi, rdi
       cmp      dword ptr [rbp-30H], 0
       je       SHORT G_M25064_IG04
       mov      rdi, bword ptr [rbp-38H]

G_M25064_IG04:
       mov      bword ptr [rbp-50H], rdi
       mov      r12, rdi
       xor      rdi, rdi
       cmp      dword ptr [rbp-40H], 0
       je       SHORT G_M25064_IG05
       mov      rdi, bword ptr [rbp-48H]

G_M25064_IG05:
       mov      bword ptr [rbp-58H], rdi
       mov      r13, rdi
       mov      rdi, 0xD1FFAB1E
       mov      esi, 4
       call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       mov      rax, 0xD1FFAB1E
       mov      rax, gword ptr [rax]
       mov      gword ptr [rbp-60H], rax
       test     rax, rax
       je       SHORT G_M25064_IG06
       mov      rax, gword ptr [rbp-60H]
       cmp      dword ptr [rax+8], 0
       jne      SHORT G_M25064_IG07

G_M25064_IG06:
       xor      rdi, rdi
       jmp      SHORT G_M25064_IG08

G_M25064_IG07:
       mov      rdi, gword ptr [rbp-60H]
       cmp      dword ptr [rdi+8], 0
       jbe      G_M25064_IG37
       mov      rax, gword ptr [rbp-60H]
       lea      rdi, bword ptr [rax+16]

G_M25064_IG08:
       mov      eax, dword ptr [rbp-30H]
       mov      esi, eax
       and      esi, -4
       mov      ecx, dword ptr [rbp-40H]
       mov      r8d, esi
       test     r8d, r8d
       jl       G_M25064_IG36

G_M25064_IG09:
       mov      eax, r8d
       sar      eax, 2
       lea      r9d, [rax+2*rax]
       lea      eax, [r9-2]
       cmp      ecx, eax
       jge      SHORT G_M25064_IG10
       mov      eax, 0xD1FFAB1E
       imul     edx:eax, ecx
       mov      r8d, edx
       shr      r8d, 31
       add      edx, r8d
       mov      r8d, edx
       shl      r8d, 2

G_M25064_IG10:
       mov      r10, r12
       mov      r11, r13
       movsxd   rax, esi
       add      rax, r10
       movsxd   rdx, r8d
       add      rdx, r10
       cmp      r8d, 24
       jl       G_M25064_IG16
       lea      r8, [rdx-45]
       cmp      r8, r12
       jb       G_M25064_IG13
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

G_M25064_IG11:
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
       jne      SHORT G_M25064_IG12
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
       jbe      SHORT G_M25064_IG11

G_M25064_IG12:
       cmp      r10, rax
       je       G_M25064_IG27

G_M25064_IG13:
       lea      r8, [rdx-24]
       cmp      r8, r10
       jb       G_M25064_IG16
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

G_M25064_IG14:
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
       jne      SHORT G_M25064_IG15
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
       jbe      SHORT G_M25064_IG14

G_M25064_IG15:
       mov      qword ptr [rbp-70H], rax
       cmp      r10, rax
       mov      rax, qword ptr [rbp-70H]
       je       G_M25064_IG27

G_M25064_IG16:
       cmp      ecx, r9d
       jl       SHORT G_M25064_IG19
       xor      r8d, r8d
       cmp      byte  ptr [rbp+10H], 0
       jne      SHORT G_M25064_IG17
       mov      edx, esi
       jmp      SHORT G_M25064_IG18

G_M25064_IG17:
       lea      edx, [rsi-4]

G_M25064_IG18:
       jmp      SHORT G_M25064_IG20

G_M25064_IG19:
       mov      qword ptr [rbp-70H], rax
       mov      edx, 0xD1FFAB1E
       mov      dword ptr [rbp-64H], ecx
       mov      eax, edx
       imul     edx:eax, ecx
       mov      r8d, edx
       shr      r8d, 31
       add      edx, r8d
       shl      edx, 2
       mov      dword ptr [rbp-74H], 1
       mov      rax, qword ptr [rbp-70H]
       mov      ecx, dword ptr [rbp-64H]
       mov      r8d, dword ptr [rbp-74H]

G_M25064_IG20:
       movsxd   rdx, edx
       add      rdx, r12
       cmp      r10, rdx
       mov      dword ptr [rbp-64H], ecx
       mov      dword ptr [rbp-74H], r8d
       jae      SHORT G_M25064_IG22

G_M25064_IG21:
       movzx    r9, byte  ptr [r10]
       mov      r9d, r9d
       movzx    r15, byte  ptr [r10+1]
       mov      r15d, r15d
       movzx    r8, byte  ptr [r10+2]
       mov      r8d, r8d
       movzx    rcx, byte  ptr [r10+3]
       mov      ecx, ecx
       movsx    r9, byte  ptr [rdi+r9]
       movsx    r15, byte  ptr [rdi+r15]
       movsx    r8, byte  ptr [rdi+r8]
       movsx    rcx, byte  ptr [rdi+rcx]
       shl      r15d, 12
       shl      r8d, 6
       or       r15d, r8d
       shl      r9d, 18
       or       r9d, ecx
       mov      ecx, r9d
       or       ecx, r15d
       test     ecx, ecx
       jl       G_M25064_IG34
       mov      r8d, ecx
       sar      r8d, 16
       mov      byte  ptr [r11], r8b
       mov      r8d, ecx
       sar      r8d, 8
       mov      byte  ptr [r11+1], r8b
       mov      byte  ptr [r11+2], cl
       add      r10, 4
       add      r11, 3
       cmp      r10, rdx
       jb       SHORT G_M25064_IG21

G_M25064_IG22:
       cmp      dword ptr [rbp-74H], 0
       jne      G_M25064_IG30
       cmp      r10, rax
       jne      SHORT G_M25064_IG23
       cmp      byte  ptr [rbp+10H], 0
       je       G_M25064_IG32
       jmp      G_M25064_IG34

G_M25064_IG23:
       movzx    rdx, byte  ptr [rax-4]
       movzx    rcx, byte  ptr [rax-3]
       movzx    r8, byte  ptr [rax-2]
       movzx    rax, byte  ptr [rax-1]
       mov      edx, edx
       movsx    rdx, byte  ptr [rdi+rdx]
       mov      ecx, ecx
       movsx    rcx, byte  ptr [rdi+rcx]
       shl      edx, 18
       shl      ecx, 12
       or       edx, ecx
       mov      ecx, dword ptr [rbp-64H]
       movsxd   rcx, ecx
       add      rcx, r13
       cmp      eax, 61
       je       SHORT G_M25064_IG24
       mov      r8d, r8d
       movsx    r8, byte  ptr [rdi+r8]
       mov      eax, eax
       movsx    rdi, byte  ptr [rdi+rax]
       shl      r8d, 6
       or       edx, edi
       or       edx, r8d
       test     edx, edx
       jl       G_M25064_IG34
       lea      rax, [r11+3]
       cmp      rax, rcx
       ja       G_M25064_IG30
       mov      ecx, edx
       sar      ecx, 16
       mov      byte  ptr [r11], cl
       mov      eax, edx
       sar      eax, 8
       mov      byte  ptr [r11+1], al
       mov      byte  ptr [r11+2], dl
       add      r11, 3
       jmp      SHORT G_M25064_IG26

G_M25064_IG24:
       cmp      r8d, 61
       je       SHORT G_M25064_IG25
       mov      eax, r8d
       movsx    rax, byte  ptr [rdi+rax]
       shl      eax, 6
       or       edx, eax
       test     edx, edx
       jl       G_M25064_IG34
       lea      rax, [r11+2]
       cmp      rax, rcx
       ja       SHORT G_M25064_IG30
       mov      ecx, edx
       sar      ecx, 16
       mov      byte  ptr [r11], cl
       sar      edx, 8
       mov      byte  ptr [r11+1], dl
       add      r11, 2
       jmp      SHORT G_M25064_IG26

G_M25064_IG25:
       test     edx, edx
       jl       G_M25064_IG34
       lea      rax, [r11+1]
       cmp      rax, rcx
       ja       SHORT G_M25064_IG30
       sar      edx, 16
       mov      byte  ptr [r11], dl
       inc      r11

G_M25064_IG26:
       add      r10, 4
       cmp      esi, dword ptr [rbp-30H]
       jne      G_M25064_IG34

G_M25064_IG27:
       mov      rax, r10
       sub      rax, r12
       mov      dword ptr [rbx], eax
       mov      rax, r11
       sub      rax, r13
       mov      dword ptr [r14], eax

G_M25064_IG28:
       xor      eax, eax

G_M25064_IG29:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M25064_IG30:
       cmp      esi, dword ptr [rbp-30H]
       setne    al
       movzx    rax, al
       mov      r15d, dword ptr [rbp+10H]
       movzx    rdi, r15b
       test     eax, edi
       jne      SHORT G_M25064_IG34
       mov      rax, r10
       sub      rax, r12
       mov      dword ptr [rbx], eax
       mov      rax, r11
       sub      rax, r13
       mov      dword ptr [r14], eax
       mov      eax, 1

G_M25064_IG31:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M25064_IG32:
       mov      rax, r10
       sub      rax, r12
       mov      dword ptr [rbx], eax
       mov      rax, r11
       sub      rax, r13
       mov      dword ptr [r14], eax
       mov      eax, 2

G_M25064_IG33:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M25064_IG34:
       sub      r10, r12
       mov      eax, r10d
       mov      dword ptr [rbx], eax
       sub      r11, r13
       mov      eax, r11d
       mov      dword ptr [r14], eax
       mov      eax, 3

G_M25064_IG35:
       vzeroupper
       lea      rsp, [rbp-28H]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret

G_M25064_IG36:
       xor      edi, edi
       call     ThrowHelper:ThrowArgumentOutOfRangeException(int)
       int3

G_M25064_IG37:
       call     CORINFO_HELP_RNGCHKFAIL
       int3

; Total bytes of code 1492, prolog size 72 for method Base64_1:DecodeFromUtf8(struct,struct,byref,byref,bool):int
; ============================================================
