// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Collections.Generic;
using System.Diagnostics;
using System.Linq0;
using static System.Linq0.Enumerable0;

namespace System.Linq1
{
    public static partial class Enumerable1
    {
        public static IEnumerable<TResult> Select<TSource, TResult>(
            this IEnumerable<TSource> source, Func<TSource, TResult> selector)
        {
            if (source == null)
            {
                throw Error.ArgumentNull(nameof(source));
            }

            if (selector == null)
            {
                throw Error.ArgumentNull(nameof(selector));
            }

            return new SelectEnumerableIterator<TSource, TResult>(source, selector);
        }

		/// <summary>
		/// An iterator that maps each item of an <see cref="IEnumerable{TSource}"/>.
		/// </summary>
		/// <typeparam name="TSource">The type of the source enumerable.</typeparam>
		/// <typeparam name="TResult">The type of the mapped items.</typeparam>
		internal sealed class SelectEnumerableIterator<TSource, TResult> : Iterator<TResult>
        {
            private readonly IEnumerable<TSource> _source;
            private readonly Func<TSource, TResult> _selector;
            private IEnumerator<TSource> _enumerator;

            public SelectEnumerableIterator(IEnumerable<TSource> source, Func<TSource, TResult> selector)
            {
                Debug.Assert(source != null);
                Debug.Assert(selector != null);
                _source = source;
                _selector = selector;
            }

            public override Iterator<TResult> Clone() =>
                new SelectEnumerableIterator<TSource, TResult>(_source, _selector);

            public override void Dispose()
            {
                if (_enumerator != null)
                {
                    _enumerator.Dispose();
                    _enumerator = null;
                }

                base.Dispose();
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
                        if (_enumerator.MoveNext())
                        {
                            _current = _selector(_enumerator.Current);
                            return true;
                        }

                        Dispose();
                        break;
                }

                return false;
            }

           public TResult[] ToArray()
            {
                var builder = new LargeArrayBuilder1<TResult>(initialize: true);
                
                foreach (TSource item in _source)
                {
                    builder.Add(_selector(item));
                }

                return builder.ToArray();
            }

            public List<TResult> ToList()
            {
                var list = new List<TResult>();

                foreach (TSource item in _source)
                {
                    list.Add(_selector(item));
                }

                return list;
            }

            public int GetCount(bool onlyIfCheap)
            {
                // In case someone uses Count() to force evaluation of
                // the selector, run it provided `onlyIfCheap` is false.

                if (onlyIfCheap)
                {
                    return -1;
                }

                int count = 0;

                foreach (TSource item in _source)
                {
                    _selector(item);
                    checked
                    {
                        count++;
                    }
                }

                return count;
            }
        }
    }
}
