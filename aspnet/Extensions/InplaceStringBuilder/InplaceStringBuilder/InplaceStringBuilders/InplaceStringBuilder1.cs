// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;

namespace Microsoft.Extensions.Primitives
{
	[DebuggerDisplay("Value = {new string(_value)}")]
	public struct InplaceStringBuilder1
	{
		private int _offset;
		private char[] _value;

		public InplaceStringBuilder1(int capacity) : this()
		{
			if (capacity < 0)
			{
				ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument.capacity);
			}

			_value = new char[capacity];
		}

		public int Capacity
		{
			get => _value?.Length ?? 0;
			set
			{
				if (value < 0)
				{
					ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument.value);
				}

				// _offset > 0 indicates writing state
				if (_offset > 0)
				{
					ThrowHelper.ThrowInvalidOperationException(ExceptionResource.Capacity_CannotChangeAfterWriteStarted);
				}

				_value = new char[value];
			}
		}

		public void Append(string value)
		{
			if (value == null)
			{
				ThrowHelper.ThrowArgumentNullException(ExceptionArgument.value);
			}

			Append(value, 0, value.Length);
		}

		public void Append(StringSegment segment)
		{
			Append(segment.Buffer, segment.Offset, segment.Length);
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public void Append(string value, int offset, int count)
		{
			if (value == null
				|| offset < 0
				|| value.Length - offset < count
				|| _value.Length - _offset < count)
			{
				ThrowValidationError(value, offset, count);
			}

			Array.Copy(value.ToCharArray(), offset, _value, _offset, count);
			_offset += count;
		}

		private void ThrowValidationError(string value, int offset, int count)
		{
			if (value == null)
			{
				ThrowHelper.ThrowArgumentNullException(ExceptionArgument.value);
			}

			if (offset < 0 || value.Length - offset < count)
			{
				ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument.offset);
			}

			if (_value.Length - _offset < count)
			{
				ThrowNotEnoughCapacity(value.Length);
			}
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public void Append(char c)
		{
			char[] destination = _value;
			int pos = _offset;

			if ((uint)pos >= (uint)destination.Length)
			{
				ThrowNotEnoughCapacity(1);
			}

			destination[pos] = c;
			_offset = pos + 1;
		}

		private void ThrowNotEnoughCapacity(int length)
		{
			throw new InvalidOperationException($"Not enough capacity to write '{length}' characters, only '{_value.Length - _offset}' left.");
		}

		public override string ToString()
		{
			if (_value.Length != _offset)
			{
				ThrowCapacityNotUsed();
			}

			return new string(_value);
		}

		private void ThrowCapacityNotUsed()
		{
			throw new InvalidOperationException($"Entire reserved capacity was not used. Capacity: '{Capacity}', written '{_offset}'.");
		}
	}
}
