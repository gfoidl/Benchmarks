``` ini

BenchmarkDotNet=v0.10.12, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.248)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742187 Hz, Resolution=364.6724 ns, Timer=TSC
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT


```
|        Method |     Mean |     Error |    StdDev | Scaled |
|-------------- |---------:|----------:|----------:|-------:|
|       Default | 28.11 ns | 0.2196 ns | 0.2054 ns |   1.00 |
|   NoInterface | 21.75 ns | 0.1348 ns | 0.1261 ns |   0.77 |
|   Expressions | 23.38 ns | 0.1760 ns | 0.1646 ns |   0.83 |
| DynamicMethod | 21.92 ns | 0.3097 ns | 0.2897 ns |   0.78 |
