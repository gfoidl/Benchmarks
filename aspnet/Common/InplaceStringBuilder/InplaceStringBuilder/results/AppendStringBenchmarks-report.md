``` ini

BenchmarkDotNet=v0.10.12, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.248)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742187 Hz, Resolution=364.6724 ns, Timer=TSC
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT


```
|              Method |     Mean |    Error |   StdDev | Scaled | ScaledSD |
|-------------------- |---------:|---------:|---------:|-------:|---------:|
|             Default | 425.6 ns | 3.895 ns | 3.041 ns |   1.00 |     0.00 |
|             This_PR | 282.4 ns | 5.741 ns | 5.370 ns |   0.66 |     0.01 |
| This_PR_wo_pre_init | 291.5 ns | 5.920 ns | 4.944 ns |   0.69 |     0.01 |
|            New_Idea | 264.2 ns | 5.662 ns | 6.520 ns |   0.62 |     0.02 |
