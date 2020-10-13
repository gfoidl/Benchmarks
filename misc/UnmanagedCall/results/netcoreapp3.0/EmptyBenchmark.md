``` ini

BenchmarkDotNet=v0.11.5, OS=Windows 10.0.17134.648 (1803/April2018Update/Redstone4)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
Frequency=2742185 Hz, Resolution=364.6727 ns, Timer=TSC
.NET Core SDK=3.0.100-preview4-010389
  [Host]	 : .NET Core 3.0.0-preview-27117-01 (CoreCLR 4.6.27116.05, CoreFX 4.7.18.56608), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview4-27419-7 (CoreCLR 4.6.27418.71, CoreFX 4.7.19.11907), 64bit RyuJIT


```
|					  Method |		Mean |	   Error |	  StdDev |	  Median | Ratio | RatioSD |
|--------------------------- |----------:|----------:|----------:|----------:|------:|--------:|
|				   DllImport |	7.145 ns | 0.1868 ns | 0.4722 ns |	6.962 ns |	1.00 |	  0.00 |
|	DllImportWOSecurityCheck |	7.072 ns | 0.1862 ns | 0.4279 ns |	6.947 ns |	0.99 |	  0.05 |
|				 LoadLibrary | 19.207 ns | 0.4235 ns | 0.8839 ns | 19.197 ns |	2.68 |	  0.16 |
| LoadLibraryWOSecurityCheck | 16.774 ns | 0.3700 ns | 0.5650 ns | 16.748 ns |	2.28 |	  0.18 |
|					   CallI |	6.994 ns | 0.1776 ns | 0.1574 ns |	6.950 ns |	0.92 |	  0.11 |
|				   CallITail |	7.073 ns | 0.1798 ns | 0.3421 ns |	6.921 ns |	0.98 |	  0.07 |
