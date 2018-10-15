//#define VAR_A
//-----------------------------------------------------------------------------
#include "array_operations.h"
#include "swap.h"
#include <immintrin.h>
#include <cassert>
//-----------------------------------------------------------------------------
__forceinline
__m256i reverse(__m256i v)
{
    const __m256i idx = _mm256_setr_epi32(7, 6, 5, 4, 3, 2, 1, 0);
    return _mm256_permutevar8x32_epi32(v, idx);
}
//-----------------------------------------------------------------------------
__forceinline
__m256d reverse(__m256d v)
{
    return _mm256_permute4x64_pd(v, 0b00011011);
}
//-----------------------------------------------------------------------------
void reverse_simd(byte* arr, const size_t n)
{
    const int avxByteElements = 256 / 8 / sizeof(byte);
    const int sseByteElements = 128 / 8 / sizeof(byte);

    byte* start = arr;
    byte* end   = arr + n - 1;

    byte* avxEnd = end - avxByteElements + 1;
    while (start < avxEnd)
    {
        __m256i s = _mm256_load_si256(reinterpret_cast<__m256i*>(start));
        __m256i e = _mm256_load_si256(reinterpret_cast<__m256i*>(avxEnd));

        const __m256i idx = _mm256_setr_epi8(
            15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0,
            15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0);

        __m256i sRev = _mm256_shuffle_epi8(s, idx);
        __m256i eRev = _mm256_shuffle_epi8(e, idx);

        __m128i sRevHi = _mm256_extracti128_si256(sRev, 1);
        __m128i sRevLo = _mm256_castsi256_si128(sRev);

        __m128i eRevHi = _mm256_extracti128_si256(eRev, 1);
        __m128i eRevLo = _mm256_castsi256_si128(eRev);

        _mm_store_si128(reinterpret_cast<__m128i*>(start), eRevHi);
        _mm_store_si128(reinterpret_cast<__m128i*>(start + sseByteElements), eRevLo);

        _mm_store_si128(reinterpret_cast<__m128i*>(avxEnd), sRevHi);
        _mm_store_si128(reinterpret_cast<__m128i*>(avxEnd + sseByteElements), sRevLo);

        start  += avxByteElements;
        avxEnd -= avxByteElements;
    }
    end = avxEnd + avxByteElements - 1;

    while (start < end)
    {
        swap(start, end);

        start++;
        end--;
    }
}
//-----------------------------------------------------------------------------
void reverse_simd2(byte* arr, const size_t n)
{
    const int avxByteElements = 256 / 8 / sizeof(byte);
    const int sseByteElements = 128 / 8 / sizeof(byte);

    byte* start = arr;
    byte* end   = arr + n - 1;

    byte* avxEnd = end - avxByteElements + 1;
    while (start < avxEnd)
    {
        __m256i s = _mm256_load_si256(reinterpret_cast<__m256i*>(start));
        __m256i e = _mm256_load_si256(reinterpret_cast<__m256i*>(avxEnd));

        const __m256i idx = _mm256_setr_epi8(
            15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0,
            15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0);

        __m256i sRev = _mm256_shuffle_epi8(s, idx);
        __m256i eRev = _mm256_shuffle_epi8(e, idx);

        __m128i sRevHi = _mm256_extracti128_si256(sRev, 1);
        __m128i sRevLo = _mm256_castsi256_si128(sRev);

        __m128i eRevHi = _mm256_extracti128_si256(eRev, 1);
        __m128i eRevLo = _mm256_castsi256_si128(eRev);

        s = _mm256_castsi128_si256(eRevHi);
        s = _mm256_inserti128_si256(s, eRevLo, 1);

        e = _mm256_castsi128_si256(sRevHi);
        e = _mm256_inserti128_si256(e, sRevLo, 1);

        _mm256_store_si256(reinterpret_cast<__m256i*>(start), s);
        _mm256_store_si256(reinterpret_cast<__m256i*>(avxEnd), e);

        start  += avxByteElements;
        avxEnd -= avxByteElements;
    }
    end = avxEnd + avxByteElements - 1;

    while (start < end)
    {
        swap(start, end);

        start++;
        end--;
    }
}
//-----------------------------------------------------------------------------
void reverse_simd(int* arr, const size_t n)
{
    const int avxIntElements = 256 / 8 / sizeof(int);

#ifdef VAR_A
    size_t i = 0;
    size_t end = n / 2 & ~(avxIntElements - 1);

    for (; i < end; i += avxIntElements)
    {
        int* start = arr + i;
        int* end = arr + n - i - avxIntElements;

        __m256i s = _mm256_load_si256(reinterpret_cast<__m256i*>(start));
        __m256i e = _mm256_load_si256(reinterpret_cast<__m256i*>(end));

        __m256i sRev = reverse(s);
        __m256i eRev = reverse(e);

        _mm256_store_si256(reinterpret_cast<__m256i*>(end), sRev);
        _mm256_store_si256(reinterpret_cast<__m256i*>(start), eRev);
    }

    for (; i < n / 2; ++i)
        swap(arr[i], arr[n - 1 - i]);
#else
    int* start = arr;
    int* end   = arr + n - 1;

    int* avxEnd = end - avxIntElements + 1;
    while (start < avxEnd)
    {
        __m256i s = _mm256_load_si256(reinterpret_cast<__m256i*>(start));
        __m256i e = _mm256_load_si256(reinterpret_cast<__m256i*>(avxEnd));

        __m256i sRev = reverse(s);
        __m256i eRev = reverse(e);

        _mm256_store_si256(reinterpret_cast<__m256i*>(avxEnd), sRev);
        _mm256_store_si256(reinterpret_cast<__m256i*>(start), eRev);

        start  += avxIntElements;
        avxEnd -= avxIntElements;
    }
    end = avxEnd + avxIntElements - 1;

    while (start < end)
    {
        swap(start, end);

        start++;
        end--;
    }
#endif
}
//-----------------------------------------------------------------------------
void reverse_simd2(int* arr, const size_t n)
{
    const int avxIntElements = 256 / 8 / sizeof(int);
    const int sseIntElements = 128 / 8 / sizeof(int);

    int* start = arr;
    int* end   = arr + n - 1;

    int* avxEnd = end - avxIntElements + 1;
    while (start < avxEnd)
    {
        __m256i s = _mm256_load_si256(reinterpret_cast<__m256i*>(start));
        __m256i e = _mm256_load_si256(reinterpret_cast<__m256i*>(avxEnd));

        __m256i sRev = _mm256_shuffle_epi32(s, 0x1B);
        __m256i eRev = _mm256_shuffle_epi32(e, 0x1B);

        __m128i sRevHi = _mm256_extracti128_si256(sRev, 1);
        __m128i sRevLo = _mm256_castsi256_si128(sRev);

        __m128i eRevHi = _mm256_extracti128_si256(eRev, 1);
        __m128i eRevLo = _mm256_castsi256_si128(eRev);

        _mm_store_si128(reinterpret_cast<__m128i*>(start), eRevHi);
        _mm_store_si128(reinterpret_cast<__m128i*>(start + sseIntElements), eRevLo);

        _mm_store_si128(reinterpret_cast<__m128i*>(avxEnd), sRevHi);
        _mm_store_si128(reinterpret_cast<__m128i*>(avxEnd + sseIntElements), sRevLo);

        start  += avxIntElements;
        avxEnd -= avxIntElements;
    }
    end = avxEnd + avxIntElements - 1;

    while (start < end)
    {
        swap(start, end);

        start++;
        end--;
    }
}
//-----------------------------------------------------------------------------
void reverse_simd(double* arr, const size_t n)
{
    const int avxDoubleElements = 256 / 8 / sizeof(double);

    double* start = arr;
    double* end   = arr + n - 1;

    double* avxEnd = end - avxDoubleElements + 1;
    while (start < avxEnd)
    {
        __m256d s = _mm256_load_pd(start);
        __m256d e = _mm256_load_pd(avxEnd);

        __m256d sRev = reverse(s);
        __m256d eRev = reverse(e);

        _mm256_store_pd(avxEnd, sRev);
        _mm256_store_pd(start, eRev);

        start  += avxDoubleElements;
        avxEnd -= avxDoubleElements;
    }
    end = avxEnd + avxDoubleElements - 1;

    while (start < end)
    {
        swap(start, end);

        start++;
        end--;
    }
}
//-----------------------------------------------------------------------------
void reverse_simd2(double* arr, const size_t n)
{
    const int avxDoubleElements = 256 / 8 / sizeof(double);
    const int sseDoubleElements = 128 / 8 / sizeof(double);

    double* start = arr;
    double* end   = arr + n - 1;

    double* avxEnd = end - avxDoubleElements + 1;
    while (start < avxEnd)
    {
        __m256d s = _mm256_load_pd(start);
        __m256d e = _mm256_load_pd(avxEnd);

        __m256d sRev = _mm256_permute_pd(s, 0x5);
        __m256d eRev = _mm256_permute_pd(e, 0x5);

        __m128d sRevHi = _mm256_extractf128_pd(sRev, 1);
        __m128d sRevLo = _mm256_castpd256_pd128(sRev);

        __m128d eRevHi = _mm256_extractf128_pd(eRev, 1);
        __m128d eRevLo = _mm256_castpd256_pd128(eRev);

        _mm_store_pd(start, eRevHi);
        _mm_store_pd(start + sseDoubleElements, eRevLo);

        _mm_store_pd(avxEnd, sRevHi);
        _mm_store_pd(avxEnd + sseDoubleElements, sRevLo);

        start  += avxDoubleElements;
        avxEnd -= avxDoubleElements;
    }
    end = avxEnd + avxDoubleElements - 1;

    while (start < end)
    {
        swap(start, end);

        start++;
        end--;
    }
}
