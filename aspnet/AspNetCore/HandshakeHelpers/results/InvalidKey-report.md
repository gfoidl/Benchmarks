``` ini

BenchmarkDotNet=v0.11.5, OS=Windows 10.0.17134.950 (1803/April2018Update/Redstone4)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
Frequency=2742187 Hz, Resolution=364.6724 ns, Timer=TSC
.NET Core SDK=3.0.100-preview8-013499
  [Host]     : .NET Core 3.0.0-preview8-28376-04 (CoreCLR 4.700.19.37204, CoreFX 4.700.19.37515), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview8-28376-04 (CoreCLR 4.700.19.37204, CoreFX 4.700.19.37515), 64bit RyuJIT


```
|     Method |                  Key |          Mean |       Error |      StdDev |        Median | Ratio | RatioSD |  Gen 0 | Gen 1 | Gen 2 | Allocated |
|----------- |--------------------- |--------------:|------------:|------------:|--------------:|------:|--------:|-------:|------:|------:|----------:|
|   **Baseline** | **2006a(...)c8e29 [32]** |    **118.798 ns** |   **2.3807 ns** |   **4.4128 ns** |    **116.486 ns** |  **1.00** |    **0.00** | **0.0153** |     **-** |     **-** |      **48 B** |
|    PR12386 | 2006a(...)c8e29 [32] |     74.311 ns |   0.7227 ns |   0.6760 ns |     74.115 ns |  0.60 |    0.02 |      - |     - |     - |         - |
| Vectorized | 2006a(...)c8e29 [32] |      1.581 ns |   0.0112 ns |   0.0100 ns |      1.579 ns |  0.01 |    0.00 |      - |     - |     - |         - |
|            |                      |               |             |             |               |       |         |        |       |       |           |
|   **Baseline** | **fP5Xt(...)PCg== [24]** | **23,878.036 ns** | **219.9314 ns** | **205.7239 ns** | **23,955.622 ns** | **1.000** |    **0.00** | **0.1831** |     **-** |     **-** |     **576 B** |
|    PR12386 | fP5Xt(...)PCg== [24] |     69.002 ns |   0.6012 ns |   0.5330 ns |     69.021 ns | 0.003 |    0.00 |      - |     - |     - |         - |
| Vectorized | fP5Xt(...)PCg== [24] |      3.871 ns |   0.0359 ns |   0.0336 ns |      3.865 ns | 0.000 |    0.00 |      - |     - |     - |         - |
