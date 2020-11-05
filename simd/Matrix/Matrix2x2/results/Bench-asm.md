## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; Bench.RowMajor()
       sub       rsp,58
       vzeroupper
       xor       eax,eax
       mov       [rsp+4C],eax
       mov       [rsp+50],rax
       mov       rax,459AC7EB8FF6
       mov       [rsp+50],rax
       vmovdqu   xmm0,xmmword ptr [rcx+40]
       vmovdqu   xmmword ptr [rsp+28],xmm0
       vmovdqu   xmm0,xmmword ptr [rcx+50]
       vmovdqu   xmmword ptr [rsp+38],xmm0
       mov       rdx,[rcx+10]
       mov       r8,[rcx+18]
       lea       rcx,[rsp+28]
       call      Matrix2x2RowMajor.MultiplyWithVector(Double*, Double*)
       mov       rcx,459AC7EB8FF6
       cmp       [rsp+50],rcx
       je        short M00_L00
       call      CORINFO_HELP_FAIL_FAST
M00_L00:
       nop
       add       rsp,58
       ret
; Total bytes of code 101
```
```assembly
; Matrix2x2RowMajor.MultiplyWithVector(Double*, Double*)
       vzeroupper
       vmovsd    xmm0,qword ptr [rcx]
       vmulsd    xmm0,xmm0,qword ptr [rdx]
       vmovsd    xmm1,qword ptr [rcx+8]
       vmulsd    xmm1,xmm1,qword ptr [rdx+8]
       vaddsd    xmm0,xmm1,xmm0
       vmovsd    qword ptr [r8],xmm0
       vmovsd    xmm0,qword ptr [rcx+10]
       vmulsd    xmm0,xmm0,qword ptr [rdx]
       vmovsd    xmm1,qword ptr [rcx+18]
       vmulsd    xmm1,xmm1,qword ptr [rdx+8]
       vaddsd    xmm0,xmm1,xmm0
       vmovsd    qword ptr [r8+8],xmm0
       ret
; Total bytes of code 60
```

## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; Bench.RowMajorSimd()
       sub       rsp,58
       vzeroupper
       xor       eax,eax
       mov       [rsp+4C],eax
       mov       [rsp+50],rax
       mov       rax,0D8ED06B90EFE
       mov       [rsp+50],rax
       vmovdqu   xmm0,xmmword ptr [rcx+40]
       vmovdqu   xmmword ptr [rsp+28],xmm0
       vmovdqu   xmm0,xmmword ptr [rcx+50]
       vmovdqu   xmmword ptr [rsp+38],xmm0
       mov       rdx,[rcx+10]
       mov       r8,[rcx+18]
       lea       rcx,[rsp+28]
       call      Matrix2x2RowMajor.MultipylWithVectorSimd(Double*, Double*)
       mov       rcx,0D8ED06B90EFE
       cmp       [rsp+50],rcx
       je        short M00_L00
       call      CORINFO_HELP_FAIL_FAST
M00_L00:
       nop
       add       rsp,58
       ret
; Total bytes of code 101
```
```assembly
; Matrix2x2RowMajor.MultipylWithVectorSimd(Double*, Double*)
       vzeroupper
       vmovupd   xmm0,[rcx]
       vmovupd   xmm1,[rcx+10]
       vmovupd   xmm2,[rdx]
       vmulpd    xmm0,xmm0,xmm2
       vmulpd    xmm1,xmm1,xmm2
       vhaddpd   xmm0,xmm0,xmm1
       vmovupd   [r8],xmm0
       ret
; Total bytes of code 34
```

## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; Bench.ColumnMajor()
       sub       rsp,58
       vzeroupper
       xor       eax,eax
       mov       [rsp+4C],eax
       mov       [rsp+50],rax
       mov       rax,2F4A434177B2
       mov       [rsp+50],rax
       vmovdqu   xmm0,xmmword ptr [rcx+20]
       vmovdqu   xmmword ptr [rsp+28],xmm0
       vmovdqu   xmm0,xmmword ptr [rcx+30]
       vmovdqu   xmmword ptr [rsp+38],xmm0
       mov       rdx,[rcx+10]
       mov       r8,[rcx+18]
       lea       rcx,[rsp+28]
       call      Matrix2x2ColumnMajor.MultiplyWithVector(Double*, Double*)
       mov       rcx,2F4A434177B2
       cmp       [rsp+50],rcx
       je        short M00_L00
       call      CORINFO_HELP_FAIL_FAST
M00_L00:
       nop
       add       rsp,58
       ret
; Total bytes of code 101
```
```assembly
; Matrix2x2ColumnMajor.MultiplyWithVector(Double*, Double*)
       vzeroupper
       vmovsd    xmm0,qword ptr [rcx]
       vmulsd    xmm0,xmm0,qword ptr [rdx]
       vmovsd    xmm1,qword ptr [rcx+10]
       vmulsd    xmm1,xmm1,qword ptr [rdx+8]
       vaddsd    xmm0,xmm1,xmm0
       vmovsd    qword ptr [r8],xmm0
       vmovsd    xmm0,qword ptr [rcx+8]
       vmulsd    xmm0,xmm0,qword ptr [rdx]
       vmovsd    xmm1,qword ptr [rcx+18]
       vmulsd    xmm1,xmm1,qword ptr [rdx+8]
       vaddsd    xmm0,xmm1,xmm0
       vmovsd    qword ptr [r8+8],xmm0
       ret
; Total bytes of code 60
```

## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; Bench.ColumnMajorSimd()
       sub       rsp,58
       vzeroupper
       xor       eax,eax
       mov       [rsp+4C],eax
       mov       [rsp+50],rax
       mov       rax,7C6259F78BF1
       mov       [rsp+50],rax
       vmovdqu   xmm0,xmmword ptr [rcx+20]
       vmovdqu   xmmword ptr [rsp+28],xmm0
       vmovdqu   xmm0,xmmword ptr [rcx+30]
       vmovdqu   xmmword ptr [rsp+38],xmm0
       mov       rdx,[rcx+10]
       mov       r8,[rcx+18]
       lea       rcx,[rsp+28]
       call      Matrix2x2ColumnMajor.MultipylWithVectorSimd(Double*, Double*)
       mov       rcx,7C6259F78BF1
       cmp       [rsp+50],rcx
       je        short M00_L00
       call      CORINFO_HELP_FAIL_FAST
M00_L00:
       nop
       add       rsp,58
       ret
; Total bytes of code 101
```
```assembly
; Matrix2x2ColumnMajor.MultipylWithVectorSimd(Double*, Double*)
       vzeroupper
       vmovupd   xmm0,[rcx]
       vmovupd   xmm1,[rcx+10]
       vmovddup  xmm2,qword ptr [rdx]
       vmovddup  xmm3,qword ptr [rdx+8]
       vmulpd    xmm0,xmm0,xmm2
       vmulpd    xmm1,xmm1,xmm3
       vaddpd    xmm0,xmm0,xmm1
       vmovupd   [r8],xmm0
       ret
; Total bytes of code 39
```

