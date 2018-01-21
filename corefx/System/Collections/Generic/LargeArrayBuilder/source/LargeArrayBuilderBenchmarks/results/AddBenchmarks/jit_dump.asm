; Assembly listing for method ConsoleApplication.AddBenchmarks:Default(int):ref:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;* V00 this         [V00    ] (  0,  0   )     ref  ->  zero-ref    this class-hnd
;  V01 arg1         [V01,T01] (  3,  3   )     int  ->  rbx        
;  V02 loc0         [V02    ] ( 10,  9.25)  struct (48) [rbp-0x40]   do-not-enreg[XSF] must-init addr-exposed ld-addr-op
;  V03 tmp0         [V03,T02] (  4,  4   )     int  ->  rdi        
;  V04 tmp1         [V04,T00] (  3,  6   )     ref  ->  rax         class-hnd
;# V05 OutArgs      [V05    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;
; Lcl frame size = 48

G_M4903_IG01:
       55                   push     rbp
       4155                 push     r13
       53                   push     rbx
       4883EC30             sub      rsp, 48
       488D6C2440           lea      rbp, [rsp+40H]
       4C8BEF               mov      r13, rdi
       488D7DC0             lea      rdi, [rbp-40H]
       B90C000000           mov      ecx, 12
       33C0                 xor      rax, rax
       F3AB                 rep stosd 
       498BFD               mov      rdi, r13
       8BDE                 mov      ebx, esi

G_M4903_IG02:
       488D7DC0             lea      rdi, bword ptr [rbp-40H]
       BEFFFFFF7F           mov      esi, 0x7FFFFFFF
       E800FDFFFF           call     System.Collections.Generic.LargeArrayBuilder0`1[Int32][System.Int32]:.ctor(int):this
       8B7DD4               mov      edi, dword ptr [rbp-2CH]
       488B45C8             mov      rax, gword ptr [rbp-38H]
       3B7808               cmp      edi, dword ptr [rax+8]
       7509                 jne      SHORT G_M4903_IG03
       488D7DC0             lea      rdi, bword ptr [rbp-40H]
       E83BFDFFFF           call     System.Collections.Generic.LargeArrayBuilder0`1[Int32][System.Int32]:AllocateBuffer():this

G_M4903_IG03:
       8B7DD4               mov      edi, dword ptr [rbp-2CH]
       488B45C8             mov      rax, gword ptr [rbp-38H]
       8D7701               lea      esi, [rdi+1]
       8975D4               mov      dword ptr [rbp-2CH], esi
       3B7808               cmp      edi, dword ptr [rax+8]
       7322                 jae      SHORT G_M4903_IG05
       4863FF               movsxd   rdi, edi
       895CB810             mov      dword ptr [rax+4*rdi+16], ebx
       8B7DD8               mov      edi, dword ptr [rbp-28H]
       FFC7                 inc      edi
       897DD8               mov      dword ptr [rbp-28H], edi
       488D7DC0             lea      rdi, bword ptr [rbp-40H]
       E801FDFFFF           call     System.Collections.Generic.LargeArrayBuilder0`1[Int32][System.Int32]:ToArray():ref:this
       90                   nop      

G_M4903_IG04:
       488D65F0             lea      rsp, [rbp-10H]
       5B                   pop      rbx
       415D                 pop      r13
       5D                   pop      rbp
       C3                   ret      

G_M4903_IG05:
       E8827A9678           call     CORINFO_HELP_RNGCHKFAIL
       CC                   int3     

; Total bytes of code 127, prolog size 32 for method ConsoleApplication.AddBenchmarks:Default(int):ref:this
; ============================================================
; Assembly listing for method ConsoleApplication.AddBenchmarks:New1(int):ref:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;* V00 this         [V00    ] (  0,  0   )     ref  ->  zero-ref    this class-hnd
;  V01 arg1         [V01,T00] (  5,  2.75)     int  ->  rbx        
;  V02 loc0         [V02    ] (  8,  6.50)  struct (48) [rbp-0x50]   do-not-enreg[XSF] must-init addr-exposed ld-addr-op
;  V03 tmp0         [V03,T01] (  5,  2.75)     int  ->  r14        
;  V04 tmp1         [V04,T02] (  4,  2.50)     ref  ->  r15         class-hnd
;# V05 OutArgs      [V05    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;
; Lcl frame size = 48
1
1

G_M58693_IG01:
       55                   push     rbp
       4157                 push     r15
       4156                 push     r14
       4155                 push     r13
       53                   push     rbx
       4883EC30             sub      rsp, 48
       488D6C2450           lea      rbp, [rsp+50H]
       4C8BEF               mov      r13, rdi
       488D7DB0             lea      rdi, [rbp-50H]
       B90C000000           mov      ecx, 12
       33C0                 xor      rax, rax
       F3AB                 rep stosd 
       498BFD               mov      rdi, r13
       8BDE                 mov      ebx, esi

G_M58693_IG02:
       488D7DB0             lea      rdi, bword ptr [rbp-50H]
       BEFFFFFF7F           mov      esi, 0x7FFFFFFF
       E854FAFFFF           call     System.Collections.Generic.LargeArrayBuilder1`1[Int32][System.Int32]:.ctor(int):this
       448B75C4             mov      r14d, dword ptr [rbp-3CH]
       4C8B7DB8             mov      r15, gword ptr [rbp-48H]
       45397708             cmp      dword ptr [r15+8], r14d
       770D                 ja       SHORT G_M58693_IG03
       488D7DB0             lea      rdi, bword ptr [rbp-50H]
       8BF3                 mov      esi, ebx
       E853FAFFFF           call     System.Collections.Generic.LargeArrayBuilder1`1[Int32][System.Int32]:AddWithBufferAllocation(int):this
       EB0F                 jmp      SHORT G_M58693_IG04

G_M58693_IG03:
       4963FE               movsxd   rdi, r14d
       41895CBF10           mov      dword ptr [r15+4*rdi+16], ebx
       41FFC6               inc      r14d
       448975C4             mov      dword ptr [rbp-3CH], r14d

G_M58693_IG04:
       8B7DC8               mov      edi, dword ptr [rbp-38H]
       FFC7                 inc      edi
       897DC8               mov      dword ptr [rbp-38H], edi
       488D7DB0             lea      rdi, bword ptr [rbp-50H]
       E861FAFFFF           call     System.Collections.Generic.LargeArrayBuilder1`1[Int32][System.Int32]:ToArray():ref:this
       90                   nop      

G_M58693_IG05:
       488D65E0             lea      rsp, [rbp-20H]
       5B                   pop      rbx
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 125, prolog size 36 for method ConsoleApplication.AddBenchmarks:New1(int):ref:this
; ============================================================
