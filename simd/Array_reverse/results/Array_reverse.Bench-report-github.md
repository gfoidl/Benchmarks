``` ini

BenchmarkDotNet=v0.11.1, OS=Windows 10.0.17134.345 (1803/April2018Update/Redstone4)
Intel Core i7-7700HQ CPU 2.80GHz (Max: 2.81GHz) (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
Frequency=2742184 Hz, Resolution=364.6728 ns, Timer=TSC
.NET Core SDK=2.1.402
  [Host]     : .NET Core 2.1.4 (CoreCLR 4.6.26814.03, CoreFX 4.6.26814.02), 64bit RyuJIT
  DefaultJob : .NET Core 2.1.4 (CoreCLR 4.6.26814.03, CoreFX 4.6.26814.02), 64bit RyuJIT


```
|              Method |       N |           Mean |         Error |        StdDev | Scaled |
|-------------------- |-------- |---------------:|--------------:|--------------:|-------:|
|        **Sequential_2** |      **10** |       **4.396 ns** |     **0.0302 ns** |     **0.0282 ns** |   **1.00** |
|           Simd_Sse2 |      10 |       2.056 ns |     0.0345 ns |     0.0306 ns |   0.47 |
| Simd_Sse2_CacheLine |      10 |       3.007 ns |     0.0277 ns |     0.0259 ns |   0.68 |
|                     |         |                |               |               |        |
|        **Sequential_2** |    **1000** |     **331.245 ns** |     **3.1415 ns** |     **2.7849 ns** |   **1.00** |
|           Simd_Sse2 |    1000 |      98.705 ns |     0.5496 ns |     0.5141 ns |   0.30 |
| Simd_Sse2_CacheLine |    1000 |      86.118 ns |     0.7573 ns |     0.7084 ns |   0.26 |
|                     |         |                |               |               |        |
|        **Sequential_2** | **1000000** | **382,392.825 ns** | **3,671.3216 ns** | **3,065.7195 ns** |   **1.00** |
|           Simd_Sse2 | 1000000 | 152,647.636 ns | 1,286.2660 ns | 1,140.2412 ns |   0.40 |
| Simd_Sse2_CacheLine | 1000000 | 148,007.414 ns | 1,427.9031 ns | 1,265.7988 ns |   0.39 |
