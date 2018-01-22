// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Collections.Generic;
using System.Diagnostics;

namespace System.Linq0
{
	public static partial class Enumerable0
	{
		public static IEnumerable<TSource> Where<TSource>(this IEnumerable<TSource> source, Func<TSource, bool> predicate)
		{
			if (source == null)
			{
				throw Error.ArgumentNull(nameof(source));
			}

			if (predicate == null)
			{
				throw Error.ArgumentNull(nameof(predicate));
			}

			return new WhereEnumerableIterator<TSource>(source, predicate);
		}

		/// <summary>
		/// An iterator that filters each item of an <see cref="IEnumerable{TSource}"/>.
		/// </summary>
		/// <typeparam name="TSource">The type of the source enumerable.</typeparam>
		internal sealed class WhereEnumerableIterator<TSource> : Iterator<TSource>
		{
			private readonly IEnumerable<TSource> _source;
			private readonly Func<TSource, bool> _predicate;
			private IEnumerator<TSource> _enumerator;

			public WhereEnumerableIterator(IEnumerable<TSource> source, Func<TSource, bool> predicate)
			{
				Debug.Assert(source != null);
				Debug.Assert(predicate != null);
				_source = source;
				_predicate = predicate;
			}

			public override Iterator<TSource> Clone() => new WhereEnumerableIterator<TSource>(_source, _predicate);

			public override void Dispose()
			{
				if (_enumerator != null)
				{
					_enumerator.Dispose();
					_enumerator = null;
				}

				base.Dispose();
			}

			public int GetCount(bool onlyIfCheap)
			{
				if (onlyIfCheap)
				{
					return -1;
				}

				int count = 0;

				foreach (TSource item in _source)
				{
					if (_predicate(item))
					{
						checked
						{
							count++;
						}
					}
				}

				return count;
			}

			public override bool MoveNext()
			{
				switch (_state)
				{
					case 1:
						_enumerator = _source.GetEnumerator();
						_state = 2;
						goto case 2;
					case 2:
						while (_enumerator.MoveNext())
						{
							TSource item = _enumerator.Current;
							if (_predicate(item))
							{
								_current = item;
								return true;
							}
						}

						Dispose();
						break;
				}

				return false;
			}

			public TSource[] ToArray()
			{
				var builder = new LargeArrayBuilder0<TSource>(initialize: true);

				foreach (TSource item in _source)
				{
					if (_predicate(item))
					{
						builder.Add(item);
					}
				}

				return builder.ToArray();
			}

			public List<TSource> ToList()
			{
				var list = new List<TSource>();

				foreach (TSource item in _source)
				{
					if (_predicate(item))
					{
						list.Add(item);
					}
				}

				return list;
			}
		}
	}
}
