; Assembly listing for method Program:Do(struct,ref)
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 arg0         [V00    ] (  5,  2.75)  struct (32) [rbp+0x10]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V01 arg1         [V01,T00] (  6,  4.50)     ref  ->  rdi         class-hnd
;# V02 OutArgs      [V02    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;* V03 tmp1         [V03    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op
;  V04 tmp2         [V04,T01] (  4,  3   )     int  ->  [rbp-0x04]  
;  V05 tmp3         [V05,T05] (  4,  2.25)     int  ->  rdi        
;  V06 tmp4         [V06,T08] (  2,  2   )   byref  ->  rdx        
;* V07 tmp5         [V07    ] (  0,  0   )  struct (16) zero-ref   
;* V08 tmp6         [V08    ] (  0,  0   )  struct (16) zero-ref   
;* V09 tmp7         [V09    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op
;  V10 tmp8         [V10,T09] (  2,  2   )   byref  ->  rdx        
;* V11 tmp9         [V11    ] (  0,  0   )  struct ( 8) zero-ref   
;  V12 tmp10        [V12,T11] (  2,  2   )     int  ->  rdi        
;* V13 tmp11        [V13    ] (  0,  0   )  struct (16) zero-ref   
;* V14 tmp12        [V14    ] (  0,  0   )  struct ( 8) zero-ref    ld-addr-op
;* V15 tmp13        [V15    ] (  0,  0   )   byref  ->  zero-ref   
;* V16 tmp14        [V16    ] (  0,  0   )  struct (16) zero-ref   
;* V17 tmp15        [V17    ] (  0,  0   )  struct ( 8) zero-ref    ld-addr-op
;  V18 tmp16        [V18,T06] (  3,  2   )   byref  ->  rsi         V03._pointer(offs=0x00) P-INDEP
;* V19 tmp17        [V19,T18] (  0,  0   )     int  ->  zero-ref    V03._length(offs=0x08) P-INDEP
;  V20 tmp18        [V20,T07] (  3,  2   )   byref  ->  rsi         V07._pointer(offs=0x00) P-INDEP
;  V21 tmp19        [V21,T02] (  3,  2   )     int  ->  rdx         V07._length(offs=0x08) P-INDEP
;  V22 tmp20        [V22,T12] (  2,  1   )   byref  ->  rdx         V08._pointer(offs=0x00) P-INDEP
;  V23 tmp21        [V23,T16] (  2,  1   )     int  ->  rdi         V08._length(offs=0x08) P-INDEP
;  V24 tmp22        [V24,T13] (  2,  1   )   byref  ->  rsi         V09._pointer(offs=0x00) P-INDEP
;  V25 tmp23        [V25,T17] (  2,  1   )     int  ->  rdx         V09._length(offs=0x08) P-INDEP
;  V26 tmp24        [V26,T14] (  2,  1   )   byref  ->  rsi         V11._value(offs=0x00) P-INDEP
;  V27 tmp25        [V27,T15] (  2,  1   )   byref  ->  rcx         V13._pointer(offs=0x00) P-INDEP
;* V28 tmp26        [V28    ] (  0,  0   )     int  ->  zero-ref    V13._length(offs=0x08) P-INDEP
;* V29 tmp27        [V29    ] (  0,  0   )   byref  ->  zero-ref    V14._value(offs=0x00) P-INDEP
;* V30 tmp28        [V30    ] (  0,  0   )   byref  ->  zero-ref    V16._pointer(offs=0x00) P-INDEP
;* V31 tmp29        [V31    ] (  0,  0   )     int  ->  zero-ref    V16._length(offs=0x08) P-INDEP
;* V32 tmp30        [V32    ] (  0,  0   )   byref  ->  zero-ref    V17._value(offs=0x00) P-INDEP
;  V33 tmp31        [V33,T03] (  3,  3   )   byref  ->  rdx        
;  V34 tmp32        [V34    ] (  4,  5   )  struct (16) [rbp-0x18]   do-not-enreg[XSB] must-init addr-exposed
;  V35 tmp33        [V35,T04] (  3,  3   )   byref  ->  rcx         stack-byref
;  V36 tmp34        [V36,T10] (  2,  2   )   byref  ->  rdi        
;
; Lcl frame size = 32

G_M56192_IG01:
       55                   push     rbp
       4883EC20             sub      rsp, 32
       488D6C2420           lea      rbp, [rsp+20H]
       33C0                 xor      rax, rax
       488945E8             mov      qword ptr [rbp-18H], rax

G_M56192_IG02:
       4885FF               test     rdi, rdi
       7506                 jne      SHORT G_M56192_IG03
       33F6                 xor      rsi, rsi
       33D2                 xor      edx, edx
       EB15                 jmp      SHORT G_M56192_IG04

G_M56192_IG03:
       488D770C             lea      rsi, bword ptr [rdi+12]
       488BD6               mov      rdx, rsi
       8B7F08               mov      edi, dword ptr [rdi+8]
       488BF2               mov      rsi, rdx
       488BD6               mov      rdx, rsi
       488BF2               mov      rsi, rdx
       8BD7                 mov      edx, edi

G_M56192_IG04:
       8B7D18               mov      edi, dword ptr [rbp+18H]
       83FA01               cmp      edx, 1
       7523                 jne      SHORT G_M56192_IG05
       3B7D28               cmp      edi, dword ptr [rbp+28H]
       7D1E                 jge      SHORT G_M56192_IG05
       488D5520             lea      rdx, bword ptr [rbp+20H]
       488B0A               mov      rcx, bword ptr [rdx]
       8B5208               mov      edx, dword ptr [rdx+8]
       4863D7               movsxd   rdx, edi
       488D1451             lea      rdx, bword ptr [rcx+2*rdx]
       0FB736               movzx    rsi, word  ptr [rsi]
       668932               mov      word  ptr [rdx], si
       FFC7                 inc      edi
       897D18               mov      dword ptr [rbp+18H], edi
       EB21                 jmp      SHORT G_M56192_IG06

G_M56192_IG05:
       488D7D10             lea      rdi, bword ptr [rbp+10H]
       488D4DE8             lea      rcx, bword ptr [rbp-18H]
       488931               mov      bword ptr [rcx], rsi
       8955FC               mov      dword ptr [rbp-04H], edx
       895108               mov      dword ptr [rcx+8], edx
       488B75E8             mov      rsi, bword ptr [rbp-18H]
       488B55F0             mov      rdx, qword ptr [rbp-10H]
       8B4DFC               mov      ecx, dword ptr [rbp-04H]
       E82CF7FFFF           call     ValueStringBuilder:AppendSpan(struct,int):this

G_M56192_IG06:
       90                   nop      

G_M56192_IG07:
       488D6500             lea      rsp, [rbp]
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 131, prolog size 16 for method Program:Do(struct,ref)
; ============================================================
; Assembly listing for method ValueStringBuilder:AppendSpan(struct,int):this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] ( 12, 11.50)   byref  ->  rbx         this
;  V01 arg1         [V01,T02] (  6,  6   )  struct (16) [rbp-0x30]   do-not-enreg[SFB] ld-addr-op
;  V02 arg2         [V02,T04] (  5,  4.50)     int  ->  r14        
;  V03 loc0         [V03,T03] (  7,  7   )     int  ->  r15        
;# V04 OutArgs      [V04    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;* V05 tmp1         [V05    ] (  0,  0   )  struct (16) zero-ref   
;  V06 tmp2         [V06,T08] (  3,  6   )   byref  ->  rdi        
;  V07 tmp3         [V07,T01] (  5, 10   )   byref  ->  r12        
;* V08 tmp4         [V08    ] (  0,  0   )  struct ( 8) zero-ref    ld-addr-op
;* V09 tmp5         [V09    ] (  0,  0   )  struct (16) zero-ref   
;* V10 tmp6         [V10    ] (  0,  0   )   byref  ->  zero-ref   
;* V11 tmp7         [V11    ] (  0,  0   )   byref  ->  zero-ref   
;* V12 tmp8         [V12    ] (  0,  0   )  struct ( 8) zero-ref   
;  V13 tmp9         [V13,T09] (  3,  6   )     int  ->  rdx        
;* V14 tmp10        [V14    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op
;  V15 tmp11        [V15,T10] (  3,  6   )     int  ->  rax        
;* V16 tmp12        [V16    ] (  0,  0   )  struct ( 8) zero-ref    ld-addr-op
;  V17 tmp13        [V17,T12] (  2,  4   )   byref  ->  rdi        
;  V18 tmp14        [V18,T13] (  2,  4   )   byref  ->  rax        
;  V19 tmp15        [V19,T11] (  3,  6   )    long  ->  rdx        
;* V20 tmp16        [V20    ] (  0,  0   )   byref  ->  zero-ref   
;* V21 tmp17        [V21    ] (  0,  0   )   byref  ->  zero-ref   
;* V22 tmp18        [V22    ] (  0,  0   )   byref  ->  zero-ref   
;* V23 tmp19        [V23    ] (  0,  0   )   byref  ->  zero-ref   
;  V24 tmp20        [V24,T14] (  2,  2   )   byref  ->  rdi         V05._pointer(offs=0x00) P-INDEP
;  V25 tmp21        [V25,T20] (  2,  2   )     int  ->  rdx         V05._length(offs=0x08) P-INDEP
;  V26 tmp22        [V26,T15] (  2,  2   )   byref  ->  rdi         V08._value(offs=0x00) P-INDEP
;  V27 tmp23        [V27,T16] (  2,  2   )   byref  ->  rdi         V09._pointer(offs=0x00) P-INDEP
;  V28 tmp24        [V28,T21] (  2,  2   )     int  ->  rdx         V09._length(offs=0x08) P-INDEP
;  V29 tmp25        [V29,T17] (  2,  2   )   byref  ->  rdi         V12._value(offs=0x00) P-INDEP
;  V30 tmp26        [V30,T18] (  2,  2   )   byref  ->  rdi         V14._pointer(offs=0x00) P-INDEP
;  V31 tmp27        [V31,T22] (  2,  2   )     int  ->  rdx         V14._length(offs=0x08) P-INDEP
;  V32 tmp28        [V32,T19] (  2,  2   )   byref  ->  rax         V16._value(offs=0x00) P-INDEP
;  V33 cse0         [V33,T06] (  6,  6   )     int  ->  rdx        
;  V34 cse1         [V34,T05] (  6,  6   )   byref  ->  r12        
;  V35 cse2         [V35,T07] (  6,  6   )     int  ->  rsi        
;
; Lcl frame size = 16

G_M9798_IG01:
       55                   push     rbp
       4157                 push     r15
       4156                 push     r14
       4154                 push     r12
       53                   push     rbx
       4883EC10             sub      rsp, 16
       488D6C2430           lea      rbp, [rsp+30H]
       488975D0             mov      bword ptr [rbp-30H], rsi
       488955D8             mov      qword ptr [rbp-28H], rdx
       488BDF               mov      rbx, rdi
       448BF1               mov      r14d, ecx

G_M9798_IG02:
       448B7B08             mov      r15d, dword ptr [rbx+8]
       391B                 cmp      dword ptr [rbx], ebx
       4C8D6310             lea      r12, bword ptr [rbx+16]
       498BFC               mov      rdi, r12
       8B7F08               mov      edi, dword ptr [rdi+8]
       412BFE               sub      edi, r14d
       413BFF               cmp      edi, r15d
       7D0B                 jge      SHORT G_M9798_IG03
       488BFB               mov      rdi, rbx
       418BF6               mov      esi, r14d
       E8F6F6FFFF           call     ValueStringBuilder:Grow(int):this

G_M9798_IG03:
       391B                 cmp      dword ptr [rbx], ebx
       418B542408           mov      edx, dword ptr [r12+8]
       443BFA               cmp      r15d, edx
       773D                 ja       SHORT G_M9798_IG06

G_M9798_IG04:
       498B3C24             mov      rdi, bword ptr [r12]
       412BD7               sub      edx, r15d
       4963F7               movsxd   rsi, r15d
       488D3C77             lea      rdi, bword ptr [rdi+2*rsi]
       8B75D8               mov      esi, dword ptr [rbp-28H]
       8BC6                 mov      eax, esi
       3BC2                 cmp      eax, edx
       772C                 ja       SHORT G_M9798_IG07
       488D55D0             lea      rdx, bword ptr [rbp-30H]
       488B02               mov      rax, bword ptr [rdx]
       4863D6               movsxd   rdx, esi
       48D1E2               shl      rdx, 1
       488BF0               mov      rsi, rax
       E8D65FA1FF           call     Buffer:Memmove(byref,byref,long)
       44017308             add      dword ptr [rbx+8], r14d

G_M9798_IG05:
       488D65E0             lea      rsp, [rbp-20H]
       5B                   pop      rbx
       415C                 pop      r12
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret      

G_M9798_IG06:
       E840EBA1FF           call     ThrowHelper:ThrowArgumentOutOfRangeException()
       CC                   int3     

G_M9798_IG07:
       E86AEBA1FF           call     ThrowHelper:ThrowArgumentException_DestinationTooShort()
       CC                   int3     

; Total bytes of code 151, prolog size 17 for method ValueStringBuilder:AppendSpan(struct,int):this
; ============================================================
; Assembly listing for method ValueStringBuilder:Grow(int):this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] ( 11, 11   )   byref  ->  rbx         this
;  V01 arg1         [V01,T10] (  3,  3   )     int  ->  r14        
;  V02 loc0         [V02,T13] (  6,  4.50)     ref  ->  r15         class-hnd
;  V03 loc1         [V03,T18] (  4,  3   )     ref  ->  r12         class-hnd
;  V04 loc2         [V04,T14] (  6,  4.50)     ref  ->  r15         class-hnd
;# V05 OutArgs      [V05    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V06 tmp1         [V06,T04] (  4,  8   )     ref  ->  rdi         class-hnd
;  V07 tmp2         [V07,T11] (  3,  5   )     int  ->  rsi        
;  V08 tmp3         [V08,T02] (  5, 10   )   byref  ->  rdx        
;* V09 tmp4         [V09    ] (  0,  0   )  struct (16) zero-ref   
;  V10 tmp5         [V10,T06] (  3,  6   )   byref  ->  rax        
;  V11 tmp6         [V11,T24] (  3,  2   )     int  ->  rax        
;  V12 tmp7         [V12,T12] (  3,  5   )     int  ->  rax        
;* V13 tmp8         [V13    ] (  0,  0   )  struct (16) zero-ref   
;* V14 tmp9         [V14    ] (  0,  0   )  ushort  ->  zero-ref    ld-addr-op
;* V15 tmp10        [V15    ] (  0,  0   )     ref  ->  zero-ref    class-hnd exact
;* V16 tmp11        [V16    ] (  0,  0   )  struct ( 8) zero-ref   
;  V17 tmp12        [V17,T21] (  3,  3   )   byref  ->  rdi        
;* V18 tmp13        [V18    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op
;  V19 tmp14        [V19,T07] (  3,  6   )     int  ->  rcx        
;* V20 tmp15        [V20    ] (  0,  0   )  struct ( 8) zero-ref    ld-addr-op
;  V21 tmp16        [V21,T15] (  2,  4   )   byref  ->  rdi        
;  V22 tmp17        [V22,T16] (  2,  4   )   byref  ->  rsi        
;  V23 tmp18        [V23,T08] (  3,  6   )    long  ->  rdx        
;* V24 tmp19        [V24    ] (  0,  0   )   byref  ->  zero-ref   
;* V25 tmp20        [V25    ] (  0,  0   )   byref  ->  zero-ref   
;* V26 tmp21        [V26    ] (  0,  0   )   byref  ->  zero-ref   
;* V27 tmp22        [V27    ] (  0,  0   )   byref  ->  zero-ref   
;* V28 tmp23        [V28    ] (  0,  0   )  struct (16) zero-ref   
;* V29 tmp24        [V29    ] (  0,  0   )  ushort  ->  zero-ref    ld-addr-op
;* V30 tmp25        [V30    ] (  0,  0   )     ref  ->  zero-ref    class-hnd exact
;* V31 tmp26        [V31    ] (  0,  0   )  struct ( 8) zero-ref   
;  V32 tmp27        [V32,T22] (  3,  3   )   byref  ->  rdi        
;  V33 tmp28        [V33,T26] (  2,  2   )   byref  ->  rdi         V09._pointer(offs=0x00) P-INDEP
;  V34 tmp29        [V34,T29] (  2,  2   )     int  ->  rsi         V09._length(offs=0x08) P-INDEP
;  V35 tmp30        [V35,T23] (  3,  2   )   byref  ->  rdi         V13._pointer(offs=0x00) P-INDEP
;  V36 tmp31        [V36,T25] (  3,  2   )     int  ->  rsi         V13._length(offs=0x08) P-INDEP
;  V37 tmp32        [V37,T31] (  2,  1   )   byref  ->  rdi         V16._value(offs=0x00) P-INDEP
;  V38 tmp33        [V38,T27] (  2,  2   )   byref  ->  rdi         V18._pointer(offs=0x00) P-INDEP
;  V39 tmp34        [V39,T30] (  2,  2   )     int  ->  rsi         V18._length(offs=0x08) P-INDEP
;  V40 tmp35        [V40,T28] (  2,  2   )   byref  ->  rsi         V20._value(offs=0x00) P-INDEP
;  V41 tmp36        [V41,T19] (  4,  3   )   byref  ->  rdi         V28._pointer(offs=0x00) P-INDEP
;  V42 tmp37        [V42,T20] (  4,  3   )     int  ->  rsi         V28._length(offs=0x08) P-INDEP
;  V43 tmp38        [V43,T32] (  2,  1   )   byref  ->  rdi         V31._value(offs=0x00) P-INDEP
;  V44 tmp39        [V44,T01] (  6, 12   )   byref  ->  r14        
;  V45 tmp40        [V45,T09] (  5,  5   )     ref  ->  rdi        
;  V46 cse0         [V46,T17] (  3,  2.50)    long  ->  [rbp-0x28]  
;  V47 cse1         [V47,T05] (  6,  6   )     int  ->  rax        
;  V48 cse2         [V48,T03] (  8,  8   )   byref  ->  r14        
;
; Lcl frame size = 16

G_M53330_IG01:
       55                   push     rbp
       4157                 push     r15
       4156                 push     r14
       4154                 push     r12
       53                   push     rbx
       4883EC10             sub      rsp, 16
       488D6C2430           lea      rbp, [rsp+30H]
       488BDF               mov      rbx, rdi
       448BF6               mov      r14d, esi

G_M53330_IG02:
       48BF2030F8256F7F0000 mov      rdi, 0x7F6F25F83020
       BE10000000           mov      esi, 16
       E8C5CC1279           call     CORINFO_HELP_CLASSINIT_SHARED_DYNAMICCLASS
       48BFA80A00186F7F0000 mov      rdi, 0x7F6F18000AA8
       488B3F               mov      rdi, gword ptr [rdi]
       418BF6               mov      esi, r14d
       037308               add      esi, dword ptr [rbx+8]
       391B                 cmp      dword ptr [rbx], ebx
       4C8D7310             lea      r14, bword ptr [rbx+16]
       498BC6               mov      rax, r14
       8B4008               mov      eax, dword ptr [rax+8]
       D1E0                 shl      eax, 1
       3BF0                 cmp      esi, eax
       7D02                 jge      SHORT G_M53330_IG03
       EB02                 jmp      SHORT G_M53330_IG04

G_M53330_IG03:
       8BC6                 mov      eax, esi

G_M53330_IG04:
       8BF0                 mov      esi, eax
       488B07               mov      rax, qword ptr [rdi]
       488B4040             mov      rax, qword ptr [rax+64]
       FF5020               call     gword ptr [rax+32]ArrayPool`1:Rent(int):ref:this
       4C8BF8               mov      r15, rax
       391B                 cmp      dword ptr [rbx], ebx
       498BD6               mov      rdx, r14
       4D85FF               test     r15, r15
       7506                 jne      SHORT G_M53330_IG05
       33FF                 xor      rdi, rdi
       33F6                 xor      esi, esi
       EB08                 jmp      SHORT G_M53330_IG06

G_M53330_IG05:
       498D7F10             lea      rdi, bword ptr [r15+16]
       418B7708             mov      esi, dword ptr [r15+8]

G_M53330_IG06:
       8B4208               mov      eax, dword ptr [rdx+8]
       8BC8                 mov      ecx, eax
       3BCE                 cmp      ecx, esi
       7765                 ja       SHORT G_M53330_IG11
       488B32               mov      rsi, bword ptr [rdx]
       4863D0               movsxd   rdx, eax
       48D1E2               shl      rdx, 1
       E8FE5EA1FF           call     Buffer:Memmove(byref,byref,long)
       4C8B23               mov      r12, gword ptr [rbx]
       488BFB               mov      rdi, rbx
       498BF7               mov      rsi, r15
       E8B1651C79           call     CORINFO_HELP_CHECKED_ASSIGN_REF
       4D85FF               test     r15, r15
       7506                 jne      SHORT G_M53330_IG07
       33FF                 xor      rdi, rdi
       33F6                 xor      esi, esi
       EB08                 jmp      SHORT G_M53330_IG08

G_M53330_IG07:
       498D7F10             lea      rdi, bword ptr [r15+16]
       418B7708             mov      esi, dword ptr [r15+8]

G_M53330_IG08:
       49893E               mov      bword ptr [r14], rdi
       41897608             mov      dword ptr [r14+8], esi
       4D85E4               test     r12, r12
       741C                 je       SHORT G_M53330_IG09
       48BFA80A00186F7F0000 mov      rdi, 0x7F6F18000AA8
       488B3F               mov      rdi, gword ptr [rdi]
       498BF4               mov      rsi, r12
       33D2                 xor      edx, edx
       488B07               mov      rax, qword ptr [rdi]
       488B4040             mov      rax, qword ptr [rax+64]
       FF5028               call     qword ptr [rax+40]ArrayPool`1:Return(ref,bool):this

G_M53330_IG09:
       90                   nop      

G_M53330_IG10:
       488D65E0             lea      rsp, [rbp-20H]
       5B                   pop      rbx
       415C                 pop      r12
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret      

G_M53330_IG11:
       E852EAA1FF           call     ThrowHelper:ThrowArgumentException_DestinationTooShort()
       CC                   int3     

; Total bytes of code 239, prolog size 17 for method ValueStringBuilder:Grow(int):this
; ============================================================
