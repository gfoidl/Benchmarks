## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; UnmanagedCall.Benchmarks.AddDoubleBenchmark.DllImport()
       push      rbp
       push      r15
       push      r14
       push      r13
       push      r12
       push      rdi
       push      rsi
       push      rbx
       sub       rsp,68
       vzeroupper
       lea       rbp,[rsp+0A0]
       mov       rsi,rcx
       lea       rcx,[rbp+0FF88]
       mov       rdx,r10
       call      CORINFO_HELP_INIT_PINVOKE_FRAME
       mov       rdi,rax
       mov       rax,rsp
       mov       [rbp+0FFA8],rax
       mov       rax,rbp
       mov       [rbp+0FFB8],rax
       vmovsd    xmm0,qword ptr [rsi+8]
       vmovsd    xmm1,qword ptr [rsi+10]
       mov       rax,offset MD_UnmanagedCall.DllImport.NativeDllImport.add_d(Double, Double)
       mov       [rbp+0FF98],rax
       lea       rax,[M00_L00]
       mov       [rbp+0FFB0],rax
       lea       rax,[rbp+0FF88]
       mov       [rdi+10],rax
       mov       byte ptr [rdi+0C],0
       call      qword ptr [7FFD26141A88]
M00_L00:
       mov       byte ptr [rdi+0C],1
       cmp       dword ptr [7FFD26148D70],0
       je        short M00_L01
       call      qword ptr [7FFD2614D308]
M00_L01:
       mov       rax,[rbp+0FF90]
       mov       [rdi+10],rax
       mov       byte ptr [rdi+0C],1
       lea       rsp,[rbp+0FFC8]
       pop       rbx
       pop       rsi
       pop       rdi
       pop       r12
       pop       r13
       pop       r14
       pop       r15
       pop       rbp
       ret
; Total bytes of code 160
```

## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; UnmanagedCall.Benchmarks.AddDoubleBenchmark.FunctionPointerDefault()
       vzeroupper
       vmovsd    xmm0,qword ptr [rcx+8]
       vmovsd    xmm1,qword ptr [rcx+10]
       mov       rax,7FFDB39D1010
       jmp       rax
; Total bytes of code 26
```

## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; UnmanagedCall.Benchmarks.AddDoubleBenchmark.FunctionPointerCdecl()
       push      rbp
       push      r15
       push      r14
       push      r13
       push      r12
       push      rdi
       push      rsi
       push      rbx
       sub       rsp,68
       vzeroupper
       lea       rbp,[rsp+0A0]
       mov       rsi,rcx
       lea       rcx,[rbp+0FF88]
       mov       rdx,r10
       call      CORINFO_HELP_INIT_PINVOKE_FRAME
       mov       rdi,rax
       mov       rax,rsp
       mov       [rbp+0FFA8],rax
       mov       rax,rbp
       mov       [rbp+0FFB8],rax
       vmovsd    xmm0,qword ptr [rsi+8]
       vmovsd    xmm1,qword ptr [rsi+10]
       lea       rax,[M00_L00]
       mov       [rbp+0FFB0],rax
       lea       rax,[rbp+0FF88]
       mov       [rdi+10],rax
       mov       byte ptr [rdi+0C],0
       mov       rax,7FFDB39D1010
       call      rax
M00_L00:
       mov       byte ptr [rdi+0C],1
       cmp       dword ptr [7FFD26158D70],0
       je        short M00_L01
       call      qword ptr [7FFD2615D308]
M00_L01:
       mov       rax,[rbp+0FF90]
       mov       [rdi+10],rax
       mov       byte ptr [rdi+0C],1
       lea       rsp,[rbp+0FFC8]
       pop       rbx
       pop       rsi
       pop       rdi
       pop       r12
       pop       r13
       pop       r14
       pop       r15
       pop       rbp
       ret
; Total bytes of code 152
```

