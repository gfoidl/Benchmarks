﻿// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Runtime.CompilerServices;

namespace Microsoft.Extensions.Primitives
{
	/// <summary>
	/// An optimized representation of a substring.
	/// </summary>
	public struct StringSegment1 : IEquatable<StringSegment1>, IEquatable<string>
	{
		/// <summary>
		/// A <see cref="StringSegment1"/> for <see cref="string.Empty"/>.
		/// </summary>
		public static readonly StringSegment1 Empty = string.Empty;

		/// <summary>
		/// Initializes an instance of the <see cref="StringSegment1"/> struct.
		/// </summary>
		/// <param name="buffer">
		/// The original <see cref="string"/>. The <see cref="StringSegment1"/> includes the whole <see cref="string"/>.
		/// </param>
		public StringSegment1(string buffer)
		{
			Buffer = buffer;
			Offset = 0;
			Length = buffer?.Length ?? 0;
		}

		/// <summary>
		/// Initializes an instance of the <see cref="StringSegment1"/> struct.
		/// </summary>
		/// <param name="buffer">The original <see cref="string"/> used as buffer.</param>
		/// <param name="offset">The offset of the segment within the <paramref name="buffer"/>.</param>
		/// <param name="length">The length of the segment.</param>
		public StringSegment1(string buffer, int offset, int length)
		{
			// Validate arguments, check is minimal instructions with reduced branching for inlinable fast-path
			// Negative values discovered though conversion to high values when converted to unsigned
			// Failure should be rare and location determination and message is delegated to failure functions
			if (buffer == null || (uint)offset > (uint)buffer.Length || (uint)length > (uint)(buffer.Length - offset))
			{
				ThrowInvalidArguments(buffer, offset, length);
			}

			Buffer = buffer;
			Offset = offset;
			Length = length;
		}

		// Methods that do no return (i.e. throw) are not inlined
		// https://github.com/dotnet/coreclr/pull/6103
		private static void ThrowInvalidArguments(string buffer, int offset, int length)
		{
			if (buffer == null)
			{
				throw ThrowHelper.GetArgumentNullException(ExceptionArgument.buffer);
			}

			if (offset < 0)
			{
				throw ThrowHelper.GetArgumentOutOfRangeException(ExceptionArgument.offset);
			}

			if (length < 0)
			{
				throw ThrowHelper.GetArgumentOutOfRangeException(ExceptionArgument.length);
			}

			throw ThrowHelper.GetArgumentException(ExceptionResource.Argument_InvalidOffsetLength);
		}

		/// <summary>
		/// Gets the <see cref="string"/> buffer for this <see cref="StringSegment1"/>.
		/// </summary>
		public string Buffer { get; }

		/// <summary>
		/// Gets the offset within the buffer for this <see cref="StringSegment1"/>.
		/// </summary>
		public int Offset { get; }

		/// <summary>
		/// Gets the length of this <see cref="StringSegment1"/>.
		/// </summary>
		public int Length { get; }

		/// <summary>
		/// Gets the value of this segment as a <see cref="string"/>.
		/// </summary>
		public string Value
		{
			get
			{
				if (HasValue)
				{
					return Buffer.Substring(Offset, Length);
				}
				else
				{
					return null;
				}
			}
		}

		/// <summary>
		/// Gets whether or not this <see cref="StringSegment1"/> contains a valid value.
		/// </summary>
		public bool HasValue
		{
			get { return Buffer != null; }
		}

		/// <summary>
		/// Gets the <see cref="char"/> at a specified position in the current <see cref="StringSegment1"/>.
		/// </summary>
		/// <param name="index">The offset into the <see cref="StringSegment1"/></param>
		/// <returns>The <see cref="char"/> at a specified position.</returns>
		public char this[int index]
		{
			get
			{
				if ((uint)index >= (uint)Length)
				{
					ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument.index);
				}

				return Buffer[Offset + index];
			}
		}

