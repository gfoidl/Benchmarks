; Assembly listing for method MaxBenchmark.Benchmarks:Max1():int:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  5,  5   )     ref  ->  rdi         this class-hnd
;  V01 tmp0         [V01,T03] (  3,  2   )     int  ->  rdi        
;  V02 tmp1         [V02,T02] (  3,  5   )     int  ->  rax        
;  V03 tmp2         [V03,T01] (  4,  7   )     int  ->  rdi        
;# V04 OutArgs      [V04    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;
; Lcl frame size = 0

G_M52293_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp

G_M52293_IG02:
       8B4708               mov      eax, dword ptr [rdi+8]
       8B7F0C               mov      edi, dword ptr [rdi+12]
       3BC7                 cmp      eax, edi
       7F02                 jg       SHORT G_M52293_IG03
       EB02                 jmp      SHORT G_M52293_IG04

G_M52293_IG03:
       8BF8                 mov      edi, eax

G_M52293_IG04:
       8BC7                 mov      eax, edi

G_M52293_IG05:
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 22, prolog size 4 for method MaxBenchmark.Benchmarks:Max1():int:this
; ============================================================
; Assembly listing for method MaxBenchmark.Benchmarks:Max2():int:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  5,  5   )     ref  ->  rdi         this class-hnd
;  V01 tmp0         [V01,T03] (  3,  2   )     int  ->  rax        
;  V02 tmp1         [V02,T02] (  3,  5   )     int  ->  rax        
;  V03 tmp2         [V03,T01] (  4,  7   )     int  ->  rdi        
;# V04 OutArgs      [V04    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;
; Lcl frame size = 0

G_M52296_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp

G_M52296_IG02:
       8B4708               mov      eax, dword ptr [rdi+8]
       8B7F0C               mov      edi, dword ptr [rdi+12]
       3BC7                 cmp      eax, edi
       7E02                 jle      SHORT G_M52296_IG03
       EB02                 jmp      SHORT G_M52296_IG04

G_M52296_IG03:
       8BC7                 mov      eax, edi

G_M52296_IG04:
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 20, prolog size 4 for method MaxBenchmark.Benchmarks:Max2():int:this
; ============================================================
; Assembly listing for method MaxBenchmark.Benchmarks:Max3():int:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  5,  5   )     ref  ->  rdi         this class-hnd
;  V01 tmp0         [V01,T03] (  3,  2   )     int  ->  rax        
;  V02 tmp1         [V02,T02] (  3,  5   )     int  ->  rax        
;  V03 tmp2         [V03,T01] (  4,  7   )     int  ->  rdi        
;# V04 OutArgs      [V04    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;
; Lcl frame size = 0

G_M52295_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp

G_M52295_IG02:
       8B4708               mov      eax, dword ptr [rdi+8]
       8B7F0C               mov      edi, dword ptr [rdi+12]
       3BC7                 cmp      eax, edi
       7E02                 jle      SHORT G_M52295_IG03
       EB02                 jmp      SHORT G_M52295_IG04

G_M52295_IG03:
       8BC7                 mov      eax, edi

G_M52295_IG04:
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 20, prolog size 4 for method MaxBenchmark.Benchmarks:Max3():int:this
; ============================================================
; Assembly listing for method MaxBenchmark.Benchmarks:Max4():int:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  5,  5   )     ref  ->  rdi         this class-hnd
;  V01 tmp0         [V01,T01] (  3,  6   )     int  ->  rdi        
;  V02 tmp1         [V02,T03] (  4,  3.25)     int  ->  rdi        
;  V03 tmp2         [V03,T02] (  3,  4.50)     int  ->  rax        
;# V04 OutArgs      [V04    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;
; Lcl frame size = 0

G_M52290_IG01:

G_M52290_IG02:
       8B4708               mov      eax, dword ptr [rdi+8]
       8B7F0C               mov      edi, dword ptr [rdi+12]
       3BC7                 cmp      eax, edi
       7E02                 jle      SHORT G_M52290_IG03
       8BF8                 mov      edi, eax

G_M52290_IG03:
       8BC7                 mov      eax, edi

G_M52290_IG04:
       C3                   ret      

; Total bytes of code 15, prolog size 0 for method MaxBenchmark.Benchmarks:Max4():int:this
; ============================================================
; Assembly listing for method MaxBenchmark.Benchmarks:Max5():int:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  5,  5   )     ref  ->  rdi         this class-hnd
;  V01 tmp0         [V01,T02] (  2,  4   )     int  ->  rax        
;  V02 tmp1         [V02,T03] (  4,  3.25)     int  ->  rax        
;  V03 tmp2         [V03,T01] (  4,  6.50)     int  ->  rdi        
;# V04 OutArgs      [V04    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;
; Lcl frame size = 0

G_M52289_IG01:

G_M52289_IG02:
       8B4708               mov      eax, dword ptr [rdi+8]
       8B7F0C               mov      edi, dword ptr [rdi+12]
       3BC7                 cmp      eax, edi
       7D02                 jge      SHORT G_M52289_IG03
       8BC7                 mov      eax, edi

G_M52289_IG03:
       C3                   ret      

