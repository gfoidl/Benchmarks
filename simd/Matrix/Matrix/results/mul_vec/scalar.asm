; gfoidl.Numerics.MatrixExtensions.MultiplyCore(gfoidl.Numerics.Matrix, Double ByRef, Double ByRef)
       push      rdi
       push      rsi
       sub       rsp,18
       vzeroupper
       xor       eax,eax
       mov       [rsp+10],rax
       mov       [rsp+8],rax
       mov       [rsp+10],rdx
       mov       [rsp+8],r8
       mov       eax,[rcx+18]
       mov       r9d,[rcx+1C]
       vmovsd    xmm0,qword ptr [rdx]
       mov       r10,[rcx+10]
       xor       r11d,r11d
       test      rax,rax
       jle       short M01_L01
M01_L00:
       vmulsd    xmm1,xmm0,qword ptr [r10+r11*8]
       vmovsd    qword ptr [r8+r11*8],xmm1
       inc       r11
       cmp       r11,rax
       jl        short M01_L00
M01_L01:
       mov       r11d,1
       cmp       r9,1
       jle       short M01_L05
M01_L02:
       vmovsd    xmm0,qword ptr [rdx+r11*8]
       mov       r10d,[rcx+20]
       imul      r10,r11
       mov       rsi,[rcx+10]
       lea       r10,[rsi+r10*8]
       xor       esi,esi
       test      rax,rax
       jle       short M01_L04
M01_L03:
       lea       rdi,[r8+rsi*8]
       vmovsd    xmm1,qword ptr [rdi]
       vmulsd    xmm2,xmm0,qword ptr [r10+rsi*8]
       vaddsd    xmm1,xmm1,xmm2
       vmovsd    qword ptr [rdi],xmm1
       inc       rsi
       cmp       rsi,rax
       jl        short M01_L03
M01_L04:
       inc       r11
       cmp       r11,r9
       jl        short M01_L02
M01_L05:
       xor       eax,eax
       mov       [rsp+8],rax
       mov       [rsp+10],rax
       add       rsp,18
       pop       rsi
       pop       rdi
       ret
; Total bytes of code 172

; gfoidl.Numerics.RowMajorMatrixExtensions.MultiplyCore(gfoidl.Numerics.RowMajorMatrix, Double ByRef, Double ByRef)
       push      rsi
       sub       rsp,10
       vzeroupper
       xor       eax,eax
       mov       [rsp+8],rax
       mov       [rsp],rax
       mov       [rsp+8],rdx
       mov       [rsp],r8
       mov       eax,[rcx+18]
       mov       r9d,[rcx+1C]
       xor       r10d,r10d
       test      rax,rax
       jle       short M01_L03
M01_L00:
       mov       r11d,[rcx+20]
       imul      r11,r10
       mov       rsi,[rcx+10]
       lea       r11,[rsi+r11*8]
       vxorps    xmm0,xmm0,xmm0
       xor       esi,esi
       test      r9,r9
       jle       short M01_L02
M01_L01:
       vmovsd    xmm1,qword ptr [r11+rsi*8]
       vmulsd    xmm1,xmm1,qword ptr [rdx+rsi*8]
       vaddsd    xmm0,xmm1,xmm0
       inc       rsi
       cmp       rsi,r9
       jl        short M01_L01
M01_L02:
       vmovsd    qword ptr [r8+r10*8],xmm0
       inc       r10
       cmp       r10,rax
       jl        short M01_L00
M01_L03:
       xor       eax,eax
       mov       [rsp],rax
       mov       [rsp+8],rax
       add       rsp,10
       pop       rsi
       ret
; Total bytes of code 124
