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
|   Max1 | 0.7574 ns | 0.0675 ns | 0.0663 ns |   1.00 |     0.00 |
|   Max2 | 0.3537 ns | 0.0264 ns | 0.0234 ns |   0.47 |     0.05 |
|   Max3 | 0.3164 ns | 0.0443 ns | 0.0527 ns |   0.42 |     0.08 |
|   Max4 | 0.0292 ns | 0.0330 ns | 0.0309 ns |   0.04 |     0.04 |
|   Max5 | 0.3301 ns | 0.0264 ns | 0.0234 ns |   0.44 |     0.05 |
|   Max6 | 0.7018 ns | 0.0459 ns | 0.0406 ns |   0.93 |     0.09 |
|   Max7 | 0.3838 ns | 0.0124 ns | 0.0116 ns |   0.51 |     0.04 |
|   Max8 | 2.0664 ns | 0.0256 ns | 0.0239 ns |   2.75 |     0.22 |
|   Max9 | 0.3121 ns | 0.0165 ns | 0.0155 ns |   0.41 |     0.04 |
