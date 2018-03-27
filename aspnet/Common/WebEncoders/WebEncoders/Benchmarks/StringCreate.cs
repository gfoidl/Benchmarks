#if NETCOREAPP2_1

using System;
using System.Buffers;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using BenchmarkDotNet.Attributes;

namespace WebEncodersBench.Benchmarks
{
    public class StringCreate : BaseBenchmark
    {
        private char[] _chars;
        //---------------------------------------------------------------------
        [Params(10, 50, 100)]
        public int Size { get; set; }
        //---------------------------------------------------------------------
        [GlobalSetup]
        public void GlobalSetup()
        {
            var rnd = new Random(0);

            _chars = Enumerable.Repeat(0, this.Size)
                .Select(_ => (char)rnd.Next('a', 'z' + 1))
                .ToArray();
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public string String_Ctor() => this.String_Ctor(_chars);
        //---------------------------------------------------------------------
        [Benchmark]
        public string String_Create() => this.String_Create(_chars);
        //---------------------------------------------------------------------
        [Benchmark]
        public string String_Create1() => this.String_Create1(_chars);
        //---------------------------------------------------------------------
        private string String_Ctor(ReadOnlySpan<char> chars)
        {
            var buffer = new Buffer<char>(chars.Length);
            try
            {
                var data = buffer.Span;
                chars.CopyTo(data);
                return new string(data);
            }
            finally
            {
                buffer.Dispose();
            }
        }
        //---------------------------------------------------------------------
        private unsafe string String_Create(ReadOnlySpan<char> chars)
        {
            fixed (char* ptr = &MemoryMarshal.GetReference(chars))
            {
                var state = ((IntPtr)ptr, chars.Length);
                return string.Create(chars.Length, state, String_CreateCore);
            }
        }
        //---------------------------------------------------------------------
        private unsafe string String_Create1(ReadOnlySpan<char> chars)
        {
            fixed (char* ptr = &MemoryMarshal.GetReference(chars))
            {
                var state = (Ptr: (IntPtr)ptr, chars.Length);
                return string.Create(chars.Length, state, (text, _) =>
                {
                    var span = new ReadOnlySpan<char>(_.Ptr.ToPointer(), _.Length);
                    span.CopyTo(text);
                });
            }
        }
        //---------------------------------------------------------------------
        private static unsafe void String_CreateCore(Span<char> text, (IntPtr Ptr, int Length) state)
        {
            var span = new ReadOnlySpan<char>(state.Ptr.ToPointer(), state.Length);
            span.CopyTo(text);
        }
        //---------------------------------------------------------------------
        internal unsafe ref struct Buffer<T> where T : struct
        {
            private const int MaxStack = 128;
            private T[] _arrayToReturnToPool;
            private fixed char _buffer[MaxStack];
            //-----------------------------------------------------------------
            public Span<T> Span { get; }
            //-----------------------------------------------------------------
            [MethodImpl(MethodImplOptions.AggressiveInlining)]
            public Buffer(int size)
            {
                _arrayToReturnToPool = null;

                // T is only char or byte
                int sizeOfT = typeof(T) == typeof(byte) ? 1 : 2;
                if (size > MaxStack * sizeof(char) / sizeOfT)
                {
#if !NET461
                    _arrayToReturnToPool = ArrayPool<T>.Shared.Rent(size);
#else
                    _arrayToReturnToPool = new T[size];
#endif
                    Span = new Span<T>(_arrayToReturnToPool, 0, size);
                }
                else
                {
                    fixed (char* buffer = _buffer)
                    {
                        Span = new Span<T>(buffer, size);
                    }
                }
            }
            //-----------------------------------------------------------------
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
