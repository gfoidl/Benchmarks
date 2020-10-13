``` ini

BenchmarkDotNet=v0.12.1, OS=Windows 10.0.19041.508 (2004/?/20H1)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.7.20366.6
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT


```
|                 Method |     Mean |     Error |    StdDev | Ratio | RatioSD | Code Size |
|----------------------- |---------:|----------:|----------:|------:|--------:|----------:|
|              DllImport | 7.405 ns | 0.1839 ns | 0.3500 ns |  1.00 |    0.00 |     144 B |
| FunctionPointerDefault | 1.206 ns | 0.0306 ns | 0.0286 ns |  0.16 |    0.01 |      22 B |
|   FunctionPointerCdecl | 6.525 ns | 0.1594 ns | 0.1637 ns |  0.87 |    0.04 |     136 B |
