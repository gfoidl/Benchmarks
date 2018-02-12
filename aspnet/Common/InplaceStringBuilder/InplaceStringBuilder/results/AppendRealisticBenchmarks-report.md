``` ini

BenchmarkDotNet=v0.10.12, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.125)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742191 Hz, Resolution=364.6719 ns, Timer=TSC
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT


```
|                                 Method |      Mean |     Error |    StdDev | Scaled | ScaledSD |
|--------------------------------------- |----------:|----------:|----------:|-------:|---------:|
|                                Default |  74.63 ns | 1.5745 ns | 2.5426 ns |   1.00 |     0.00 |
| Default_ThrowHelper_AggressiveInlining |  42.83 ns | 0.5936 ns | 0.5262 ns |   0.57 |     0.02 |
|                    Default_ThrowHelper |  54.69 ns | 0.3238 ns | 0.2704 ns |   0.73 |     0.02 |
|                              CharArray | 178.26 ns | 1.7530 ns | 1.6397 ns |   2.39 |     0.08 |
