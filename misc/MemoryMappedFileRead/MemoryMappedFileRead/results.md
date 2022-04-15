``` ini

BenchmarkDotNet=v0.13.1, OS=Windows 10.0.19043.1586 (21H1/May2021Update)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET SDK=7.0.100-preview.4.22181.7
  [Host]     : .NET 7.0.0 (7.0.22.17907), X64 RyuJIT
  DefaultJob : .NET 7.0.0 (7.0.22.17907), X64 RyuJIT


```
|                   Method |    Mean |    Error |   StdDev | Ratio | RatioSD |
|------------------------- |--------:|---------:|---------:|------:|--------:|
|               FileStream | 2.584 s | 0.0512 s | 0.0610 s |  1.00 |    0.00 |
|               FileHandle | 2.517 s | 0.0450 s | 0.0752 s |  0.98 |    0.04 |
| MemoryMappedViewAccessor | 1.468 s | 0.0263 s | 0.0394 s |  0.57 |    0.02 |
