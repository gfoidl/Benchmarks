; while-loop for typeof(T) == typeof(Large), AddWithBufferAllocation has in-parameter
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
       49BB300041F37C7F0000 mov      r11, 0x7F7CF3410030
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.Collections.Generic.IEnumerator`1[Large][ConsoleApplication.Large]:get_Current():struct:this
       488B4DE8             mov      rcx, gword ptr [rbp-18H]
       8B4908               mov      ecx, dword ptr [rcx+8]
       394DE0               cmp      dword ptr [rbp-20H], ecx
       7216                 jb       SHORT G_M47436_IG05
       488D4DE0             lea      rcx, bword ptr [rbp-20H]
       488D75C0             lea      rsi, bword ptr [rbp-40H]
       488D55E8             lea      rdx, bword ptr [rbp-18H]
       488BFB               mov      rdi, rbx
       E800FCFFFF           call     System.Collections.Generic.LargeArrayBuilder1`1[Large][ConsoleApplication.Large]:AddWithBufferAllocation(byref,byref,byref):this
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
       49BB280041F37C7F0000 mov      r11, 0x7F7CF3410028
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.Collections.IEnumerator:MoveNext():bool:this
       85C0                 test     eax, eax
       0F8579FFFFFF         jne      G_M47436_IG04