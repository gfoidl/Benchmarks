#pragma once
//-----------------------------------------------------------------------------
//#define VAR_A
//#define VAR_B
//-----------------------------------------------------------------------------
#include <cassert>
#include "swap.h"
//-----------------------------------------------------------------------------
using byte = unsigned char;
//-----------------------------------------------------------------------------
template<typename T>
void validate(const T* arr, const size_t n, const bool ascending);

template<typename T>
void reverse(T* arr, const size_t n);

void reverse_simd(byte* arr, const size_t n);
void reverse_simd2(byte* arr, const size_t n);

void reverse_simd(int* arr, const size_t n);
void reverse_simd2(int* arr, const size_t n);

void reverse_simd(double* arr, const size_t n);
void reverse_simd2(double* arr, const size_t n);
//-----------------------------------------------------------------------------
template<typename T>
void validate(const T* arr, const size_t n, const bool ascending)
{
    for (size_t i = 1; i < n; ++i)
    {
        if (ascending)
            assert(arr[i - 1] < arr[i]);
        else
            assert(arr[i - 1] > arr[i]);
    }
}
//-----------------------------------------------------------------------------
template<typename T>
void reverse(T* arr, const size_t n)
{
#ifdef VAR_A
    for (size_t i = 0; i < n / 2; ++i)
        swap(arr[i], arr[n - 1 - i]);
#elif defined(VAR_B)
    for (size_t i = 0; i < n / 2; ++i)
        swap(arr + i, arr + n - 1 - i);
#else
    T* end = arr + n - 1;

    while (arr < end)
    {
        swap(arr, end);

        arr++;
        end--;
    }
#endif
}
