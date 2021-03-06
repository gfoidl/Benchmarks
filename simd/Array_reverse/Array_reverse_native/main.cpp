#define BENCH
//-----------------------------------------------------------------------------
#include <iostream>
#include <vector>
#include "array_operations.h"
#include <chrono>
//-----------------------------------------------------------------------------
using std::vector;
using std::cout;
using std::cerr;
using std::endl;
//-----------------------------------------------------------------------------
template<typename T>
void print(const T* arr, size_t n)
{
† for (size_t i = 0; i < n; ++i)
† † cout << static_cast<int>(arr[i]) << " ";

† cout << endl;
}
//-----------------------------------------------------------------------------
template<typename T>
void run(const size_t n)
{
† vector<T> arr;

† for (size_t i = 0; i < n; ++i)
† † arr.push_back(static_cast<T>(i));

† print(arr.data(), arr.size());
† validate(arr.data(), arr.size(), true);

† //reverse(arr.data(), arr.size());
† reverse_simd(arr.data(), arr.size());
† print(arr.data(), arr.size());
† validate(arr.data(), arr.size(), false);

† reverse_simd2(arr.data(), arr.size());
† print(arr.data(), arr.size());
† validate(arr.data(), arr.size(), true);

† cout << endl;
}
//-----------------------------------------------------------------------------
template<typename T>
void bench(const size_t n)
{
† const int benchIterations = 101;

† cout << "bench for " << typeid(T).name() << endl;

† using Clock = std::chrono::steady_clock;
† using std::chrono::time_point;
† using std::chrono::duration_cast;
† using std::chrono::nanoseconds;
† using namespace std::literals::chrono_literals;

† T* arr = new T[n];

† for (size_t i = 0; i < n; ++i)
† † arr[i] = static_cast<T>(i);

† time_point<Clock> start = Clock::now();
† for (int i = 0; i < benchIterations; ++i)
† {
† † reverse(arr, n);

#ifdef _DEBUG
† † validate(arr, n, i % 2 != 0);
#endif
† }
† time_point<Clock> end = Clock::now();
† nanoseconds diffSequential = duration_cast<nanoseconds>(end - start);
† cout << "sequential:      " << diffSequential.count() * 1e-3 / benchIterations << " ms" << endl;

† start = Clock::now();
† for (int i = 0; i < benchIterations; ++i)
† {
† † reverse_simd(arr, n);

#ifdef _DEBUG
† † validate(arr, n, i % 2 == 0);
#endif
† }
† end = Clock::now();
† nanoseconds diffSimd = duration_cast<nanoseconds>(end - start);
† cout << "simd:            " << diffSimd.count() * 1e-3 / benchIterations << " ms" << endl;

† start = Clock::now();
† for (int i = 0; i < benchIterations; ++i)
† {
† † reverse_simd2(arr, n);

#ifdef _DEBUG
† † validate(arr, n, i % 2 != 0);
#endif
† }
† end = Clock::now();
† nanoseconds diffSimd2 = duration_cast<nanoseconds>(end - start);
† cout << "simd2:           " << diffSimd2.count() * 1e-3 / benchIterations << " ms" << endl;

† cout << "speedup (simd):  " << (double)diffSequential.count() / diffSimd.count() << endl;
† cout << "speedup (simd2): " << (double)diffSequential.count() / diffSimd2.count() << endl;

† delete[] arr;

† cout << endl;
}
//-----------------------------------------------------------------------------
int main()
{
† run<byte>(64);
† run<int>(18);
† run<double>(18);

#ifdef BENCH

#ifdef _DEBUG
† const size_t N = 16;
#else
† const size_t N = 500000;
#endif

† bench<byte>(N);
† bench<int>(N);
† bench<double>(N);
#endif
}
