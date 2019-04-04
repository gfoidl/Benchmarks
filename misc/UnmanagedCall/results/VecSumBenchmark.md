``` ini

BenchmarkDotNet=v0.11.5, OS=Windows 10.0.17134.648 (1803/April2018Update/Redstone4)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
Frequency=2742185 Hz, Resolution=364.6727 ns, Timer=TSC
.NET Core SDK=3.0.100-preview4-010389
  [Host]     : .NET Core 3.0.0-preview-27117-01 (CoreCLR 4.6.27116.05, CoreFX 4.7.18.56608), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview4-27419-7 (CoreCLR 4.6.27418.71, CoreFX 4.7.19.11907), 64bit RyuJIT


```
|                     Method |     Mean |     Error |    StdDev | Ratio |
|--------------------------- |---------:|----------:|----------:|------:|
|                  DllImport | 1.221 us | 0.0161 us | 0.0151 us |  1.00 |
|   DllImportWOSecurityCheck | 1.228 us | 0.0096 us | 0.0090 us |  1.01 |
|                LoadLibrary | 1.269 us | 0.0056 us | 0.0052 us |  1.04 |
| LoadLibraryWOSecurityCheck | 1.282 us | 0.0120 us | 0.0112 us |  1.05 |
|                      CallI | 1.227 us | 0.0023 us | 0.0021 us |  1.00 |
