; while-loop for typeof(T) == typeof(int)
G_M19396_IG04:
       488B7DE0             mov      rdi, gword ptr [rbp-20H]
       49BB300065699E7F0000 mov      r11, 0x7F9E69650030
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.Collections.Generic.IEnumerator`1[Int32][System.Int32]:get_Current():int:this
       488B55F0             mov      rdx, gword ptr [rbp-10H]
       8B5208               mov      edx, dword ptr [rdx+8]
       3955E8               cmp      dword ptr [rbp-18H], edx
       7214                 jb       SHORT G_M19396_IG05
       488D55F0             lea      rdx, bword ptr [rbp-10H]
       488D4DE8             lea      rcx, bword ptr [rbp-18H]
       488BFB               mov      rdi, rbx
       8BF0                 mov      esi, eax
       E8F8FBFFFF           call     System.Collections.Generic.LargeArrayBuilder1`1[Int32][System.Int32]:AddWithBufferAllocation(int,byref,byref):this
       EB10                 jmp      SHORT G_M19396_IG06

G_M19396_IG05:
       488B7DF0             mov      rdi, gword ptr [rbp-10H]
       448B5DE8             mov      r11d, dword ptr [rbp-18H]
       4D63DB               movsxd   r11, r11d
       4289449F10           mov      dword ptr [rdi+4*r11+16], eax

G_M19396_IG06:
       8B7DE8               mov      edi, dword ptr [rbp-18H]
       FFC7                 inc      edi
       897DE8               mov      dword ptr [rbp-18H], edi
       488B7DE0             mov      rdi, gword ptr [rbp-20H]
       49BB280065699E7F0000 mov      r11, 0x7F9E69650028
       393F                 cmp      dword ptr [rdi], edi
       41FF13               call     qword ptr [r11]System.Collections.IEnumerator:MoveNext():bool:this
       85C0                 test     eax, eax
       759E                 jne      SHORT G_M19396_IG04
