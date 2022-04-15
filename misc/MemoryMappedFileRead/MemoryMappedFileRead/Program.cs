using System.Diagnostics;
using System.IO.MemoryMappedFiles;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using BenchmarkDotNet.Attributes;
using Microsoft.Win32.SafeHandles;

using Bench bench = new();
bench.Setup();
Console.WriteLine(bench.FileStream());
Console.WriteLine(bench.FileHandle());
//Console.WriteLine(bench.MemoryMappedViewStream());
Console.WriteLine(bench.MemoryMappedViewAccessor());

#if !DEBUG
BenchmarkDotNet.Running.BenchmarkRunner.Run<Bench>();
#endif
//-----------------------------------------------------------------------------
public class Bench : IDisposable
{
#if DEBUG
    private const long Size = 2 * 4083;
#else
    private const long Size = 2 * 1024 * 1024 * 1024L;
#endif

    public const string Path = "foo.dat";

    private readonly byte[] _buffer = new byte[4096];
    //-------------------------------------------------------------------------
    [GlobalSetup]
    public void Setup()
    {
        CreateFile(Path, Size);
        Console.WriteLine($"File created with size {Size} B = {Size / 1024d:N2} kiB = {Size / 1024 / 1024d:N2} MiB = {Size / 1024 / 1024 / 1024d:N2} GiB");
    }
    //-------------------------------------------------------------------------
    [GlobalCleanup]
    public void Dispose()
    {
        try
        {
            File.Delete(Path);
        }
        catch { }
    }
    //-------------------------------------------------------------------------
    [Benchmark(Baseline = true)]
    public long FileStream()
    {
        long sum                = 0;
        using FileStream stream = File.OpenRead(Path);

        byte[] buffer = _buffer;
        int read      = 0;

        while ((read = stream.Read(buffer)) > 0)
        {
            sum += Sum(buffer.AsSpan(0, read));
        }

        return sum;
    }
    //-------------------------------------------------------------------------
    [Benchmark]
    public long FileHandle()
    {
        long sum = 0;

        using SafeFileHandle file = File.OpenHandle(Path, FileMode.Open, FileAccess.Read);
        byte[] buffer             = _buffer;
        long offset               = 0;
        int read                  = 0;

        while ((read = RandomAccess.Read(file, buffer, offset)) > 0)
        {
            offset += read;
            sum    += Sum(buffer.AsSpan(0, read));
        }

        return sum;
    }
    //-------------------------------------------------------------------------
    //[Benchmark]
    public long MemoryMappedViewStream()
    {
        // When the actual file is smaller than the page size (4096) this method has the same
        // problem as outlined in the comment below.

        long sum = 0;

        using MemoryMappedFile file         = MemoryMappedFile.CreateFromFile(Path, FileMode.Open, null, capacity: 0, MemoryMappedFileAccess.Read);
        using MemoryMappedViewStream stream = file.CreateViewStream(0, 0, MemoryMappedFileAccess.Read);

        byte[] buffer = _buffer;
        int read      = 0;

        while ((read = stream.Read(buffer)) > 0)
        {
            sum += Sum(buffer.AsSpan(0, read));
        }

        return sum;
    }
    //-------------------------------------------------------------------------
    [Benchmark]
    public unsafe long MemoryMappedViewAccessor()
    {
        long sum       = 0;
        int bufferSize = _buffer.Length;

        // Must open the MMF with the filestream in order to be able to get the length.
        // accessor.SafeMemoryMappedViewHandle.ByteLength is the length of the (internal) buffer,
        // which may be aligned to page size (4096 bytes), so it can be too large.

        // This is wrong here.
        //MemoryMappedFile file           = MemoryMappedFile.CreateFromFile(Path, FileMode.Open, null, capacity: 0, MemoryMappedFileAccess.Read);
        FileStream fileStream             = File.OpenRead(Path);
        MemoryMappedFile file             = MemoryMappedFile.CreateFromFile(fileStream, null, 0, MemoryMappedFileAccess.Read, HandleInheritability.None, leaveOpen: false);
        MemoryMappedViewAccessor accessor = file.CreateViewAccessor(0, 0, MemoryMappedFileAccess.Read);

        byte* ptr = null;
        accessor.SafeMemoryMappedViewHandle.AcquirePointer(ref ptr);

        try
        {
            // This is wrong here.
            //byte* end = ptr + accessor.SafeMemoryMappedViewHandle.ByteLength;
            byte* end = ptr + fileStream.Length;
            ReadOnlySpan<byte> span;

            while (ptr <= end - bufferSize)
            {
                span = new ReadOnlySpan<byte>(ptr, bufferSize);
                ptr += bufferSize;
                sum += Sum(span);
            }

            span = new ReadOnlySpan<byte>(ptr, (int)(end - ptr));
            sum += Sum(span);
        }
        finally
        {
            accessor.SafeMemoryMappedViewHandle.ReleasePointer();
            accessor.Dispose();
            file    .Dispose();
        }

        return sum;
    }

    [DebuggerStepThrough]
    internal static long Sum(ReadOnlySpan<byte> span)
    {
        long sum     = 0;
        ref byte rb  = ref MemoryMarshal.GetReference(span);
        nuint length = (uint)span.Length;
        nuint idx    = length % 4;

        if (idx > 0)
        {
            sum = rb;

            if (idx > 1)
            {
                sum += Unsafe.Add(ref rb, 1);

                if (idx > 2)
                {
                    sum += Unsafe.Add(ref rb, 2);
                }
            }
        }

        if (length >= 4)
        {
            do
            {
                long t0 = Unsafe.Add(ref rb, idx + 0);
                long t1 = Unsafe.Add(ref rb, idx + 1);
                long t2 = Unsafe.Add(ref rb, idx + 2);
                long t3 = Unsafe.Add(ref rb, idx + 3);

                Debug.Assert(t0 != 0 && t1 != 0 && t2 != 0 && t3 != 0, "Should not contain 0 -- maybe read beyond the limits of actual file");

                t0  += t1;
                t2  += t3;
                t0  += t2;
                sum += t0;

                idx += 4;
            } while (idx <= length - 4);
        }

        return sum;
    }
    //-------------------------------------------------------------------------
    private static void CreateFile(string path, long size)
    {
        using FileStream stream         = new(path, new FileStreamOptions { PreallocationSize = size, Mode = FileMode.Create, Access = FileAccess.Write });
        long totalWritten               = 0;
        byte[] buffer                   = new byte[Math.Min(size, 80_000)];
        using RandomNumberGenerator rng = RandomNumberGenerator.Create();

        while (totalWritten < size)
        {
            rng.GetNonZeroBytes(buffer);
            stream.Write(buffer);
            totalWritten += buffer.Length;
            Random.Shared.NextBytes(buffer);
        }
    }
}
