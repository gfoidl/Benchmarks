``` ini

BenchmarkDotNet=v0.10.12, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.125)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742191 Hz, Resolution=364.6719 ns, Timer=TSC
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT


```
|              Method |     Mean |     Error |    StdDev | Scaled | ScaledSD |
|-------------------- |---------:|----------:|----------:|-------:|---------:|
|             Default | 553.2 ns | 10.889 ns | 18.193 ns |   1.00 |     0.00 |
| Default_ThrowHelper | 242.9 ns |  3.939 ns |  3.684 ns |   0.44 |     0.02 |
|           CharArray | 213.0 ns |  4.288 ns |  8.158 ns |   0.39 |     0.02 |
