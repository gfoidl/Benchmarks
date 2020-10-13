## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; UnmanagedCall.Benchmarks.AddIntegerBenchmark.DllImport()
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
       mov       rsi,rcx
       lea       rcx,[rbp+0FF88]
       mov       rdx,r10
       call      CORINFO_HELP_INIT_PINVOKE_FRAME
       mov       rdi,rax
       mov       rcx,rsp
       mov       [rbp+0FFA8],rcx
       mov       rcx,rbp
       mov       [rbp+0FFB8],rcx
       mov       ecx,[rsi+8]
       mov       edx,[rsi+0C]
       mov       rax,offset MD_UnmanagedCall.DllImport.NativeDllImport.add_i(Int32, Int32)
       mov       [rbp+0FF98],rax
       lea       rax,[M00_L00]
       mov       [rbp+0FFB0],rax
       lea       rax,[rbp+0FF88]
       mov       [rdi+10],rax
       mov       byte ptr [rdi+0C],0
       call      qword ptr [7FFD26141A78]
M00_L00:
       mov       byte ptr [rdi+0C],1
       cmp       dword ptr [7FFD26148D70],0
       je        short M00_L01
       call      qword ptr [7FFD2614D308]
M00_L01:
       mov       rdx,[rbp+0FF90]
       mov       [rdi+10],rdx
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
; Total bytes of code 153
```

## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; UnmanagedCall.Benchmarks.AddIntegerBenchmark.FunctionPointerDefault()
       mov       edx,[rcx+8]
       mov       eax,[rcx+0C]
       mov       ecx,edx
       mov       edx,eax
       mov       rax,7FFDB2C81000
       jmp       rax
; Total bytes of code 23
```

## .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
```assembly
; UnmanagedCall.Benchmarks.AddIntegerBenchmark.FunctinoPointerCdecl()
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
       mov       rsi,rcx
       lea       rcx,[rbp+0FF88]
       mov       rdx,r10
       call      CORINFO_HELP_INIT_PINVOKE_FRAME
       mov       rdi,rax
       mov       rcx,rsp
       mov       [rbp+0FFA8],rcx
       mov       rcx,rbp
       mov       [rbp+0FFB8],rcx
       mov       ecx,[rsi+8]
       mov       edx,[rsi+0C]
       lea       rax,[M00_L00]
       mov       [rbp+0FFB0],rax
       lea       rax,[rbp+0FF88]
       mov       [rdi+10],rax
       mov       byte ptr [rdi+0C],0
       mov       rax,7FFDB2C81000
       call      rax
M00_L00:
       mov       byte ptr [rdi+0C],1
       cmp       dword ptr [7FFD26168D70],0
       je        short M00_L01
       call      qword ptr [7FFD2616D308]
M00_L01:
       mov       rdx,[rbp+0FF90]
       mov       [rdi+10],rdx
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
; Total bytes of code 145
```