		/// <summary>
		/// Gets a <see cref="ReadOnlySpan{T}"/> from the current <see cref="StringSegment"/>.
		/// </summary>
		/// <returns>The <see cref="ReadOnlySpan{T}"/> from this <see cref="StringSegment"/>.</returns>
		public ReadOnlySpan<char> AsSpan() => Buffer.AsSpan(Offset, Length);

		/// <summary>
		/// Gets a <see cref="ReadOnlyMemory{T}"/> from the current <see cref="StringSegment"/>.
		/// </summary>
		/// <returns>The <see cref="ReadOnlyMemory{T}"/> from this <see cref="StringSegment"/>.</returns>
		public ReadOnlyMemory<char> AsMemory() => Buffer.AsMemory(Offset, Length);

		/// <inheritdoc />
		public override bool Equals(object obj)
		{
			if (obj == null) return false;

			return obj is StringSegment1 segment && Equals(segment);
		}

		/// <summary>
		/// Indicates whether the current object is equal to another object of the same type.
		/// </summary>
		/// <param name="other">An object to compare with this object.</param>
		/// <returns><code>true</code> if the current object is equal to the other parameter; otherwise, <code>false</code>.</returns>
		public bool Equals(StringSegment1 other)
		{
			return Equals(other, StringComparison.Ordinal);
		}

		/// <summary>
		/// Indicates whether the current object is equal to another object of the same type.
		/// </summary>
		/// <param name="other">An object to compare with this object.</param>
		/// <param name="comparisonType">One of the enumeration values that specifies the rules to use in the comparison.</param>
		/// <returns><code>true</code> if the current object is equal to the other parameter; otherwise, <code>false</code>.</returns>
		public bool Equals(StringSegment1 other, StringComparison comparisonType)
		{
			if (Length != other.Length)
			{
				return false;
			}

			return string.Compare(Buffer, Offset, other.Buffer, other.Offset, other.Length, comparisonType) == 0;
		}

		// This handles StringSegment.Equals(string, StringSegment, StringComparison) and StringSegment.Equals(StringSegment, string, StringComparison)
		// via the implicit type converter
		/// <summary>
		/// Determines whether two specified StringSegment objects have the same value. A parameter specifies the culture, case, and
		/// sort rules used in the comparison.
		/// </summary>
		/// <param name="a">The first StringSegment to compare.</param>
		/// <param name="b">The second StringSegment to compare.</param>
		/// <param name="comparisonType">One of the enumeration values that specifies the rules for the comparison.</param>
		/// <returns><code>true</code> if the objects are equal; otherwise, <code>false</code>.</returns>
		public static bool Equals(StringSegment1 a, StringSegment1 b, StringComparison comparisonType)
		{
			return a.Equals(b, comparisonType);
		}

		/// <summary>
		/// Checks if the specified <see cref="string"/> is equal to the current <see cref="StringSegment1"/>.
		/// </summary>
		/// <param name="text">The <see cref="string"/> to compare with the current <see cref="StringSegment1"/>.</param>
		/// <returns><code>true</code> if the specified <see cref="string"/> is equal to the current <see cref="StringSegment1"/>; otherwise, <code>false</code>.</returns>
		public bool Equals(string text)
		{
			return Equals(text, StringComparison.Ordinal);
		}

		/// <summary>
		/// Checks if the specified <see cref="string"/> is equal to the current <see cref="StringSegment1"/>.
		/// </summary>
		/// <param name="text">The <see cref="string"/> to compare with the current <see cref="StringSegment1"/>.</param>
		/// <param name="comparisonType">One of the enumeration values that specifies the rules to use in the comparison.</param>
		/// <returns><code>true</code> if the specified <see cref="string"/> is equal to the current <see cref="StringSegment1"/>; otherwise, <code>false</code>.</returns>
		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public bool Equals(string text, StringComparison comparisonType)
		{
			if (text == null)
			{
				ThrowHelper.ThrowArgumentNullException(ExceptionArgument.text);
			}

			int textLength = text.Length;
			if (!HasValue || Length != textLength)
			{
				return false;
			}

			return string.Compare(Buffer, Offset, text, 0, textLength, comparisonType) == 0;
		}

