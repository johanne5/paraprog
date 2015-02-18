#include <stdio.h>
#include <time.h>
#include <sys/time.h>
#include <math.h>
#include <omp.h>


#define N 800

//const int N = 800;

long _time (void)
{
  struct timeval t;

  gettimeofday(&t,NULL);
  return t.tv_sec*1000000+t.tv_usec;
}


void ParallelMxM( float c[N][N], float a[N][N], float b[N][N] ) {
int i,j,k;
#pragma omp parallel
#pragma omp single
 {
  for (i = 0; i < N; ++i ) 
#pragma omp task shared(a,c,b) firstprivate(i) private(j,k)
    {
    for (j=0; j<N; ++j ) {
      float sum = 0;
	  for (k=0; k<N; ++k ) {
               sum += a[i][k]*b[k][j];
	  }
      c[i][j] = sum;
    }
	#pragma omp taskwait
  }
    }
}


void mxm( float c[N][N], float a[N][N], float b[N][N] ) {
int i,j,k;
  for(i = 0; i < N; ++i ) {
    for(j=0; j<N; ++j ) {
      float sum = 0;
	  for(k=0; k<N; ++k ) {
        sum += a[i][k]*b[k][j];
	  }
      c[i][j] = sum;
    }
  }
}


void initialize(float a[N][N], float b[N][N]) {
int i,j;
   for (i = 0; i < N; ++i) {
     for (j = 0; j < N; ++j) {
       a[i][j] = (float)i+j;
       b[i][j] = (float)i*j;
     }
   }
}



void validate(float c[N][N], float r[N][N]) {
int i,j;
	for (i = 0; i < N; ++i) {
		for (j = 0; j < N; ++j)	{
			if (c[i][j] != r[i][j]) {	
				printf("c != rc at [%d][%d]\n",i,j);
			}
		}
	}
}



float a[N][N], b[N][N], c[N][N], rc[N][N];
int main() {
    
    unsigned long   before, after;
    double time_serial, time_parallel;
    
    initialize(a,b);
    
    before = _time();
    mxm(rc,a,b);
    after = _time();
    time_serial= (float)(after - before)/ CLOCKS_PER_SEC;
   

    initialize(a,b);
   
    before = _time();
    ParallelMxM(c,a,b); 
    after = _time();

    time_parallel = (float)(after - before)/ CLOCKS_PER_SEC;
    

    validate(c,rc);

	printf("  serial mxm = %f seconds\nparallel mxm = %f seconds\nfor a speedup of %6.2fX\n\n",
           time_serial, time_parallel,time_serial/time_parallel );

    return 0;
}


