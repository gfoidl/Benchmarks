// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

namespace System.Linq0
{
    internal static class Error
    {
        internal static Exception ArgumentNull(string s) => new ArgumentNullException(s);

        internal static Exception ArgumentOutOfRange(string s) => new ArgumentOutOfRangeException(s);

        internal static Exception MoreThanOneElement() => new InvalidOperationException();

        internal static Exception MoreThanOneMatch() => new InvalidOperationException();

        internal static Exception NoElements() => new InvalidOperationException();

        internal static Exception NoMatch() => new InvalidOperationException();

        internal static Exception NotSupported() => new NotSupportedException();
    }
}
