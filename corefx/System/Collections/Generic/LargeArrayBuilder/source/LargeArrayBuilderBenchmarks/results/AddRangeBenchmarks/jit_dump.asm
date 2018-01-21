; Assembly listing for method ConsoleApplication.AddBenchmarks:Default(ref):ref:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;* V00 this         [V00    ] (  0,  0   )     ref  ->  zero-ref    this class-hnd
;  V01 arg1         [V01,T00] (  3,  3   )     ref  ->  rbx         class-hnd
;  V02 loc0         [V02    ] (  3,  3   )  struct (48) [rbp-0x40]   do-not-enreg[XS] must-init addr-exposed ld-addr-op
;# V03 OutArgs      [V03    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;
; Lcl frame size = 48

G_M4902_IG01:
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
       488BDE               mov      rbx, rsi

G_M4902_IG02:
       488D7DC0             lea      rdi, bword ptr [rbp-40H]
       BEFFFFFF7F           mov      esi, 0x7FFFFFFF
       E8F7FCFFFF           call     System.Collections.Generic.LargeArrayBuilder0`1[Int32][System.Int32]:.ctor(int):this
       488D7DC0             lea      rdi, bword ptr [rbp-40H]
       488BF3               mov      rsi, rbx
       E803FDFFFF           call     System.Collections.Generic.LargeArrayBuilder0`1[Int32][System.Int32]:AddRange(ref):this
       488D7DC0             lea      rdi, bword ptr [rbp-40H]
       E822FDFFFF           call     System.Collections.Generic.LargeArrayBuilder0`1[Int32][System.Int32]:ToArray():ref:this
       90                   nop      

G_M4902_IG03:
       488D65F0             lea      rsp, [rbp-10H]
       5B                   pop      rbx
       415D                 pop      r13
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 80, prolog size 32 for method ConsoleApplication.AddBenchmarks:Default(ref):ref:this
; ============================================================
; Assembly listing for method System.Collections.Generic.LargeArrayBuilder0`1[Int32][System.Int32]:AddRange(ref):this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 this         [V00,T01] ( 15, 22   )   byref  ->  rbx         this
;  V01 arg1         [V01,T06] (  3,  3   )     ref  ->  rsi         class-hnd
;  V02 loc0         [V02,T05] (  7, 10.50)     ref  ->  [rbp-0x28]   do-not-enreg[H] class-hnd
;  V03 loc1         [V03,T04] (  5, 15   )     ref  ->  r14         class-hnd
;  V04 loc2         [V04,T02] (  9, 21   )     int  ->  registers  
;  V05 tmp0         [V05,T00] (  4, 32   )     int  ->  r15        
;  V06 tmp1         [V06,T03] (  2, 16   )     int  ->  rax        
;# V07 OutArgs      [V07    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V08 PSPSym       [V08    ] (  1,  1   )    long  ->  [rbp-0x30]   do-not-enreg[X] addr-exposed
;
; Lcl frame size = 16

G_M22501_IG01:
       55                   push     rbp
       4157                 push     r15
       4156                 push     r14
       4154                 push     r12
       53                   push     rbx
       4883EC10             sub      rsp, 16
       488D6C2430           lea      rbp, [rsp+30H]
       488965D0             mov      qword ptr [rbp-30H], rsp
       488BDF               mov      rbx, rdi

