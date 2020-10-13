## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; UnmanagedCall.Benchmarks.EmptyBenchmark.DllImport()
       push      rbp
       push      r15
       push      r14
       push      r13
       push      r12
       push      rdi
       push      rsi
       push      rbx
       sub       rsp,68
       lea       rbp,[rsp+0A0]
       lea       rcx,[rbp+0FF88]
       mov       rdx,r10
       call      CORINFO_HELP_INIT_PINVOKE_FRAME
       mov       rsi,rax
       mov       rax,rsp
       mov       [rbp+0FFA8],rax
       mov       rax,rbp
       mov       [rbp+0FFB8],rax
       mov       rax,offset MD_UnmanagedCall.DllImport.NativeDllImport.empty()
       mov       [rbp+0FF98],rax
       lea       rax,[M00_L00]
       mov       [rbp+0FFB0],rax
       lea       rax,[rbp+0FF88]
       mov       [rsi+10],rax
       mov       byte ptr [rsi+0C],0
       call      qword ptr [7FFD26171420]
M00_L00:
       mov       byte ptr [rsi+0C],1
       cmp       dword ptr [7FFD26178D70],0
       je        short M00_L01
       call      qword ptr [7FFD2617D308]
M00_L01:
       mov       rax,[rbp+0FF90]
       mov       [rsi+10],rax
       mov       byte ptr [rsi+0C],1
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
; Total bytes of code 144
```

## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; UnmanagedCall.Benchmarks.EmptyBenchmark.FunctionPointerDefault()
       sub       rsp,28
       mov       rax,7FFDB2C81080
       call      rax
       nop
       add       rsp,28
       ret
; Total bytes of code 22
```

## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; UnmanagedCall.Benchmarks.EmptyBenchmark.FunctionPointerCdecl()
       push      rbp
       push      r15
       push      r14
       push      r13
       push      r12
       push      rdi
       push      rsi
       push      rbx
       sub       rsp,68
       lea       rbp,[rsp+0A0]
       lea       rcx,[rbp+0FF88]
       mov       rdx,r10
       call      CORINFO_HELP_INIT_PINVOKE_FRAME
       mov       rsi,rax
       mov       rax,rsp
       mov       [rbp+0FFA8],rax
       mov       rax,rbp
       mov       [rbp+0FFB8],rax
       lea       rax,[M00_L00]
       mov       [rbp+0FFB0],rax
       lea       rax,[rbp+0FF88]
       mov       [rsi+10],rax
       mov       byte ptr [rsi+0C],0
       mov       rax,7FFDB2C81080
       call      rax
M00_L00:
       mov       byte ptr [rsi+0C],1
       cmp       dword ptr [7FFD26178D70],0
       je        short M00_L01
       call      qword ptr [7FFD2617D308]
M00_L01:
       mov       rax,[rbp+0FF90]
       mov       [rsi+10],rax
       mov       byte ptr [rsi+0C],1
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
; Total bytes of code 136
```

