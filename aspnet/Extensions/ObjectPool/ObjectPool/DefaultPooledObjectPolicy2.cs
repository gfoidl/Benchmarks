// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

namespace Microsoft.Extensions.ObjectPool
{
	public sealed class DefaultPooledObjectPolicy2<T> : PooledObjectPolicy<T> where T : class, new()
	{
		public override T Create()
		{
			return new T();
		}

		public override bool Return(T obj)
		{
			return true;
		}
	}
}
