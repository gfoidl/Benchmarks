``` ini

BenchmarkDotNet=v0.12.1, OS=Windows 10.0.19041.508 (2004/?/20H1)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.7.20366.6
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT


```
|                 Method |      Mean |     Error |    StdDev | Ratio | RatioSD | Code Size |
|----------------------- |----------:|----------:|----------:|------:|--------:|----------:|
|              DllImport | 7.5240 ns | 0.1889 ns | 0.3640 ns |  1.00 |    0.00 |     160 B |
| FunctionPointerDefault | 0.5724 ns | 0.0365 ns | 0.0375 ns |  0.08 |    0.01 |      26 B |
|   FunctionPointerCdecl | 6.9012 ns | 0.1558 ns | 0.1530 ns |  0.92 |    0.06 |     152 B |
