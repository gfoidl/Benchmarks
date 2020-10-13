#pragma once
//-----------------------------------------------------------------------------
#ifdef __cplusplus
extern "C"
{
#endif
	int    add_i  (const int a      , const int b);
	double add_d  (const double a   , const double b);
	double vec_sum(const double* vec, const int n);
	void   empty  ();
#ifdef __cplusplus
}
#endif
