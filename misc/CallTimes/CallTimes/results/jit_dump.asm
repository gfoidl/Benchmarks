; Assembly listing for method CallTimes.Benchmarks:Direct():this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T01] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V02 rat0         [V02,T00] (  3,  6   )     ref  ->  rdi        
;
; Lcl frame size = 0

G_M51819_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp

G_M51819_IG02:
       488B7F08             mov      rdi, gword ptr [rdi+8]
       488B07               mov      rax, qword ptr [rdi]
       488B4048             mov      rax, qword ptr [rax+72]
       FF5020               call     qword ptr [rax+32]CallTimes.Base:Do():this
       90                   nop      

G_M51819_IG03:
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 21, prolog size 4 for method CallTimes.Benchmarks:Direct():this
; ============================================================
; Assembly listing for method CallTimes.Benchmarks:Interface():this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;
; Lcl frame size = 0

G_M22787_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp

G_M22787_IG02:
       488B7F10             mov      rdi, gword ptr [rdi+16]
       49BBA80099430E7F0000 mov      r11, 0x7F0E439900A8
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]CallTimes.IFoo:Do():this
       90                   nop      

G_M22787_IG03:
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 26, prolog size 4 for method CallTimes.Benchmarks:Interface():this
; ============================================================
; Assembly listing for method CallTimes.Benchmarks:Abstract():this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T01] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V02 rat0         [V02,T00] (  3,  6   )     ref  ->  rdi        
;
; Lcl frame size = 0

G_M28646_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp

G_M28646_IG02:
       488B7F18             mov      rdi, gword ptr [rdi+24]
       488B07               mov      rax, qword ptr [rdi]
       488B4048             mov      rax, qword ptr [rax+72]
       FF5020               call     qword ptr [rax+32]CallTimes.Base:Do():this
       90                   nop      

G_M28646_IG03:
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 21, prolog size 4 for method CallTimes.Benchmarks:Abstract():this
; ============================================================
; Assembly listing for method CallTimes.Benchmarks:AbstractSealed():this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T01] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V02 rat0         [V02,T00] (  3,  6   )     ref  ->  rdi        
;
; Lcl frame size = 0

G_M53180_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp

G_M53180_IG02:
       488B7F20             mov      rdi, gword ptr [rdi+32]
       488B07               mov      rax, qword ptr [rdi]
       488B4048             mov      rax, qword ptr [rax+72]
       FF5020               call     qword ptr [rax+32]CallTimes.Base:Do():this
       90                   nop      

G_M53180_IG03:
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 21, prolog size 4 for method CallTimes.Benchmarks:AbstractSealed():this
; ============================================================
; Assembly listing for method CallTimes.Benchmarks:Delegate():this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V02 rat0         [V02,T01] (  2,  4   )     ref  ->  rax        
;
; Lcl frame size = 8

G_M41785_IG01:
       50                   push     rax

G_M41785_IG02:
       488B4728             mov      rax, gword ptr [rdi+40]
       488D7808             lea      rdi, bword ptr [rax+8]
       488B3F               mov      rdi, gword ptr [rdi]
       FF5018               call     qword ptr [rax+24]System.Action:Invoke():this
       90                   nop      

G_M41785_IG03:
       4883C408             add      rsp, 8
       C3                   ret      

; Total bytes of code 21, prolog size 1 for method CallTimes.Benchmarks:Delegate():this
; ============================================================
; Assembly listing for method CallTimes.Benchmarks:Expression():this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V02 rat0         [V02,T01] (  2,  4   )     ref  ->  rax        
;
; Lcl frame size = 8

G_M21716_IG01:
       50                   push     rax

G_M21716_IG02:
       488B4730             mov      rax, gword ptr [rdi+48]
       488D7808             lea      rdi, bword ptr [rax+8]
       488B3F               mov      rdi, gword ptr [rdi]
       FF5018               call     qword ptr [rax+24]System.Action:Invoke():this
       90                   nop      

G_M21716_IG03:
       4883C408             add      rsp, 8
       C3                   ret      

; Total bytes of code 21, prolog size 1 for method CallTimes.Benchmarks:Expression():this
; ============================================================
; Assembly listing for method CallTimes.Benchmarks:IlGenSimple():this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V02 rat0         [V02,T01] (  2,  4   )     ref  ->  rax        
;
; Lcl frame size = 8

G_M29857_IG01:
       50                   push     rax

G_M29857_IG02:
       488B4738             mov      rax, gword ptr [rdi+56]
       488D7808             lea      rdi, bword ptr [rax+8]
       488B3F               mov      rdi, gword ptr [rdi]
       FF5018               call     qword ptr [rax+24]System.Action:Invoke():this
       90                   nop      

G_M29857_IG03:
       4883C408             add      rsp, 8
       C3                   ret      

; Total bytes of code 21, prolog size 1 for method CallTimes.Benchmarks:IlGenSimple():this
; ============================================================
; Assembly listing for method CallTimes.Benchmarks:IlGen():this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 this         [V00,T00] (  3,  3   )     ref  ->  rdi         this class-hnd
;# V01 OutArgs      [V01    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V02 rat0         [V02,T01] (  2,  4   )     ref  ->  rax        
;
; Lcl frame size = 8

G_M14095_IG01:
       50                   push     rax

G_M14095_IG02:
       488B4740             mov      rax, gword ptr [rdi+64]
       488D7808             lea      rdi, bword ptr [rax+8]
       488B3F               mov      rdi, gword ptr [rdi]
       FF5018               call     qword ptr [rax+24]System.Action:Invoke():this
       90                   nop      

G_M14095_IG03:
       4883C408             add      rsp, 8
       C3                   ret      

; Total bytes of code 21, prolog size 1 for method CallTimes.Benchmarks:IlGen():this
; ============================================================