; Total bytes of code 13, prolog size 0 for method MaxBenchmark.Benchmarks:Max5():int:this
; ============================================================
; Assembly listing for method MaxBenchmark.Benchmarks:Max6():int:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  5,  5   )     ref  ->  rdi         this class-hnd
;  V01 tmp0         [V01,T02] (  2,  4   )     int  ->  rsi        
;  V02 tmp1         [V02,T01] (  3,  6   )     int  ->  rax        
;# V03 OutArgs      [V03    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;
; Lcl frame size = 8

G_M52292_IG01:
       50                   push     rax

G_M52292_IG02:
       8B7708               mov      esi, dword ptr [rdi+8]
       8B470C               mov      eax, dword ptr [rdi+12]
       8BFE                 mov      edi, esi
       8BF0                 mov      esi, eax
       E8003F63FF           call     System.Math:Max(int,int):int
       90                   nop      

G_M52292_IG03:
       4883C408             add      rsp, 8
       C3                   ret      

; Total bytes of code 22, prolog size 1 for method MaxBenchmark.Benchmarks:Max6():int:this
; ============================================================
; Assembly listing for method MaxBenchmark.Benchmarks:Max7():int:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T03] (  5,  5   )     ref  ->  rdi         this class-hnd
;  V01 tmp0         [V01,T00] (  8, 16   )     int  ->  rax        
;  V02 tmp1         [V02,T01] (  6, 12   )     int  ->  rdi        
;* V03 tmp2         [V03    ] (  0,  0   )     int  ->  zero-ref   
;# V04 OutArgs      [V04    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V05 cse0         [V05,T02] (  8,  8   )     int  ->  rdi        
;
; Lcl frame size = 0

G_M52292_IG01:

G_M52292_IG02:
       8B4708               mov      eax, dword ptr [rdi+8]
       8B7F0C               mov      edi, dword ptr [rdi+12]
       2BF8                 sub      edi, eax
       8BF7                 mov      esi, edi
       C1FE1F               sar      esi, 31
       F7D6                 not      esi
       23F7                 and      esi, edi
       03C6                 add      eax, esi

G_M52292_IG03:
       C3                   ret      

; Total bytes of code 20, prolog size 0 for method MaxBenchmark.Benchmarks:Max7():int:this
; ============================================================
; Assembly listing for method MaxBenchmark.Benchmarks:Max8():int:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T03] (  5,  5   )     ref  ->  rdi         this class-hnd
;  V01 tmp0         [V01,T00] (  8, 16   )     int  ->  rbx        
;  V02 tmp1         [V02,T01] (  6, 12   )     int  ->  rdi        
;# V03 OutArgs      [V03    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V04 cse0         [V04,T02] (  8,  8   )     int  ->  r14        
;
; Lcl frame size = 8

G_M52302_IG01:
       4156                 push     r14
       53                   push     rbx
       50                   push     rax

G_M52302_IG02:
       8B5F08               mov      ebx, dword ptr [rdi+8]
       8B7F0C               mov      edi, dword ptr [rdi+12]
       448BF7               mov      r14d, edi
       442BF3               sub      r14d, ebx
       418BFE               mov      edi, r14d
       E810E0FFFF           call     MaxBenchmark.Benchmarks:<Max8>g__sex|19_0(int):int
       F7D0                 not      eax
       4123C6               and      eax, r14d
       03C3                 add      eax, ebx

G_M52302_IG03:
       4883C408             add      rsp, 8
       5B                   pop      rbx
       415E                 pop      r14
       C3                   ret      

; Total bytes of code 39, prolog size 4 for method MaxBenchmark.Benchmarks:Max8():int:this
; ============================================================
; Assembly listing for method MaxBenchmark.Benchmarks:Max9():int:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  5,  5   )     ref  ->  rdi         this class-hnd
;  V01 tmp0         [V01,T01] (  3,  6   )     int  ->  rdi        
;  V02 tmp1         [V02,T02] (  3,  6   )     int  ->  rax        
;  V03 tmp2         [V03,T03] (  3,  3   )     int  ->  rdi        
;  V04 tmp3         [V04    ] (  4,  4   )  struct ( 8) [rsp+0x10]   do-not-enreg[XSF] addr-exposed ld-addr-op overlapping-fields
;  V05 tmp4         [V05,T04] (  2,  2   )  struct ( 8) [rsp+0x08]   do-not-enreg[SF] overlapping-fields
;  V06 tmp5         [V06,T05] (  2,  2   )     int  ->  rsi        
;# V07 OutArgs      [V07    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;
; Lcl frame size = 24

G_M52301_IG01:
       4883EC18             sub      rsp, 24

G_M52301_IG02:
       8B4708               mov      eax, dword ptr [rdi+8]
       8B7F0C               mov      edi, dword ptr [rdi+12]
       33F6                 xor      rsi, rsi
       4889742410           mov      qword ptr [rsp+10H], rsi
       2BF8                 sub      edi, eax
       4889742410           mov      qword ptr [rsp+10H], rsi
       4863F7               movsxd   rsi, edi
       4889742410           mov      qword ptr [rsp+10H], rsi
       488B742410           mov      rsi, qword ptr [rsp+10H]
       4889742408           mov      qword ptr [rsp+08H], rsi
       8B74240C             mov      esi, dword ptr [rsp+0CH]
       F7D6                 not      esi
       23F7                 and      esi, edi
       03C6                 add      eax, esi

G_M52301_IG03:
       4883C418             add      rsp, 24
       C3                   ret      

; Total bytes of code 57, prolog size 4 for method MaxBenchmark.Benchmarks:Max9():int:this
; ============================================================
