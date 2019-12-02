``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-alpha1-015774
  [Host]     : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT
  DefaultJob : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT


```
|                              Method |     Mean |    Error |   StdDev | Ratio | RatioSD |
|------------------------------------ |---------:|---------:|---------:|------:|--------:|
|                             Default | 20.60 ns | 0.508 ns | 0.978 ns |  1.00 |    0.00 |
| Default_withImprovedStringUtitlites | 17.74 ns | 0.173 ns | 0.144 ns |  0.89 |    0.04 |
|                        StringCreate | 16.43 ns | 0.263 ns | 0.246 ns |  0.81 |    0.05 |
|                           NewString | 28.28 ns | 0.237 ns | 0.222 ns |  1.40 |    0.08 |
