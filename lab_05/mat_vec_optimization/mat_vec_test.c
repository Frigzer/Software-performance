#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "pomiar_czasu.h"

#define WYMIAR 10000
#define ROZMIAR (WYMIAR*WYMIAR)
#define ALIGNEMENT 64 // assumed cache line size 

void mat_vec(double* a, double* x, double* y, int n);

int main (void)
{
  double *a, *x, *y, *z;
  int n,i,j;
  const int ione=1;
  const double done=1.0;
  const double dzero=0.0;
  
  size_t alignment =  ALIGNEMENT; 
  size_t size_in_bytes = ROZMIAR*sizeof(double);
  posix_memalign( (void **)&a, alignment, size_in_bytes);
  size_in_bytes = WYMIAR*sizeof(double);
  posix_memalign( (void **)&x, alignment, size_in_bytes);
  posix_memalign( (void **)&y, alignment, size_in_bytes);
  posix_memalign( (void **)&z, alignment, size_in_bytes);

  for(i=0;i<ROZMIAR;i++) a[i]=1.0*i/11110000.1;
  for(i=0;i<WYMIAR;i++) x[i]=1.0*(WYMIAR-i)/1010101.01;

  n=WYMIAR;

  printf("start time measurements\n");
  inicjuj_czas();
  mat_vec(a,x,y,n);
  drukuj_czas();
  printf("end time measurements\n");

  // test
  for(i=0;i<n;i++){
    z[i]=0.0;
    for(j=0;j<n;j++){
      z[i]+=a[i*n+j]*x[j];
    }
  }

  int passed = 1;
  for(i=0;i<WYMIAR;i++){
    if(fabs(y[i]-z[i])>1.e-9*z[i]) {
      printf("For i=%d, y[i]=%lf != correct_result[i]=%lf. Exiting.\n",
	     i, y[i], z[i]);
      passed = 0;
    }
    //exit(0);
  }

  if(passed) printf("correctness test - passed\n");
  else printf("correctness test - failed\n");

  return 0;
}
