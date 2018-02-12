﻿// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;

namespace Microsoft.Extensions.Primitives
{
	[DebuggerDisplay("Value = _value}")]
	public struct InplaceStringBuilder00
	{
		private int _offset;
		private string _value;

		public InplaceStringBuilder00(int capacity) : this()
		{
			if (capacity < 0)
			{
				ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument.capacity);
			}

			_value = new string('\0', capacity);
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

				_value = new string('\0', value);
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
		public unsafe void Append(string value, int offset, int count)
		{
			if (value == null
				|| offset < 0
				|| value.Length - offset < count
				|| _value.Length - _offset < count)
			{
				ThrowValidationError(value, offset, count);
			}

			fixed (char* destination = _value)
			fixed (char* source = value)
			{
				Unsafe.CopyBlockUnaligned(destination + _offset, source + offset, (uint)count * 2);
				_offset += count;
			}
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
		public unsafe void Append(char c)
		{
			if (_offset >= _value.Length)
			{
				ThrowNotEnoughCapacity(1);
			}

			fixed (char* destination = _value)
			{
				destination[_offset++] = c;
			}
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

			return _value;
		}

		private void ThrowCapacityNotUsed()
		{
			throw new InvalidOperationException($"Entire reserved capacity was not used. Capacity: '{Capacity}', written '{_offset}'.");
		}
	}
}
