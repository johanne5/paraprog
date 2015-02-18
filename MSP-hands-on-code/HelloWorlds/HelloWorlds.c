#include <stdio.h>

int main(int argc, char *argv[]) {

  int i, X=1;

  /* This program accepts 0 or 1 arguments (argc==2). If one argument
     is used, it is interpreted as an integer and put in variable X */

  if (argc == 2)
    X = (int) atoi(argv[1]);

  // Make the code from here until the last printf-statement parallel
  printf("Hello World\n");
  for(i=0;i<6;i++)
    printf("Iter:%d\n",i);
  

  printf("GoodBye World\n");
}
