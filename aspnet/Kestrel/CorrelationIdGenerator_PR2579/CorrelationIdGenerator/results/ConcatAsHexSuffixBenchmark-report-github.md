``` ini

BenchmarkDotNet=v0.10.14, OS=Windows 10.0.17134
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
Frequency=2742192 Hz, Resolution=364.6718 ns, Timer=TSC
.NET Core SDK=2.1.300-rc1-008673
  [Host] : .NET Core 2.1.0-rc1 (CoreCLR 4.6.26426.02, CoreFX 4.6.26426.04), 64bit RyuJIT
  Clr    : .NET Framework 4.7.1 (CLR 4.0.30319.42000), 64bit RyuJIT-v4.7.3101.0
  Core   : .NET Core 2.1.0-rc1 (CoreCLR 4.6.26426.02, CoreFX 4.6.26426.04), 64bit RyuJIT


```
|                 Method |  Job | Runtime |     Mean |     Error |    StdDev | Scaled | ScaledSD |  Gen 0 | Allocated |
|----------------------- |----- |-------- |---------:|----------:|----------:|-------:|---------:|-------:|----------:|
|                Default |  Clr |     Clr | 31.33 ns | 0.6917 ns | 0.8748 ns |   1.00 |     0.00 | 0.0228 |      72 B |
| StringCreateSpanUnsafe |  Clr |     Clr | 30.18 ns | 0.2140 ns | 0.1897 ns |   0.96 |     0.03 | 0.0228 |      72 B |
|                        |      |         |          |           |           |        |          |        |           |
|                Default | Core |    Core | 29.77 ns | 0.2383 ns | 0.2112 ns |   1.00 |     0.00 | 0.0228 |      72 B |
| StringCreateSpanUnsafe | Core |    Core | 24.77 ns | 0.1765 ns | 0.1651 ns |   0.83 |     0.01 | 0.0229 |      72 B |
