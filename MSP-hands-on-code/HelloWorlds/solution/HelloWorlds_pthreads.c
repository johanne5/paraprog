#include <stdio.h>
#include <pthread.h>

pthread_mutex_t mutex;

void foo(int tid){
  int i;
  
  pthread_mutex_lock(&mutex);
  printf("Hello World %d\n", tid);
  for(i=0;i<6;i++)
    printf("Iter:%d\n",i);
  pthread_mutex_unlock(&mutex);
}

int main(int argc, char *argv[]) {
  pthread_t *tid;
  int i, X=1;

  if (argc == 2)
    X = (int) atoi(argv[1]);
  
  // Create an array of thread handlers
  tid = malloc(X*sizeof(pthread_t));
  
  // Make the code from here until the last printf-statement parallel
  
  for (i = 0; i < X; i++)
    pthread_create(&tid[i], 0, foo, i);
  
  pthread_mutex_lock(&mutex);
  
  printf("Hello World MASTER\n");
  for(i=0;i<6;i++)
    printf("Iter:%d\n",i);
  
  pthread_mutex_unlock(&mutex);
  
  for (i = 0; i < X; i++)
    pthread_join(tid[i], 0);

  printf("GoodBye World\n");
}
