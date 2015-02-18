#include <stdio.h>
#include <omp.h>

#define RANGE 50000

char is_prime( int n) /* is n a prime number? If so, return -1 */
{
int i = 2;
while (i <= (n/2))
    {
        if ((n%i) == 0) return -1;
        i++;
    }
return 0;
}

int main(int argc,char *argv[])
{
int i;
int num = 0;
omp_set_num_threads(atoi(argv[1]));    //Set the number of threads to what is posted in the command line

#pragma omp parallel for firstprivate(i) shared(num)
    for (i=2;i<RANGE;i++)
        {
        if (is_prime(i) == 0)
            {
            #pragma omp critical
                {
                    num++;     //Since num is shared amongst threads, we need to use a lock to protect it.
                }
            }
        }

printf("Number of primes in the range (2-%d): %d\n",RANGE,num);
}
