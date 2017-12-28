``` ini

BenchmarkDotNet=v0.10.11, OS=Windows 7 SP1 (6.1.7601.0)
Processor=Intel Core i7-3610QM CPU 2.30GHz (Ivy Bridge), ProcessorCount=8
Frequency=2241064 Hz, Resolution=446.2166 ns, Timer=TSC
.NET Core SDK=2.1.2
  [Host]     : .NET Core 2.0.3 (Framework 4.6.25815.02), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.3 (Framework 4.6.25815.02), 64bit RyuJIT


```
|       Method |     Mean |     Error |    StdDev | Scaled | ScaledSD |
|------------- |---------:|----------:|----------:|-------:|---------:|
| Push_Default | 16.10 ns | 0.3524 ns | 0.4582 ns |   1.00 |     0.00 |
|     Push_New | 17.06 ns | 0.3798 ns | 0.4374 ns |   1.06 |     0.04 |
