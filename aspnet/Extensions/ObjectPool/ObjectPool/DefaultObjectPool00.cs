// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Runtime.CompilerServices;
using System.Threading;

namespace Microsoft.Extensions.ObjectPool
{
	public class DefaultObjectPool00<T> : ObjectPool<T> where T : class
	{
		private readonly T[] _items;
		private readonly IPooledObjectPolicy<T> _policy;
		private readonly bool _isDefaultPolicy;
		private T _firstItem;

		public DefaultObjectPool00(IPooledObjectPolicy<T> policy)
			: this(policy, Environment.ProcessorCount * 2)
		{
		}

		public DefaultObjectPool00(IPooledObjectPolicy<T> policy, int maximumRetained)
		{
			_policy = policy ?? throw new ArgumentNullException(nameof(policy));
			_isDefaultPolicy = IsDefaultPolicy();

			// -1 due to _firstItem
			_items = new T[maximumRetained - 1];

			bool IsDefaultPolicy()
			{
				var type = policy.GetType();

				return type.IsGenericType && type.GetGenericTypeDefinition() == typeof(DefaultPooledObjectPolicy<>);
			}
		}

		public override T Get()
		{
			T item = _firstItem;

			if (item == null || Interlocked.CompareExchange(ref _firstItem, null, item) != item)
			{
				item = this.GetViaScan();
			}

			return item;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		private T GetViaScan()
		{
			T[] items = _items;
			T item = null;

			for (var i = 0; i < items.Length; i++)
			{
				item = items[i];

				if (item != null && Interlocked.CompareExchange(ref items[i], null, item) == item)
					break;
			}

			return item ?? _policy.Create();
		}

		public override void Return(T obj)
		{
			if (_isDefaultPolicy || _policy.Return(obj))
			{
				if (_firstItem != null || Interlocked.CompareExchange(ref _firstItem, obj, null) != null)
				{
					this.ReturnViaScan(obj);
				}
			}
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		private void ReturnViaScan(T obj)
		{
			int n = _items.Length;
			for (var i = 0; i < n && Interlocked.CompareExchange(ref _items[i], obj, null) != null; i++)
			{ }
		}
	}
}
