``` ini

BenchmarkDotNet=v0.10.12, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.125)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742191 Hz, Resolution=364.6719 ns, Timer=TSC
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT


```
|     Method |      Mean |     Error |    StdDev | Scaled | ScaledSD |
|----------- |----------:|----------:|----------:|-------:|---------:|
| Loop_local | 0.6544 ns | 0.0212 ns | 0.0198 ns |   1.00 |     0.00 |
| Loop_field | 0.6873 ns | 0.0309 ns | 0.0289 ns |   1.05 |     0.05 |
|        Dot | 0.2862 ns | 0.0258 ns | 0.0229 ns |   0.44 |     0.04 |
