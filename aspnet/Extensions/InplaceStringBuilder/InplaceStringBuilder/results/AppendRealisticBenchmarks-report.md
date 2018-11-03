``` ini

BenchmarkDotNet=v0.10.12, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.248)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742187 Hz, Resolution=364.6724 ns, Timer=TSC
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT


```
|              Method |     Mean |     Error |    StdDev | Scaled |  Gen 0 | Allocated |
|-------------------- |---------:|----------:|----------:|-------:|-------:|----------:|
|             Default | 68.31 ns | 0.7611 ns | 0.6747 ns |   1.00 | 0.0151 |      48 B |
|             This_PR | 44.31 ns | 0.3620 ns | 0.3023 ns |   0.65 | 0.0152 |      48 B |
| This_PR_wo_pre_init | 34.11 ns | 0.4492 ns | 0.4202 ns |   0.50 | 0.0152 |      48 B |
|            New_Idea | 34.92 ns | 0.2254 ns | 0.1998 ns |   0.51 | 0.0152 |      48 B |
