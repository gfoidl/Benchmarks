-2017429323857788928 -2017429323857788927 -2017429323857788926 -2017429323857788925 -2017429323857788924 
-2017429323857788924 -2017429323857788925 -2017429323857788926 -2017429323857788927 -2017429323857788928 
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
;* V05 tmp4         [V05    ] (  0,  0   )    long  ->  zero-ref    ld-addr-op "Inline ldloca(s) first use temp"
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

G_M55403_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp
       90                   nop      

G_M55403_IG02:
       488B7F08             mov      rdi, gword ptr [rdi+8]
       4885FF               test     rdi, rdi
       7506                 jne      SHORT G_M55403_IG04

G_M55403_IG03:		;; bbWeight=0.50
       33FF                 xor      rdi, rdi
       33F6                 xor      esi, esi
       EB0A                 jmp      SHORT G_M55403_IG05

G_M55403_IG04:		;; bbWeight=0.50
       488D7710             lea      rsi, bword ptr [rdi+16]
       8B7F08               mov      edi, dword ptr [rdi+8]
       4887F7               xchg     rsi, rdi

G_M55403_IG05:
       83FE01               cmp      esi, 1
       7E05                 jle      SHORT G_M55403_IG07

G_M55403_IG06:		;; bbWeight=0.50
       E89076FFFF           call     Bench`1:ReverseVectorized(byref,int)

G_M55403_IG07:
       90                   nop      

G_M55403_IG08:
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 43, prolog size 5, perf score 12.05, (MethodHash=fd3b27b0) for method Bench`1:ReverseVectorized():this
; ============================================================
; Assembly listing for method Bench`1:ReverseVectorized(byref,int)
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T05] (  4,  4   )   byref  ->  rdi        
;  V01 arg1         [V01,T06] (  4,  4   )     int  ->  rsi        
;  V02 loc0         [V02    ] (  2,  1.50)   byref  ->  [rbp-0x08]   must-init pinned
;  V03 loc1         [V03,T04] ( 10,  6   )    long  ->  rdi        
;  V04 loc2         [V04,T07] (  9,  5   )    long  ->  rax        
;  V05 loc3         [V05,T00] ( 21, 63   )    long  ->  rdi        
;  V06 loc4         [V06,T01] ( 21, 63   )    long  ->  rax        
;  V07 loc5         [V07,T09] (  8, 32   )  simd32  ->  mm0        
;  V08 loc6         [V08,T10] (  8, 32   )  simd32  ->  mm1        
;  V09 loc7         [V09,T11] (  5, 20   )  simd16  ->  mm0        
;  V10 loc8         [V10,T12] (  5, 20   )  simd16  ->  mm1        
;  V11 loc9         [V11,T02] (  2,  8   )    long  ->  rsi        
;  V12 loc10        [V12,T03] (  2,  8   )    long  ->  rdx        
;# V13 OutArgs      [V13    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;* V14 tmp1         [V14    ] (  0,  0   )    long  ->  zero-ref    "dup spill"
;  V15 tmp2         [V15,T08] (  2,  4   )    long  ->  rdi         "Cast away GC"
;
; Lcl frame size = 16

G_M55375_IG01:
       55                   push     rbp
       4883EC10             sub      rsp, 16
       C5F877               vzeroupper 
       488D6C2410           lea      rbp, [rsp+10H]
       33C0                 xor      rax, rax
       488945F8             mov      qword ptr [rbp-08H], rax

G_M55375_IG02:
       48897DF8             mov      bword ptr [rbp-08H], rdi
       4863C6               movsxd   rax, esi
       488D04C7             lea      rax, [rdi+8*rax]
       83FE08               cmp      esi, 8
       7C59                 jl       SHORT G_M55375_IG07

G_M55375_IG03:		;; bbWeight=0.50
       4883C720             add      rdi, 32
       4883C0E0             add      rax, -32

G_M55375_IG04:		;; bbWeight=4   
       C5FE6F47E0           vmovdqu  ymm0, ymmword ptr[rdi-32]
       C5FE6F08             vmovdqu  ymm1, ymmword ptr[rax]
       C4E37D0FC008         vpalignr ymm0, ymm0, ymm0, 8
       C4E3750FC908         vpalignr ymm1, ymm1, ymm1, 8
       C4E37D46C001         vperm2i128 ymm0, ymm0, ymm0, 1
       C4E37546C901         vperm2i128 ymm1, ymm1, ymm1, 1
       C5FE7F4FE0           vmovdqu  ymmword ptr[rdi-32], ymm1
       C5FE7F00             vmovdqu  ymmword ptr[rax], ymm0
       4883C720             add      rdi, 32
       4883C0E0             add      rax, -32
       483BF8               cmp      rdi, rax
       76C9                 jbe      SHORT G_M55375_IG04

G_M55375_IG05:		;; bbWeight=0.50
       4883C7E0             add      rdi, -32
       4883C020             add      rax, 32
       483BF8               cmp      rdi, rax
       7209                 jb       SHORT G_M55375_IG07

G_M55375_IG06:		;; bbWeight=0.50
       C5F877               vzeroupper 
       488D6500             lea      rsp, [rbp]
       5D                   pop      rbp
       C3                   ret      

G_M55375_IG07:		;; bbWeight=0.50
       488BF0               mov      rsi, rax
       482BF7               sub      rsi, rdi
       4883FE20             cmp      rsi, 32
       7C4D                 jl       SHORT G_M55375_IG11
       4883C710             add      rdi, 16
       4883C0F0             add      rax, -16

G_M55375_IG08:		;; bbWeight=4   
       C5FA6F47F0           vmovdqu  xmm0, xmmword ptr [rdi-16]
       C5FA6F08             vmovdqu  xmm1, xmmword ptr [rax]
       C4E3790FC008         vpalignr xmm0, xmm0, xmm0, 8
       C4E3710FC908         vpalignr xmm1, xmm1, xmm1, 8
       C5FA7F4FF0           vmovdqu  xmmword ptr [rdi-16], xmm1
       C5FA7F00             vmovdqu  xmmword ptr [rax], xmm0
       4883C710             add      rdi, 16
       4883C0F0             add      rax, -16
       483BF8               cmp      rdi, rax
       76D5                 jbe      SHORT G_M55375_IG08

G_M55375_IG09:		;; bbWeight=0.50
       4883C7F0             add      rdi, -16
       4883C010             add      rax, 16
       483BF8               cmp      rdi, rax
       7209                 jb       SHORT G_M55375_IG11

G_M55375_IG10:		;; bbWeight=0.50
       C5F877               vzeroupper 
       488D6500             lea      rsp, [rbp]
       5D                   pop      rbp
       C3                   ret      

G_M55375_IG11:		;; bbWeight=0.50
       4883C0F8             add      rax, -8
       483BF8               cmp      rdi, rax
       7319                 jae      SHORT G_M55375_IG13

G_M55375_IG12:		;; bbWeight=4   
       488B37               mov      rsi, qword ptr [rdi]
       488B10               mov      rdx, qword ptr [rax]
       488917               mov      qword ptr [rdi], rdx
       488930               mov      qword ptr [rax], rsi
       4883C708             add      rdi, 8
       4883C0F8             add      rax, -8
       483BF8               cmp      rdi, rax
       72E7                 jb       SHORT G_M55375_IG12

G_M55375_IG13:		;; bbWeight=0.50
       33C0                 xor      rax, rax
       488945F8             mov      bword ptr [rbp-08H], rax

G_M55375_IG14:		;; bbWeight=0.50
       C5F877               vzeroupper 
       488D6500             lea      rsp, [rbp]
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 254, prolog size 19, perf score 151.20, (MethodHash=fd3b27b0) for method Bench`1:ReverseVectorized(byref,int)
; ============================================================
-2017429323857788928 -2017429323857788927 -2017429323857788926 -2017429323857788925 -2017429323857788924 