G_M22501_IG02:
       488BFE               mov      rdi, rsi
       49BB200078776F7F0000 mov      r11, 0x7F6F77780020
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     gword ptr [r11]System.Collections.Generic.IEnumerable`1[Int32][System.Int32]:GetEnumerator():ref:this
       488945D8             mov      gword ptr [rbp-28H], rax

G_M22501_IG03:
       4C8B7308             mov      r14, gword ptr [rbx+8]
       448B7B14             mov      r15d, dword ptr [rbx+20]
       488B7DD8             mov      rdi, gword ptr [rbp-28H]
       49BB280078776F7F0000 mov      r11, 0x7F6F77780028
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.Collections.IEnumerator:MoveNext():bool:this
       85C0                 test     eax, eax
       7425                 je       SHORT G_M22501_IG05

G_M22501_IG04:
       45397E08             cmp      dword ptr [r14+8], r15d
       752E                 jne      SHORT G_M22501_IG08
       418BFF               mov      edi, r15d
       2B7B14               sub      edi, dword ptr [rbx+20]
       017B18               add      dword ptr [rbx+24], edi
       44897B14             mov      dword ptr [rbx+20], r15d
       488BFB               mov      rdi, rbx
       E830FCFFFF           call     System.Collections.Generic.LargeArrayBuilder0`1[Int32][System.Int32]:AllocateBuffer():this
       4C8B7308             mov      r14, gword ptr [rbx+8]
       448B7B14             mov      r15d, dword ptr [rbx+20]
       EB0F                 jmp      SHORT G_M22501_IG08

G_M22501_IG05:
       458BE7               mov      r12d, r15d
       EB49                 jmp      SHORT G_M22501_IG09

G_M22501_IG06:
       E844E99678           call     CORINFO_HELP_RNGCHKFAIL

G_M22501_IG07:
       458BFC               mov      r15d, r12d
       EBCC                 jmp      SHORT G_M22501_IG04

G_M22501_IG08:
       418D7F01             lea      edi, [r15+1]
       448BE7               mov      r12d, edi
       488B7DD8             mov      rdi, gword ptr [rbp-28H]
       49BB300078776F7F0000 mov      r11, 0x7F6F77780030
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.Collections.Generic.IEnumerator`1[Int32][System.Int32]:get_Current():int:this
       453B7E08             cmp      r15d, dword ptr [r14+8]
       73D6                 jae      SHORT G_M22501_IG06
       4963FF               movsxd   rdi, r15d
       418944BE10           mov      dword ptr [r14+4*rdi+16], eax
       488B7DD8             mov      rdi, gword ptr [rbp-28H]
       49BB280078776F7F0000 mov      r11, 0x7F6F77780028
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.Collections.IEnumerator:MoveNext():bool:this
       85C0                 test     eax, eax
       75BC                 jne      SHORT G_M22501_IG07

G_M22501_IG09:
       418BFC               mov      edi, r12d
       2B7B14               sub      edi, dword ptr [rbx+20]
       017B18               add      dword ptr [rbx+24], edi
       44896314             mov      dword ptr [rbx+20], r12d

G_M22501_IG10:
       488B7DD8             mov      rdi, gword ptr [rbp-28H]
       49BB380078776F7F0000 mov      r11, 0x7F6F77780038
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.IDisposable:Dispose():this
       90                   nop      

G_M22501_IG11:
       488D65E0             lea      rsp, [rbp-20H]
       5B                   pop      rbx
       415C                 pop      r12
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret      

G_M22501_IG12:
       55                   push     rbp
       4157                 push     r15
       4156                 push     r14
       4154                 push     r12
       53                   push     rbx
       4883EC10             sub      rsp, 16
       488B2F               mov      rbp, qword ptr [rdi]
       48892C24             mov      qword ptr [rsp], rbp
       488D6D30             lea      rbp, [rbp+30H]

G_M22501_IG13:
       48837DD800           cmp      gword ptr [rbp-28H], 0
       7413                 je       SHORT G_M22501_IG14
       488B7DD8             mov      rdi, gword ptr [rbp-28H]
       49BB380078776F7F0000 mov      r11, 0x7F6F77780038
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.IDisposable:Dispose():this

G_M22501_IG14:
       90                   nop      

G_M22501_IG15:
       4883C410             add      rsp, 16
       5B                   pop      rbx
       415C                 pop      r12
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 301, prolog size 24 for method System.Collections.Generic.LargeArrayBuilder0`1[Int32][System.Int32]:AddRange(ref):this
; ============================================================
; Assembly listing for method ConsoleApplication.AddBenchmarks:New1(ref):ref:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;* V00 this         [V00    ] (  0,  0   )     ref  ->  zero-ref    this class-hnd
;  V01 arg1         [V01,T00] (  3,  3   )     ref  ->  rbx         class-hnd
;  V02 loc0         [V02    ] (  3,  3   )  struct (48) [rbp-0x40]   do-not-enreg[XS] must-init addr-exposed ld-addr-op
;# V03 OutArgs      [V03    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;
; Lcl frame size = 48

