``` ini

BenchmarkDotNet=v0.10.13, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.309)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742189 Hz, Resolution=364.6722 ns, Timer=TSC
.NET Core SDK=2.1.300-preview3-008384
  [Host] : .NET Core 2.1.0-preview2-26313-01 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT
  Clr    : .NET Framework 4.7.1 (CLR 4.0.30319.42000), 64bit RyuJIT-v4.7.2633.0
  Core   : .NET Core 2.1.0-preview2-26313-01 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT


```
|  Method |  Job | Runtime | DataSize |      Mean |     Error |    StdDev | Scaled | ScaledSD |  Gen 0 | Allocated |
|-------- |----- |-------- |--------- |----------:|----------:|----------:|-------:|---------:|-------:|----------:|
| **Default** |  **Clr** |     **Clr** |       **10** |  **99.66 ns** |  **2.085 ns** |  **4.259 ns** |   **1.00** |     **0.00** | **0.0355** |     **112 B** |
|     New |  Clr |     Clr |       10 |  96.82 ns |  1.934 ns |  1.986 ns |   0.97 |     0.04 | 0.0355 |     112 B |
|         |      |         |          |           |           |           |        |          |        |           |
| Default | Core |    Core |       10 |  94.31 ns |  1.966 ns |  5.178 ns |   1.00 |     0.00 | 0.0355 |     112 B |
|     New | Core |    Core |       10 |  85.06 ns |  1.768 ns |  2.479 ns |   0.90 |     0.05 | 0.0178 |      56 B |
|         |      |         |          |           |           |           |        |          |        |           |
| **Default** |  **Clr** |     **Clr** |       **50** | **292.39 ns** |  **1.660 ns** |  **1.472 ns** |   **1.00** |     **0.00** | **0.1016** |     **320 B** |
|     New |  Clr |     Clr |       50 | 242.92 ns |  4.917 ns | 10.897 ns |   0.83 |     0.04 | 0.1016 |     320 B |
|         |      |         |          |           |           |           |        |          |        |           |
| Default | Core |    Core |       50 | 240.90 ns |  4.883 ns |  4.796 ns |   1.00 |     0.00 | 0.1016 |     320 B |
|     New | Core |    Core |       50 | 151.45 ns |  3.082 ns |  5.479 ns |   0.63 |     0.03 | 0.0508 |     160 B |
|         |      |         |          |           |           |           |        |          |        |           |
| **Default** |  **Clr** |     **Clr** |      **100** | **557.73 ns** | **10.927 ns** | **13.008 ns** |   **1.00** |     **0.00** | **0.1879** |     **592 B** |
|     New |  Clr |     Clr |      100 | 431.71 ns |  7.723 ns |  6.846 ns |   0.77 |     0.02 | 0.1879 |     592 B |
|         |      |         |          |           |           |           |        |          |        |           |
| Default | Core |    Core |      100 | 467.78 ns |  9.396 ns | 19.614 ns |   1.00 |     0.00 | 0.1879 |     592 B |
|     New | Core |    Core |      100 | 326.64 ns |  6.474 ns |  5.739 ns |   0.70 |     0.03 | 0.0939 |     296 B |
