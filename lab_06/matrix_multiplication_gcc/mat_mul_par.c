#include <stdlib.h>
#include <stdio.h>
#include <immintrin.h>

// definitions of: SCALAR, BLOCK_SIZE_S, BLOCK_SIZE_L and ALIGNMENT
#include "sizes.h"

void mat_mul_par(SCALAR *a, SCALAR *b, SCALAR* c, int n)
// void mat_mul_par( const SCALAR* const restrict a, const SCALAR* const restrict b, SCALAR* const restrict c, const int n )
{
  int i, j, k;
  int ii, jj, kk;
  const int BLS = BLOCK_SIZE_S;
   
  // matrix c initialized in mat_mul_driver.c
/* #pragma omp parallel for default(none) shared(c,n) private(i,j) */
/*   for(i=0;i<n;i++){ */
/*     for(j=0;j<n;j++){ */
/*       c[i*n+j]=0.0; */
/*     } */
/*   } */

//#pragma omp parallel for default(none) shared(a,b,c,n) private(i,j,k)
// for(i=0;i<n;i++){
//   for(k=0;k<n;k++){
//     for(j=0;j<n;j++){
// 	    c[i*n+j] += a[i*n+k]*b[k*n+j];
//     }
//   }
// }

  // Cache blocking
  for (i = 0; i < n; i += BLS) {
    for (k = 0; k < n; k += BLS) {
      for (j = 0; j < n; j += BLS) {
        for (ii = i; ii < i + BLS; ii++) {
          for (kk = k; kk < k + BLS; kk++) {
            for (jj = j; jj < j + BLS; jj++) {
              c[ii*n + jj] += a[ii*n + kk] * b[kk*n + jj];
            }
          }
        }
      }
    }
  }

  // Loop unrolling
  for (i = 0; i < n; i += BLS) {
    for (k = 0; k < n; k += BLS) {
      for (j = 0; j < n; j += BLS) {
        for (ii = i; ii < i + BLS; ii++) {
          for (kk = k; kk < k + BLS; kk++) {
            __m256d v_a = _mm256_broadcast_sd(&a[ii*n + kk]);

            for (jj = j; jj < j + BLS; jj += 4) {
              __m256d v_c = _mm256_load_pd(&c[ii*n + jj]);
              __m256d v_b = _mm256_load_pd(&b[kk*n + jj]);

              v_c = _mm256_fmadd_pd(v_a, v_b, v_c);

              _mm256_store_pd(&c[ii*n + jj], v_c);
            }
          }
        }
      }
    }
  }

  return;
}
