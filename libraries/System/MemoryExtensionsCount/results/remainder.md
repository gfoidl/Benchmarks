## Description

In the current implementation the remainder of the vectorized code-path is processed scalar.
This PR processes the remainder vectorized too.

This is done by reading a vector from the end, comparing with the target vector, and extracting the most significant bits as usual.
As some elements may overlap now, we need to shift them off from the mask to get the correct count.

## Benchmarks

[Benchmark-code](https://github.com/gfoidl/Benchmarks/blob/cfa9f3dba175815aa8db481cc449a98e1bba2606/libraries/System/MemoryExtensionsCount/MemoryExtensionsCount/Program.cs#L43-L91)

### `byte`

```
|  Method | Length |      Mean |     Error |    StdDev | Ratio |
|-------- |------- |----------:|----------:|----------:|------:|
| Default |     33 |  2.950 ns | 0.1037 ns | 0.3042 ns |  1.00 |
|      PR |     33 |  3.055 ns | 0.1029 ns | 0.2280 ns |  1.04 |
|         |        |           |           |           |       |
| Default |     63 | 19.910 ns | 0.4376 ns | 0.5374 ns |  1.00 |
|      PR |     63 |  2.775 ns | 0.0995 ns | 0.1328 ns |  0.14 |
```

### `short`

```
|  Method | Length |     Mean |     Error |    StdDev | Ratio |
|-------- |------- |---------:|----------:|----------:|------:|
| Default |     17 | 3.422 ns | 0.1095 ns | 0.2187 ns |  1.00 |
|      PR |     17 | 4.150 ns | 0.1245 ns | 0.2707 ns |  1.22 |
|         |        |          |           |           |       |
| Default |     31 | 9.861 ns | 0.2287 ns | 0.2634 ns |  1.00 |
|      PR |     31 | 4.338 ns | 0.1304 ns | 0.1741 ns |  0.44 |
```

### `int`

```
|  Method | Length |     Mean |     Error |    StdDev | Ratio |
|-------- |------- |---------:|----------:|----------:|------:|
| Default |      9 | 2.279 ns | 0.0851 ns | 0.0874 ns |  1.00 |
|      PR |      9 | 3.120 ns | 0.1069 ns | 0.2643 ns |  1.29 |
|         |        |          |           |           |       |
| Default |     15 | 4.198 ns | 0.1294 ns | 0.1636 ns |  1.00 |
|      PR |     15 | 2.854 ns | 0.0845 ns | 0.0790 ns |  0.68 |
```

### `long`

```
|  Method | Length |     Mean |     Error |    StdDev | Ratio |
|-------- |------- |---------:|----------:|----------:|------:|
| Default |      5 | 2.276 ns | 0.0950 ns | 0.2725 ns |  1.00 |
|      PR |      5 | 3.088 ns | 0.1035 ns | 0.2480 ns |  1.37 |
|         |        |          |           |           |       |
| Default |      7 | 2.826 ns | 0.0379 ns | 0.0336 ns |  1.00 |
|      PR |      7 | 2.760 ns | 0.0938 ns | 0.0877 ns |  0.98 |
```
