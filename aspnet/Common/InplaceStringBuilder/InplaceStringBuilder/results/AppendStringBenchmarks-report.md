``` ini

BenchmarkDotNet=v0.10.12, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.125)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742191 Hz, Resolution=364.6719 ns, Timer=TSC
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT


```
|                                 Method |       Mean |     Error |    StdDev | Scaled | ScaledSD |
|--------------------------------------- |-----------:|----------:|----------:|-------:|---------:|
|                                Default |   453.2 ns |  8.977 ns | 14.749 ns |   1.00 |     0.00 |
| Default_ThrowHelper_AggressiveInlining |   278.1 ns |  4.503 ns |  4.212 ns |   0.61 |     0.02 |
|                    Default_ThrowHelper |   340.9 ns |  4.625 ns |  4.100 ns |   0.75 |     0.03 |
|                              CharArray | 1,451.3 ns | 19.951 ns | 16.660 ns |   3.21 |     0.11 |
