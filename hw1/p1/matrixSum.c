/* matrix summation using pthreads

   features: uses a barrier; the Worker[0] computes
             the total sum from partial sums computed by Workers
             and prints the total sum to the standard output

   usage under Linux:
     gcc matrixSum.c -lpthread
     a.out size numWorkers

*/
#ifndef _REENTRANT 
#define _REENTRANT 
#endif 
#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <time.h>
#include <sys/time.h>
#define MAXSIZE 100  /* maximum matrix size */
#define MAXWORKERS 10   /* maximum number of workers */

pthread_mutex_t barrier;  /* mutex lock for the barrier */
pthread_cond_t go;        /* condition variable for leaving */
int numWorkers;           /* number of workers */ 
int numArrived = 0;       /* number who have arrived */


/* a reusable counter barrier */
// void Barrier() {
//   pthread_mutex_lock(&barrier);
//   numArrived++;
//   if (numArrived == numWorkers) {
//     numArrived = 0;
//     pthread_cond_broadcast(&go);
//   } else
//     pthread_cond_wait(&go, &barrier);
//   pthread_mutex_unlock(&barrier);
// }



/* timer */
double read_timer() {
    static bool initialized = false;
    static struct timeval start;
    struct timeval end;
    if( !initialized )
    {
        gettimeofday( &start, NULL );
        initialized = true;
    }
    gettimeofday( &end, NULL );
    return (end.tv_sec - start.tv_sec) + 1.0e-6 * (end.tv_usec - start.tv_usec);
}

double start_time, end_time; /* start and end times */
int size, stripSize;  /* assume size is multiple of numWorkers */
int sums[MAXWORKERS]; /* partial sums */
int matrix[MAXSIZE][MAXSIZE]; /* matrix */

#include <limits.h>
// #define DEBUG true
pthread_mutex_t min_max;
int max_x=-1, max_y=-1, min_x=-1, min_y=-1, min=INT_MAX, max=INT_MIN;

void set_min_max(int x, int y) {
  pthread_mutex_lock(&min_max);
  if(matrix[x][y] < min) {
    min = matrix[x][y];
    min_x = x;
    min_y = y;
  }
  if(matrix[x][y] > max) {
    max = matrix[x][y];
    max_x = x;
    max_y = y;
  }
  pthread_mutex_unlock(&min_max);
}

int sum = 0;
pthread_mutex_t sum_lock;

void increment_sum(int n) {
  pthread_mutex_lock(&sum_lock);
  sum+=n;
  pthread_mutex_unlock(&sum_lock);
}

int current_row = 0;
pthread_mutex_t bag_lock;
void bag_of_tasks(int *ip) {
  pthread_mutex_lock(&bag_lock);
  *ip = (current_row == size) ? -1 : current_row++;
  pthread_mutex_unlock(&bag_lock);
}

void *Worker(void *);


/* read command line, initialize, and create threads */
int main(int argc, char *argv[]) {
  int i, j;
  long l; /* use long in case of a 64-bit system */
  pthread_attr_t attr;
  pthread_t workerid[MAXWORKERS];

  /* set global thread attributes */
  pthread_attr_init(&attr);
  pthread_attr_setscope(&attr, PTHREAD_SCOPE_SYSTEM);

  /* initialize mutex and condition variable */
  pthread_mutex_init(&min_max, NULL);     /*!!!!!!!!!!!!!!!!!*/
  pthread_mutex_init(&sum_lock, NULL);     /*!!!!!!!!!!!!!!!!!*/
  pthread_mutex_init(&bag_lock, NULL);     /*!!!!!!!!!!!!!!!!!*/
  pthread_mutex_init(&barrier, NULL);
  pthread_cond_init(&go, NULL);

  /* read command line args if any */
  size = (argc > 1)? atoi(argv[1]) : MAXSIZE;
  numWorkers = (argc > 2)? atoi(argv[2]) : MAXWORKERS;
  if (size > MAXSIZE) size = MAXSIZE;
  if (numWorkers > MAXWORKERS) numWorkers = MAXWORKERS;
  stripSize = size/numWorkers;

  /* initialize the matrix */
  for (i = 0; i < size; i++) {
	  for (j = 0; j < size; j++) {
          matrix[i][j] = 1;//rand()%99;
	  }
  }

  matrix[MAXSIZE/2][MAXSIZE/2]=-7;
  matrix[MAXSIZE/4][MAXSIZE/4]=99;

  /* print the matrix */
#ifdef DEBUG
  for (i = 0; i < size; i++) {
	  printf("[ ");
	  for (j = 0; j < size; j++) {
	    printf(" %d", matrix[i][j]);
	  }
	  printf(" ]\n");
  }
#endif

  /* do the parallel work: create the workers */
  start_time = read_timer();
  for (l = 0; l < numWorkers; l++)
    pthread_create(&workerid[l], &attr, Worker, (void *) l);
  //pthread_exit(NULL);
  for (l = 0; l < numWorkers; l++)
       pthread_join(workerid[l], NULL);

  printf("The total is %d\n", sum);
  printf("The execution time is %g sec\n", end_time - start_time);
  printf("Min -> index: %d %d value: %d \nMax -> index: %d %d value: %d\n", min_x, min_y, min, max_x, max_y, max);
  return 0;
}

/* Each worker sums the values in one strip of the matrix.
   After a barrier, worker(0) computes and prints the total */

void set_min_max(int,int);    /*!!!!!!!!!!!!!!!!!!!!!!*/
void increment_sum(int);
void bag_of_tasks(int*);

void *Worker(void *arg) {
  long myid = (long) arg;
  int total, i, j, first, last;
  int my_row;

#ifdef DEBUG
  printf("worker %d (pthread id %d) has started\n", myid, pthread_self());
#endif

#ifdef OLD  
  /* determine first and last rows of my strip */
  first = myid*stripSize;
  last = (myid == numWorkers - 1) ? (size - 1) : (first + stripSize - 1);

  /* sum values in my strip */
  total = 0;
  for (i = first; i <= last; i++)
    for (j = 0; j < size; j++) {
      //total += matrix[i][j];
      increment_sum(matrix[i][j]);
      set_min_max(i,j);
    }
#else
    while(1) {
      bag_of_tasks(&my_row);
      if(my_row == -1) break;
      for(j=0; j < size; j++) {
        increment_sum(matrix[my_row][j]);
        set_min_max(my_row,j);
      } 
    }

#endif
    
  //sums[myid] = total;
  //Barrier();
  //if (myid == 0) {
  // if(0) {
  //   total = 0;
  //   for (i = 0; i < numWorkers; i++)
  //     total += sums[i];
  //   /* get end time */
  //   end_time = read_timer();
  //   /* print results */
  //   printf("The total is %d\n", total);
  //   printf("The execution time is %g sec\n", end_time - start_time);
  //   printf("Min -> index: %d %d value: %d \nMax -> index: %d %d value: %d", min_x, min_y, min, max_x, max_y, max);
  // } 
}
