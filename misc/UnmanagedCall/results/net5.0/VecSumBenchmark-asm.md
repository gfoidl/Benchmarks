## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; UnmanagedCall.Benchmarks.VecSumBenchmark.DllImport()
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
       mov       rcx,rsp
       mov       [rbp+0FFA8],rcx
       mov       rcx,rbp
       mov       [rbp+0FFB8],rcx
       mov       rcx,[rsi+8]
       mov       edx,[rsi+10]
       mov       rax,offset MD_UnmanagedCall.DllImport.NativeDllImport.vec_sum(Double*, Int32)
       mov       [rbp+0FF98],rax
       lea       rax,[M00_L00]
       mov       [rbp+0FFB0],rax
       lea       rax,[rbp+0FF88]
       mov       [rdi+10],rax
       mov       byte ptr [rdi+0C],0
       call      qword ptr [7FFD26151A98]
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
; Total bytes of code 157
```

## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; UnmanagedCall.Benchmarks.VecSumBenchmark.FunctionPointerDefault()
       mov       rdx,[rcx+8]
       mov       eax,[rcx+10]
       mov       rcx,rdx
       mov       edx,eax
       mov       rax,7FFDB2C81020
       jmp       rax
; Total bytes of code 25
```

## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; UnmanagedCall.Benchmarks.VecSumBenchmark.FunctionPointerCdecl()
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
       mov       rcx,rsp
       mov       [rbp+0FFA8],rcx
       mov       rcx,rbp
       mov       [rbp+0FFB8],rcx
       mov       rcx,[rsi+8]
       mov       edx,[rsi+10]
       lea       rax,[M00_L00]
       mov       [rbp+0FFB0],rax
       lea       rax,[rbp+0FF88]
       mov       [rdi+10],rax
       mov       byte ptr [rdi+0C],0
       mov       rax,7FFDB2C81020
       call      rax
M00_L00:
       mov       byte ptr [rdi+0C],1
       cmp       dword ptr [7FFD26178D70],0
       je        short M00_L01
       call      qword ptr [7FFD2617D308]
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
; Total bytes of code 149
```

