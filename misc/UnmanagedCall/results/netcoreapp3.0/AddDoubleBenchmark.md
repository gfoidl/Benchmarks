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
|				   DllImport |	7.335 ns | 0.1695 ns | 0.1586 ns |	7.329 ns |	1.00 |	  0.00 |
|	DllImportWOSecurityCheck |	5.935 ns | 0.3823 ns | 0.9799 ns |	5.387 ns |	1.04 |	  0.06 |
|				 LoadLibrary | 14.968 ns | 0.3807 ns | 0.9480 ns | 14.662 ns |	2.17 |	  0.19 |
| LoadLibraryWOSecurityCheck | 13.825 ns | 0.3647 ns | 1.0347 ns | 13.437 ns |	2.14 |	  0.07 |
|					   CallI |	4.820 ns | 0.3982 ns | 0.9385 ns |	4.358 ns |	0.88 |	  0.09 |
