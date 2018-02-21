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
|      Original | 34.14 ns | 0.4016 ns | 0.3756 ns |   1.00 |
|       Default | 29.24 ns | 0.1374 ns | 0.1285 ns |   0.86 |
|   NoInterface | 21.92 ns | 0.2210 ns | 0.2068 ns |   0.64 |
|   Expressions | 23.43 ns | 0.1165 ns | 0.1089 ns |   0.69 |
| DynamicMethod | 21.80 ns | 0.1269 ns | 0.1187 ns |   0.64 |
