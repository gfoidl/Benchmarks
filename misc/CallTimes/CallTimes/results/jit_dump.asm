; Assembly listing for method Benchmarks:Direct():this
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T01] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V02 rat0         [V02,T00] (  3,  6   )     ref  ->  rdi         "virtual vtable call"
;
; Lcl frame size = 0

G_M6081_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp
       90                   nop

G_M6081_IG02:
       488B7F08             mov      rdi, gword ptr [rdi+8]
       488B07               mov      rax, qword ptr [rdi]
       488B4040             mov      rax, qword ptr [rax+64]
       FF5020               call     qword ptr [rax+32]Base:Do():this
       90                   nop

G_M6081_IG03:
       5D                   pop      rbp
       C3                   ret

; Total bytes of code 22, prolog size 5 for method Benchmarks:Direct():this
; ============================================================
; Assembly listing for method Benchmarks:Interface():this
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;
; Lcl frame size = 0

G_M33961_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp
       90                   nop

G_M33961_IG02:
       488B7F10             mov      rdi, gword ptr [rdi+16]
       49BBF802FCE9F97F0000 mov      r11, 0x7FF9E9FC02F8
       48B8F802FCE9F97F0000 mov      rax, 0x7FF9E9FC02F8
       393F                 cmp      dword ptr [rdi], edi
       FF10                 call     qword ptr [rax]IFoo:Do():this
       90                   nop

G_M33961_IG03:
       5D                   pop      rbp
       C3                   ret

; Total bytes of code 36, prolog size 5 for method Benchmarks:Interface():this
; ============================================================
; Assembly listing for method Benchmarks:Abstract():this
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T01] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V02 rat0         [V02,T00] (  3,  6   )     ref  ->  rdi         "virtual vtable call"
;
; Lcl frame size = 0

G_M45644_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp
       90                   nop

G_M45644_IG02:
       488B7F18             mov      rdi, gword ptr [rdi+24]
       488B07               mov      rax, qword ptr [rdi]
       488B4040             mov      rax, qword ptr [rax+64]
       FF5020               call     qword ptr [rax+32]Base:Do():this
       90                   nop

G_M45644_IG03:
       5D                   pop      rbp
       C3                   ret

; Total bytes of code 22, prolog size 5 for method Benchmarks:Abstract():this
; ============================================================
; Assembly listing for method Benchmarks:AbstractSealedBase():this
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T01] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V02 rat0         [V02,T00] (  3,  6   )     ref  ->  rdi         "virtual vtable call"
;
; Lcl frame size = 0

G_M63299_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp
       90                   nop

G_M63299_IG02:
       488B7F20             mov      rdi, gword ptr [rdi+32]
       488B07               mov      rax, qword ptr [rdi]
       488B4040             mov      rax, qword ptr [rax+64]
       FF5020               call     qword ptr [rax+32]Base:Do():this
       90                   nop

G_M63299_IG03:
       5D                   pop      rbp
       C3                   ret

; Total bytes of code 22, prolog size 5 for method Benchmarks:AbstractSealedBase():this
; ============================================================
; Assembly listing for method Benchmarks:AbstractSealed():this
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T01] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V02 tmp1         [V02,T00] (  3,  6   )     ref  ->  rax         class-hnd "Inlining Arg"
;
; Lcl frame size = 0

G_M4631_IG01:
       0F1F440000           nop

G_M4631_IG02:
       488B4728             mov      rax, gword ptr [rdi+40]
       FF4008               inc      dword ptr [rax+8]

G_M4631_IG03:
       C3                   ret

; Total bytes of code 13, prolog size 5 for method Benchmarks:AbstractSealed():this
; ============================================================
; Assembly listing for method Benchmarks:Delegate():this
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T01] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V02 rat0         [V02,T00] (  3,  6   )     ref  ->  rax         "delegate invoke call"
;
; Lcl frame size = 8

G_M32403_IG01:
       50                   push     rax
       0F1F4000             nop

G_M32403_IG02:
       488B4730             mov      rax, gword ptr [rdi+48]
       488B7808             mov      rdi, gword ptr [rax+8]
       FF5018               call     qword ptr [rax+24]Action:Invoke():this
       90                   nop

G_M32403_IG03:
       4883C408             add      rsp, 8
       C3                   ret

