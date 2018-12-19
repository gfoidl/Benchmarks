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
|                Default |  Clr |     Clr | 31.14 ns | 0.3393 ns | 0.3173 ns |   1.00 |     0.00 | 0.0228 |      72 B |
| StringCreateSpanUnsafe |  Clr |     Clr | 30.45 ns | 0.5382 ns | 0.5034 ns |   0.98 |     0.02 | 0.0228 |      72 B |
|               NoLookup |  Clr |     Clr | 33.77 ns | 0.4602 ns | 0.4304 ns |   1.08 |     0.02 | 0.0228 |      72 B |
|     NoLookupBranchless |  Clr |     Clr | 33.81 ns | 0.4356 ns | 0.3861 ns |   1.09 |     0.02 | 0.0228 |      72 B |
|                        |      |         |          |           |           |        |          |        |           |
|                Default | Core |    Core | 34.12 ns | 0.7521 ns | 0.7386 ns |   1.00 |     0.00 | 0.0228 |      72 B |
| StringCreateSpanUnsafe | Core |    Core | 26.85 ns | 0.4039 ns | 0.3778 ns |   0.79 |     0.02 | 0.0228 |      72 B |
|               NoLookup | Core |    Core | 26.77 ns | 0.3949 ns | 0.3694 ns |   0.79 |     0.02 | 0.0228 |      72 B |
|     NoLookupBranchless | Core |    Core | 28.02 ns | 0.3557 ns | 0.3328 ns |   0.82 |     0.02 | 0.0228 |      72 B |
