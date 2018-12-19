; Assembly listing for method Program:Do(struct,ref)
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 arg0         [V00    ] (  5,  2.75)  struct (32) [rbp+0x10]   do-not-enreg[XSF] addr-exposed ld-addr-op
;  V01 arg1         [V01,T00] (  8,  5.50)     ref  ->  [rbp-0x08]   class-hnd
;# V02 OutArgs      [V02    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V03 tmp1         [V03,T02] (  7,  3.75)     int  ->  rsi        
;  V04 tmp2         [V04,T01] (  5,  5   )   byref  ->  rax        
;
; Lcl frame size = 16

G_M56185_IG01:
       55                   push     rbp
       4883EC10             sub      rsp, 16
       488D6C2410           lea      rbp, [rsp+10H]

G_M56185_IG02:
       8B7518               mov      esi, dword ptr [rbp+18H]
       837F0801             cmp      dword ptr [rdi+8], 1
       752F                 jne      SHORT G_M56185_IG04
       3B7528               cmp      esi, dword ptr [rbp+28H]
       7D24                 jge      SHORT G_M56185_IG03
       488D4520             lea      rax, bword ptr [rbp+20H]
       3B7008               cmp      esi, dword ptr [rax+8]
       733B                 jae      SHORT G_M56185_IG08
       488B00               mov      rax, bword ptr [rax]
       4863D6               movsxd   rdx, esi
       837F0800             cmp      dword ptr [rdi+8], 0
       762F                 jbe      SHORT G_M56185_IG08
       0FB77F0C             movzx    rdi, word  ptr [rdi+12]
       66893C50             mov      word  ptr [rax+2*rdx], di
       FFC6                 inc      esi
       897518               mov      dword ptr [rbp+18H], esi
       EB19                 jmp      SHORT G_M56185_IG06

G_M56185_IG03:
       48897DF8             mov      gword ptr [rbp-08H], rdi
       EB06                 jmp      SHORT G_M56185_IG05

G_M56185_IG04:
       48897DF8             mov      gword ptr [rbp-08H], rdi
       EB00                 jmp      SHORT G_M56185_IG05

G_M56185_IG05:
       488D7D10             lea      rdi, bword ptr [rbp+10H]
       488B75F8             mov      rsi, gword ptr [rbp-08H]
       E84BFBFFFF           call     ValueStringBuilder:AppendSlow(ref):this

G_M56185_IG06:
       90                   nop      

G_M56185_IG07:
       488D6500             lea      rsp, [rbp]
       5D                   pop      rbp
       C3                   ret      

G_M56185_IG08:
       E8DF5D1379           call     CORINFO_HELP_RNGCHKFAIL
       CC                   int3     

