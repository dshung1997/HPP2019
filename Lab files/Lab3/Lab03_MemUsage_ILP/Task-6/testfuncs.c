#include "testfuncs.h"

void f_std(const double * __restrict a, 
	   const double * __restrict b, 
	   double * __restrict c, int N) {
  int i;
  int counter = 0;
  double x = 0;
  for(i = 0; i < N; i++) {
    if(counter == 4) {
      x += 0.1;
      counter = 0;
    }
    c[i] = a[i]*a[i] + b[i] + x;
    counter++;
  }
}

void f_opt(const double * __restrict a, 
	   const double * __restrict b, 
	   double * __restrict c, int N) {
  int i;
  // int counter = 0;
  double x = 0;

  int N_max = (N >> 2) << 2;
  // int N_max = 4 * (N / 4);

  for(i = 0; i < N_max; i+=4) {

  c[i] = a[i]*a[i] + b[i] + x;
  c[i+1] = a[i+1]*a[i+1] + b[i+1] + x;
  c[i+2] = a[i+2]*a[i+2] + b[i+2] + x;
  c[i+3] = a[i+3]*a[i+3] + b[i+3] + x;


    // if(counter == 4) {
      x += 0.1;
      // counter = 0;
    // }
    // c[i] = a[i]*a[i] + b[i] + x;
    // counter++;
  }

  for(; i < N; i++)
  {
    c[i] = a[i]*a[i] + b[i] + x;
  }
}

