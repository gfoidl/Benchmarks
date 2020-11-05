((0, 1), (2, 3)) ((4, 5), (6, 7)) ((8, 9), (10, 11)) ((12, 13), (14, 15)) ((16, 17), (18, 19)) 
((16, 17), (18, 19)) ((12, 13), (14, 15)) ((8, 9), (10, 11)) ((4, 5), (6, 7)) ((0, 1), (2, 3)) 
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
;* V05 tmp4         [V05    ] (  0,  0   )  struct (32) zero-ref    do-not-enreg[SB] ld-addr-op "Inline ldloca(s) first use temp"
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

G_M58312_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp
       90                   nop      

G_M58312_IG02:
       488B7F08             mov      rdi, gword ptr [rdi+8]
       4885FF               test     rdi, rdi
       7506                 jne      SHORT G_M58312_IG04

G_M58312_IG03:		;; bbWeight=0.50
       33FF                 xor      rdi, rdi
       33F6                 xor      esi, esi
       EB0A                 jmp      SHORT G_M58312_IG05

G_M58312_IG04:		;; bbWeight=0.50
       488D7710             lea      rsi, bword ptr [rdi+16]
       8B7F08               mov      edi, dword ptr [rdi+8]
       4887F7               xchg     rsi, rdi

G_M58312_IG05:
       83FE01               cmp      esi, 1
       7E05                 jle      SHORT G_M58312_IG07

G_M58312_IG06:		;; bbWeight=0.50
       E8E07BFFFF           call     Bench`1:ReverseVectorized(byref,int)

G_M58312_IG07:
       90                   nop      

G_M58312_IG08:
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 43, prolog size 5, perf score 12.05, (MethodHash=95d21c53) for method Bench`1:ReverseVectorized():this
; ============================================================
; Assembly listing for method Bench`1:ReverseVectorized(byref,int)
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T02] (  4,  4   )   byref  ->  rdi        
;  V01 arg1         [V01,T03] (  3,  3   )     int  ->  rsi        
;  V02 loc0         [V02    ] (  2,  2   )   byref  ->  [rbp-0x08]   must-init pinned
;* V03 loc1         [V03    ] (  0,  0   )    long  ->  zero-ref   
;  V04 loc2         [V04,T00] (  8, 23   )    long  ->  rdi        
;  V05 loc3         [V05,T01] (  7, 22   )    long  ->  rax        
;  V06 loc4         [V06,T05] (  2,  8   )  simd32  ->  mm0        
;  V07 loc5         [V07,T06] (  2,  8   )  simd32  ->  mm1        
;# V08 OutArgs      [V08    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;* V09 tmp1         [V09    ] (  0,  0   )    long  ->  zero-ref    "dup spill"
;  V10 tmp2         [V10,T04] (  2,  4   )    long  ->  rdi         "Cast away GC"
;
; Lcl frame size = 16

G_M58284_IG01:
       55                   push     rbp
       4883EC10             sub      rsp, 16
       C5F877               vzeroupper 
       488D6C2410           lea      rbp, [rsp+10H]
       33C0                 xor      rax, rax
       488945F8             mov      qword ptr [rbp-08H], rax

G_M58284_IG02:
       48897DF8             mov      bword ptr [rbp-08H], rdi
       4863C6               movsxd   rax, esi
       48C1E005             shl      rax, 5
       488D4407E0           lea      rax, [rdi+rax-32]
       483BF8               cmp      rdi, rax
       7321                 jae      SHORT G_M58284_IG04

G_M58284_IG03:		;; bbWeight=4   
       C5FD1007             vmovupd  ymm0, ymmword ptr[rdi]
       C5FD1008             vmovupd  ymm1, ymmword ptr[rax]
       C5FD110F             vmovupd  ymmword ptr[rdi], ymm1
       C5FD1100             vmovupd  ymmword ptr[rax], ymm0
       4883C720             add      rdi, 32
       4883C0E0             add      rax, -32
       483BF8               cmp      rdi, rax
       72E3                 jb       SHORT G_M58284_IG03

G_M58284_IG04:
       33C0                 xor      rax, rax
       488945F8             mov      bword ptr [rbp-08H], rax

G_M58284_IG05:
       C5F877               vzeroupper 
       488D6500             lea      rsp, [rbp]
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 84, prolog size 19, perf score 54.55, (MethodHash=95d21c53) for method Bench`1:ReverseVectorized(byref,int)
; ============================================================
((0, 1), (2, 3)) ((4, 5), (6, 7)) ((8, 9), (10, 11)) ((12, 13), (14, 15)) ((16, 17), (18, 19)) 
