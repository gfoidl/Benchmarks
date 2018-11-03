``` ini

BenchmarkDotNet=v0.10.13, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.371)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742187 Hz, Resolution=364.6724 ns, Timer=TSC
.NET Core SDK=2.1.300-preview3-008618
  [Host] : .NET Core 2.1.0-preview3-26411-06 (CoreCLR 4.6.26411.07, CoreFX 4.6.26411.06), 64bit RyuJIT
  Clr    : .NET Framework 4.7.1 (CLR 4.0.30319.42000), 64bit RyuJIT-v4.7.2633.0
  Core   : .NET Core 2.1.0-preview3-26411-06 (CoreCLR 4.6.26411.07, CoreFX 4.6.26411.06), 64bit RyuJIT


```
|  Method |  Job | Runtime | DataSize |      Mean |     Error |    StdDev | Scaled |  Gen 0 | Allocated |
|-------- |----- |-------- |--------- |----------:|----------:|----------:|-------:|-------:|----------:|
| **Default** |  **Clr** |     **Clr** |       **10** |  **88.40 ns** | **0.7236 ns** | **0.6769 ns** |   **1.00** | **0.0355** |     **112 B** |
|  PR_334 |  Clr |     Clr |       10 | 134.56 ns | 0.6604 ns | 0.5514 ns |   1.52 | 0.0176 |      56 B |
|     New |  Clr |     Clr |       10 |  83.58 ns | 0.7490 ns | 0.6639 ns |   0.95 | 0.0178 |      56 B |
|         |      |         |          |           |           |           |        |        |           |
| Default | Core |    Core |       10 |  81.69 ns | 0.4227 ns | 0.3954 ns |   1.00 | 0.0355 |     112 B |
|  PR_334 | Core |    Core |       10 |  77.21 ns | 0.6466 ns | 0.5732 ns |   0.95 | 0.0178 |      56 B |
|     New | Core |    Core |       10 |  63.37 ns | 0.3465 ns | 0.3241 ns |   0.78 | 0.0178 |      56 B |
|         |      |         |          |           |           |           |        |        |           |
| **Default** |  **Clr** |     **Clr** |       **50** | **264.01 ns** | **1.7501 ns** | **1.6370 ns** |   **1.00** | **0.1016** |     **320 B** |
|  PR_334 |  Clr |     Clr |       50 | 253.22 ns | 1.9782 ns | 1.8504 ns |   0.96 | 0.0505 |     160 B |
|     New |  Clr |     Clr |       50 | 136.01 ns | 1.0058 ns | 0.8916 ns |   0.52 | 0.0508 |     160 B |
|         |      |         |          |           |           |           |        |        |           |
| Default | Core |    Core |       50 | 218.02 ns | 1.1414 ns | 1.0676 ns |   1.00 | 0.1016 |     320 B |
|  PR_334 | Core |    Core |       50 | 131.78 ns | 0.8857 ns | 0.7396 ns |   0.60 | 0.0508 |     160 B |
|     New | Core |    Core |       50 |  98.77 ns | 0.4972 ns | 0.4651 ns |   0.45 | 0.0508 |     160 B |
|         |      |         |          |           |           |           |        |        |           |
| **Default** |  **Clr** |     **Clr** |      **100** | **471.31 ns** | **1.9779 ns** | **1.7534 ns** |   **1.00** | **0.1879** |     **592 B** |
|  PR_334 |  Clr |     Clr |      100 | 443.90 ns | 2.8687 ns | 2.6834 ns |   0.94 | 0.1879 |     592 B |
|     New |  Clr |     Clr |      100 | 215.07 ns | 1.2431 ns | 1.1019 ns |   0.46 | 0.1881 |     592 B |
|         |      |         |          |           |           |           |        |        |           |
| Default | Core |    Core |      100 | 415.51 ns | 3.1875 ns | 2.9816 ns |   1.00 | 0.1879 |     592 B |
|  PR_334 | Core |    Core |      100 | 289.83 ns | 1.7229 ns | 1.4387 ns |   0.70 | 0.0939 |     296 B |
|     New | Core |    Core |      100 | 151.40 ns | 1.8358 ns | 1.7172 ns |   0.36 | 0.0939 |     296 B |
