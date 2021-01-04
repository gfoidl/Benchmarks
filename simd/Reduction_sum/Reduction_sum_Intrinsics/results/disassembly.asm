### .NET Core 5.0.1 (CoreCLR 5.0.120.57516, CoreFX 5.0.120.57516), X64 RyuJIT

```assembly
; Bench.A()
       vzeroupper
       vmovupd   ymm0,[rcx+8]
       vhaddpd   ymm0,ymm0,ymm0
       vmovaps   ymm1,ymm0
       vextractf128 xmm0,ymm0,1
       vaddsd    xmm0,xmm1,xmm0
       vzeroupper
       ret
; Total bytes of code 30

; Bench.B()
       vzeroupper
       vmovupd   ymm0,[rcx+8]
       vhaddpd   ymm0,ymm0,ymm0
       vpermpd   ymm0,ymm0,8
       vhaddpd   xmm0,xmm0,xmm0
       vzeroupper
       ret
; Total bytes of code 26

; Bench.C()
       vzeroupper
       vmovupd   ymm0,[rcx+8]
       vhaddpd   ymm0,ymm0,ymm0
       vpermpd   ymm0,ymm0,8
       vpermilpd xmm1,xmm0,1
       vaddsd    xmm0,xmm0,xmm1
       vzeroupper
       ret
; Total bytes of code 32
```
