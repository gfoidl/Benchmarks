00 01 02 03 04 
04 03 02 01 00 
; Assembly listing for method Bench`1:ReverseVectorized():this
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T01] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;* V02 tmp1         [V02    ] (  0,  0   )  struct (16) zero-ref    "struct address for call/obj"
;  V03 tmp2         [V03,T00] (  4,  6   )     ref  ->  rdi         class-hnd "Inlining Arg"
;* V04 tmp3         [V04    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V05 tmp4         [V05    ] (  0,  0   )   ubyte  ->  zero-ref    ld-addr-op "Inline ldloca(s) first use temp"
;* V06 tmp5         [V06    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;  V07 tmp6         [V07,T05] (  2,  2   )   byref  ->  rsi         "Inlining Arg"
;* V08 tmp7         [V08    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;  V09 tmp8         [V09,T02] (  3,  2.50)     int  ->  rsi         "Inline stloc first use temp"
;* V10 tmp9         [V10    ] (  0,  0   )     int  ->  zero-ref    "impAppendStmt"
;* V11 tmp10        [V11    ] (  0,  0   )     int  ->  zero-ref    "impAppendStmt"
;* V12 tmp11        [V12    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V13 tmp12        [V13    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V14 tmp13        [V14    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V15 tmp14        [V15    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V16 tmp15        [V16    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V17 tmp16        [V17    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V18 tmp17        [V18    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V19 tmp18        [V19    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V20 tmp19        [V20    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V21 tmp20        [V21    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V22 tmp21        [V22    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V23 tmp22        [V23    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;* V24 tmp23        [V24    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;  V25 tmp24        [V25,T06] (  2,  2   )   byref  ->  rdi         V02._pointer(offs=0x00) P-INDEP "field V02._pointer (fldOffset=0x0)"
;  V26 tmp25        [V26,T07] (  2,  2   )     int  ->  rsi         V02._length(offs=0x08) P-INDEP "field V02._length (fldOffset=0x8)"
;  V27 tmp26        [V27,T03] (  3,  2   )   byref  ->  registers   V04._pointer(offs=0x00) P-INDEP "field V04._pointer (fldOffset=0x0)"
;  V28 tmp27        [V28,T04] (  3,  2   )     int  ->  registers   V04._length(offs=0x08) P-INDEP "field V04._length (fldOffset=0x8)"
;  V29 tmp28        [V29,T10] (  2,  1   )   byref  ->  rsi         V06._value(offs=0x00) P-INDEP "field V06._value (fldOffset=0x0)"
;  V30 tmp29        [V30,T09] (  2,  1.50)   byref  ->  rdi         V08._pointer(offs=0x00) P-INDEP "field V08._pointer (fldOffset=0x0)"
;  V31 tmp30        [V31,T08] (  2,  2   )     int  ->  rsi         V08._length(offs=0x08) P-INDEP "field V08._length (fldOffset=0x8)"
;* V32 tmp31        [V32    ] (  0,  0   )   byref  ->  zero-ref    V12._pointer(offs=0x00) P-INDEP "field V12._pointer (fldOffset=0x0)"
;* V33 tmp32        [V33    ] (  0,  0   )     int  ->  zero-ref    V12._length(offs=0x08) P-INDEP "field V12._length (fldOffset=0x8)"
;* V34 tmp33        [V34    ] (  0,  0   )   byref  ->  zero-ref    V14._pointer(offs=0x00) P-INDEP "field V14._pointer (fldOffset=0x0)"
;* V35 tmp34        [V35    ] (  0,  0   )     int  ->  zero-ref    V14._length(offs=0x08) P-INDEP "field V14._length (fldOffset=0x8)"
;* V36 tmp35        [V36    ] (  0,  0   )   byref  ->  zero-ref    V16._pointer(offs=0x00) P-INDEP "field V16._pointer (fldOffset=0x0)"
;* V37 tmp36        [V37    ] (  0,  0   )     int  ->  zero-ref    V16._length(offs=0x08) P-INDEP "field V16._length (fldOffset=0x8)"
;* V38 tmp37        [V38    ] (  0,  0   )   byref  ->  zero-ref    V18._pointer(offs=0x00) P-INDEP "field V18._pointer (fldOffset=0x0)"
;* V39 tmp38        [V39    ] (  0,  0   )     int  ->  zero-ref    V18._length(offs=0x08) P-INDEP "field V18._length (fldOffset=0x8)"
;* V40 tmp39        [V40    ] (  0,  0   )   byref  ->  zero-ref    V20._pointer(offs=0x00) P-INDEP "field V20._pointer (fldOffset=0x0)"
;* V41 tmp40        [V41    ] (  0,  0   )     int  ->  zero-ref    V20._length(offs=0x08) P-INDEP "field V20._length (fldOffset=0x8)"
;* V42 tmp41        [V42    ] (  0,  0   )   byref  ->  zero-ref    V22._pointer(offs=0x00) P-INDEP "field V22._pointer (fldOffset=0x0)"
;* V43 tmp42        [V43    ] (  0,  0   )     int  ->  zero-ref    V22._length(offs=0x08) P-INDEP "field V22._length (fldOffset=0x8)"
;* V44 tmp43        [V44    ] (  0,  0   )   byref  ->  zero-ref    V24._pointer(offs=0x00) P-INDEP "field V24._pointer (fldOffset=0x0)"
;* V45 tmp44        [V45    ] (  0,  0   )     int  ->  zero-ref    V24._length(offs=0x08) P-INDEP "field V24._length (fldOffset=0x8)"
;
; Lcl frame size = 0

G_M16464_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp
       90                   nop      

G_M16464_IG02:
       488B7F08             mov      rdi, gword ptr [rdi+8]
       4885FF               test     rdi, rdi
       7506                 jne      SHORT G_M16464_IG04

G_M16464_IG03:		;; bbWeight=0.50
       33FF                 xor      rdi, rdi
       33F6                 xor      esi, esi
       EB0A                 jmp      SHORT G_M16464_IG05

G_M16464_IG04:		;; bbWeight=0.50
       488D7710             lea      rsi, bword ptr [rdi+16]
       8B7F08               mov      edi, dword ptr [rdi+8]
       4887F7               xchg     rsi, rdi

G_M16464_IG05:
       83FE01               cmp      esi, 1
       7E05                 jle      SHORT G_M16464_IG07

G_M16464_IG06:		;; bbWeight=0.50
       E8E878FFFF           call     Bench`1:ReverseVectorized(byref,int)

