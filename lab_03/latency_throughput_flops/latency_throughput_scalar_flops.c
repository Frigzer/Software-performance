#include<stdlib.h>
#include<stdio.h>
#include<time.h>

#include"uth_time.h"

//#define PAPI_TEST
#ifdef PAPI_TEST
#include "papi_driver.h"
#endif


const int num_iter = 100000000;

int main( void ){

  double a, b, c, d, e, f, g, h, r, s, t, u, w, v, x, y, z, sum;
  int i, j, k, l;
  double CPU_time, wallclock_time;


  // scalar operations

  a = 1.000001;
  b = 1.000002;
  c = 1.000003;
  d = 1.000004;
  e = 1.000005;
  f = 1.000006;
  g = 1.000007;
  h = 1.000008;
  r = 1.000009;
  s = 1.000010;
  t = 1.000011;
  u = 1.000012;
  w = 1.000013;
  v = 1.000014;
  x = 1.000015;
  y = 1.000016;
  z = 1.000017;

// warm up
//
  for(i=0;i<10*num_iter;i++){
    a = 1.00000001*a+0.000001;
  }
  a *= 0.000000001;

#ifdef PAPI_TEST
  papi_driver_init();
  papi_driver_reset_events();
  papi_driver_start_events();
#endif
  
// calculations with time measurments
//
  CPU_time = time_CPU();
  wallclock_time = time_clock();

  for(i=0;i<num_iter;i++){

    a = 1.00000001*a+0.000001; 
    b = 1.00000001*b+0.000001; 
    c = 1.00000001*c+0.000001; 
    d = 1.00000001*d+0.000001; 
    e = 1.00000001*e+0.000001; 
    f = 1.00000001*f+0.000001; 
    g = 1.00000001*g+0.000001; 
    h = 1.00000001*h+0.000001; 
    r = 1.00000001*r+0.000001; 
    s = 1.00000001*s+0.000001; 
    t = 1.00000001*t+0.000001; 
    u = 1.00000001*u+0.000001; 
    w = 1.00000001*w+0.000001; 
    v = 1.00000001*v+0.000001; 
    x = 1.00000001*x+0.000001; 
    y = 1.00000001*y+0.000001; 
    z = 1.00000001*z+0.000001; 

  }
  double nr_oper_local = 17 * 2.0 * num_iter; // liczba zmiennych

  CPU_time = time_CPU() - CPU_time;
  wallclock_time = time_clock() - wallclock_time;

#ifdef PAPI_TEST
  double clock_ratio=1.0;
  papi_driver_stop_events();
  papi_driver_print_events();
  double papi_return_clock_ratio();
  clock_ratio = papi_return_clock_ratio();
// frequency is calculated taken nominal frequency and frequency ration from PAPI 
// for Estera nominal frequency is 2.2 GHz 
// 
  double frequency = 2.2*clock_ratio;
#endif

  sum = a+b+c+d+e+f+g+h+r+s+t+u+w+v+x+y+z;
  printf("\n\n");
  // printf("Result of arithmetic operations: %lf\n", sum);
  printf("Wynik operacji arytmetycznych: %lf\n", sum);
  printf("\n");
  // printf("Time for executing %lf arithmetic operations:\n\t CPU - %lf, wallclock - %lf\n",
	//  nr_oper_local, CPU_time, wallclock_time);
  printf("Czas wykonania %lf operacji arytmetycznych:\n\t CPU - %lf, zegar - %lf\n",
	 nr_oper_local, CPU_time, wallclock_time);
#ifdef PAPI_TEST
  printf("Wydajność: %lf GFlops (frequency %lf)\n",
	 nr_oper_local*1.0e-9/wallclock_time, frequency);
#else
    printf("Wydajność: %lf GFlops\n",
	 nr_oper_local*1.0e-9/wallclock_time);
#endif
  printf("\n\n");

  return(0);
}