; Total bytes of code 22, prolog size 5 for method Benchmarks:Delegate():this
; ============================================================
; Assembly listing for method Benchmarks:Expression():this
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T01] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V02 rat0         [V02,T00] (  3,  6   )     ref  ->  rax         "delegate invoke call"
;
; Lcl frame size = 8

G_M35198_IG01:
       50                   push     rax
       0F1F4000             nop

G_M35198_IG02:
       488B4738             mov      rax, gword ptr [rdi+56]
       488B7808             mov      rdi, gword ptr [rax+8]
       FF5018               call     qword ptr [rax+24]Action:Invoke():this
       90                   nop

G_M35198_IG03:
       4883C408             add      rsp, 8
       C3                   ret

; Total bytes of code 22, prolog size 5 for method Benchmarks:Expression():this
; ============================================================
; Assembly listing for method Benchmarks:IlGenSimple():this
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T01] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V02 rat0         [V02,T00] (  3,  6   )     ref  ->  rax         "delegate invoke call"
;
; Lcl frame size = 8

G_M43275_IG01:
       50                   push     rax
       0F1F4000             nop

G_M43275_IG02:
       488B4740             mov      rax, gword ptr [rdi+64]
       488B7808             mov      rdi, gword ptr [rax+8]
       FF5018               call     qword ptr [rax+24]Action:Invoke():this
       90                   nop

G_M43275_IG03:
       4883C408             add      rsp, 8
       C3                   ret

; Total bytes of code 22, prolog size 5 for method Benchmarks:IlGenSimple():this
; ============================================================
; Assembly listing for method Benchmarks:IlGen():this
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T01] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V02 rat0         [V02,T00] (  3,  6   )     ref  ->  rax         "delegate invoke call"
;
; Lcl frame size = 8

G_M60069_IG01:
       50                   push     rax
       0F1F4000             nop

G_M60069_IG02:
       488B4748             mov      rax, gword ptr [rdi+72]
       488B7808             mov      rdi, gword ptr [rax+8]
       FF5018               call     qword ptr [rax+24]Action:Invoke():this
       90                   nop

G_M60069_IG03:
       4883C408             add      rsp, 8
       C3                   ret

; Total bytes of code 22, prolog size 5 for method Benchmarks:IlGen():this
; ============================================================
; Assembly listing for method Benchmarks:IlCall():this
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T01] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;  V02 tmp1         [V02,T00] (  3,  6   )     ref  ->  rax         class-hnd "Inlining Arg"
;
; Lcl frame size = 0

G_M27660_IG01:
       0F1F440000           nop

G_M27660_IG02:
       488B4708             mov      rax, gword ptr [rdi+8]
       FF4008               inc      dword ptr [rax+8]

G_M27660_IG03:
       C3                   ret

; Total bytes of code 13, prolog size 5 for method Benchmarks:IlCall():this
; ============================================================
; Assembly listing for method Benchmarks:IlCalli():this
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;* V02 tmp1         [V02,T01] (  0,  0   )    long  ->  zero-ref    "impImportIndirectCall"
;
; Lcl frame size = 0

G_M42146_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp
       90                   nop

G_M42146_IG02:
       488B7F08             mov      rdi, gword ptr [rdi+8]
       48B870F41EEBF97F0000 mov      rax, 0x7FF9EB1EF470
       FFD0                 call     rax
       90                   nop

G_M42146_IG03:
       5D                   pop      rbp
       C3                   ret

; Total bytes of code 24, prolog size 5 for method Benchmarks:IlCalli():this
; ============================================================
; Assembly listing for method Benchmarks:IlCalliTail():this
; Emitting BLENDED_CODE for X64 CPU with AVX - Unix
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]   "OutgoingArgSpace"
;* V02 tmp1         [V02,T01] (  0,  0   )    long  ->  zero-ref    "impImportIndirectCall"
;
; Lcl frame size = 0

G_M26674_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp
       90                   nop

G_M26674_IG02:
       488B7F08             mov      rdi, gword ptr [rdi+8]
       48B870F41EEBF97F0000 mov      rax, 0x7FF9EB1EF470

G_M26674_IG03:
       5D                   pop      rbp
       48FFE0               rex.jmp  rax

; Total bytes of code 23, prolog size 5 for method Benchmarks:IlCalliTail():this
; ============================================================
