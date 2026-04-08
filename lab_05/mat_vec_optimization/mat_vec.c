#include <stdio.h>
#include <stdlib.h>
#include <math.h>


void mat_vec(double* a, double* x, double* y, int n)
{
  
  int i,j;
  
  // Original
  // for(i=0;i<n;i++){ 
  //   y[i]=0.0; 
  //   for(j=0;j<n;j++){ 
  //     y[i]+=a[i*n+j]*x[j]; 
  //   } 
  // }

  // Classic (CSE, LICM, IVS)
  // for (i = 0; i < n; i++) {
  //   double sum = 0.0;
  //   int in = i * n;

  //   for (j = 0; j < n; j++) {
  //       sum += a[in] * x[j];
  //       in++;
  //   }

  //   y[i] = sum;
  // }

  // Loop unrolling
  // for (i = 0; i < n; i++) {
  //   double sum = 0.0;
  //   int in = i * n;
  //   int j;

  //   for (j = 0; j <= n - 4; j += 4) {
  //       sum += a[in] * x[j];
  //       in++;
  //       sum += a[in] * x[j + 1];
  //       in++;
  //       sum += a[in] * x[j + 2];
  //       in++;
  //       sum += a[in] * x[j + 3];
  //       in++;
  //   }

  //   y[i] = sum;
  // }

  // Register blocking
  for (i = 0; i < n; i++) {
    double sum0 = 0.0, sum1 = 0.0, sum2 = 0.0, sum3 = 0.0;
    int in = i * n;
    int j;

    for (j = 0; j <= n - 4; j += 4) {
        sum0 += a[in]     * x[j];
        sum1 += a[in + 1] * x[j + 1];
        sum2 += a[in + 2] * x[j + 2];
        sum3 += a[in + 3] * x[j + 3];
        in += 4;
    }

    double sum = sum0 + sum1 + sum2 + sum3;

    y[i] = sum;
  }

  // Loop unrolling + register blocking
  // for (i = 0; i <= n - 4; i += 4) {
  //   double sum0 = 0.0, sum1 = 0.0, sum2 = 0.0, sum3 = 0.0;
  //   int in0 = i * n;
  //   int in1 = (i + 1) * n;
  //   int in2 = (i + 2) * n;
  //   int in3 = (i + 3) * n;

  //   for (j = 0; j < n; j++) {
  //       double xj = x[j];

  //       sum0 += a[in0] * xj; in0++;
  //       sum1 += a[in1] * xj; in1++;
  //       sum2 += a[in2] * xj; in2++;
  //       sum3 += a[in3] * xj; in3++;
  //   }

  //   y[i]     = sum0;
  //   y[i + 1] = sum1;
  //   y[i + 2] = sum2;
  //   y[i + 3] = sum3;
  // }

}
