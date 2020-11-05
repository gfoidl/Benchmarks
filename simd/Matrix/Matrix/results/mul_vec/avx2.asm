; gfoidl.Numerics.MatrixExtensions.MultiplyCore(gfoidl.Numerics.Matrix, Double ByRef, Double ByRef)
       push      rdi
       push      rsi
       push      rbp
       push      rbx
       sub       rsp,18
       vzeroupper
       xor       eax,eax
       mov       [rsp+10],rax
       mov       [rsp+8],rax
       mov       [rsp+10],rdx
       mov       [rsp+8],r8
       mov       eax,[rcx+18]
       mov       r9d,[rcx+1C]
       xor       r10d,r10d
       mov       r11,[rcx+10]
       vbroadcastsd ymm0,qword ptr [rdx]
       cmp       rax,8
       jl        short M01_L01
       lea       rbx,[rax+0FFF8]
M01_L00:
       vmovupd   ymm1,[r11+r10*8]
       vmulpd    ymm1,ymm1,ymm0
       vmovupd   ymm2,[r11+r10*8+20]
       vmulpd    ymm2,ymm2,ymm0
       lea       rdi,[r8+r10*8]
       vmovupd   [rdi],ymm1
       vmovupd   [rdi+20],ymm2
       add       r10,8
       cmp       r10,rbx
       jle       short M01_L00
M01_L01:
       lea       rsi,[rax+0FFFE]
       cmp       r10,rsi
       jg        short M01_L03
       vmovaps   ymm1,ymm0
M01_L02:
       vmovupd   xmm2,[r11+r10*8]
       vmulpd    xmm2,xmm2,xmm1
       vmovupd   [r8+r10*8],xmm2
       add       r10,2
       cmp       r10,rsi
       jle       short M01_L02
M01_L03:
       cmp       r10,rax
       jge       short M01_L04
       vmulsd    xmm0,xmm0,qword ptr [r11+r10*8]
       vmovsd    qword ptr [r8+r10*8],xmm0
M01_L04:
       mov       edi,1
       cmp       r9,1
       jle       near ptr M01_L11
M01_L05:
       xor       r10d,r10d
       mov       r11d,[rcx+20]
       imul      r11,rdi
       mov       rbx,[rcx+10]
       lea       r11,[rbx+r11*8]
       vbroadcastsd ymm0,qword ptr [rdx+rdi*8]
       cmp       rax,8
       jl        short M01_L07
       lea       rbx,[rax+0FFF8]
M01_L06:
       vmovupd   ymm1,[r11+r10*8]
       vmovupd   ymm2,[r11+r10*8+20]
       vmovupd   ymm3,[r8+r10*8]
       vmovupd   ymm4,[r8+r10*8+20]
       vmulpd    ymm1,ymm1,ymm0
       vmulpd    ymm2,ymm2,ymm0
       vaddpd    ymm3,ymm3,ymm1
       vaddpd    ymm4,ymm4,ymm2
       lea       rbp,[r8+r10*8]
       vmovupd   [rbp],ymm3
       vmovupd   [rbp+20],ymm4
       add       r10,8
       cmp       r10,rbx
       jle       short M01_L06
M01_L07:
       cmp       r10,rsi
       jg        short M01_L09
       vmovaps   ymm1,ymm0
M01_L08:
       vmovupd   xmm2,[r11+r10*8]
       vmovupd   xmm3,[r8+r10*8]
       vmulpd    xmm2,xmm2,xmm1
       vaddpd    xmm2,xmm3,xmm2
       vmovupd   [r8+r10*8],xmm2
       add       r10,2
       cmp       r10,rsi
       jle       short M01_L08
M01_L09:
       cmp       r10,rax
       jge       short M01_L10
       lea       rbx,[r8+r10*8]
       vmovsd    xmm1,qword ptr [rbx]
       vmulsd    xmm0,xmm0,qword ptr [r11+r10*8]
       vaddsd    xmm0,xmm1,xmm0
       vmovsd    qword ptr [rbx],xmm0
M01_L10:
       inc       rdi
       cmp       rdi,r9
       jl        near ptr M01_L05
M01_L11:
       xor       eax,eax
       mov       [rsp+8],rax
       mov       [rsp+10],rax
       vzeroupper
       add       rsp,18
       pop       rbx
       pop       rbp
       pop       rsi
       pop       rdi
       ret
; Total bytes of code 382