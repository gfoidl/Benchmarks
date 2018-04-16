``` ini

BenchmarkDotNet=v0.10.13, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.371)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742187 Hz, Resolution=364.6724 ns, Timer=TSC
.NET Core SDK=2.1.300-preview3-008618
  [Host] : .NET Core 2.1.0-preview3-26411-06 (CoreCLR 4.6.26411.07, CoreFX 4.6.26411.06), 64bit RyuJIT
  Clr    : .NET Framework 4.7.1 (CLR 4.0.30319.42000), 64bit RyuJIT-v4.7.2633.0
  Core   : .NET Core 2.1.0-preview3-26411-06 (CoreCLR 4.6.26411.07, CoreFX 4.6.26411.06), 64bit RyuJIT


```
|  Method |  Job | Runtime | DataSize |      Mean |      Error |     StdDev | Scaled | ScaledSD |  Gen 0 | Allocated |
|-------- |----- |-------- |--------- |----------:|-----------:|-----------:|-------:|---------:|-------:|----------:|
| **Default** |  **Clr** |     **Clr** |       **10** | **113.56 ns** |  **2.3357 ns** |  **4.4439 ns** |   **1.00** |     **0.00** | **0.0303** |      **96 B** |
|  PR_334 |  Clr |     Clr |       10 | 130.38 ns |  2.6556 ns |  2.4840 ns |   1.15 |     0.05 | 0.0126 |      40 B |
|     New |  Clr |     Clr |       10 |  57.09 ns |  1.0639 ns |  0.8884 ns |   0.50 |     0.02 | 0.0126 |      40 B |
|         |      |         |          |           |            |            |        |          |        |           |
| Default | Core |    Core |       10 | 132.83 ns |  2.7128 ns |  6.1785 ns |   1.00 |     0.00 | 0.0303 |      96 B |
|  PR_334 | Core |    Core |       10 |  83.82 ns |  0.4884 ns |  0.4569 ns |   0.63 |     0.03 | 0.0126 |      40 B |
|     New | Core |    Core |       10 |  44.06 ns |  0.4275 ns |  0.3790 ns |   0.33 |     0.02 | 0.0127 |      40 B |
|         |      |         |          |           |            |            |        |          |        |           |
| **Default** |  **Clr** |     **Clr** |       **50** | **367.18 ns** |  **3.2591 ns** |  **3.0486 ns** |   **1.00** |     **0.00** | **0.0758** |     **240 B** |
|  PR_334 |  Clr |     Clr |       50 | 206.31 ns |  3.3799 ns |  3.1615 ns |   0.56 |     0.01 | 0.0253 |      80 B |
|     New |  Clr |     Clr |       50 | 103.92 ns |  1.4526 ns |  1.2877 ns |   0.28 |     0.00 | 0.0254 |      80 B |
|         |      |         |          |           |            |            |        |          |        |           |
| Default | Core |    Core |       50 | 352.06 ns |  3.4024 ns |  3.1826 ns |   1.00 |     0.00 | 0.0758 |     240 B |
|  PR_334 | Core |    Core |       50 | 120.36 ns |  2.4488 ns |  3.8841 ns |   0.34 |     0.01 | 0.0253 |      80 B |
|     New | Core |    Core |       50 |  96.80 ns |  2.1195 ns |  3.1067 ns |   0.27 |     0.01 | 0.0254 |      80 B |
|         |      |         |          |           |            |            |        |          |        |           |
| **Default** |  **Clr** |     **Clr** |      **100** | **733.31 ns** | **14.2941 ns** | **15.8878 ns** |   **1.00** |     **0.00** | **0.1345** |     **424 B** |
|  PR_334 |  Clr |     Clr |      100 | 373.12 ns |  7.4124 ns | 13.5540 ns |   0.51 |     0.02 | 0.0911 |     288 B |
|     New |  Clr |     Clr |      100 | 153.03 ns |  3.0541 ns |  3.6357 ns |   0.21 |     0.01 | 0.0405 |     128 B |
|         |      |         |          |           |            |            |        |          |        |           |
| Default | Core |    Core |      100 | 645.58 ns | 13.2485 ns | 22.1353 ns |   1.00 |     0.00 | 0.1345 |     424 B |
|  PR_334 | Core |    Core |      100 | 237.82 ns |  1.9677 ns |  1.8406 ns |   0.37 |     0.01 | 0.0405 |     128 B |
|     New | Core |    Core |      100 | 158.39 ns |  2.0021 ns |  1.7748 ns |   0.25 |     0.01 | 0.0405 |     128 B |
