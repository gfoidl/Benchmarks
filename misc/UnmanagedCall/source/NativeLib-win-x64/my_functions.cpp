#include "my_functions.h"
//-----------------------------------------------------------------------------
int add_i(const int a, const int b)
{
	return a + b;
}
//-----------------------------------------------------------------------------
double add_d(const double a, const double b)
{
	return a + b;
}
//-----------------------------------------------------------------------------
double vec_sum(const double* vec, const int n)
{
	double sum = 0;

	for (int i = 0; i < n; ++i)
		sum += vec[i];

	return sum;
}
//-----------------------------------------------------------------------------
void empty() {}
