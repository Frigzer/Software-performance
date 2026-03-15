#include<stdlib.h>
#include<stdio.h>
#include<time.h>

#include"uth_time.h"
 
const int num_iter = 1000000;

void main( void ){

  double a, b, c, sum;
  int i, j, k, l;
  double CPU_time, wallclock_time;

  int *tab_int;
  double *tab_double;

  time_init();

  // k = -500000;
  // for(i=0;i<num_iter;i++){

  //   printf("%d ",k+i);

  // }
  // printf("\n\n\n");

  // printf("Czas wykonania %d operacji wejscia/wyjscia: \n",num_iter);
  // time_print();

  // CPU_time = time_CPU();
  // wallclock_time = time_clock();
  // a = 1.000001;
  // for(i=0;i<num_iter/2;i++){

  //   a = 1.000001*a+0.000001; 

  // }
  // CPU_time = time_CPU() - CPU_time;
  // wallclock_time = time_clock() - wallclock_time;

  // printf("\n\n");

  // printf("Wynik operacji arytmetycznych: %lf\n\n", a);
  // printf("Czas wykonania %d operacji arytmetycznych:\n\t CPU - %lf, zegar - %lf\n",
	//  num_iter, CPU_time, wallclock_time);
  
  // printf("\n\n");


  srand(time(NULL));

  // printf("----------------------------------------------------------------------------------------------------\n\n");

  /* ---------- LOSOWE LICZBY RZECZYWISTE ---------- */

  a = 2.72; 
  b = 3.14;
  
  printf("  Analiza 4 petli %d losowych liczb rzeczywistych z zakresu : %lf - %lf\n\n", 
	 num_iter, a, b);

  tab_double = (double*)malloc(num_iter * sizeof(double));
  if(tab_double == NULL) {
    printf("Blad alokacji pamieci.\n");
    exit(0);
  }

  /* 1. Samo generowanie liczb losowych: sum += rand() */
  sum = 0.0;

  CPU_time = time_CPU();
  wallclock_time = time_clock();

  for(i=0;i<num_iter;i++){
    sum += rand();
  }

  CPU_time = time_CPU() - CPU_time;
  wallclock_time = time_clock() - wallclock_time;

  printf("1. Samo generowanie liczb losowych (sum += rand())\n");
  printf("   Srednia: %lf\n", sum / num_iter);
  printf("   CPU = %lf, wallclock = %lf\n\n", CPU_time, wallclock_time);
  
  /* 2. Generowanie i rzutowanie do odpowiedniego przedziału */
  sum = 0.0;

  CPU_time = time_CPU();
  wallclock_time = time_clock();

  for(i=0;i<num_iter;i++){
      c = a + (b-a)*((double)rand()/RAND_MAX);
      sum += c;
  }

  CPU_time = time_CPU() - CPU_time;
  wallclock_time = time_clock() - wallclock_time;

  printf("2. Generowanie i rzutowanie do odpowiedniego przedzialu\n");
  printf("   Srednia: %lf [oczekiwana ok. %lf]\n", sum / num_iter, (a + b) / 2.0);
  printf("   CPU = %lf, wallclock = %lf\n\n", CPU_time, wallclock_time);

  /* 3. Generowanie i zapisywanie do zaalokowanej tablicy */
  CPU_time = time_CPU();
  wallclock_time = time_clock();

  for(i = 0; i < num_iter; i++) {
      tab_double[i] = rand();
  }

  CPU_time = time_CPU() - CPU_time;
  wallclock_time = time_clock() - wallclock_time;

  printf("3. Generowanie i zapisywanie do zaalokowanej tablicy\n");
  printf("   CPU = %lf, wallclock = %lf\n\n", CPU_time, wallclock_time);

  /* 4. Wczytywanie z tablicy i rzutowanie do odpowiedniego przedziału */
  sum = 0.0;

  CPU_time = time_CPU();
  wallclock_time = time_clock();

  for(i = 0; i < num_iter; i++) {
      c = a + (b - a) * ((double)tab_double[i] / RAND_MAX);
      sum += c;
  }

  CPU_time = time_CPU() - CPU_time;
  wallclock_time = time_clock() - wallclock_time;

  printf("4. Wczytywanie z tablicy i rzutowanie do odpowiedniego przedzialu\n");
  printf("   Srednia: %lf [oczekiwana ok. %lf]\n", sum / num_iter, (a + b) / 2.0);
  printf("   CPU = %lf, wallclock = %lf\n\n", CPU_time, wallclock_time);

  free(tab_double);

  printf("----------------------------------------------------------------------------------------------------\n\n");

  /* ---------- LOSOWE LICZBY CALKOWITE ---------- */

  j = 13000; 
  k = 21000;
  
  printf("  Analiza 4 petli dla %d losowych liczb całkowitych z zakresu : %d - %d\n\n", 
	 num_iter, j, k);

  tab_int = (int*)malloc(num_iter * sizeof(int));
  if (tab_int == NULL) {
    printf("Blad alokacji pamieci.\n");
    exit(0);
  }

  /* 1. Samo generowanie liczb losowych: sum += rand() */
  sum = 0.0;

  CPU_time = time_CPU();
  wallclock_time = time_clock();

  for(i=0;i<num_iter;i++){
    sum += rand();
  }

  CPU_time = time_CPU() - CPU_time;
  wallclock_time = time_clock() - wallclock_time;

  printf("1. Samo generowanie liczb losowych (sum += rand())\n");
  printf("   Srednia: %lf\n", sum / num_iter);
  printf("   CPU = %lf, wallclock = %lf\n\n", CPU_time, wallclock_time);

  /* 2. Generowanie i rzutowanie do odpowiedniego przedziału */
  sum = 0.0;

  CPU_time = time_CPU();
  wallclock_time = time_clock();

  for(i = 0; i < num_iter; i++) {
      l = j + (int)((k - j + 1.0) * rand() / (RAND_MAX + 1.0));
      sum += l;
  }

  CPU_time = time_CPU() - CPU_time;
  wallclock_time = time_clock() - wallclock_time;

  printf("2. Generowanie i rzutowanie do odpowiedniego przedzialu\n");
  printf("   Srednia: %lf [oczekiwana ok. %lf]\n", sum / num_iter, (j + k) / 2.0);
  printf("   CPU = %lf, wallclock = %lf\n\n", CPU_time, wallclock_time);

  /* 3. Generowanie i zapisywanie do zaalokowanej tablicy */
  CPU_time = time_CPU();
  wallclock_time = time_clock();

  for(i = 0; i < num_iter; i++) {
      tab_int[i] = rand();
  }

  CPU_time = time_CPU() - CPU_time;
  wallclock_time = time_clock() - wallclock_time;

  printf("3. Generowanie i zapisywanie do zaalokowanej tablicy\n");
  printf("   CPU = %lf, wallclock = %lf\n\n", CPU_time, wallclock_time);

  /* 4. Wczytywanie z tablicy i rzutowanie do odpowiedniego przedziału */
  sum = 0.0;

  CPU_time = time_CPU();
  wallclock_time = time_clock();

  for(i = 0; i < num_iter; i++) {
      l = j + (int)((k - j + 1.0) * tab_int[i] / (RAND_MAX + 1.0));
      sum += l;
  }

  CPU_time = time_CPU() - CPU_time;
  wallclock_time = time_clock() - wallclock_time;

  printf("4. Wczytywanie z tablicy i rzutowanie do odpowiedniego przedzialu\n");
  printf("   Srednia: %lf [oczekiwana ok. %lf]\n", sum / num_iter, (j + k) / 2.0);
  printf("   CPU = %lf, wallclock = %lf\n\n", CPU_time, wallclock_time);

  free(tab_int);

  printf("====================================================================================================\n\n");

}