		/// <inheritdoc />
		/// <remarks>
		/// This GetHashCode is expensive since it allocates on every call.
		/// However this is required to ensure we retain any behavior (such as hash code randomization) that
		/// string.GetHashCode has.
		/// </remarks>
		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public override int GetHashCode() => Value?.GetHashCode() ?? 0;

		/// <summary>
		/// Checks if two specified <see cref="StringSegment1"/> have the same value.
		/// </summary>
		/// <param name="left">The first <see cref="StringSegment1"/> to compare, or <code>null</code>.</param>
		/// <param name="right">The second <see cref="StringSegment1"/> to compare, or <code>null</code>.</param>
		/// <returns><code>true</code> if the value of <paramref name="left"/> is the same as the value of <paramref name="right"/>; otherwise, <code>false</code>.</returns>
		public static bool operator ==(StringSegment1 left, StringSegment1 right)
		{
			return left.Equals(right);
		}

		/// <summary>
		/// Checks if two specified <see cref="StringSegment1"/> have different values.
		/// </summary>
		/// <param name="left">The first <see cref="StringSegment1"/> to compare, or <code>null</code>.</param>
		/// <param name="right">The second <see cref="StringSegment1"/> to compare, or <code>null</code>.</param>
		/// <returns><code>true</code> if the value of <paramref name="left"/> is different from the value of <paramref name="right"/>; otherwise, <code>false</code>.</returns>
		public static bool operator !=(StringSegment1 left, StringSegment1 right)
		{
			return !left.Equals(right);
		}

		// PERF: Do NOT add a implicit converter from StringSegment to String. That would negate most of the perf safety.
		/// <summary>
		/// Creates a new <see cref="global::StringSegment"/> from the given <see cref="string"/>.
		/// </summary>
		/// <param name="value">The <see cref="string"/> to convert to a <see cref="global::StringSegment"/></param>
		public static implicit operator StringSegment1(string value)
		{
			return new StringSegment1(value);
		}

		/// <summary>
		/// Creates a see <see cref="ReadOnlySpan{T}"/> from the given <see cref="StringSegment"/>.
		/// </summary>
		/// <param name="segment">The <see cref="StringSegment"/> to convert to a <see cref="ReadOnlySpan{T}"/>.</param>
		public static implicit operator ReadOnlySpan<char>(StringSegment1 segment) => segment.AsSpan();

		/// <summary>
		/// Creates a see <see cref="ReadOnlyMemory{T}"/> from the given <see cref="StringSegment"/>.
		/// </summary>
		/// <param name="segment">The <see cref="StringSegment"/> to convert to a <see cref="ReadOnlyMemory{T}"/>.</param>
		public static implicit operator ReadOnlyMemory<char>(StringSegment1 segment) => segment.AsMemory();

		/// <summary>
		/// Checks if the beginning of this <see cref="StringSegment1"/> matches the specified <see cref="string"/> when compared using the specified <paramref name="comparisonType"/>.
		/// </summary>
		/// <param name="text">The <see cref="string"/>to compare.</param>
		/// <param name="comparisonType">One of the enumeration values that specifies the rules to use in the comparison.</param>
		/// <returns><code>true</code> if <paramref name="text"/> matches the beginning of this <see cref="StringSegment1"/>; otherwise, <code>false</code>.</returns>
		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public bool StartsWith(string text, StringComparison comparisonType)
		{
			if (text == null)
			{
				ThrowHelper.ThrowArgumentNullException(ExceptionArgument.text);
			}

			bool result = false;
			int textLength = text.Length;

			if (HasValue && Length >= textLength)
			{
				result = string.Compare(Buffer, Offset, text, 0, textLength, comparisonType) == 0;
			}

			return result;
		}

