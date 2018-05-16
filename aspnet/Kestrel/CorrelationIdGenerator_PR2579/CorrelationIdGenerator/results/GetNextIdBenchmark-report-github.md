``` ini

BenchmarkDotNet=v0.10.14, OS=Windows 10.0.17134
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
Frequency=2742192 Hz, Resolution=364.6718 ns, Timer=TSC
.NET Core SDK=2.1.300-rc1-008673
  [Host] : .NET Core 2.1.0-rc1 (CoreCLR 4.6.26426.02, CoreFX 4.6.26426.04), 64bit RyuJIT
  Clr    : .NET Framework 4.7.1 (CLR 4.0.30319.42000), 64bit RyuJIT-v4.7.3101.0
  Core   : .NET Core 2.1.0-rc1 (CoreCLR 4.6.26426.02, CoreFX 4.6.26426.04), 64bit RyuJIT


```
|                 Method |  Job | Runtime |     Mean |     Error |    StdDev | Scaled |  Gen 0 | Allocated |
|----------------------- |----- |-------- |---------:|----------:|----------:|-------:|-------:|----------:|
|                Default |  Clr |     Clr | 30.55 ns | 0.3343 ns | 0.2610 ns |   1.00 | 0.0178 |      56 B |
|           StringCreate |  Clr |     Clr | 30.72 ns | 0.3675 ns | 0.3437 ns |   1.01 | 0.0178 |      56 B |
| StringCreateSpanUnsafe |  Clr |     Clr | 29.00 ns | 0.1565 ns | 0.1463 ns |   0.95 | 0.0178 |      56 B |
|                        |      |         |          |           |           |        |        |           |
|                Default | Core |    Core | 38.56 ns | 0.7330 ns | 0.6498 ns |   1.00 | 0.0178 |      56 B |
|           StringCreate | Core |    Core | 29.07 ns | 0.1224 ns | 0.1022 ns |   0.75 | 0.0178 |      56 B |
| StringCreateSpanUnsafe | Core |    Core | 24.21 ns | 0.1273 ns | 0.1129 ns |   0.63 | 0.0178 |      56 B |
