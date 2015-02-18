#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <errno.h>
#include <omp.h>

#define DEFAULTSIZE 10
#define MAXSIZE 100
#define LADIES 0
#define GENTS 1

void Worker(void *);

int main(int argc, char *argv[]) {
	int numGuests, myGender, mcount, wcount, mwcount, wwcount, hello;
	numGuests = argc>1 ? atoi(argv[1]) : DEFAULTSIZE; //read input parameter
	numGuests = numGuests > MAXSIZE ? MAXSIZE : numGuests; //constrain parameter to predefined limits
	sem_t *w, *m, *q, *wq, *mq;

  	/*initiate semaphores*/
	w = sem_open("/ladies", O_CREAT | O_EXCL, 0777, 1);
	m = sem_open("/gents", O_CREAT | O_EXCL, 0777, 1);	
	q = sem_open("/queue mutex", O_CREAT | O_EXCL, 0777, 1);
  	wq = sem_open("/ladies flag", O_CREAT | O_EXCL, 0777, 0);
  	mq = sem_open("/gents flag", O_CREAT | O_EXCL, 0777, 0);

  	printf("\n\n--- hurl yourself at ENTER and chill to bail ---\n");
  	numGuests++; //add one thread for listener (user prompt)
	wwcount=0; mwcount=0; mcount=0; wcount=0; hello=1;
	#pragma omp parallel num_threads(numGuests) firstprivate(w, m, q, wq, mq) private(myGender) shared(wwcount, mwcount, mcount, wcount, hello)
	{
    if(!omp_get_thread_num()) //listens for user input. Enter makes the program terminate
      while(hello)
        if(getchar()=='\n') {
          printf("\n--- hold on while i'm cleaning up your mess... ---\n");
          hello=0;
        } 
		
    myGender = (omp_get_thread_num() % 2) == 0 ? LADIES : GENTS;
    sleep(1 + (rand()%15));
		while(hello) {
			if(LADIES==myGender) {
				sem_wait(q); //wait for queue mutex lock
				if((mcount | mwcount)) { //if no man is waiting or in the bathrom
         			printf("%s %d stands in line\n",GENTS==myGender ? "Gentleman" : "Lady" ,omp_get_thread_num());
					wwcount++; //increment women waiting
					sem_post(q); //unlock queue mutex lock
					sem_wait(wq); //stand in line (women waiting fifo)
				}
				wcount++; //increment number of women in the bathroom
				if(wwcount) { //if women in queue
					wwcount--; //decrement women waiting
					sem_post(wq); //let one woman in from fifo
				}
				else sem_post(q); //unlock queue mutex lock

				printf("%s %d uses the bathroom\n",GENTS==myGender ? "Gentleman" : "Lady" ,omp_get_thread_num());
				sleep(1 + (rand()%5));

				sem_wait(q); //lock queue mutex lock
				wcount--; //decrement number of women in bathroom
				if(!wcount && mwcount){ //if last woman in bathroom and at least one man is waiting
          			printf("[GENDER SWAP]\n");
					mwcount--; //decrement number of waiting men by 1
					sem_post(mq); //let one man in (pass lock to this man)
				}
				else sem_post(q); //unlock queue mutex lock
				
			}
			/*Symmtry, see comments from previous selective statement */
			else if(GENTS == myGender) {
				sem_wait(q);
				if(wcount | wwcount){
          			printf("%s %d stands in line\n",GENTS==myGender ? "Gentleman" : "Lady" ,omp_get_thread_num());
					mwcount++;
					sem_post(q);
					sem_wait(mq);
				}
				mcount++;
				if(mwcount) {
					mwcount--;
					sem_post(mq);
				}
				else sem_post(q);

				printf("%s %d uses the bathroom\n",GENTS==myGender ? "Gentleman" : "Lady" ,omp_get_thread_num());
				sleep(1 + (rand()%5));

				sem_wait(q);
				mcount--;
				if(!mcount && wwcount){
          			printf("[GENDER SWAP]\n");
					wwcount--;
					sem_post(wq);
				}
				else sem_post(q);
			}
			else printf("Warning - hermaphrodite\n");
			
			sleep(1 + (rand()%15));

		}
	}

	sem_unlink("/ladies");
	sem_unlink("/gents");
	sem_unlink("/queue mutex");
	sem_unlink("/ladies flag");
	sem_unlink("/gents flag");

	printf("\n--- all done! ---\n");
}




