#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <errno.h>
#include <omp.h>

#define DEFAULTBEES 10
#define MAXBEES 100
#define DEFAULTSIZE 10
#define MAXSIZE 100

/* This program has a number of producer threads (bees) that drop honey in a jar. When the jar is full,
everything is consumed by a consumer thread (bear) and the bees then keep on producing */

int main(int argc, char *argv[]) {
	int numBees, jarSize, jarSpace, hello, myNumber;
	numBees = argc>1 ? atoi(argv[1]) : DEFAULTBEES; //reads number of producer threads
	numBees = numBees > MAXBEES ? MAXBEES : numBees; //limits number of producer threads to maximum
	jarSize = argc>2 ? atoi(argv[2]) : DEFAULTSIZE; //reads size of problem from parameter
	jarSize = jarSize > MAXSIZE ? MAXSIZE : jarSize; //limits size of problem to maximum
	sem_t *jar, *full;

  	/*initiate semaphores*/
	jar = sem_open("/jar mutex", O_CREAT | O_EXCL, 0777, 1);
	if(SEM_FAILED==jar) perror(NULL);
	full = sem_open("/full jar flag", O_CREAT | O_EXCL, 0777, 0);
	if(SEM_FAILED==full) perror(NULL);

	printf("\n\n--- hurl yourself at ENTER and chill to bail ---\n");
	numBees+=2; //adds 2 extra treads, one for user prompt, one for consumer thread
	jarSpace = jarSize; hello=1;
	#pragma omp parallel num_threads(numBees) firstprivate(jar, full) private(myNumber) shared(jarSpace, hello)
	{
		myNumber = omp_get_thread_num()-1; //set thread ID
		while(hello) { //while user has not pressed enter to exit
			if(!omp_get_thread_num()) { //thread 0 listens for user input
				if(getchar()=='\n') {
					printf("\n--- hold on while i'm cleaning up your mess... ---\n");
					hello=0; //makes sure program terminates on enter
				}
			}		
			else if(omp_get_thread_num()==1) { //consumer thread waits on full flag
				sem_wait(full);
				printf("Brother bear drinks all the bees' loads, rolls over and goes back to sleep\n");
				jarSpace=jarSize; //consumes everything
				sem_post(jar); //unlocks mutex
			}
			else {
				sleep(1 + (rand()%15)); //random sleep
				sem_wait(jar); //waits to lock mutex
				printf("Bee %d pops the lid and drops payload\n", myNumber);
				jarSpace--; //produces
				if(!jarSpace) { //if no more space to produce, set flag and give lock to consumer thread
					printf("Bee %d \"gently\" wakes the bear... (;\n", myNumber);
					sem_post(full);
				}
				else sem_post(jar); //else unlock mutex
			}
		}
	}
	//implicit barrier
	sem_unlink("/jar mutex");
	sem_unlink("/full jar flag");
	printf("\n--- all done! ---\n");
}




