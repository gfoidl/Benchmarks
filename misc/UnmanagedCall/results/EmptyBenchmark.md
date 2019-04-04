``` ini

BenchmarkDotNet=v0.11.5, OS=Windows 10.0.17134.648 (1803/April2018Update/Redstone4)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
Frequency=2742185 Hz, Resolution=364.6727 ns, Timer=TSC
.NET Core SDK=3.0.100-preview4-010389
  [Host]     : .NET Core 3.0.0-preview-27117-01 (CoreCLR 4.6.27116.05, CoreFX 4.7.18.56608), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview4-27419-7 (CoreCLR 4.6.27418.71, CoreFX 4.7.19.11907), 64bit RyuJIT


```
|                     Method |      Mean |     Error |    StdDev | Ratio | RatioSD |
|--------------------------- |----------:|----------:|----------:|------:|--------:|
|                  DllImport |  7.775 ns | 0.2000 ns | 0.3450 ns |  1.00 |    0.00 |
|   DllImportWOSecurityCheck |  7.528 ns | 0.1921 ns | 0.4711 ns |  0.99 |    0.05 |
|                LoadLibrary | 15.027 ns | 0.3352 ns | 0.5317 ns |  1.93 |    0.09 |
| LoadLibraryWOSecurityCheck | 14.281 ns | 0.1246 ns | 0.1165 ns |  1.77 |    0.06 |
|                      CallI |  6.887 ns | 0.1017 ns | 0.0849 ns |  0.85 |    0.03 |
