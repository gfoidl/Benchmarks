``` ini

BenchmarkDotNet=v0.11.5, OS=Windows 10.0.17134.648 (1803/April2018Update/Redstone4)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
Frequency=2742185 Hz, Resolution=364.6727 ns, Timer=TSC
.NET Core SDK=3.0.100-preview4-010389
  [Host]     : .NET Core 3.0.0-preview-27117-01 (CoreCLR 4.6.27116.05, CoreFX 4.7.18.56608), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview4-27419-7 (CoreCLR 4.6.27418.71, CoreFX 4.7.19.11907), 64bit RyuJIT


```
|                     Method |      Mean |     Error |    StdDev |    Median | Ratio | RatioSD |
|--------------------------- |----------:|----------:|----------:|----------:|------:|--------:|
|                  DllImport |  7.255 ns | 0.1706 ns | 0.1596 ns |  7.257 ns |  1.00 |    0.00 |
|   DllImportWOSecurityCheck |  5.233 ns | 0.1961 ns | 0.4584 ns |  5.051 ns |  0.75 |    0.11 |
|                LoadLibrary | 14.512 ns | 0.3778 ns | 0.7632 ns | 14.271 ns |  2.13 |    0.10 |
| LoadLibraryWOSecurityCheck | 15.561 ns | 0.3893 ns | 0.3451 ns | 15.569 ns |  2.15 |    0.06 |
|                      CallI |  5.529 ns | 0.2984 ns | 0.6974 ns |  5.281 ns |  0.87 |    0.15 |
