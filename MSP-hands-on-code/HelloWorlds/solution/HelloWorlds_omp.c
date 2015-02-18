#include <stdio.h>

int main(int argc, char *argv[]) {

  int i, X=1;

  if (argc == 2)
    X = (int) atoi(argv[1]);

#pragma omp parallel private(i) num_threads(X)
    {
 #pragma omp critical
	{
	  printf("Hello World\n");
	  for(i=0;i<6;i++)
            printf("Iter:%d\n",i);
	}
    }
    printf("GoodBye World\n");
}
