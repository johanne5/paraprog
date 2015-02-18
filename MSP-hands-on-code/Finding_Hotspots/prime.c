#include <stdio.h>
#define RANGE 20000

char is_prime( int n)
{
    int i = 2;
    while (i <= (n/2))
    {
        if ((n%i) == 0) return -1;
        i++;
    }
    return 0;}

int main(int argc,char *argv[])
{
    int i, num = 0;

    for (i=2;i<RANGE;i++) if (is_prime(i) == 0) num++;      /*<--- Parallelize this loop */
    printf("Number of primes in range 2-%d are: %d\n",RANGE,num);
}
