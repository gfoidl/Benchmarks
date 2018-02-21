// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Diagnostics;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.CompilerServices;
using System.Threading;

namespace Microsoft.Extensions.ObjectPool
{
	public class DefaultObjectPool4<T> : ObjectPool<T> where T : class
	{
		private readonly ObjectWrapper[] _items;
		private readonly IPooledObjectPolicy<T> _policy;
		private readonly bool _isDefaultPolicy;
		private T _firstItem;
		private Func<T> _create;
		private Func<T, bool> _return;

		public DefaultObjectPool4(IPooledObjectPolicy<T> policy)
			: this(policy, Environment.ProcessorCount * 2)
		{
		}

		public DefaultObjectPool4(IPooledObjectPolicy<T> policy, int maximumRetained)
		{
			_policy = policy ?? throw new ArgumentNullException(nameof(policy));
			_isDefaultPolicy = IsDefaultPolicy();
			_create = CompileCreate(this);
			_return = CompileReturn(this);

			// -1 due to _firstItem
			_items = new ObjectWrapper[maximumRetained - 1];

			bool IsDefaultPolicy()
			{
				var type = policy.GetType();

				return type.IsGenericType && type.GetGenericTypeDefinition() == typeof(DefaultPooledObjectPolicy<>);
			}

			Func<T> CompileCreate(object owner)
			{
				Type ownerType = typeof(DefaultObjectPool4<T>);
				FieldInfo policyField = ownerType.GetField(nameof(_policy), BindingFlags.NonPublic | BindingFlags.Instance);
				Type target = policy.GetType();
				MethodInfo createMethod = target.GetMethod(nameof(IPooledObjectPolicy<T>.Create));
				DynamicMethod dm = new DynamicMethod("_Create_", typeof(T), new[] { ownerType }, ownerType);
				ILGenerator ilGen = dm.GetILGenerator();

				ilGen.Emit(OpCodes.Ldarg_0);
				ilGen.Emit(OpCodes.Ldfld, policyField);
				ilGen.Emit(OpCodes.Call, createMethod);
				ilGen.Emit(OpCodes.Ret);

				return dm.CreateDelegate(typeof(Func<T>), owner) as Func<T>;
			}

			Func<T, bool> CompileReturn(object owner)
			{
				Type ownerType = typeof(DefaultObjectPool4<T>);
				FieldInfo policyField = ownerType.GetField(nameof(_policy), BindingFlags.NonPublic | BindingFlags.Instance);
				Type target = policy.GetType();
				MethodInfo returnMethod = target.GetMethod(nameof(IPooledObjectPolicy<T>.Return));
				DynamicMethod dm = new DynamicMethod("_Return_", typeof(bool), new[] { ownerType, typeof(T) }, ownerType);
				ILGenerator ilGen = dm.GetILGenerator();

				ilGen.Emit(OpCodes.Ldarg_0);
				ilGen.Emit(OpCodes.Ldfld, policyField);
				ilGen.Emit(OpCodes.Ldarg_1);
				ilGen.Emit(OpCodes.Call, returnMethod);
				ilGen.Emit(OpCodes.Ret);

				return dm.CreateDelegate(typeof(Func<T, bool>), owner) as Func<T, bool>;
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
			ObjectWrapper[] items = _items;
			T item = null;

			for (int i = 0; i < items.Length; ++i)
			{
				item = items[i];

				if (item != null && Interlocked.CompareExchange(ref items[i].Element, null, item) == item)
					break;
			}

			return item ?? _create();
		}

		public override void Return(T obj)
		{
			if (_isDefaultPolicy || _return(obj))
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
			ObjectWrapper[] items = _items;

			for (int i = 0; i < items.Length && Interlocked.CompareExchange(ref items[i].Element, obj, null) != null; ++i)
			{ }
		}

		[DebuggerDisplay("{Element}")]
		private struct ObjectWrapper
		{
			public T Element;

			public ObjectWrapper(T item) => Element = item;

			public static implicit operator ObjectWrapper(T item) => new ObjectWrapper(item);
			public static implicit operator T(ObjectWrapper wrapper) => wrapper.Element;
		}
	}
}
