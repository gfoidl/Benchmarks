; Assembly listing for method Program:Do(struct,ushort)
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 arg0         [V00    ] (  5,  3.50)  struct (32) [rbp+0x10]   do-not-enreg[XSFB] addr-exposed ld-addr-op
;  V01 arg1         [V01,T00] (  4,  3   )  ushort  ->  rdi        
;# V02 OutArgs      [V02    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V03 tmp1         [V03,T01] (  4,  3   )     int  ->  rsi        
;* V04 tmp2         [V04    ] (  0,  0   )  struct (16) zero-ref   
;* V05 tmp3         [V05    ] (  0,  0   )  struct ( 8) zero-ref    ld-addr-op
;* V06 tmp4         [V06    ] (  0,  0   )   byref  ->  zero-ref   
;  V07 tmp5         [V07,T03] (  2,  1   )   byref  ->  rdx         V04._pointer(offs=0x00) P-INDEP
;* V08 tmp6         [V08    ] (  0,  0   )     int  ->  zero-ref    V04._length(offs=0x08) P-INDEP
;* V09 tmp7         [V09    ] (  0,  0   )   byref  ->  zero-ref    V05._value(offs=0x00) P-INDEP
;  V10 tmp8         [V10,T02] (  3,  3   )   byref  ->  rax        
;
; Lcl frame size = 0

G_M56187_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp

G_M56187_IG02:
       8B7518               mov      esi, dword ptr [rbp+18H]
       3B7528               cmp      esi, dword ptr [rbp+28H]
       7D18                 jge      SHORT G_M56187_IG03
       488D4520             lea      rax, bword ptr [rbp+20H]
       488B10               mov      rdx, bword ptr [rax]
       8B4008               mov      eax, dword ptr [rax+8]
       4863C6               movsxd   rax, esi
       66893C42             mov      word  ptr [rdx+2*rax], di
       FFC6                 inc      esi
       897518               mov      dword ptr [rbp+18H], esi
       EB0C                 jmp      SHORT G_M56187_IG04

G_M56187_IG03:
       0FB7F7               movzx    rsi, di
       488D7D10             lea      rdi, bword ptr [rbp+10H]
       E8A0F7FFFF           call     ValueStringBuilder:GrowAndAppend(ushort):this

G_M56187_IG04:
       90                   nop      

G_M56187_IG05:
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 51, prolog size 4 for method Program:Do(struct,ushort)
; ============================================================
; Assembly listing for method ValueStringBuilder:GrowAndAppend(ushort):this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  9,  7.50)   byref  ->  rbx         this
;  V01 arg1         [V01,T01] (  4,  3   )  ushort  ->  r14        
;# V02 OutArgs      [V02    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V03 tmp1         [V03,T03] (  4,  3   )     int  ->  rsi        
;  V04 tmp2         [V04,T02] (  2,  4   )   byref  ->  rdi        
;* V05 tmp3         [V05    ] (  0,  0   )  struct (16) zero-ref   
;* V06 tmp4         [V06    ] (  0,  0   )  struct ( 8) zero-ref    ld-addr-op
;* V07 tmp5         [V07    ] (  0,  0   )   byref  ->  zero-ref   
;  V08 tmp6         [V08,T05] (  2,  1   )   byref  ->  rax         V05._pointer(offs=0x00) P-INDEP
;* V09 tmp7         [V09    ] (  0,  0   )     int  ->  zero-ref    V05._length(offs=0x08) P-INDEP
;* V10 tmp8         [V10    ] (  0,  0   )   byref  ->  zero-ref    V06._value(offs=0x00) P-INDEP
;  V11 tmp9         [V11,T04] (  3,  3   )   byref  ->  rdi        
;
; Lcl frame size = 0

G_M17475_IG01:
       55                   push     rbp
       4156                 push     r14
       53                   push     rbx
       488D6C2410           lea      rbp, [rsp+10H]
       488BDF               mov      rbx, rdi
       448BF6               mov      r14d, esi

G_M17475_IG02:
       488BFB               mov      rdi, rbx
       BE01000000           mov      esi, 1
       E86CF7FFFF           call     ValueStringBuilder:Grow(int):this
       8B7308               mov      esi, dword ptr [rbx+8]
       391B                 cmp      dword ptr [rbx], ebx
       488D7B10             lea      rdi, bword ptr [rbx+16]
       3B7708               cmp      esi, dword ptr [rdi+8]
       7D19                 jge      SHORT G_M17475_IG03
       488D7B10             lea      rdi, bword ptr [rbx+16]
       488B07               mov      rax, bword ptr [rdi]
       8B7F08               mov      edi, dword ptr [rdi+8]
       4863FE               movsxd   rdi, esi
       6644893478           mov      word  ptr [rax+2*rdi], r14w
       FFC6                 inc      esi
       897308               mov      dword ptr [rbx+8], esi
       EB0C                 jmp      SHORT G_M17475_IG04

G_M17475_IG03:
       410FB7F6             movzx    rsi, r14w
       488BFB               mov      rdi, rbx
       E831F7FFFF           call     ValueStringBuilder:GrowAndAppend(ushort):this

G_M17475_IG04:
       90                   nop      

G_M17475_IG05:
       5B                   pop      rbx
       415E                 pop      r14
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 85, prolog size 9 for method ValueStringBuilder:GrowAndAppend(ushort):this
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
       48BF203094AF5E7F0000 mov      rdi, 0x7F5EAF943020
       BE10000000           mov      esi, 16
       E865BD1179           call     CORINFO_HELP_CLASSINIT_SHARED_DYNAMICCLASS
       48BFA80A00A05E7F0000 mov      rdi, 0x7F5EA0000AA8
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
       E89E5FA1FF           call     Buffer:Memmove(byref,byref,long)
       4C8B23               mov      r12, gword ptr [rbx]
       488BFB               mov      rdi, rbx
       498BF7               mov      rsi, r15
       E851561B79           call     CORINFO_HELP_CHECKED_ASSIGN_REF
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
       48BFA80A00A05E7F0000 mov      rdi, 0x7F5EA0000AA8
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
       E8F2EAA1FF           call     ThrowHelper:ThrowArgumentException_DestinationTooShort()
       CC                   int3     

; Total bytes of code 239, prolog size 17 for method ValueStringBuilder:Grow(int):this
; ============================================================
