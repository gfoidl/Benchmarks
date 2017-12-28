// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Collections.Generic;
using System.Linq;
using Xunit;

namespace System.Collections.Tests
{
    /// <summary>
    /// Contains tests that ensure the correctness of the Stack0 class.
    /// </summary>
    public abstract partial class Stack_Generic_Tests<T> : IGenericSharedAPI_Tests<T>
    {
        #region Stack0<T> Helper Methods

        #region IGenericSharedAPI<T> Helper Methods

        protected Stack1<T> GenericStackFactory()
        {
            return new Stack1<T>();
        }

        protected Stack1<T> GenericStackFactory(int count)
        {
            Stack1<T> stack = new Stack1<T>(count);
            int seed = count * 34;
            for (int i = 0; i < count; i++)
                stack.Push(CreateT(seed++));
            return stack;
        }

        protected override Type IGenericSharedAPI_CopyTo_IndexLargerThanArrayCount_ThrowType => typeof(ArgumentOutOfRangeException);

        #endregion

        protected override IEnumerable<T> GenericIEnumerableFactory()
        {
            return GenericStackFactory();
        }

        protected override IEnumerable<T> GenericIEnumerableFactory(int count)
        {
            return GenericStackFactory(count);
        }

        protected override int Count(IEnumerable<T> enumerable) => ((Stack1<T>)enumerable).Count;
        protected override void Add(IEnumerable<T> enumerable, T value) => ((Stack1<T>)enumerable).Push(value);
        protected override void Clear(IEnumerable<T> enumerable) => ((Stack1<T>)enumerable).Clear();
        protected override bool Contains(IEnumerable<T> enumerable, T value) => ((Stack1<T>)enumerable).Contains(value);
        protected override void CopyTo(IEnumerable<T> enumerable, T[] array, int index) => ((Stack1<T>)enumerable).CopyTo(array, index);
        protected override bool Remove(IEnumerable<T> enumerable) { ((Stack1<T>)enumerable).Pop(); return true; }
        protected override bool Enumerator_Current_UndefinedOperation_Throws => true;

        #endregion

        #region Constructor

        [Fact]
        public void Stack_Generic_Constructor_InitialValues()
        {
            var stack = new Stack1<T>();
            Assert.Equal(0, stack.Count);
            Assert.Equal(0, stack.ToArray().Length);
            Assert.NotNull(((ICollection)stack).SyncRoot);
        }

        #endregion

        #region Constructor_IEnumerable

        //[Theory]
        //[MemberData(nameof(EnumerableTestData))]
        //public void Stack_Generic_Constructor_IEnumerable(EnumerableType enumerableType, int setLength, int enumerableLength, int numberOfMatchingElements, int numberOfDuplicateElements)
        //{
        //    IEnumerable<T> enumerable = CreateEnumerable(enumerableType, null, enumerableLength, 0, numberOfDuplicateElements);
        //    Stack0<T> stack = new Stack0<T>(enumerable);
        //    Assert.Equal(enumerable.ToArray().Reverse(), stack.ToArray());
        //}

        //[Fact]
        //public void Stack_Generic_Constructor_IEnumerable_Null_ThrowsArgumentNullException()
        //{
        //    AssertExtensions.Throws<ArgumentNullException>("collection", () => new Stack0<T>(null));
        //}

		#endregion

		#region Constructor_Capacity

		[Theory]
		[MemberData(nameof(ValidCollectionSizes))]
		public void Stack_Generic_Constructor_int(int count)
        {
            Stack1<T> stack = new Stack1<T>(count);
            Assert.Equal(Array.Empty<T>(), stack.ToArray());
        }

        [Fact]
        public void Stack_Generic_Constructor_int_Negative_ThrowsArgumentOutOfRangeException()
        {
            AssertExtensions.Throws<ArgumentOutOfRangeException>("capacity", () => new Stack1<T>(-1));
            AssertExtensions.Throws<ArgumentOutOfRangeException>("capacity", () => new Stack1<T>(int.MinValue));
        }

        #endregion

        #region Pop

        [Theory]
        [MemberData(nameof(ValidCollectionSizes))]
        public void Stack_Generic_Pop_AllElements(int count)
        {
            Stack1<T> stack = GenericStackFactory(count);
            List<T> elements = stack.ToList();
            foreach (T element in elements)
                Assert.Equal(element, stack.Pop());
        }

        [Fact]
        public void Stack_Generic_Pop_OnEmptyStack_ThrowsInvalidOperationException()
        {
            Assert.Throws<InvalidOperationException>(() => new Stack1<T>().Pop());
        }

        #endregion

      

        #region Peek

        [Theory]
        [MemberData(nameof(ValidCollectionSizes))]
        public void Stack_Generic_Peek_AllElements(int count)
        {
            Stack1<T> stack = GenericStackFactory(count);
            List<T> elements = stack.ToList();
            foreach (T element in elements)
            {
                Assert.Equal(element, stack.Peek());
                stack.Pop();
            }
        }

        [Fact]
        public void Stack_Generic_Peek_OnEmptyStack_ThrowsInvalidOperationException()
        {
            Assert.Throws<InvalidOperationException>(() => new Stack1<T>().Peek());
        }

        #endregion

      
    }
}
