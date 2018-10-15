``` ini

BenchmarkDotNet=v0.11.1, OS=Windows 10.0.17134.345 (1803/April2018Update/Redstone4)
Intel Core i7-7700HQ CPU 2.80GHz (Max: 2.81GHz) (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
Frequency=2742184 Hz, Resolution=364.6728 ns, Timer=TSC
.NET Core SDK=2.1.402
  [Host]     : .NET Core 2.1.4 (CoreCLR 4.6.26814.03, CoreFX 4.6.26814.02), 64bit RyuJIT
  DefaultJob : .NET Core 2.1.4 (CoreCLR 4.6.26814.03, CoreFX 4.6.26814.02), 64bit RyuJIT


```
|     Method |      Mean |     Error |    StdDev | Scaled | ScaledSD |
|----------- |----------:|----------:|----------:|-------:|---------:|
| Loop_local | 0.9606 ns | 0.0457 ns | 0.0428 ns |   1.00 |     0.00 |
| Loop_field | 0.9643 ns | 0.0468 ns | 0.0438 ns |   1.01 |     0.06 |
|        Dot | 0.4054 ns | 0.0670 ns | 0.0594 ns |   0.42 |     0.06 |
| Intrinsics | 0.3689 ns | 0.0316 ns | 0.0296 ns |   0.38 |     0.03 |