G_M58692_IG01:
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
       488BDE               mov      rbx, rsi

G_M58692_IG02:
       488D7DC0             lea      rdi, bword ptr [rbp-40H]
       BEFFFFFF7F           mov      esi, 0x7FFFFFFF
       E827F9FFFF           call     System.Collections.Generic.LargeArrayBuilder1`1[Int32][System.Int32]:.ctor(int):this
       488D7DC0             lea      rdi, bword ptr [rbp-40H]
       488BF3               mov      rsi, rbx
       E83BF9FFFF           call     System.Collections.Generic.LargeArrayBuilder1`1[Int32][System.Int32]:AddRange(ref):this
       488D7DC0             lea      rdi, bword ptr [rbp-40H]
       E862F9FFFF           call     System.Collections.Generic.LargeArrayBuilder1`1[Int32][System.Int32]:ToArray():ref:this
       90                   nop      

G_M58692_IG03:
       488D65F0             lea      rsp, [rbp-10H]
       5B                   pop      rbx
       415D                 pop      r13
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 80, prolog size 32 for method ConsoleApplication.AddBenchmarks:New1(ref):ref:this
; ============================================================
; Assembly listing for method System.Collections.Generic.LargeArrayBuilder1`1[Int32][System.Int32]:AddRange(ref):this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 this         [V00,T01] (  9, 10   )   byref  ->  rbx         this
;  V01 arg1         [V01,T04] (  3,  3   )     ref  ->  rsi         class-hnd
;  V02 loc0         [V02,T03] (  7, 10.50)     ref  ->  [rbp-0x20]   do-not-enreg[H] class-hnd
;  V03 loc1         [V03    ] (  7, 17   )     ref  ->  [rbp-0x10]   do-not-enreg[X] must-init addr-exposed ld-addr-op class-hnd
;  V04 loc2         [V04    ] ( 12, 29   )     int  ->  [rbp-0x18]   do-not-enreg[X] must-init addr-exposed ld-addr-op
;  V05 loc3         [V05,T02] (  5, 12   )     int  ->  rax        
;# V06 OutArgs      [V06    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V07 PSPSym       [V07    ] (  1,  1   )    long  ->  [rbp-0x30]   do-not-enreg[X] addr-exposed
;  V08 cse0         [V08,T00] (  5, 18   )     int  ->  rdx        
;
; Lcl frame size = 40

G_M19396_IG01:
       55                   push     rbp
       53                   push     rbx
       4883EC28             sub      rsp, 40
       488D6C2430           lea      rbp, [rsp+30H]
       33C0                 xor      rax, rax
       488945F0             mov      qword ptr [rbp-10H], rax
       488945E8             mov      qword ptr [rbp-18H], rax
       488965D0             mov      qword ptr [rbp-30H], rsp
       488BDF               mov      rbx, rdi

