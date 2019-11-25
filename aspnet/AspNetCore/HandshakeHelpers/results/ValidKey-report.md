``` ini

BenchmarkDotNet=v0.11.5, OS=Windows 10.0.17134.950 (1803/April2018Update/Redstone4)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
Frequency=2742187 Hz, Resolution=364.6724 ns, Timer=TSC
.NET Core SDK=3.0.100-preview8-013499
  [Host]     : .NET Core 3.0.0-preview8-28376-04 (CoreCLR 4.700.19.37204, CoreFX 4.700.19.37515), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview8-28376-04 (CoreCLR 4.700.19.37204, CoreFX 4.700.19.37515), 64bit RyuJIT


```
|     Method |      Mean |     Error |    StdDev | Ratio | RatioSD |  Gen 0 | Gen 1 | Gen 2 | Allocated |
|----------- |----------:|----------:|----------:|------:|--------:|-------:|------:|------:|----------:|
|   Baseline | 94.167 ns | 1.7203 ns | 2.3548 ns |  1.00 |    0.00 | 0.0126 |     - |     - |      40 B |
|    PR12386 | 52.838 ns | 0.5165 ns | 0.4831 ns |  0.56 |    0.02 |      - |     - |     - |         - |
| Vectorized |  3.773 ns | 0.0518 ns | 0.0485 ns |  0.04 |    0.00 |      - |     - |     - |         - |
