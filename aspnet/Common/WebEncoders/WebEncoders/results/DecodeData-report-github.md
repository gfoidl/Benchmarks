``` ini

BenchmarkDotNet=v0.10.13, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.309)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742189 Hz, Resolution=364.6722 ns, Timer=TSC
.NET Core SDK=2.1.300-preview3-008384
  [Host] : .NET Core 2.1.0-preview2-26313-01 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT
  Clr    : .NET Framework 4.7.1 (CLR 4.0.30319.42000), 64bit RyuJIT-v4.7.2633.0
  Core   : .NET Core 2.1.0-preview2-26313-01 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT


```
|  Method |  Job | Runtime | DataSize |     Mean |      Error |     StdDev |   Median | Scaled | ScaledSD |  Gen 0 | Allocated |
|-------- |----- |-------- |--------- |---------:|-----------:|-----------:|---------:|-------:|---------:|-------:|----------:|
| **Default** |  **Clr** |     **Clr** |       **10** | **119.7 ns** |  **2.4100 ns** |  **2.6787 ns** | **119.4 ns** |   **1.00** |     **0.00** | **0.0303** |      **96 B** |
|     New |  Clr |     Clr |       10 | 124.7 ns |  2.5604 ns |  3.4181 ns | 124.7 ns |   1.04 |     0.04 | 0.0126 |      40 B |
|         |      |         |          |          |            |            |          |        |          |        |           |
| Default | Core |    Core |       10 | 131.0 ns |  2.7016 ns |  5.6392 ns | 129.9 ns |   1.00 |     0.00 | 0.0303 |      96 B |
|     New | Core |    Core |       10 | 106.6 ns |  3.3803 ns |  9.6988 ns | 103.2 ns |   0.82 |     0.08 | 0.0126 |      40 B |
|         |      |         |          |          |            |            |          |        |          |        |           |
| **Default** |  **Clr** |     **Clr** |       **50** | **398.0 ns** |  **7.8665 ns** |  **9.3645 ns** | **398.5 ns** |   **1.00** |     **0.00** | **0.0758** |     **240 B** |
|     New |  Clr |     Clr |       50 | 203.1 ns |  1.3501 ns |  1.0541 ns | 202.9 ns |   0.51 |     0.01 | 0.0253 |      80 B |
|         |      |         |          |          |            |            |          |        |          |        |           |
| Default | Core |    Core |       50 | 430.2 ns |  3.4316 ns |  3.2099 ns | 431.0 ns |   1.00 |     0.00 | 0.0758 |     240 B |
|     New | Core |    Core |       50 | 132.8 ns |  0.7019 ns |  0.6222 ns | 133.0 ns |   0.31 |     0.00 | 0.0253 |      80 B |
|         |      |         |          |          |            |            |          |        |          |        |           |
| **Default** |  **Clr** |     **Clr** |      **100** | **744.1 ns** | **10.4349 ns** |  **8.7136 ns** | **742.6 ns** |   **1.00** |     **0.00** | **0.1345** |     **424 B** |
|     New |  Clr |     Clr |      100 | 380.2 ns |  7.5157 ns | 12.5570 ns | 380.2 ns |   0.51 |     0.02 | 0.0911 |     288 B |
|         |      |         |          |          |            |            |          |        |          |        |           |
| Default | Core |    Core |      100 | 866.1 ns | 15.9919 ns | 22.4184 ns | 864.3 ns |   1.00 |     0.00 | 0.1345 |     424 B |
|     New | Core |    Core |      100 | 277.8 ns |  5.5897 ns |  9.9358 ns | 278.1 ns |   0.32 |     0.01 | 0.0405 |     128 B |
