#include <stdio.h>
#include <time.h>
#include <sys/time.h>
#include <cassert>
#include <cstdio>
#include <cstring>
#include <math.h>
#include <cstdlib>
#include <cctype>
#include "tbb/parallel_reduce.h"
#include "tbb/task_scheduler_init.h"
#include "tbb/blocked_range.h"

using namespace std;
using namespace tbb;

int Nthreads=	48;
#define GrainSize      10000
long long num_steps =  1000000000;

long _time (void)
{
  struct timeval t;

  gettimeofday(&t,NULL);
  return t.tv_sec*1000000+t.tv_usec;
}


class MyPi {
	double *const my_step;
public:
	double sum;
	void operator()( const blocked_range<size_t>& r ) {
		double step = *my_step;
		double x;
	    for (size_t i=r.begin(); i!=r.end(); ++i)
		{
			x = (i + .5)*step;
			sum = sum + 4.0/(1.+ x*x);
		}
	}

	MyPi( MyPi& x, split ) : my_step(x.my_step), sum(0) {}

	void join( const MyPi& y ) {sum += y.sum;}

	MyPi(double *const step) : my_step(step), sum(0) {}

};



int main(int argc, char* argv[])
{
	unsigned long start, stop;
	double pi;
	double width = 1./(double)num_steps;
	MyPi step((double *const)&width);

	Nthreads = atoi(getenv("OMP_NUM_THREADS"));
    task_scheduler_init init(task_scheduler_init::deferred);

	start = _time();
	init.initialize(Nthreads);
	parallel_reduce(blocked_range<size_t>(0,num_steps,GrainSize), step);
	pi = step.sum*width;
	stop = _time();

	printf("The value of PI is %15.12f\n",pi);
	printf("The time to calculate PI was %f seconds\n",((double)(stop - start)/1000000.0));
	return 0;
}
