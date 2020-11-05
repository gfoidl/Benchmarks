``` ini

BenchmarkDotNet=v0.12.1, OS=Windows 10.0.19041.572 (2004/?/20H1)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.7.20366.6
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT


```
|          Method |     Mean |     Error |    StdDev | Ratio | RatioSD | Code Size |
|---------------- |---------:|----------:|----------:|------:|--------:|----------:|
|        RowMajor | 2.976 ns | 0.0917 ns | 0.0900 ns |  1.00 |    0.00 |     161 B |
|    RowMajorSimd | 2.469 ns | 0.0818 ns | 0.0765 ns |  0.83 |    0.03 |     135 B |
|     ColumnMajor | 2.698 ns | 0.0857 ns | 0.0881 ns |  0.91 |    0.04 |     161 B |
| ColumnMajorSimd | 2.757 ns | 0.0913 ns | 0.1121 ns |  0.93 |    0.05 |     140 B |