		/// <summary>
		/// Checks if the end of this <see cref="StringSegment1"/> matches the specified <see cref="string"/> when compared using the specified <paramref name="comparisonType"/>.
		/// </summary>
		/// <param name="text">The <see cref="string"/>to compare.</param>
		/// <param name="comparisonType">One of the enumeration values that specifies the rules to use in the comparison.</param>
		/// <returns><code>true</code> if <paramref name="text"/> matches the end of this <see cref="StringSegment1"/>; otherwise, <code>false</code>.</returns>
		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public bool EndsWith(string text, StringComparison comparisonType)
		{
			if (text == null)
			{
				ThrowHelper.ThrowArgumentNullException(ExceptionArgument.text);
			}

			bool result = false;
			int textLength = text.Length;
			int comparisonLength = Offset + Length - textLength;

			if (HasValue && comparisonLength > 0)
			{
				result = string.Compare(Buffer, comparisonLength, text, 0, textLength, comparisonType) == 0;
			}

			return result;
		}

		/// <summary>
		/// Retrieves a substring from this <see cref="StringSegment1"/>.
		/// The substring starts at the position specified by <paramref name="offset"/> and has the remaining length.
		/// </summary>
		/// <param name="offset">The zero-based starting character position of a substring in this <see cref="StringSegment1"/>.</param>
		/// <returns>A <see cref="string"/> that is equivalent to the substring of remaining length that begins at
		/// <paramref name="offset"/> in this <see cref="StringSegment1"/></returns>
		public string Substring(int offset)
		{
			return Substring(offset, Length - offset);
		}

		/// <summary>
		/// Retrieves a substring from this <see cref="StringSegment1"/>.
		/// The substring starts at the position specified by <paramref name="offset"/> and has the specified <paramref name="length"/>.
		/// </summary>
		/// <param name="offset">The zero-based starting character position of a substring in this <see cref="StringSegment1"/>.</param>
		/// <param name="length">The number of characters in the substring.</param>
		/// <returns>A <see cref="string"/> that is equivalent to the substring of length <paramref name="length"/> that begins at
		/// <paramref name="offset"/> in this <see cref="StringSegment1"/></returns>
		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public string Substring(int offset, int length)
		{
			if (!HasValue || offset < 0 || offset + length > Length || length < 0)
			{
				ThrowInvalidArguments(offset, length);
			}

			return Buffer.Substring(Offset + offset, length);
		}

		private void ThrowInvalidArguments(int offset, int length)
		{
			if (!HasValue)
			{
				throw ThrowHelper.GetArgumentOutOfRangeException(ExceptionArgument.offset);
			}

			if (offset < 0 || offset + length > Length)
			{
				throw ThrowHelper.GetArgumentOutOfRangeException(ExceptionArgument.offset);
			}

			throw ThrowHelper.GetArgumentOutOfRangeException(ExceptionArgument.length);
		}

		/// <summary>
		/// Retrieves a <see cref="StringSegment1"/> that represents a substring from this <see cref="StringSegment1"/>.
		/// The <see cref="StringSegment1"/> starts at the position specified by <paramref name="offset"/>.
		/// </summary>
		/// <param name="offset">The zero-based starting character position of a substring in this <see cref="StringSegment1"/>.</param>
		/// <returns>A <see cref="StringSegment1"/> that begins at <paramref name="offset"/> in this <see cref="StringSegment1"/>
		/// whose length is the remainder.</returns>
		public StringSegment1 Subsegment(int offset)
		{
			return Subsegment(offset, Length - offset);
		}

		/// <summary>
		/// Retrieves a <see cref="StringSegment1"/> that represents a substring from this <see cref="StringSegment1"/>.
		/// The <see cref="StringSegment1"/> starts at the position specified by <paramref name="offset"/> and has the specified <paramref name="length"/>.
		/// </summary>
		/// <param name="offset">The zero-based starting character position of a substring in this <see cref="StringSegment1"/>.</param>
		/// <param name="length">The number of characters in the substring.</param>
		/// <returns>A <see cref="StringSegment1"/> that is equivalent to the substring of length <paramref name="length"/> that begins at <paramref name="offset"/> in this <see cref="StringSegment1"/></returns>
		public StringSegment1 Subsegment(int offset, int length)
		{
			if (!HasValue || offset < 0 || offset + length > Length || length < 0)
			{
				ThrowInvalidArguments(offset, length);
			}

			return new StringSegment1(Buffer, Offset + offset, length);
		}

