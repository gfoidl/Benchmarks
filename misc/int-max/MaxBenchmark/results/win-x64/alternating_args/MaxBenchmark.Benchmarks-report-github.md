``` ini

BenchmarkDotNet=v0.10.12, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.125)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742191 Hz, Resolution=364.6719 ns, Timer=TSC
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT


```
| Method |      Mean |     Error |    StdDev | Scaled | ScaledSD |
|------- |----------:|----------:|----------:|-------:|---------:|
|   Max1 | 0.8220 ns | 0.0542 ns | 0.0507 ns |   1.00 |     0.00 |
|   Max2 | 0.7590 ns | 0.0449 ns | 0.0398 ns |   0.93 |     0.07 |
|   Max3 | 0.7834 ns | 0.0539 ns | 0.0577 ns |   0.96 |     0.09 |
|   Max4 | 0.5017 ns | 0.0209 ns | 0.0185 ns |   0.61 |     0.04 |
|   Max5 | 0.4912 ns | 0.0311 ns | 0.0291 ns |   0.60 |     0.05 |
|   Max6 | 0.7272 ns | 0.0185 ns | 0.0173 ns |   0.89 |     0.05 |
|   Max7 | 0.3053 ns | 0.0213 ns | 0.0200 ns |   0.37 |     0.03 |
|   Max8 | 2.1243 ns | 0.0313 ns | 0.0293 ns |   2.59 |     0.15 |
|   Max9 | 0.7665 ns | 0.0528 ns | 0.0821 ns |   0.94 |     0.11 |
