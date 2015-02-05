
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include <sys/time.h>
#include <stdbool.h>

#define MAXWORKERS 20
#ifndef W
	#define W MAXWORKERS
#elif W > MAXWORKERS
	#define W MAXWORKERS
#endif
#define BATCHSIZE 100 //batch size for bag of tasks

/* function prototypes */
void bag_of_tasks(int*, int*);
int find_word(const char*);
char *strrev(char *);
void write_output_buffer(const char*);
void increment_sum(void);

/*words = array for memory adress for each word in the buffer, numWords = number of words in the buffer,
 sum = total number of palindromes, current_task is global storage for bag_of_tasks-function*/
int *words, numWords, sum = 0, current_task = 0, outBuffer_offset =0; 
char *inBuffer, *outBuffer; //buffer to read the input in to
FILE *outFile;
pthread_mutex_t write_lock, sum_lock, bag_lock; //mutex locks for shared variables and file writing

/* strrev-function reverses the string pointed to by the parameter */
char *strrev(char *str) {
	char *p1, *p2;

	if (! str || ! *str)
		return str;
	for (p1 = str, p2 = str + strlen(str) - 1; p2 > p1; ++p1, --p2) {
		*p1 ^= *p2;
		*p2 ^= *p1;
		*p1 ^= *p2;
	}
	return str;
}

/* timer */
double read_timer() {
    static bool initialized = false;
    static struct timeval start;
    struct timeval end;
    if( !initialized )
    {
        gettimeofday( &start, NULL );
        initialized = true;
    }
    gettimeofday( &end, NULL );
    return (end.tv_sec - start.tv_sec) + 1.0e-6 * (end.tv_usec - start.tv_usec);
}

/*Writes string to output buffer*/
void write_output_buffer(const char *p) {
	pthread_mutex_lock(&write_lock); //locks mutex
	strcpy(outBuffer + outBuffer_offset, p); //copies string to output buffer
	outBuffer_offset+=strlen(p); //increments the buffer offset
	outBuffer[outBuffer_offset++] = '\n'; //adds a newline and increments offset by 1
	pthread_mutex_unlock(&write_lock); //unlocks mutex
}
/*Increments the shared sum variable*/
void increment_sum() {
	pthread_mutex_lock(&sum_lock); //locks mutex
	sum++; //increments the sum
	pthread_mutex_unlock(&sum_lock); //unlocks mutex
}

/* Gives a range of tasks from a value start to a value end where end is at most the last word in the inBuffer */
void bag_of_tasks(int *start, int *end) {
	pthread_mutex_lock(&bag_lock); //locks the mutex
	if(current_task==numWords) *start = -1; //if no more tasks, write -1
	else {
		*start = current_task; //else give a range of tasks
		*end = (current_task + BATCHSIZE -1 > numWords -1) ? numWords -1 : current_task + BATCHSIZE -1;
		current_task = *end + 1; //update offset to next task
	}
	pthread_mutex_unlock(&bag_lock); //unlock mutex
	
}

/* Searches through the inBuffer for a match against the word provided as argument */
int find_word(const char *w) {
	int i;
	for(i = 0; i < numWords; i++)
		if(!strcasecmp(w, inBuffer + words[i])) return i; //if word parameter matches current word, returns its index
	return -1; // if no match return -1
}

void worker(void *arg) {
	int start=0, end, myPalindromes=0;
	long myid = (long) arg;
	char wordBuffer[30];
	while(1) {
		bag_of_tasks(&start,&end); //aquire a range of tasks
		if(start==-1) break; //if no more tasks, break
		while(start<=end) { //while all tasks have not been done
			strcpy(wordBuffer, inBuffer + words[start]); //copy word to small buffer
			strrev(wordBuffer); //reverse the word
			if( -1 != find_word(wordBuffer) ) { //search for reversed word in the largebuffer
				increment_sum(); //if match increment sum
				myPalindromes++; //increment threads private sum of palindromes
				write_output_buffer(inBuffer + words[start]); //write the word to output buffer
			}
			start++;
		}
	}	
	printf("Thread with ID %lu found %d palindromes\n", myid, myPalindromes); //when finished, print some info
}

int main(int argc, char *argv[]) {
	FILE *inFile;
	long numBytes, l;
	double start_time, end_time;
	int i, j, wordstart;
 	pthread_attr_t attr;
  	pthread_t workerid[W];

	inFile = fopen("words","r"); //open infile for reading
	if(!inFile) {
		fprintf(stderr, "Could not open file \"words\"\n");
		exit(1);
	}
	outFile = fopen("output", "w"); //open outfile for writing
	fseek(inFile, 0L, SEEK_END);
	numBytes = ftell(inFile); //set numBytes to file size
	fseek(inFile, 0L, SEEK_SET);	
	inBuffer = (char*)calloc(numBytes, sizeof(char)); //allocate heap memory for inbuffer
	outBuffer = (char*)calloc(numBytes, sizeof(char)); //allocate the same amount for outbuffer (perhaps excessive)
	fread(inBuffer, sizeof(char), numBytes, inFile); //read input file to inbuffer
	fclose(inFile); //close the input file for reading

	for(i=0, numWords=0; i < numBytes; i++) //count the number of words
		if('\n'==inBuffer[i])
			numWords++;
	words = malloc(sizeof(int) * numWords); //allocate appropriate amount of heap memory for words offset array
	for(i = 0, j=0, wordstart=0; i < numBytes; i++) //assign each word its offset in the array
		if(inBuffer[i]=='\n') {
			inBuffer[i]='\0';
			words[j++] = wordstart;
			wordstart = i+1;
		}
	/* initiate threads and mutexes */
	pthread_attr_init(&attr);
  	pthread_attr_setscope(&attr, PTHREAD_SCOPE_SYSTEM);
  	pthread_mutex_init(&bag_lock, NULL);
  	pthread_mutex_init(&write_lock, NULL);
  	pthread_mutex_init(&sum_lock, NULL);
  	start_time = read_timer(); //read timer
  	for (l = 0; l < W; l++)
    	pthread_create(&workerid[l], &attr, (void *)&worker, (void *) l);
   	for (l = 0; l < W; l++) //wait for each thread to finish
       pthread_join(workerid[l], NULL);
   	end_time = read_timer(); //read timer
   	outBuffer[outBuffer_offset]='\0'; //null-terminate the output buffer
   	fprintf(outFile, "%s", (const char *)outBuffer); //write output buffer to output file
   	fclose(outFile); free(inBuffer); free(outBuffer); free(words); //close output file and free memory
   	/* print out info */
  	printf("A total number of %d palindromes found by %d threads!\n",sum, W);
   	printf("The execution time was %g sec\n", end_time - start_time);		
}
