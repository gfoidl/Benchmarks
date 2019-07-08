// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

// This file contains two ICryptoTransforms: ToBase64Transform and FromBase64Transform
// they may be attached to a CryptoStream in either read or write mode

using System.Buffers;
using System.Buffers.Text;
using System.Diagnostics;
using System.Runtime.CompilerServices;

namespace System.Security.Cryptography
{
    public class FromBase64Transform_128 : ICryptoTransform
    {
        private byte[] _inputBuffer = new byte[4];
        private int _inputIndex;
        private readonly FromBase64TransformMode _whitespaces;

        public FromBase64Transform_128() : this(FromBase64TransformMode.IgnoreWhiteSpaces) { }
        public FromBase64Transform_128(FromBase64TransformMode whitespaces)
        {
            _whitespaces = whitespaces;
        }

        // Converting from Base64 generates 3 bytes output from each 4 bytes input block
        private const int Base64InputBlockSize = 4;
        public int InputBlockSize => 1;
        public int OutputBlockSize => 3;
        public bool CanTransformMultipleBlocks => false;
        public virtual bool CanReuseTransform => true;

        public int TransformBlock(byte[] inputBuffer, int inputOffset, int inputCount, byte[] outputBuffer, int outputOffset)
        {
            // inputCount != InputBlockSize is allowed
            ThrowHelper.ValidateTransformBlock(inputBuffer, inputOffset, inputCount);

            if (_inputBuffer == null)
                ThrowHelper.ThrowObjectDisposed();

            if (outputBuffer == null)
                ThrowHelper.ThrowArgumentNull(ThrowHelper.ExceptionArgument.outputBuffer);

            // The common case is inputCount = InputBlockSize
            byte[] tmpBufferArray = null;
            Span<byte> tmpBuffer = stackalloc byte[128];
            if (inputCount > tmpBuffer.Length)
            {
                tmpBuffer = tmpBufferArray = CryptoPool.Rent(inputCount);
            }

            tmpBuffer = GetTempBuffer(inputBuffer.AsSpan(inputOffset, inputCount), tmpBuffer);
            int bytesToTransform = _inputIndex + tmpBuffer.Length;

            // Too little data to decode: save data to _inputBuffer, so it can be transformed later
            if (bytesToTransform < Base64InputBlockSize)
            {
                tmpBuffer.CopyTo(_inputBuffer.AsSpan(_inputIndex));

                _inputIndex = bytesToTransform;

                ReturnToCryptoPool(tmpBufferArray, tmpBuffer.Length);

                return 0;
            }

            ConvertFromBase64(tmpBuffer, outputBuffer.AsSpan(outputOffset), out _, out int written);

            ReturnToCryptoPool(tmpBufferArray, tmpBuffer.Length);

            return written;
        }

        public byte[] TransformFinalBlock(byte[] inputBuffer, int inputOffset, int inputCount)
        {
            // inputCount != InputBlockSize is allowed
            ThrowHelper.ValidateTransformBlock(inputBuffer, inputOffset, inputCount);

            if (_inputBuffer == null)
            {
                ThrowHelper.ThrowObjectDisposed();
            }

            if (inputCount == 0)
            {
                return Array.Empty<byte>();
            }

            // The common case is inputCount <= Base64InputBlockSize
            byte[] tmpBufferArray = null;
            Span<byte> tmpBuffer = stackalloc byte[Base64InputBlockSize];
            if (inputCount > Base64InputBlockSize)
            {
                tmpBuffer = tmpBufferArray = CryptoPool.Rent(inputCount);
            }

            tmpBuffer = GetTempBuffer(inputBuffer.AsSpan(inputOffset, inputCount), tmpBuffer);
            int bytesToTransform = _inputIndex + tmpBuffer.Length;

            // Too little data to decode
            if (bytesToTransform < Base64InputBlockSize)
            {
                // reinitialize the transform
                Reset();

                ReturnToCryptoPool(tmpBufferArray, tmpBuffer.Length);

                return Array.Empty<byte>();
            }

            int outputSize = GetOutputSize(bytesToTransform, tmpBuffer);
            byte[] output = new byte[outputSize];

            ConvertFromBase64(tmpBuffer, output, out int consumed, out int written);
            Debug.Assert(written == outputSize);

            ReturnToCryptoPool(tmpBufferArray, tmpBuffer.Length);

            // reinitialize the transform
            Reset();

            return output;
        }

