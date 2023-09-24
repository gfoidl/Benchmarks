## Description

In the current implementation the remainder of the vectorized code-path is processed scalar.
This PR processes the remainder vectorized too.

This is done by reading a vector from the end, comparing with the target vector, and extracting the most significant bits as usual.
As some elements may overlap now, we need to shift them off from the mask to get the correct count.

Benchmarking showed that the cost of doing the remainder vectorized is higher than scalar processing if there are just a few elements.
Thus the remainder is done vectorized only if remaining length is more than half of a vector size.

## Benchmarks

[Benchmark-code](https://github.com/gfoidl/Benchmarks/blob/f2a964b42800a9f2477b09c9a8ce0c93ab0a7725/libraries/System/MemoryExtensionsCount/MemoryExtensionsCount/Program.cs#L43-L98)
Bencharks are done for the lengths `Vector256<T>.Count + 1` and `Vector256<T>.Count * 2 - 1`, so the both extreme cases for the remainder.

### `byte`

```
|  Method | Length |      Mean |     Error |    StdDev | Ratio | RatioSD |
|-------- |------- |----------:|----------:|----------:|------:|--------:|
| Default |     33 |  2.550 ns | 0.0897 ns | 0.0795 ns |  1.00 |    0.00 |
|      PR |     33 |  2.460 ns | 0.0574 ns | 0.0509 ns |  0.97 |    0.04 |
|         |        |           |           |           |       |         |
| Default |     63 | 18.252 ns | 0.2371 ns | 0.2102 ns |  1.00 |    0.00 |
|      PR |     63 |  2.816 ns | 0.0921 ns | 0.0862 ns |  0.15 |    0.00 |
```

### `short`

```
|  Method | Length |     Mean |     Error |    StdDev | Ratio | RatioSD |
|-------- |------- |---------:|----------:|----------:|------:|--------:|
| Default |     17 | 2.729 ns | 0.0630 ns | 0.0589 ns |  1.00 |    0.00 |
|      PR |     17 | 3.255 ns | 0.1044 ns | 0.2358 ns |  1.20 |    0.11 |
|         |        |          |           |           |       |         |
| Default |     31 | 9.784 ns | 0.2347 ns | 0.4172 ns |  1.00 |    0.00 |
|      PR |     31 | 3.707 ns | 0.1104 ns | 0.1473 ns |  0.38 |    0.03 |
```

### `int`

```
|  Method | Length |     Mean |     Error |    StdDev | Ratio | RatioSD |
|-------- |------- |---------:|----------:|----------:|------:|--------:|
| Default |      9 | 1.960 ns | 0.0805 ns | 0.1452 ns |  1.00 |    0.00 |
|      PR |      9 | 2.177 ns | 0.0427 ns | 0.0356 ns |  1.04 |    0.08 |
|         |        |          |           |           |       |         |
| Default |     15 | 4.317 ns | 0.1263 ns | 0.2278 ns |  1.00 |    0.00 |
|      PR |     15 | 2.205 ns | 0.0291 ns | 0.0272 ns |  0.51 |    0.02 |
```

### `long`

```
|  Method | Length |     Mean |     Error |    StdDev | Ratio | RatioSD |
|-------- |------- |---------:|----------:|----------:|------:|--------:|
| Default |      5 | 2.274 ns | 0.0866 ns | 0.2414 ns |  1.00 |    0.00 |
|      PR |      5 | 2.460 ns | 0.0922 ns | 0.2703 ns |  1.09 |    0.16 |
|         |        |          |           |           |       |         |
| Default |      7 | 3.071 ns | 0.1044 ns | 0.2944 ns |  1.00 |    0.00 |
|      PR |      7 | 2.469 ns | 0.0941 ns | 0.2199 ns |  0.79 |    0.09 |
```