		/// <summary>
		/// Gets the zero-based index of the first occurrence of the character <paramref name="c"/> in this <see cref="StringSegment1"/>.
		/// The search starts at <paramref name="start"/> and examines a specified number of <paramref name="count"/> character positions.
		/// </summary>
		/// <param name="c">The Unicode character to seek.</param>
		/// <param name="start">The zero-based index position at which the search starts. </param>
		/// <param name="count">The number of characters to examine.</param>
		/// <returns>The zero-based index position of <paramref name="c"/> from the beginning of the <see cref="StringSegment1"/> if that character is found, or -1 if it is not.</returns>
		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public int IndexOf(char c, int start, int count)
		{
			var offset = Offset + start;

			if (!HasValue || start < 0 || offset > Buffer.Length)
			{
				ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument.start);
			}

			if (count < 0)
			{
				ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument.count);
			}

			var index = Buffer.IndexOf(c, offset, count);
			if (index != -1)
			{
				index -= Offset;
			}

			return index;
		}

		/// <summary>
		/// Gets the zero-based index of the first occurrence of the character <paramref name="c"/> in this <see cref="StringSegment1"/>.
		/// The search starts at <paramref name="start"/>.
		/// </summary>
		/// <param name="c">The Unicode character to seek.</param>
		/// <param name="start">The zero-based index position at which the search starts. </param>
		/// <returns>The zero-based index position of <paramref name="c"/> from the beginning of the <see cref="StringSegment1"/> if that character is found, or -1 if it is not.</returns>
		public int IndexOf(char c, int start)
		{
			return IndexOf(c, start, Length - start);
		}

		/// <summary>
		/// Gets the zero-based index of the first occurrence of the character <paramref name="c"/> in this <see cref="StringSegment1"/>.
		/// </summary>
		/// <param name="c">The Unicode character to seek.</param>
		/// <returns>The zero-based index position of <paramref name="c"/> from the beginning of the <see cref="StringSegment1"/> if that character is found, or -1 if it is not.</returns>
		public int IndexOf(char c)
		{
			return IndexOf(c, 0, Length);
		}

		/// <summary>
		/// Reports the zero-based index of the first occurrence in this instance of any character in a specified array
		/// of Unicode characters. The search starts at a specified character position and examines a specified number
		/// of character positions.
		/// </summary>
		/// <param name="anyOf">A Unicode character array containing one or more characters to seek.</param>
		/// <param name="startIndex">The search starting position.</param>
		/// <param name="count">The number of character positions to examine.</param>
		/// <returns>The zero-based index position of the first occurrence in this instance where any character in anyOf
		/// was found; -1 if no character in anyOf was found.</returns>
		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public int IndexOfAny(char[] anyOf, int startIndex, int count)
		{
			var index = -1;

			if (HasValue)
			{
				if (startIndex < 0 || Offset + startIndex > Buffer.Length)
				{
					ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument.start);
				}

				if (count < 0 || Offset + startIndex + count > Buffer.Length)
				{
					ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument.count);
				}

				index = Buffer.IndexOfAny(anyOf, Offset + startIndex, count);
				if (index != -1)
				{
					index -= Offset;
				}
			}

			return index;
		}

		/// <summary>
		/// Reports the zero-based index of the first occurrence in this instance of any character in a specified array
		/// of Unicode characters. The search starts at a specified character position.
		/// </summary>
		/// <param name="anyOf">A Unicode character array containing one or more characters to seek.</param>
		/// <param name="startIndex">The search starting position.</param>
		/// <returns>The zero-based index position of the first occurrence in this instance where any character in anyOf
		/// was found; -1 if no character in anyOf was found.</returns>
		public int IndexOfAny(char[] anyOf, int startIndex)
		{
			return IndexOfAny(anyOf, startIndex, Length - startIndex);
		}

		/// <summary>
		/// Reports the zero-based index of the first occurrence in this instance of any character in a specified array
		/// of Unicode characters.
		/// </summary>
		/// <param name="anyOf">A Unicode character array containing one or more characters to seek.</param>
		/// <returns>The zero-based index position of the first occurrence in this instance where any character in anyOf
		/// was found; -1 if no character in anyOf was found.</returns>
		public int IndexOfAny(char[] anyOf)
		{
			return IndexOfAny(anyOf, 0, Length);
		}

		/// <summary>
		/// Reports the zero-based index position of the last occurrence of a specified Unicode character within this instance.
		/// </summary>
		/// <param name="value">The Unicode character to seek.</param>
		/// <returns>The zero-based index position of value if that character is found, or -1 if it is not.</returns>
		public int LastIndexOf(char value)
		{
			var index = -1;

			if (HasValue)
			{
				index = Buffer.LastIndexOf(value, Offset + Length - 1, Length);
				if (index != -1)
				{
					index -= Offset;
				}
			}

			return index;
		}

		/// <summary>
		/// Removes all leading and trailing whitespaces.
		/// </summary>
		/// <returns>The trimmed <see cref="StringSegment1"/>.</returns>
		public StringSegment1 Trim() => TrimStart().TrimEnd();

		/// <summary>
		/// Removes all leading whitespaces.
		/// </summary>
		/// <returns>The trimmed <see cref="StringSegment1"/>.</returns>
		public unsafe StringSegment1 TrimStart()
		{
			var trimmedStart = Offset;
			var length = Offset + Length;

			fixed (char* p = Buffer)
			{
				while (trimmedStart < length)
				{
					char c = p[trimmedStart];

					if (!char.IsWhiteSpace(c))
					{
						break;
					}

					trimmedStart++;
				}
			}

			return new StringSegment1(Buffer, trimmedStart, length - trimmedStart);
		}

		/// <summary>
		/// Removes all trailing whitespaces.
		/// </summary>
		/// <returns>The trimmed <see cref="StringSegment1"/>.</returns>
		public unsafe StringSegment1 TrimEnd()
		{
			var offset = Offset;
			var trimmedEnd = offset + Length - 1;

			fixed (char* p = Buffer)
			{
				while (trimmedEnd >= offset)
				{
					char c = p[trimmedEnd];

					if (!char.IsWhiteSpace(c))
					{
						break;
					}

					trimmedEnd--;
				}
			}

			return new StringSegment1(Buffer, offset, trimmedEnd - offset + 1);
		}

		/// <summary>
		/// Splits a string into StringSegments that are based on the characters in an array.
		/// </summary>
		/// <param name="chars">A character array that delimits the substrings in this string, an empty array that
		/// contains no delimiters, or null.</param>
		/// <returns>An <see cref="StringTokenizer"/> whose elements contain the StringSegmeents from this instance
		/// that are delimited by one or more characters in separator.</returns>
#if !BENCH
		public StringTokenizer Split(char[] chars)
		{
			return new StringTokenizer(this, chars);
		}
#endif

		/// <summary>
		/// Indicates whether the specified StringSegment is null or an Empty string.
		/// </summary>
		/// <param name="value">The StringSegment to test.</param>
		/// <returns></returns>
		public static bool IsNullOrEmpty(StringSegment1 value)
		{
			var res = false;

			if (!value.HasValue || value.Length == 0)
			{
				res = true;
			}

			return res;
		}

		/// <summary>
		/// Returns the <see cref="string"/> represented by this <see cref="StringSegment1"/> or <code>String.Empty</code> if the <see cref="StringSegment1"/> does not contain a value.
		/// </summary>
		/// <returns>The <see cref="string"/> represented by this <see cref="StringSegment1"/> or <code>String.Empty</code> if the <see cref="StringSegment1"/> does not contain a value.</returns>
		public override string ToString()
		{
			return Value ?? string.Empty;
		}
	}
}