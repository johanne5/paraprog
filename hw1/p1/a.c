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
#define MAXSIZE 4  /* maximum matrix size */
#define MAXWORKERS 2   /* maximum number of workers */
#define DEBUG yes

pthread_mutex_t barrier;  /* mutex lock for the barrier */
pthread_cond_t go;        /* condition variable for leaving */
int numWorkers;           /* number of workers */ 
int numArrived = 0;       /* number who have arrived */


/* a reusable counter barrier */
void Barrier() {
  pthread_mutex_lock(&barrier);
  numArrived++;
  if (numArrived == numWorkers) {
    numArrived = 0;
    pthread_cond_broadcast(&go);
  } else
    pthread_cond_wait(&go, &barrier);
  pthread_mutex_unlock(&barrier);
}



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

/* MY CODE STARTS HERE */
#include <limits.h>
void set_min_max(int,int); //the function prototype
pthread_mutex_t min_max; //mutex lock for critical section (the set_min_max-function). Initialized in main.
/* variables named *_x or *_y store array indexes for min and max values, min and max store the actual values */
int max_x=-1, max_y=-1, min_x=-1, min_y=-1, min=INT_MAX, max=INT_MIN;

/* critical section */
void set_min_max(int x, int y) {
  pthread_mutex_lock(&min_max); //locking mutex
  if(matrix[x][y] < min) { //if current value is strictly less than the current minimum
    min = matrix[x][y]; //set new minimum
    min_x = x; //update min indexes
    min_y = y;
  }
  if(matrix[x][y] > max) { //if current value is strictly greater than the current maximum
    max = matrix[x][y]; //set new maximum
    max_x = x; //update max indexes
    max_y = y;
  }
  pthread_mutex_unlock(&min_max); //unlock mutex
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
  pthread_mutex_init(&min_max, NULL);     /*initializing my mutex*/
  pthread_mutex_init(&barrier, NULL);
  pthread_cond_init(&go, NULL);

  /* read command line args if any */
  size = (argc > 1)? atoi(argv[1]) : MAXSIZE;
  numWorkers = (argc > 2)? atoi(argv[2]) : MAXWORKERS;
  if (size > MAXSIZE) size = MAXSIZE;
  if (numWorkers > MAXWORKERS) numWorkers = MAXWORKERS;
  stripSize = size/numWorkers;
  srand(time(NULL));

  /* initialize the matrix */
  for (i = 0; i < size; i++) {
	  for (j = 0; j < size; j++) {
          matrix[i][j] = /*1;*/rand()%99;
	  }
  }

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
  pthread_exit(NULL);
}

/* Each worker sums the values in one strip of the matrix.
   After a barrier, worker(0) computes and prints the total */

void *Worker(void *arg) {
  long myid = (long) arg;
  int total, i, j, first, last;
  int my_row;

#ifdef DEBUG
  printf("worker %d (pthread id %d) has started\n", myid, pthread_self());
#endif

  /* determine first and last rows of my strip */
  first = myid*stripSize;
  last = (myid == numWorkers - 1) ? (size - 1) : (first + stripSize - 1);

  /* sum values in my strip */
  total = 0;
  for (i = first; i <= last; i++)
    for (j = 0; j < size; j++) {
      total += matrix[i][j];
      set_min_max(i,j);
    }
    
  sums[myid] = total;
  Barrier();
  if (myid == 0) {
    total = 0;
    for (i = 0; i < numWorkers; i++)
      total += sums[i];
    /* get end time */
    end_time = read_timer();
    /* print results */
    printf("The total is %d\n", total);
    printf("The execution time is %g sec\n", end_time - start_time);
    printf("MINIMUM index: [%d,%d] value: %d \nMAXIMUM index: [%d,%d] value: %d\n", min_x, min_y, min, max_x, max_y, max);
  } 
}
