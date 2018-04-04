``` ini

BenchmarkDotNet=v0.10.13, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.309)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742189 Hz, Resolution=364.6722 ns, Timer=TSC
.NET Core SDK=2.1.300-preview3-008384
  [Host]     : .NET Core 2.1.0-preview2-26313-01 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT
  DefaultJob : .NET Core 2.1.0-preview2-26313-01 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT


```
|  Method |     Mean |    Error |   StdDev | Scaled | ScaledSD |  Gen 0 | Allocated |
|-------- |---------:|---------:|---------:|-------:|---------:|-------:|----------:|
| Default | 83.64 ns | 1.372 ns | 1.283 ns |   1.00 |     0.00 | 0.0228 |      72 B |
|     New | 67.66 ns | 2.175 ns | 2.137 ns |   0.81 |     0.03 | 0.0228 |      72 B |