G_M19396_IG02:
       488BFE               mov      rdi, rsi
       49BB400078776F7F0000 mov      r11, 0x7F6F77780040
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     gword ptr [r11]System.Collections.Generic.IEnumerable`1[Int32][System.Int32]:GetEnumerator():ref:this
       488945E0             mov      gword ptr [rbp-20H], rax

G_M19396_IG03:
       488B7B08             mov      rdi, gword ptr [rbx+8]
       48897DF0             mov      gword ptr [rbp-10H], rdi
       8B7B14               mov      edi, dword ptr [rbx+20]
       897DE8               mov      dword ptr [rbp-18H], edi
       488B7DE0             mov      rdi, gword ptr [rbp-20H]
       49BB480078776F7F0000 mov      r11, 0x7F6F77780048
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.Collections.IEnumerator:MoveNext():bool:this
       85C0                 test     eax, eax
       7462                 je       SHORT G_M19396_IG07

G_M19396_IG04:
       488B7DE0             mov      rdi, gword ptr [rbp-20H]
       49BB500078776F7F0000 mov      r11, 0x7F6F77780050
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.Collections.Generic.IEnumerator`1[Int32][System.Int32]:get_Current():int:this
       488B55F0             mov      rdx, gword ptr [rbp-10H]
       8B5208               mov      edx, dword ptr [rdx+8]
       3955E8               cmp      dword ptr [rbp-18H], edx
       7214                 jb       SHORT G_M19396_IG05
       488D55F0             lea      rdx, bword ptr [rbp-10H]
       488D4DE8             lea      rcx, bword ptr [rbp-18H]
       488BFB               mov      rdi, rbx
       8BF0                 mov      esi, eax
       E818F8FFFF           call     System.Collections.Generic.LargeArrayBuilder1`1[Int32][System.Int32]:AddWithBufferAllocation(int,byref,byref):this
       EB10                 jmp      SHORT G_M19396_IG06

G_M19396_IG05:
       488B7DF0             mov      rdi, gword ptr [rbp-10H]
       448B5DE8             mov      r11d, dword ptr [rbp-18H]
       4D63DB               movsxd   r11, r11d
       4289449F10           mov      dword ptr [rdi+4*r11+16], eax

G_M19396_IG06:
       8B7DE8               mov      edi, dword ptr [rbp-18H]
       FFC7                 inc      edi
       897DE8               mov      dword ptr [rbp-18H], edi
       488B7DE0             mov      rdi, gword ptr [rbp-20H]
       49BB480078776F7F0000 mov      r11, 0x7F6F77780048
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.Collections.IEnumerator:MoveNext():bool:this
       85C0                 test     eax, eax
       759E                 jne      SHORT G_M19396_IG04

G_M19396_IG07:
       8B7DE8               mov      edi, dword ptr [rbp-18H]
       2B7B14               sub      edi, dword ptr [rbx+20]
       017B18               add      dword ptr [rbx+24], edi
       8B7DE8               mov      edi, dword ptr [rbp-18H]
       897B14               mov      dword ptr [rbx+20], edi

G_M19396_IG08:
       488B7DE0             mov      rdi, gword ptr [rbp-20H]
       49BB580078776F7F0000 mov      r11, 0x7F6F77780058
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.IDisposable:Dispose():this
       90                   nop      

G_M19396_IG09:
       488D65F8             lea      rsp, [rbp-08H]
       5B                   pop      rbx
       5D                   pop      rbp
       C3                3
3
   ret      

G_M19396_IG10:
       55                   push     rbp
       53                   push     rbx
       50                   push     rax
       488B2F               mov      rbp, qword ptr [rdi]
       48892C24             mov      qword ptr [rsp], rbp
       488D6D30             lea      rbp, [rbp+30H]

G_M19396_IG11:
       48837DE000           cmp      gword ptr [rbp-20H], 0
       7413                 je       SHORT G_M19396_IG12
       488B7DE0             mov      rdi, gword ptr [rbp-20H]
       49BB580078776F7F0000 mov      r11, 0x7F6F77780058
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.IDisposable:Dispose():this

G_M19396_IG12:
       90                   nop      

G_M19396_IG13:
       4883C408             add      rsp, 8
       5B                   pop      rbx
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 275, prolog size 28 for method System.Collections.Generic.LargeArrayBuilder1`1[Int32][System.Int32]:AddRange(ref):this
; ============================================================
