#pragma once
//-----------------------------------------------------------------------------
template<typename T>
void swap(T& a, T& b)
{
    T c = a;
    a   = b;
    b   = c;
}
//-----------------------------------------------------------------------------
template<typename T>
void swap(T* a, T* b)
{
    T c = *a;
    *a  = *b;
    *b  = c;
}