        private Span<byte> GetTempBuffer(Span<byte> inputBuffer, Span<byte> tmpBuffer)
        {
            if (_whitespaces == FromBase64TransformMode.DoNotIgnoreWhiteSpaces)
            {
                return inputBuffer;
            }

            return DiscardWhiteSpaces(inputBuffer, tmpBuffer);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static Span<byte> DiscardWhiteSpaces(Span<byte> inputBuffer, Span<byte> tmpBuffer)
        {
            int count = 0;

            for (int i = 0; i < inputBuffer.Length; i++)
            {
                if (!IsWhitespace(inputBuffer[i]))
                {
                    tmpBuffer[count++] = inputBuffer[i];
                }
            }

            return tmpBuffer.Slice(0, count);
        }

        private static bool IsWhitespace(byte value)
        {
            // We assume ASCII encoded data. If there is any non-ASCII char, it is invalid
            // Base64 and will be caught during decoding.

            // SPACE        32
            // TAB           9
            // LF           10
            // VTAB         11
            // FORM FEED    12
            // CR           13

            return value == 32 || ((uint)value - 9 <= (13 - 9));
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private int GetOutputSize(int bytesToTransform, Span<byte> tmpBuffer)
        {
            int outputSize = Base64.GetMaxDecodedFromUtf8Length(bytesToTransform);

            const byte padding = (byte)'=';
            int len = tmpBuffer.Length;

            // In Base64 there are maximum 2 padding chars

            if (tmpBuffer[len - 2] == padding)
            {
                outputSize--;
            }

            if (tmpBuffer[len - 1] == padding)
            {
                outputSize--;
            }

            return outputSize;
        }

        private void ConvertFromBase64(Span<byte> tmpBuffer, Span<byte> outputBuffer, out int consumed, out int written)
        {
            int bytesToTransform = _inputIndex + tmpBuffer.Length;
            Debug.Assert(bytesToTransform >= 4);

            // Common case for bytesToTransform = 4
            byte[] transformBufferArray = null;
            Span<byte> transformBuffer = stackalloc byte[4];
            if (bytesToTransform > 4)
            {
                transformBuffer = transformBufferArray = CryptoPool.Rent(bytesToTransform);
            }

            // Copy _inputBuffer to transformBuffer and append tmpBuffer
            Debug.Assert(_inputIndex < _inputBuffer.Length);
            _inputBuffer.AsSpan(0, _inputIndex).CopyTo(transformBuffer);
            tmpBuffer.CopyTo(transformBuffer.Slice(_inputIndex));

            // Save data that won't be transformed to _inputBuffer, so it can be transformed later
            _inputIndex = bytesToTransform & 3;     // bit hack for % 4
            bytesToTransform -= _inputIndex;        // only transform up to the next multiple of 4
            Debug.Assert(_inputIndex < _inputBuffer.Length);
            tmpBuffer.Slice(tmpBuffer.Length - _inputIndex).CopyTo(_inputBuffer);

            transformBuffer = transformBuffer.Slice(0, bytesToTransform);
            OperationStatus status = Base64.DecodeFromUtf8(transformBuffer, outputBuffer, out consumed, out written);

            if (status == OperationStatus.Done)
            {
                Debug.Assert(consumed == bytesToTransform);
            }
            else
            {
                Debug.Assert(status == OperationStatus.InvalidData);
                ThrowHelper.ThrowBase64FormatException();
            }

            ReturnToCryptoPool(transformBufferArray, transformBuffer.Length);
        }

        private void ReturnToCryptoPool(byte[] array, int clearSize)
        {
            if (array != null)
            {
                CryptoPool.Return(array, clearSize);
            }
        }

        public void Clear()
        {
            Dispose();
        }

        // Reset the state of the transform so it can be used again
        private void Reset()
        {
            _inputIndex = 0;
        }

        // must implement IDisposable, which in this case means clearing the input buffer

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            // we always want to clear the input buffer
            if (disposing)
            {
                if (_inputBuffer != null)
                {
                    CryptographicOperations.ZeroMemory(_inputBuffer);
                    _inputBuffer = null;
                }

                Reset();
            }
        }

        ~FromBase64Transform_128()
        {
            Dispose(false);
        }
    }
}
