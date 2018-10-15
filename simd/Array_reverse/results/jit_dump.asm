; Assembly listing for method Bench:Reverse(ref)
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T03] (  5,  5   )     ref  ->  rdi         class-hnd
;  V01 loc0         [V01,T04] (  3,  2   )    long  ->  rax        
;  V02 loc1         [V02    ] (  5,  3.50)     ref  ->  [rbp-0x08]   must-init pinned class-hnd
;  V03 loc2         [V03,T00] (  8, 23   )    long  ->  rax        
;  V04 loc3         [V04,T01] (  7, 22   )    long  ->  rdi        
;  V05 loc4         [V05,T02] (  2,  8   )     int  ->  rsi        
;# V06 OutArgs      [V06    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V07 tmp1         [V07,T05] (  2,  2   )    long  ->  rax        
;
; Lcl frame size = 16

G_M64586_IG01:
       55                   push     rbp
       4883EC10             sub      rsp, 16
       488D6C2410           lea      rbp, [rsp+10H]
       33C0                 xor      rax, rax
       488945F8             mov      qword ptr [rbp-08H], rax

G_M64586_IG02:
       48897DF8             mov      gword ptr [rbp-08H], rdi
       4885FF               test     rdi, rdi
       740A                 je       SHORT G_M64586_IG03
       488B45F8             mov      rax, gword ptr [rbp-08H]
       83780800             cmp      dword ptr [rax+8], 0
       7504                 jne      SHORT G_M64586_IG04

G_M64586_IG03:
       33C0                 xor      rax, rax
       EB12                 jmp      SHORT G_M64586_IG05

G_M64586_IG04:
       488B45F8             mov      rax, gword ptr [rbp-08H]
       83780800             cmp      dword ptr [rax+8], 0
       7639                 jbe      SHORT G_M64586_IG09
       488B45F8             mov      rax, gword ptr [rbp-08H]
       4883C010             add      rax, 16

G_M64586_IG05:
       8B7F08               mov      edi, dword ptr [rdi+8]
       4863FF               movsxd   rdi, edi
       488D7CB8FC           lea      rdi, [rax+4*rdi-4]
       483BC7               cmp      rax, rdi
       7315                 jae      SHORT G_M64586_IG07

G_M64586_IG06:
       8B30                 mov      esi, dword ptr [rax]
       8B17                 mov      edx, dword ptr [rdi]
       8910                 mov      dword ptr [rax], edx
       8937                 mov      dword ptr [rdi], esi
       4883C004             add      rax, 4
       4883C7FC             add      rdi, -4
       483BC7               cmp      rax, rdi
       72EB                 jb       SHORT G_M64586_IG06

G_M64586_IG07:
       33C0                 xor      rax, rax
       488945F8             mov      gword ptr [rbp-08H], rax

G_M64586_IG08:
       488D6500             lea      rsp, [rbp]
       5D                   pop      rbp
       C3                   ret      

G_M64586_IG09:
       E871BD1279           call     CORINFO_HELP_RNGCHKFAIL
       CC                   int3     

; Total bytes of code 112, prolog size 16 for method Bench:Reverse(ref)
; ============================================================
; Assembly listing for method Bench:ReverseSse2(ref)
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T03] (  6,  6   )     ref  ->  rdi         class-hnd
;  V01 loc0         [V01,T00] ( 15, 45   )   byref  ->  rdi        
;  V02 loc1         [V02,T01] (  9, 24   )   byref  ->  rax        
;  V03 loc2         [V03,T02] (  8, 23   )   byref  ->  rax        
;* V04 loc3         [V04    ] (  0,  0   )   byref  ->  zero-ref   
;* V05 loc4         [V05    ] (  0,  0   )   byref  ->  zero-ref   
;  V06 loc5         [V06,T04] (  2,  8   )  simd16  ->  mm0        
;  V07 loc6         [V07,T05] (  2,  8   )  simd16  ->  mm1        
;  V08 loc7         [V08,T06] (  2,  8   )     int  ->  rsi        
;# V09 OutArgs      [V09    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V10 tmp1         [V10,T08] (  3,  6   )     int  ->  rax        
;  V11 cse0         [V11,T07] (  6,  6   )     int  ->  rax        
;
; Lcl frame size = 0

G_M63496_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp

G_M63496_IG02:
       8B4708               mov      eax, dword ptr [rdi+8]
       83F800               cmp      eax, 0
       7663                 jbe      SHORT G_M63496_IG07
       4883C710             add      rdi, 16
       FFC8                 dec      eax
       4863C0               movsxd   rax, eax
       488D0487             lea      rax, bword ptr [rdi+4*rax]
       4883C0F4             add      rax, -12
       483BF8               cmp      rdi, rax
       732D                 jae      SHORT G_M63496_IG04

