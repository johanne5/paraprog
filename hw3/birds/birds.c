#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <errno.h>
#include <omp.h>

#define DEFAULTHASHLINGS 10
#define MAXBEES 100
#define DEFAULTSIZE 10
#define MAXSIZE 100

/* This program has a number of producer threads (bees) that drop honey in a plate. When the plate is empty,
everything is consumed by a consumer thread (bear) and the bees then keep on producing */

int main(int argc, char *argv[]) {
	int numHashlings, plateSize, food, hello, myNumber;
	numHashlings = argc>1 ? atoi(argv[1]) : DEFAULTHASHLINGS; //reads number of producer threads
	numHashlings = numHashlings > MAXBEES ? MAXBEES : numHashlings; //limits number of producer threads to maximum
	plateSize = argc>2 ? atoi(argv[2]) : DEFAULTSIZE; //reads size of problem from parameter
	plateSize = plateSize > MAXSIZE ? MAXSIZE : plateSize; //limits size of problem to maximum
	sem_t *plate, *empty;

  	/*initiate semaphores*/
	plate = sem_open("/plate mutex", O_CREAT | O_EXCL, 0777, 1);
	if(SEM_FAILED==plate) perror(NULL);
	empty = sem_open("/empty plate flag", O_CREAT | O_EXCL, 0777, 0);
	if(SEM_FAILED==empty) perror(NULL);

	printf("\n\n--- hurl yourself at ENTER and chill to bail ---\n");
	numHashlings+=2; //adds 2 extra treads, one for user prompt, one for consumer thread
	food = plateSize; hello=1;
	#pragma omp parallel num_threads(numHashlings) firstprivate(plate, empty) private(myNumber) shared(food, hello)
	{
		myNumber = omp_get_thread_num()-1; //set thread ID
		while(hello) { //while user has not pressed enter to exit
			if(!omp_get_thread_num()) { //thread 0 listens for user input
				if(getchar()=='\n') {
					printf("\n--- hold on while i'm cleaning up your mess... ---\n");
					hello=0; //makes sure program terminates on enter
				}
			}		
			else if(omp_get_thread_num()==1) { //provider thread waits on empty flag
				sem_wait(empty);
				printf("Big moma saves the day (:\n");
				food=plateSize; //fills up plate
				sem_post(plate); //unlocks mutex
			}
			else {
				sleep(1 + (rand()%15)); //random sleep
				sem_wait(plate); //waits to lock mutex
				printf("Hashling %d bites a worm in the bum...\n", myNumber);
				food--; //produces
				if(!food) { //if no more space to produce, set flag and give lock to consumer thread
					printf("Hashling %d swallows it whole! No more food, what to do!?\n", myNumber);
					sem_post(empty);
				}
				else sem_post(plate); //else unlock mutex
			}
		}
	}
	//implicit barrier
	sem_unlink("/plate mutex");
	sem_unlink("/empty plate flag");
	printf("\n--- all done! ---\n");
}




