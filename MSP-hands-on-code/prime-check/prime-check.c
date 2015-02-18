#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#define MAX_THREADS 8

long get_usecs(void)
{
    struct timeval t;
    gettimeofday(&t, ((void *) 0));
    return t.tv_sec * 1000000 + t.tv_usec;
}

int isPrime(unsigned int number) {
    if (number <= 1) return 0; // zero and one are not prime
    unsigned int i;
    for (i=2; i*i<=number; i++) {
        if (number % i == 0) return 0; // number divisible hence !prime ! 
    }
    return 1;
}

int main (int argc, char *argv[]) {
    int num_threads = MAX_THREADS;
    if(argc==2) num_threads = atoi(argv[1]);
    if(num_threads > MAX_THREADS) num_threads = MAX_THREADS;

    double alg_start = get_usecs();
    int numPrimes = 0;
    omp_set_dynamic(0);
#pragma omp parallel num_threads(num_threads)
    {
// #pragma omp for 
// #pragma omp for schedule(static) reduction(+:numPrimes)
#pragma omp for schedule(dynamic,500) reduction(+:numPrimes)
// #pragma omp for schedule(dynamic,500) 
// #pragma omp for schedule(dynamic,1) reduction(+:numPrimes)
        for(int i=3;i<=10000000;i++)
        {
            if(1==isPrime(i))
            {
// #pragma omp critical 
// #pragma omp atomic
                numPrimes++;
            }
        }
    }
    double alg_end = get_usecs();
    printf ("Num Primes = %d\nComputation time  = %f secs\n", numPrimes, ((double) (alg_end - alg_start)) / 1000000);

    return 0;
}