; Total bytes of code 98, prolog size 10 for method Program:Do(struct,ref)
; ============================================================
; Assembly listing for method ValueStringBuilder:AppendSlow(ref):this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] ( 15, 14   )   byref  ->  rbx         this
;  V01 arg1         [V01,T05] (  6,  5   )     ref  ->  r14         class-hnd
;  V02 loc0         [V02,T03] (  8,  8   )     int  ->  r15        
;* V03 loc1         [V03    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op
;# V04 OutArgs      [V04    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;* V05 tmp1         [V05    ] (  0,  0   )  struct (16) zero-ref   
;  V06 tmp2         [V06,T04] (  4,  8   )   byref  ->  rsi        
;* V07 tmp3         [V07    ] (  0,  0   )  struct (16) zero-ref   
;* V08 tmp4         [V08    ] (  0,  0   )  struct (16) zero-ref   
;* V09 tmp5         [V09    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op
;  V10 tmp6         [V10,T14] (  2,  2   )   byref  ->  rdx        
;* V11 tmp7         [V11    ] (  0,  0   )  struct ( 8) zero-ref   
;  V12 tmp8         [V12,T12] (  3,  3   )     int  ->  rdi        
;  V13 tmp9         [V13,T01] (  5, 10   )   byref  ->  r12        
;* V14 tmp10        [V14    ] (  0,  0   )  struct ( 8) zero-ref    ld-addr-op
;* V15 tmp11        [V15    ] (  0,  0   )  struct (16) zero-ref   
;* V16 tmp12        [V16    ] (  0,  0   )   byref  ->  zero-ref   
;* V17 tmp13        [V17    ] (  0,  0   )   byref  ->  zero-ref   
;* V18 tmp14        [V18    ] (  0,  0   )  struct ( 8) zero-ref   
;  V19 tmp15        [V19,T08] (  3,  6   )     int  ->  rsi        
;* V20 tmp16        [V20    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op
;* V21 tmp17        [V21    ] (  0,  0   )     int  ->  zero-ref   
;* V22 tmp18        [V22    ] (  0,  0   )  struct ( 8) zero-ref    ld-addr-op
;  V23 tmp19        [V23,T09] (  2,  4   )   byref  ->  rax        
;  V24 tmp20        [V24,T10] (  2,  4   )   byref  ->  [rbp-0x30]  
;  V25 tmp21        [V25,T11] (  2,  4   )    long  ->  rdi        
;* V26 tmp22        [V26    ] (  0,  0   )   byref  ->  zero-ref   
;* V27 tmp23        [V27    ] (  0,  0   )   byref  ->  zero-ref   
;* V28 tmp24        [V28    ] (  0,  0   )   byref  ->  zero-ref   
;* V29 tmp25        [V29    ] (  0,  0   )   byref  ->  zero-ref   
;  V30 tmp26        [V30,T15] (  2,  2   )   byref  ->  rdx         V03._pointer(offs=0x00) P-INDEP
;  V31 tmp27        [V31,T13] (  3,  3   )     int  ->  rdi         V03._length(offs=0x08) P-INDEP
;  V32 tmp28        [V32,T16] (  2,  2   )   byref  ->  rax         V05._pointer(offs=0x00) P-INDEP
;  V33 tmp29        [V33,T21] (  2,  2   )     int  ->  rsi         V05._length(offs=0x08) P-INDEP
;  V34 tmp30        [V34,T24] (  2,  1.50)   byref  ->  rdx         V07._pointer(offs=0x00) P-INDEP
;  V35 tmp31        [V35,T25] (  2,  1.50)     int  ->  rdi         V07._length(offs=0x08) P-INDEP
;  V36 tmp32        [V36,T26] (  2,  1   )   byref  ->  rdx         V08._pointer(offs=0x00) P-INDEP
;  V37 tmp33        [V37,T28] (  2,  1   )     int  ->  rdi         V08._length(offs=0x08) P-INDEP
;* V38 tmp34        [V38    ] (  0,  0   )   byref  ->  zero-ref    V09._pointer(offs=0x00) P-INDEP
;* V39 tmp35        [V39    ] (  0,  0   )     int  ->  zero-ref    V09._length(offs=0x08) P-INDEP
;  V40 tmp36        [V40,T27] (  2,  1   )   byref  ->  rdx         V11._value(offs=0x00) P-INDEP
;  V41 tmp37        [V41,T17] (  2,  2   )   byref  ->  rax         V14._value(offs=0x00) P-INDEP
;  V42 tmp38        [V42,T18] (  2,  2   )   byref  ->  rax         V15._pointer(offs=0x00) P-INDEP
;  V43 tmp39        [V43,T22] (  2,  2   )     int  ->  rsi         V15._length(offs=0x08) P-INDEP
;  V44 tmp40        [V44,T19] (  2,  2   )   byref  ->  rax         V18._value(offs=0x00) P-INDEP
;  V45 tmp41        [V45,T20] (  2,  2   )   byref  ->  rax         V20._pointer(offs=0x00) P-INDEP
;  V46 tmp42        [V46,T23] (  2,  2   )     int  ->  rsi         V20._length(offs=0x08) P-INDEP
;* V47 tmp43        [V47    ] (  0,  0   )   byref  ->  zero-ref    V22._value(offs=0x00) P-INDEP
;  V48 cse0         [V48,T07] (  6,  6   )     int  ->  rsi        
;  V49 cse1         [V49,T02] ( 10,  8   )     int  ->  r13        
;  V50 cse2         [V50,T06] (  6,  6   )   byref  ->  r12        
;
; Lcl frame size = 8

G_M29202_IG01:
       55                   push     rbp
       4157                 push     r15
       4156                 push     r14
       4155                 push     r13
       4154                 push     r12
       53                   push     rbx
       50                   push     rax
       488D6C2430           lea      rbp, [rsp+30H]
       488BDF               mov      rbx, rdi
       4C8BF6               mov      r14, rsi

G_M29202_IG02:
       448B7B08             mov      r15d, dword ptr [rbx+8]
       391B                 cmp      dword ptr [rbx], ebx
       4C8D6310             lea      r12, bword ptr [rbx+16]
       498BF4               mov      rsi, r12
       8B7608               mov      esi, dword ptr [rsi+8]
       458B6E08             mov      r13d, dword ptr [r14+8]
       412BF5               sub      esi, r13d
       413BF7               cmp      esi, r15d
       7D0B                 jge      SHORT G_M29202_IG03
       418BF5               mov      esi, r13d
       488BFB               mov      rdi, rbx
       E813F7FFFF           call     ValueStringBuilder:Grow(int):this

G_M29202_IG03:
       498D560C             lea      rdx, bword ptr [r14+12]
       418BFD               mov      edi, r13d
       391B                 cmp      dword ptr [rbx], ebx
       418B742408           mov      esi, dword ptr [r12+8]
       443BFE               cmp      r15d, esi
       773E                 ja       SHORT G_M29202_IG06

G_M29202_IG04:
       498B0424             mov      rax, bword ptr [r12]
       412BF7               sub      esi, r15d
       4963CF               movsxd   rcx, r15d
       488D0448             lea      rax, bword ptr [rax+2*rcx]
       3BFE                 cmp      edi, esi
       7732                 ja       SHORT G_M29202_IG07
       488955D0             mov      bword ptr [rbp-30H], rdx
       4863FF               movsxd   rdi, edi
       488BD7               mov      rdx, rdi
       48D1E2               shl      rdx, 1
       488BF8               mov      rdi, rax
       488B75D0             mov      rsi, bword ptr [rbp-30H]
       E8F55FA1FF           call     Buffer:Memmove(byref,byref,long)
       44016B08             add      dword ptr [rbx+8], r13d

G_M29202_IG05:
       488D65D8             lea      rsp, [rbp-28H]
       5B                   pop      rbx
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret      

G_M29202_IG06:
       E85DEBA1FF           call     ThrowHelper:ThrowArgumentOutOfRangeException()
       CC                   int3     

G_M29202_IG07:
       E887EBA1FF           call     ThrowHelper:ThrowArgumentException_DestinationTooShort()
       CC                   int3     

; Total bytes of code 154, prolog size 16 for method ValueStringBuilder:AppendSlow(ref):this
; ============================================================