G_M16464_IG07:
       90                   nop      

G_M16464_IG08:
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 43, prolog size 5, perf score 12.05, (MethodHash=74cbbfcb) for method Bench`1:ReverseVectorized():this
; ============================================================
; Assembly listing for method Bench`1:ReverseVectorized(byref,int)
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T12] (  4,  4   )   byref  ->  rdi        
;  V01 arg1         [V01,T13] (  4,  4   )     int  ->  rsi        
;  V02 loc0         [V02    ] (  2,  1.50)   byref  ->  [rbp-0x08]   must-init pinned
;  V03 loc1         [V03,T08] ( 22, 12   )    long  ->  rdi        
;  V04 loc2         [V04,T09] ( 21, 11   )    long  ->  rax        
;  V05 loc3         [V05,T00] ( 42,126   )    long  ->  rdi        
;  V06 loc4         [V06,T01] ( 42,126   )    long  ->  rax        
;  V07 loc5         [V07,T21] (  5, 10   )  simd16  ->  mm0         ld-addr-op
;  V08 loc6         [V08,T22] (  3,  8.50)  simd32  ->  mm1        
;  V09 loc7         [V09,T17] (  7, 28   )  simd32  ->  mm2        
;  V10 loc8         [V10,T18] (  7, 28   )  simd32  ->  mm3        
;  V11 loc9         [V11,T19] (  4, 16   )  simd16  ->  mm1        
;  V12 loc10        [V12,T20] (  4, 16   )  simd16  ->  mm2        
;  V13 loc11        [V13,T02] (  4, 16   )    long  ->  rsi        
;  V14 loc12        [V14,T03] (  4, 16   )    long  ->  rdx        
;  V15 loc13        [V15,T04] (  4, 16   )     int  ->  rsi        
;  V16 loc14        [V16,T05] (  4, 16   )     int  ->  rdx        
;  V17 loc15        [V17,T06] (  4, 16   )   short  ->  rsi        
;  V18 loc16        [V18,T07] (  4, 16   )   short  ->  rdx        
;  V19 loc17        [V19,T10] (  2,  8   )   ubyte  ->  rsi        
;  V20 loc18        [V20,T11] (  2,  8   )   ubyte  ->  rdx        
;# V21 OutArgs      [V21    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;* V22 tmp1         [V22    ] (  0,  0   )    long  ->  zero-ref    "dup spill"
;* V23 tmp2         [V23    ] (  0,  0   )  struct (16) zero-ref    "NewObj constructor temp"
;* V24 tmp3         [V24    ] (  0,  0   )  struct ( 8) zero-ref    "NewObj constructor temp"
;* V25 tmp4         [V25    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op "Inlining Arg"
;* V26 tmp5         [V26    ] (  0,  0   )   byref  ->  zero-ref    "Inlining Arg"
;  V27 tmp6         [V27,T27] (  2,  1   )  simd32  ->  mm1         "Inline return value spill temp"
;  V28 tmp7         [V28,T23] (  2,  2   )  simd16  ->  mm1         "Inlining Arg"
;  V29 tmp8         [V29,T28] (  2,  1   )  simd32  ->  mm1         "Inline stloc first use temp"
;  V30 tmp9         [V30,T24] (  2,  2   )  simd16  ->  mm2         "Inlining Arg"
;  V31 tmp10        [V31,T29] (  2,  1   )  simd32  ->  mm1         "Inline return value spill temp"
;  V32 tmp11        [V32,T25] (  2,  2   )  simd32  ->  mm1         "Inlining Arg"
;  V33 tmp12        [V33,T26] (  2,  2   )  simd16  ->  mm2         "Inlining Arg"
;* V34 tmp13        [V34,T15] (  0,  0   )   byref  ->  zero-ref    V23._pointer(offs=0x00) P-INDEP "field V23._pointer (fldOffset=0x0)"
;* V35 tmp14        [V35    ] (  0,  0   )     int  ->  zero-ref    V23._length(offs=0x08) P-INDEP "field V23._length (fldOffset=0x8)"
;* V36 tmp15        [V36,T16] (  0,  0   )   byref  ->  zero-ref    V24._value(offs=0x00) P-INDEP "field V24._value (fldOffset=0x0)"
;* V37 tmp16        [V37    ] (  0,  0   )   byref  ->  zero-ref    V25._pointer(offs=0x00) P-INDEP "field V25._pointer (fldOffset=0x0)"
;* V38 tmp17        [V38    ] (  0,  0   )     int  ->  zero-ref    V25._length(offs=0x08) P-INDEP "field V25._length (fldOffset=0x8)"
;  V39 tmp18        [V39,T14] (  2,  4   )    long  ->  rdi         "Cast away GC"
;
; Lcl frame size = 16

G_M16446_IG01:
       55                   push     rbp
       4883EC10             sub      rsp, 16
       C5F877               vzeroupper 
       488D6C2410           lea      rbp, [rsp+10H]
       33C0                 xor      rax, rax
       488945F8             mov      qword ptr [rbp-08H], rax

G_M16446_IG02:
       48897DF8             mov      bword ptr [rbp-08H], rdi
       4863C6               movsxd   rax, esi
       4803C7               add      rax, rdi
       48BA436DA9F4557F0000 mov      rdx, 0x7F55F4A96D43
       C5F91002             vmovupd  xmm0, xmmword ptr [rdx]
       81FE80000000         cmp      esi, 128
       7C63                 jl       SHORT G_M16446_IG06

G_M16446_IG03:		;; bbWeight=0.50
       C5F828C8             vmovaps  xmm1, xmm0
       C5F828D0             vmovaps  xmm2, xmm0
       C4E37538CA01         vinserti128 ymm1, ymm1, ymm2, 1
       4883C720             add      rdi, 32
       4883C0E0             add      rax, -32

G_M16446_IG04:		;; bbWeight=4   
       C5FE6F57E0           vmovdqu  ymm2, ymmword ptr[rdi-32]
       C5FE6F18             vmovdqu  ymm3, ymmword ptr[rax]
       C4E26D00D1           vpshufb  ymm2, ymm2, ymm1
       C4E26500D9           vpshufb  ymm3, ymm3, ymm1
       C4E36D46D201         vperm2i128 ymm2, ymm2, ymm2, 1
       C4E36546DB01         vperm2i128 ymm3, ymm3, ymm3, 1
       C5FE7F5FE0           vmovdqu  ymmword ptr[rdi-32], ymm3
       C5FE7F10             vmovdqu  ymmword ptr[rax], ymm2
       4883C720             add      rdi, 32
       4883C0E0             add      rax, -32
       483BF8               cmp      rdi, rax
       76CB                 jbe      SHORT G_M16446_IG04

G_M16446_IG05:		;; bbWeight=0.50
       4883C7E0             add      rdi, -32
       4883C020             add      rax, 32
       483BF8               cmp      rdi, rax
       0F8347010000         jae      G_M16446_IG21

G_M16446_IG06:		;; bbWeight=0.50
       488BF0               mov      rsi, rax
       482BF7               sub      rsi, rdi
       4883FE20             cmp      rsi, 32
       7C46                 jl       SHORT G_M16446_IG09
       4883C710             add      rdi, 16
       4883C0F0             add      rax, -16

G_M16446_IG07:		;; bbWeight=4   
       C5FA6F4FF0           vmovdqu  xmm1, xmmword ptr [rdi-16]
       C5FA6F10             vmovdqu  xmm2, xmmword ptr [rax]
       C4E27100C8           vpshufb  xmm1, xmm1, xmm0
       C4E26900D0           vpshufb  xmm2, xmm2, xmm0
       C5FA7F57F0           vmovdqu  xmmword ptr [rdi-16], xmm2
       C5FA7F08             vmovdqu  xmmword ptr [rax], xmm1
       4883C710             add      rdi, 16
       4883C0F0             add      rax, -16
       483BF8               cmp      rdi, rax
       76D7                 jbe      SHORT G_M16446_IG07

G_M16446_IG08:		;; bbWeight=0.50
       4883C7F0             add      rdi, -16
       4883C010             add      rax, 16
       483BF8               cmp      rdi, rax
       0F83F5000000         jae      G_M16446_IG21

G_M16446_IG09:		;; bbWeight=0.50
       488BF0               mov      rsi, rax
       482BF7               sub      rsi, rdi
       4883FE10             cmp      rsi, 16
       7C3A                 jl       SHORT G_M16446_IG12
       4883C708             add      rdi, 8
       4883C0F8             add      rax, -8

G_M16446_IG10:		;; bbWeight=4   
       488B77F8             mov      rsi, qword ptr [rdi-8]
       488B10               mov      rdx, qword ptr [rax]
       480FCE               bswap    rsi
       480FCA               bswap    rdx
       488957F8             mov      qword ptr [rdi-8], rdx
       488930               mov      qword ptr [rax], rsi
       4883C708             add      rdi, 8
       4883C0F8             add      rax, -8
       483BF8               cmp      rdi, rax
       76DF                 jbe      SHORT G_M16446_IG10

G_M16446_IG11:		;; bbWeight=0.50
       4883C7F8             add      rdi, -8
       4883C008             add      rax, 8
       483BF8               cmp      rdi, rax
       0F83AF000000         jae      G_M16446_IG21

G_M16446_IG12:		;; bbWeight=0.50
       488BF0               mov      rsi, rax
       482BF7               sub      rsi, rdi
       4883FE08             cmp      rsi, 8
       7C30                 jl       SHORT G_M16446_IG15
       4883C704             add      rdi, 4
       4883C0FC             add      rax, -4

G_M16446_IG13:		;; bbWeight=4   
       8B77FC               mov      esi, dword ptr [rdi-4]
       8B10                 mov      edx, dword ptr [rax]
       0FCE                 bswap    esi
       0FCA                 bswap    edx
       8957FC               mov      dword ptr [rdi-4], edx
       8930                 mov      dword ptr [rax], esi
       4883C704             add      rdi, 4
       4883C0FC             add      rax, -4
       483BF8               cmp      rdi, rax
       76E5                 jbe      SHORT G_M16446_IG13

G_M16446_IG14:		;; bbWeight=0.50
       4883C7FC             add      rdi, -4
       4883C004             add      rax, 4
       483BF8               cmp      rdi, rax
       7373                 jae      SHORT G_M16446_IG21

G_M16446_IG15:		;; bbWeight=0.50
       488BF0               mov      rsi, rax
       482BF7               sub      rsi, rdi
       4883FE04             cmp      rsi, 4
       7C42                 jl       SHORT G_M16446_IG18
       4883C702             add      rdi, 2
       4883C0FE             add      rax, -2

G_M16446_IG16:		;; bbWeight=4   
       480FBF77FE           movsx    rsi, word  ptr [rdi-2]
       480FBF10             movsx    rdx, word  ptr [rax]
       66C1CE08             ror      si, 8
       480FBFF6             movsx    rsi, si
       66C1CA08             ror      dx, 8
       480FBFD2             movsx    rdx, dx
       668957FE             mov      word  ptr [rdi-2], dx
       668930               mov      word  ptr [rax], si
       4883C702             add      rdi, 2
       4883C0FE             add      rax, -2
       483BF8               cmp      rdi, rax
       76D3                 jbe      SHORT G_M16446_IG16

G_M16446_IG17:		;; bbWeight=0.50
       4883C7FE             add      rdi, -2
       4883C002             add      rax, 2
       483BF8               cmp      rdi, rax
       7325                 jae      SHORT G_M16446_IG21

G_M16446_IG18:		;; bbWeight=0.50
       48FFC8               dec      rax
       483BF8               cmp      rdi, rax
       7317                 jae      SHORT G_M16446_IG20

G_M16446_IG19:		;; bbWeight=4   
       400FB637             movzx    rsi, byte  ptr [rdi]
       0FB610               movzx    rdx, byte  ptr [rax]
       8817                 mov      byte  ptr [rdi], dl
       408830               mov      byte  ptr [rax], sil
       48FFC7               inc      rdi
       48FFC8               dec      rax
       483BF8               cmp      rdi, rax
       72E9                 jb       SHORT G_M16446_IG19

G_M16446_IG20:		;; bbWeight=0.50
       33C0                 xor      rax, rax
       488945F8             mov      bword ptr [rbp-08H], rax

G_M16446_IG21:
       C5F877               vzeroupper 
       488D6500             lea      rsp, [rbp]
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 475, prolog size 19, perf score 301.60, (MethodHash=74cbbfcb) for method Bench`1:ReverseVectorized(byref,int)
; ============================================================
00 01 02 03 04 
