using System;
using System.Linq.Expressions;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.CompilerServices;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

namespace CallTimes
{
    class Program
    {
        static void Main()
        {
            var benchmarks = new Benchmarks();
            benchmarks.Direct();
            benchmarks.Interface();
            benchmarks.Abstract();
            benchmarks.AbstractSealed();
            benchmarks.Delegate();
            benchmarks.Expression();
            benchmarks.IlGenSimple();
            benchmarks.IlGen();
#if !DEBUG
            BenchmarkRunner.Run<Benchmarks>();
#endif
        }
    }
    //-------------------------------------------------------------------------
    public class Benchmarks
    {
        private readonly Foo    _direct         = new Foo();
        private readonly IFoo   _interface      = new Foo();
        private readonly Base   _abstract       = new Foo();
        private readonly Base   _abstractSealed = new FooSealed();
        private readonly Action _action;
        private readonly Action _expression;
        private readonly Action _ilGenSimple;
        private readonly Action _ilGen;
        //---------------------------------------------------------------------
        public Benchmarks()
        {
            _action      = _direct.Do;
            _expression  = CompileExpression();
            _ilGenSimple = CompileILSimple(this);
            _ilGen       = CompileIL(this);
            //-----------------------------------------------------------------
            Action CompileExpression()
            {
                Expression<Action> expression = () => _direct.Do();
                return expression.Compile();
            }
            //-----------------------------------------------------------------
            Action CompileILSimple(object owner)
            {
                Type ownerType        = typeof(Benchmarks);
                FieldInfo directField = ownerType.GetField(nameof(_direct), BindingFlags.NonPublic | BindingFlags.Instance);
                Type target           = typeof(Foo);
                MethodInfo doMethod   = target.GetMethod(nameof(Foo.Do));
                var dm                = new DynamicMethod("_Do_", typeof(void), new[] { ownerType });
                ILGenerator ilGen     = dm.GetILGenerator();

                ilGen.Emit(OpCodes.Ldarg_0);
                ilGen.Emit(OpCodes.Ldfld, directField);
                ilGen.Emit(OpCodes.Call, doMethod);
                ilGen.Emit(OpCodes.Ret);

                return dm.CreateDelegate(typeof(Action), owner) as Action;
            }
            //-----------------------------------------------------------------
            Action CompileIL(object owner)
            {
                Type ownerType        = typeof(Benchmarks);
                FieldInfo directField = ownerType.GetField(nameof(_direct), BindingFlags.NonPublic | BindingFlags.Instance);
                Type target           = typeof(Foo);
                MethodInfo doMethod   = target.GetMethod(nameof(Foo.Do));
                var dm                = new DynamicMethod("_Do_", typeof(void), new[] { ownerType }, ownerType);
                ILGenerator ilGen     = dm.GetILGenerator();

                ilGen.Emit(OpCodes.Ldarg_0);
                ilGen.Emit(OpCodes.Ldfld, directField);
                ilGen.Emit(OpCodes.Call, doMethod);
                ilGen.Emit(OpCodes.Ret);

                return dm.CreateDelegate(typeof(Action), owner) as Action;
            }
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void Direct() => _direct.Do();
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void Interface() => _interface.Do();
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void Abstract() => _abstract.Do();
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void AbstractSealed() => _abstractSealed.Do();
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void Delegate() => _action();
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void Expression() => _expression();
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void IlGenSimple() => _ilGenSimple();
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void IlGen() => _ilGen();
    }
    //-------------------------------------------------------------------------
    public interface IFoo
    {
        void Do();
    }
    //---------------------------------------------------------------------
    public abstract class Base : IFoo
    {
        public abstract void Do();
    }
    //---------------------------------------------------------------------
    public class Foo : Base
    {
        public override void Do() { }
    }
    //---------------------------------------------------------------------
    public sealed class FooSealed : Base
    {
        public override void Do() { }
    }
}
