#include <stdio.h>
#include <time.h>
#include <sys/time.h>
#include <math.h>
#include <cilk/cilk.h>
#include <cilk/reducer_opadd.h>


#define Nthreads	48
#define GrainSize      10000

long long num_steps =  1000000000;

long _time (void)
{
  struct timeval t;

  gettimeofday(&t,NULL);
  return t.tv_sec*1000000+t.tv_usec;
}

double step;
CILK_C_REDUCER_OPADD(sum,double,0);

int main(int argc, char* argv[])
{
	unsigned long start, stop;
	double y, pi;//, sum=0.0;

	int i;
	step = 1./(double)num_steps;

	start = _time();
	
	
	cilk_for (i=0; i<num_steps; i++)
	{		
		double x = (i + .5)*step;
		REDUCER_VIEW(sum) += (4.0/(1.+ x*x));
	}
	
	pi = sum.value*step;
	stop = _time();

	printf("The value of PI is %15.12f\n",pi);
	printf("The time to calculate PI was %f seconds\n",((double)(stop - start)/1000000.0));
	return 0;
}
