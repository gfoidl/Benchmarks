#pragma once
//-----------------------------------------------------------------------------
#include "dll.h"
//-----------------------------------------------------------------------------
DLL_API int add_i(const int a, const int b);
DLL_API double add_d(const double a, const double b);
DLL_API double vec_sum(const double* vec, const int n);
DLL_API void empty();
