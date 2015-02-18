/* matrix summation using OpenMP

   usage with gcc (version 4.2 or higher required):
     gcc -O -fopenmp -o matrixSum-openmp matrixSum-openmp.c 
     ./matrixSum-openmp size numWorkers

*/

#include <omp.h>

double start_time, end_time;

#include <stdio.h>
#define MAXSIZE 10000  /* maximum matrix size */
#define MAXWORKERS 100  /* maximum number of workers */

#include <limits.h>
int gmin=INT_MAX,gmax=INT_MIN,gminx=-1,gminy=-1,gmaxx=-1,gmaxy=-1, gsum=0;

int numWorkers;
int size; 
int matrix[MAXSIZE][MAXSIZE];

/* read command line, initialize, and create threads */
int main(int argc, char *argv[]) {
  int i, j, total=0;

  /* read command line args if any */
  size = (argc > 1)? atoi(argv[1]) : MAXSIZE;
  numWorkers = (argc > 2)? atoi(argv[2]) : MAXWORKERS;
  if (size > MAXSIZE) size = MAXSIZE;
  if (numWorkers > MAXWORKERS) numWorkers = MAXWORKERS;

  omp_set_num_threads(numWorkers);

  /* initialize the matrix */
  for (i = 0; i < size; i++) {
    //  printf("[ ");
    for (j = 0; j < size; j++) {
      matrix[i][j] = rand()%99;
      //    printf(" %d", matrix[i][j]);
    }
    //    printf(" ]\n");
  }
  start_time = omp_get_wtime();
#pragma omp parallel for reduction (+:total) private(j) shared(gmin,gmax,gminx,gminy,gmaxx,gmaxy)
  for (i = 0; i < size; i++)
    for (j = 0; j < size; j++){
      total += matrix[i][j];
     
      if(matrix[i][j]<gmin) { //condition to enter critical section
        #pragma omp critical (min) //named independent critical sections so they can be accessed at the same time
        {
          if(matrix[i][j]<gmin) { //check that condition still holds true
            gminx=i;
            gminy=j;
            gmin=matrix[i][j];
          }
        }
      }
      if(matrix[i][j]>gmax) { //condition to enter critical section
        #pragma omp critical (max) //named independent critical sections so they can be accessed at the same time
        {
          if(matrix[i][j]>gmax) { //check that condition still holds true
            gmaxx=i;
            gmaxy=j;
            gmax=matrix[i][j];
          }
        }
      }

    }
// implicit barrier

  end_time = omp_get_wtime();

  if(argc<4) {
    printf("MIN => %d x: %d y: %d\n", gmin, gminx, gminy);
    printf("MAX => %d x: %d y: %d\n", gmax, gmaxx, gmaxy);
    printf("the total is %d\n", total);
    printf("it took %g seconds\n", end_time - start_time);
  }
  else printf("%lf\n", (end_time-start_time));

}

