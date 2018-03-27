``` ini

BenchmarkDotNet=v0.10.13, OS=ubuntu 16.04
Intel Xeon CPU 2.60GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=2.1.300-preview3-008416
  [Host]     : .NET Core 2.1.0-preview2-26314-02 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT
  DefaultJob : .NET Core 2.1.0-preview2-26314-02 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT


```
|                   Method |     Mean |     Error |    StdDev | Scaled |  Gen 0 | Allocated |
|------------------------- |---------:|----------:|----------:|-------:|-------:|----------:|
| Convert_TryToBase64Chars | 78.51 ns | 0.5147 ns | 0.4814 ns |   1.00 | 0.0113 |      72 B |
|      Base64_EncodeToUtf8 | 81.96 ns | 0.3273 ns | 0.2902 ns |   1.04 | 0.0075 |      48 B |
