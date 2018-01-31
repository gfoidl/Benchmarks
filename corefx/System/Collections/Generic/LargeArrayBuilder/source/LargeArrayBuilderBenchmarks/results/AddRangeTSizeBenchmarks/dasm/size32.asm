; while-loop for typeof(T) == typeof(Large)
;
; public struct Large
; {
;     public long A;
;     public long B;
;     public long C;
;     public long D;
; }
G_M47436_IG04:
       488D75C0             lea      rsi, bword ptr [rbp-40H]
       488B7DB8             mov      rdi, gword ptr [rbp-48H]
       49BB30001C8B297F0000 mov      r11, 0x7F298B1C0030
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.Collections.Generic.IEnumerator`1[Large][ConsoleApplication.Large]:get_Current():struct:this
       488B55E8             mov      rdx, gword ptr [rbp-18H]
       8B5208               mov      edx, dword ptr [rdx+8]
       3955E0               cmp      dword ptr [rbp-20H], edx
       722B                 jb       SHORT G_M47436_IG05
       C4E17A6F45C0         vmovdqu  xmm0, qword ptr [rbp-40H]				; copy for arg item in AddWithBufferAllocation
       C4E17A7F0424         vmovdqu  qword ptr [rsp], xmm0
       C4E17A6F45D0         vmovdqu  xmm0, qword ptr [rbp-30H]
       C4E17A7F442410       vmovdqu  qword ptr [rsp+10H], xmm0
       488D55E0             lea      rdx, bword ptr [rbp-20H]
       488D75E8             lea      rsi, bword ptr [rbp-18H]
       488BFB               mov      rdi, rbx
       E8EBFBFFFF           call     System.Collections.Generic.LargeArrayBuilder1`1[Large][ConsoleApplication.Large]:AddWithBufferAllocation(struct,byref,byref):this
       EB2B                 jmp      SHORT G_M47436_IG06

G_M47436_IG05:
       488B7DE8             mov      rdi, gword ptr [rbp-18H]
       448B5DE0             mov      r11d, dword ptr [rbp-20H]
       4D63DB               movsxd   r11, r11d
       49C1E305             shl      r11, 5
       4A8D7C1F10           lea      rdi, bword ptr [rdi+r11+16]
       C4E17A6F45C0         vmovdqu  xmm0, qword ptr [rbp-40H]				; copy for destination[index] = item
       C4E17A7F07           vmovdqu  qword ptr [rdi], xmm0
       C4E17A6F45D0         vmovdqu  xmm0, qword ptr [rbp-30H]
       C4E17A7F4710         vmovdqu  qword ptr [rdi+16], xmm0

G_M47436_IG06:
       8B7DE0               mov      edi, dword ptr [rbp-20H]
       FFC7                 inc      edi
       897DE0               mov      dword ptr [rbp-20H], edi
       488B7DB8             mov      rdi, gword ptr [rbp-48H]
       49BB28001C8B297F0000 mov      r11, 0x7F298B1C0028
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.Collections.IEnumerator:MoveNext():bool:this
       85C0                 test     eax, eax
       0F8564FFFFFF         jne      G_M47436_IG04