; Assembly listing for method Program:Do(struct,int):byref
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 arg0         [V00    ] (  1,  1   )  struct (32) [rsp+0x10]   do-not-enreg[XSF] addr-exposed ld-addr-op
;  V01 arg1         [V01,T00] (  4,  4   )     int  ->  rdi        
;# V02 OutArgs      [V02    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V03 tmp1         [V03,T01] (  3,  6   )   byref  ->  rax        
;
; Lcl frame size = 8

G_M56184_IG01:
       50                   push     rax

G_M56184_IG02:
       488D442420           lea      rax, bword ptr [rsp+20H]
       3B7808               cmp      edi, dword ptr [rax+8]
       730F                 jae      SHORT G_M56184_IG04
       488B00               mov      rax, bword ptr [rax]
       4863FF               movsxd   rdi, edi
       488D0478             lea      rax, bword ptr [rax+2*rdi]

G_M56184_IG03:
       4883C408             add      rsp, 8
       C3                   ret      

G_M56184_IG04:
       E801D81379           call     CORINFO_HELP_RNGCHKFAIL
       CC                   int3     

; Total bytes of code 32, prolog size 1 for method Program:Do(struct,int):byref
; ============================================================
