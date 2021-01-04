``` ini

BenchmarkDotNet=v0.12.1, OS=Windows 10.0.19041.685 (2004/?/20H1)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.101
  [Host]     : .NET Core 5.0.1 (CoreCLR 5.0.120.57516, CoreFX 5.0.120.57516), X64 RyuJIT
  DefaultJob : .NET Core 5.0.1 (CoreCLR 5.0.120.57516, CoreFX 5.0.120.57516), X64 RyuJIT


```
| Method |      Mean |     Error |    StdDev | Ratio | RatioSD | Code Size |
|------- |----------:|----------:|----------:|------:|--------:|----------:|
|      A | 0.2924 ns | 0.0450 ns | 0.0585 ns |  1.00 |    0.00 |      30 B |
|      B | 0.5448 ns | 0.0518 ns | 0.1336 ns |  2.10 |    0.79 |      26 B |
|      C | 0.4089 ns | 0.0486 ns | 0.0785 ns |  1.45 |    0.35 |      32 B |
