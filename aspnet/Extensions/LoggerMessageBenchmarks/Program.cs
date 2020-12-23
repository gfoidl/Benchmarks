using System;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using Microsoft.Extensions.Logging;

#if !DEBUG
using BenchmarkDotNet.Running;
#endif

Bench bench = new();
bench.LogInfoDefault();
bench.LogInfoDefined();

#if !DEBUG
BenchmarkRunner.Run<Bench>();
#endif
//-----------------------------------------------------------------------------
[MemoryDiagnoser]
[GroupBenchmarksBy(BenchmarkLogicalGroupRule.ByCategory)]
public class Bench
{
    private readonly ILogger _logger;
    //-------------------------------------------------------------------------
    public Bench()
    {
        ILoggerFactory loggerFactory = LoggerFactory.Create(builder =>
        {
            builder.ClearProviders();
            builder.AddProvider(new NopLoggerProvider());
        });

        _logger = loggerFactory.CreateLogger("foo");
    }
    //-------------------------------------------------------------------------
    [Benchmark(Baseline = true)]
    [BenchmarkCategory("LogInfo")]
    public void LogInfoDefault() => _logger.LogInformation("string: {string}, int: {int}, DateTime: {DateTime}", "abc", 42, new DateTime(2020, 12, 23));
    //-------------------------------------------------------------------------
    [Benchmark]
    [BenchmarkCategory("LogInfo")]
    public void LogInfoDefined() => _logger.DummyInfo("abc", 42, new DateTime(2020, 12, 23));
    //---------------------------------------------------------------------
    [Benchmark(Baseline = true)]
    [BenchmarkCategory("Scope")]
    public IDisposable CreateScopeDefault() => _logger.BeginScope("scope at {now}", new DateTime(2020, 12, 23));
    //---------------------------------------------------------------------
    [Benchmark]
    [BenchmarkCategory("Scope")]
    public IDisposable CreateScopeDefined() => _logger.DummyScope(new DateTime(2020, 12, 23));
}
//-----------------------------------------------------------------------------
public static class LoggerMessages
{
    private static readonly Action<ILogger, string, int, DateTime, Exception> s_dummyInfo
        = LoggerMessage.Define<string, int, DateTime>(
            LogLevel.Information,
            0,
            "string: {string}, int: {int}, DateTime: {DateTime}");

    public static void DummyInfo(this ILogger logger, string arg0, int arg1, DateTime arg2)
        => s_dummyInfo(logger, arg0, arg1, arg2, null);
    //---------------------------------------------------------------------
    private static readonly Func<ILogger, DateTime, IDisposable> s_dummyScope
        = LoggerMessage.DefineScope<DateTime>("scope at {now}");

    public static IDisposable DummyScope(this ILogger logger, DateTime arg)
        => s_dummyScope(logger, arg);
}
//-----------------------------------------------------------------------------
public class NopLoggerProvider : ILoggerProvider
{
    public ILogger CreateLogger(string categoryName) => new NopLogger();
    public void Dispose() { }
}
//-----------------------------------------------------------------------------
public class NopLogger : ILogger
{
    private static readonly IDisposable s_cachedDisposable = new DummyDisposable();
    private string _msg;
    //-------------------------------------------------------------------------
    public IDisposable BeginScope<TState>(TState state) => s_cachedDisposable;
    public bool IsEnabled(LogLevel logLevel) => true;
    public void Log<TState>(LogLevel logLevel, EventId eventId, TState state, Exception exception, Func<TState, Exception, string> formatter)
    {
        //_msg = formatter(state, exception);

#if DEBUG
        Console.WriteLine(_msg);
#endif
    }
    //-------------------------------------------------------------------------
    private class DummyDisposable : IDisposable
    {
        public void Dispose() { }
    }
}
