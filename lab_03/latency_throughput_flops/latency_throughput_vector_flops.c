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

  int i, j, k, l;
  double CPU_time, wallclock_time;

  // attempt to use vector operations
#define LOCAL_SIZE 160

  double a_tab[LOCAL_SIZE], b_tab[LOCAL_SIZE], c_tab[LOCAL_SIZE], d_tab[LOCAL_SIZE];

  int tab_l = LOCAL_SIZE;
  for(i=0; i<tab_l; i++){
    a_tab[i] = 1.000001+0.0000001*i;
    b_tab[i] = 1.000002+0.0000001*i;
    c_tab[i] = 1.000003+0.0000001*i;
    d_tab[i] = 1.000004+0.0000001*i;
    //_tab[i] = 1.000005+0.0000001*i;
  }

  // warm up
  //
  for(i=0;i<num_iter;i++){
    for(k=0; k<tab_l; k++){
      a_tab[k] = 1.00000001*a_tab[k]+0.0000001;
    }
  }
  for(i=0; i<tab_l; i++){
    a_tab[i] *= 0.000000001;
  }

#ifdef PAPI_TEST
  papi_driver_init();
  papi_driver_reset_events();
  papi_driver_start_events();
#endif

  // computations with time measurments
  //
  CPU_time = time_CPU();
  wallclock_time = time_clock();

  for(i=0;i<num_iter;i++){
    
    for(k=0; k<tab_l; k++){

      a_tab[k] = 1.00000001*a_tab[k]+0.000001; 
      //}
      //for(k=0; k<tab_l; k++){
      //b_tab[k] = 1.00000001*b_tab[k]+0.000001; 
      //}
      //for(k=0; k<tab_l; k++){
      //c_tab[k] = 1.00000001*c_tab[k]+0.000001; 
      //}
      //for(k=0; k<tab_l; k++){
      //d_tab[k] = 1.00000001*d_tab[k]+0.000001; 

    }
    
  }

  double nr_oper_local = 1 * tab_l * 2.0 * num_iter;

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

  double sum = 0.0;
  for(k=0; k<tab_l; k++){
    sum += a_tab[k] + b_tab[k] + c_tab[k] + d_tab[k];
  }

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