G_M63496_IG03:
       C4E1791007           vmovupd  xmm0, xmmword ptr [rdi]
       C4E17970C01B         vpshufd  xmm0, xmm0, 27
       C4E1791008           vmovupd  xmm1, xmmword ptr [rax]
       C4E17970C91B         vpshufd  xmm1, xmm1, 27
       C4E179110F           vmovupd  xmmword ptr [rdi], xmm1
       C4E1791100           vmovupd  xmmword ptr [rax], xmm0
       4883C710             add      rdi, 16
       4883C0F0             add      rax, -16
       483BF8               cmp      rdi, rax
       72D3                 jb       SHORT G_M63496_IG03

G_M63496_IG04:
       4883C00C             add      rax, 12
       483BF8               cmp      rdi, rax
       7315                 jae      SHORT G_M63496_IG06

G_M63496_IG05:
       8B37                 mov      esi, dword ptr [rdi]
       8B10                 mov      edx, dword ptr [rax]
       8917                 mov      dword ptr [rdi], edx
       8930                 mov      dword ptr [rax], esi
       4883C704             add      rdi, 4
       4883C0FC             add      rax, -4
       483BF8               cmp      rdi, rax
       72EB                 jb       SHORT G_M63496_IG05

G_M63496_IG06:
       5D                   pop      rbp
       C3                   ret      

G_M63496_IG07:
       E81CB21279           call     CORINFO_HELP_RNGCHKFAIL
       CC                   int3     

; Total bytes of code 117, prolog size 4 for method Bench:ReverseSse2(ref)
; ============================================================
; Assembly listing for method Bench:ReverseSse2_CacheLine(ref)
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T09] (  6,  6   )     ref  ->  rdi         class-hnd
;  V01 loc0         [V01,T00] ( 24, 78   )   byref  ->  rdi        
;  V02 loc1         [V02,T02] ( 11, 26   )   byref  ->  rax        
;  V03 loc2         [V03,T01] ( 19, 58   )   byref  ->  rsi        
;* V04 loc3         [V04    ] (  0,  0   )   byref  ->  zero-ref   
;  V05 loc4         [V05,T04] (  3, 12   )   byref  ->  rax        
;  V06 loc5         [V06,T05] (  3, 12   )   byref  ->  rdx        
;  V07 loc6         [V07,T06] (  3, 12   )   byref  ->  rcx        
;* V08 loc7         [V08    ] (  0,  0   )   byref  ->  zero-ref   
;  V09 loc8         [V09,T07] (  3, 12   )   byref  ->   r8        
;  V10 loc9         [V10,T08] (  3, 12   )   byref  ->   r9        
;  V11 loc10        [V11,T10] (  2,  8   )  simd16  ->  mm0        
;  V12 loc11        [V12,T11] (  2,  8   )  simd16  ->  mm1        
;  V13 loc12        [V13,T12] (  2,  8   )  simd16  ->  mm2        
;  V14 loc13        [V14,T13] (  2,  8   )  simd16  ->  mm3        
;  V15 loc14        [V15,T14] (  2,  8   )  simd16  ->  mm4        
;  V16 loc15        [V16,T15] (  2,  8   )  simd16  ->  mm5        
;  V17 loc16        [V17,T16] (  2,  8   )  simd16  ->  mm6        
;  V18 loc17        [V18,T17] (  2,  8   )  simd16  ->  mm7        
;* V19 loc18        [V19    ] (  0,  0   )   byref  ->  zero-ref   
;* V20 loc19        [V20    ] (  0,  0   )   byref  ->  zero-ref   
;  V21 loc20        [V21,T18] (  2,  8   )  simd16  ->  mm0        
;  V22 loc21        [V22,T19] (  2,  8   )  simd16  ->  mm1        
;  V23 loc22        [V23,T20] (  2,  8   )     int  ->  rsi        
;# V24 OutArgs      [V24    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V25 tmp1         [V25,T03] (  3, 24   )   byref  ->  r10        
;  V26 tmp2         [V26,T22] (  3,  6   )     int  ->  rax        
;* V27 tmp3         [V27    ] (  0,  0   )   byref  ->  zero-ref   
;* V28 tmp4         [V28    ] (  0,  0   )   byref  ->  zero-ref   
;* V29 tmp5         [V29    ] (  0,  0   )   byref  ->  zero-ref   
;* V30 tmp6         [V30    ] (  0,  0   )   byref  ->  zero-ref   
;* V31 tmp7         [V31    ] (  0,  0   )   byref  ->  zero-ref   
;* V32 tmp8         [V32    ] (  0,  0   )   byref  ->  zero-ref   
;* V33 tmp9         [V33    ] (  0,  0   )   byref  ->  zero-ref   
;* V34 tmp10        [V34    ] (  0,  0   )   byref  ->  zero-ref   
;  V35 cse0         [V35,T21] (  6,  6   )     int  ->  rax        
;
; Lcl frame size = 0

G_M37152_IG01:
       55                   push     rbp
       488BEC               mov      rbp, rsp

