#include<stdlib.h>
#include<stdio.h>
#include<time.h>

#include"uth_time.h"
 
const int num_iter = 1000000;

void main( void ){

  double a, b, c, sum;
  int i, j, k, l;
  double CPU_time, wallclock_time;

  // int tests[] = {1000, 10000, 100000, 1000000};
  int tests[] = {1000000, 10000000, 100000000, 1000000000};
  int ntests = 4;
  int n;

  srand(time(NULL));

  printf("\n\n");
  
  for(n=0; n<ntests; n++) {
    int current_iter = tests[n];

    j = 13000; 
    k = 21000;
  
    printf("Analiza dla %d losowych liczb całkowitych z zakresu : %d - %d\n\n", current_iter, j, k);

    /* test skalowania */
    printf("Tryb skalowania\n");

    sum = 0.0;
    CPU_time = time_CPU();
    wallclock_time = time_clock();

    for(i=0; i<current_iter; i++){
        l = j + (int)((k-j+1.0)*rand()/(RAND_MAX+1.0));
        sum += l;
    }

    CPU_time = time_CPU() - CPU_time;
    wallclock_time = time_clock() - wallclock_time;

    printf("Srednia: %lf [oczekiwana: %lf]\n", sum/current_iter, (j+k)/2.0);
    printf("CPU = %lf, wallclock = %lf\n\n", CPU_time, wallclock_time);

    /* test modulo */
    printf("Tryb modulo\n");

    sum = 0.0;
    CPU_time = time_CPU();
    wallclock_time = time_clock();

    for(i=0; i<current_iter; i++){
        l = j + rand() % (k-j+1);
        sum += l;
    }

    CPU_time = time_CPU() - CPU_time;
    wallclock_time = time_clock() - wallclock_time;

    printf("Srednia: %lf [oczekiwana: %lf]\n", sum/current_iter, (j+k)/2.0);
    printf("CPU = %lf, wallclock = %lf\n\n", CPU_time, wallclock_time);

    printf("------------------------------------------------------------------\n\n");
  
  }

}
