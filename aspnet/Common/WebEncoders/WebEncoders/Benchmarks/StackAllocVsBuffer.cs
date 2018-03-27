#if NETCOREAPP2_1

//#define STACK_ONLY
//-----------------------------------------------------------------------------
using System;
using System.Buffers;
using System.Runtime.CompilerServices;
using BenchmarkDotNet.Attributes;

namespace WebEncodersBench.Benchmarks
{
    [MemoryDiagnoser]
    public class StackAllocVsBuffer
    {
#if !STACK_ONLY
        [Params(32, 1000)]
#endif
        public int Size { get; set; } = 32;
        //---------------------------------------------------------------------
#if STACK_ONLY
        [Benchmark(Baseline = true)]
        public byte Stackalloc()
        {
            Span<byte> span = stackalloc byte[this.Size];
            return this.Core(span);
        }
#endif
        //---------------------------------------------------------------------
#if STACK_ONLY
        [Benchmark]
#else
        [Benchmark(Baseline = true)]
#endif
        public byte BufferBased()
        {
            var buffer = new Buffer<byte>(this.Size);
            try
            {
                var span = buffer.Span;
                return this.Core(span);
            }
            finally
            {
                buffer.Dispose();
            }
        }
        //---------------------------------------------------------------------
        [Benchmark]
        public byte StackallocBased()
        {
            byte[] arrayToReturnToPool = null;
            try
            {
                Span<byte> span = this.Size <= 256
                    ? stackalloc byte[this.Size]
                    : new Span<byte>(arrayToReturnToPool = ArrayPool<byte>.Shared.Rent(this.Size), 0, this.Size);

                return this.Core(span);
            }
            finally
            {
                if (arrayToReturnToPool != null)
                    ArrayPool<byte>.Shared.Return(arrayToReturnToPool);
            }
        }
        //---------------------------------------------------------------------
        [Benchmark]
        public byte StackallocFixedSize()
        {
            byte[] arrayToReturnToPool = null;
            try
            {
                Span<byte> span = this.Size <= 256
                    ? stackalloc byte[256]
                    : (arrayToReturnToPool = ArrayPool<byte>.Shared.Rent(this.Size));

                span = span.Slice(0, this.Size);

                return this.Core(span);
            }
            finally
            {
                if (arrayToReturnToPool != null)
                    ArrayPool<byte>.Shared.Return(arrayToReturnToPool);
            }
        }
        //---------------------------------------------------------------------
        private byte Core(Span<byte> span) => span[span.Length - 1];
        //---------------------------------------------------------------------
        private unsafe ref struct Buffer<T> where T : struct
        {
            private const int MaxStack = 128;
            private T[]        _arrayToReturnToPool;
            private fixed char _buffer[MaxStack];

            public Span<T> Span { get; }

            [MethodImpl(MethodImplOptions.AggressiveInlining)]
            public Buffer(int size)
            {
                _arrayToReturnToPool = null;

                if (IsStackAllocated(size))
                {
                    fixed (char* buffer = _buffer)
                    {
                        Span = new Span<T>(buffer, size);
                    }
                }
                else
                {
#if !NET461
                    _arrayToReturnToPool = ArrayPool<T>.Shared.Rent(size);
#else
                    _arrayToReturnToPool = new T[size];
#endif
                    Span = new Span<T>(_arrayToReturnToPool, 0, size);
                }
            }

            [MethodImpl(MethodImplOptions.AggressiveInlining)]
            private static bool IsStackAllocated(int size)
            {
                // T is only char or byte
                int sizeOfT = typeof(T) == typeof(byte) ? 1 : 2;

                return size <= MaxStack * sizeof(char) / sizeOfT;
            }

            [MethodImpl(MethodImplOptions.AggressiveInlining)]
            public void Dispose()
            {
                if (_arrayToReturnToPool != null)
                {
#if !NET461
                    ArrayPool<T>.Shared.Return(_arrayToReturnToPool);
#endif
                    _arrayToReturnToPool = null;
                }
            }
        }
    }
}

#endif