G_M37152_IG02:
       8B4708               mov      eax, dword ptr [rdi+8]
       83F800               cmp      eax, 0
       0F861D010000         jbe      G_M37152_IG09
       4883C710             add      rdi, 16
       FFC8                 dec      eax
       4863C0               movsxd   rax, eax
       488D0487             lea      rax, bword ptr [rdi+4*rax]
       488D70C4             lea      rsi, bword ptr [rax-60]
       483BFE               cmp      rdi, rsi
       0F83A9000000         jae      G_M37152_IG04

G_M37152_IG03:
       488D4710             lea      rax, bword ptr [rdi+16]
       488D5720             lea      rdx, bword ptr [rdi+32]
       488D4F30             lea      rcx, bword ptr [rdi+48]
       4C8D4610             lea      r8, bword ptr [rsi+16]
       4C8D4E20             lea      r9, bword ptr [rsi+32]
       4C8D5630             lea      r10, bword ptr [rsi+48]
       C4E1791007           vmovupd  xmm0, xmmword ptr [rdi]
       C4E17970C01B         vpshufd  xmm0, xmm0, 27
       C4E1791008           vmovupd  xmm1, xmmword ptr [rax]
       C4E17970C91B         vpshufd  xmm1, xmm1, 27
       C4E1791012           vmovupd  xmm2, xmmword ptr [rdx]
       C4E17970D21B         vpshufd  xmm2, xmm2, 27
       C4E1791019           vmovupd  xmm3, xmmword ptr [rcx]
       C4E17970DB1B         vpshufd  xmm3, xmm3, 27
       C4E1791026           vmovupd  xmm4, xmmword ptr [rsi]
       C4E17970E41B         vpshufd  xmm4, xmm4, 27
       C4C1791028           vmovupd  xmm5, xmmword ptr [r8]
       C4E17970ED1B         vpshufd  xmm5, xmm5, 27
       C4C1791031           vmovupd  xmm6, xmmword ptr [r9]
       C4E17970F61B         vpshufd  xmm6, xmm6, 27
       C4C179103A           vmovupd  xmm7, xmmword ptr [r10]
       C4E17970FF1B         vpshufd  xmm7, xmm7, 27
       C4E179113F           vmovupd  xmmword ptr [rdi], xmm7
       C4E1791130           vmovupd  xmmword ptr [rax], xmm6
       C4E179112A           vmovupd  xmmword ptr [rdx], xmm5
       C4E1791121           vmovupd  xmmword ptr [rcx], xmm4
       C4E179111E           vmovupd  xmmword ptr [rsi], xmm3
       C4C1791110           vmovupd  xmmword ptr [r8], xmm2
       C4C1791109           vmovupd  xmmword ptr [r9], xmm1
       C4C1791102           vmovupd  xmmword ptr [r10], xmm0
       4883C740             add      rdi, 64
       4883C6C0             add      rsi, -64
       483BFE               cmp      rdi, rsi
       0F8257FFFFFF         jb       G_M37152_IG03

G_M37152_IG04:
       488D463C             lea      rax, bword ptr [rsi+60]
       488D70F4             lea      rsi, bword ptr [rax-12]
       483BFE               cmp      rdi, rsi
       732D                 jae      SHORT G_M37152_IG06

G_M37152_IG05:
       C4E1791007           vmovupd  xmm0, xmmword ptr [rdi]
       C4E17970C01B         vpshufd  xmm0, xmm0, 27
       C4E179100E           vmovupd  xmm1, xmmword ptr [rsi]
       C4E17970C91B         vpshufd  xmm1, xmm1, 27
       C4E179110F           vmovupd  xmmword ptr [rdi], xmm1
       C4E1791106           vmovupd  xmmword ptr [rsi], xmm0
       4883C710             add      rdi, 16
       4883C6F0             add      rsi, -16
       483BFE               cmp      rdi, rsi
       72D3                 jb       SHORT G_M37152_IG05

G_M37152_IG06:
       488D460C             lea      rax, bword ptr [rsi+12]
       483BF8               cmp      rdi, rax
       7315                 jae      SHORT G_M37152_IG08

G_M37152_IG07:
       8B37                 mov      esi, dword ptr [rdi]
       8B10                 mov      edx, dword ptr [rax]
       8917                 mov      dword ptr [rdi], edx
       8930                 mov      dword ptr [rax], esi
       4883C704             add      rdi, 4
       4883C0FC             add      rax, -4
       483BF8               cmp      rdi, rax
       72EB                 jb       SHORT G_M37152_IG07

G_M37152_IG08:
       5D                   pop      rbp
       C3                   ret      

G_M37152_IG09:
       E8CEB01279           call     CORINFO_HELP_RNGCHKFAIL
       CC                   int3     

; Total bytes of code 307, prolog size 4 for method Bench:ReverseSse2_CacheLine(ref)
; ============================================================
