
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include <sys/time.h>
#include <stdbool.h>
#include <omp.h>

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

/*words = array for memory adress for each word in the buffer, numWords = number of words in the buffer,
 sum = total number of palindromes, current_task is global storage for bag_of_tasks-function*/
int *words, *palindromes, numWords, gcount = 0, current_task = 0, outBuffer_offset =0; 
char *inBuffer, *outBuffer; //buffer to read the input in to
FILE *outFile;

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

/*Writes string to output buffer*/
void write_output_buffer(const char *p) {
	strcpy(outBuffer + outBuffer_offset, p); //copies string to output buffer
	outBuffer_offset+=strlen(p); //increments the buffer offset
	outBuffer[outBuffer_offset++] = '\n'; //adds a newline and increments offset by 1
}

/* Gives a range of tasks from a value start to a value end where end is at most the last word in the inBuffer */
void bag_of_tasks(int *start, int *end) {
	if(current_task==numWords) *start = -1; //if no more tasks, write -1
	else {
		*start = current_task; //else give a range of tasks
		*end = (current_task + BATCHSIZE -1 > numWords -1) ? numWords -1 : current_task + BATCHSIZE -1;
		current_task = *end + 1; //update offset to next task
	}
}

/* Searches through the inBuffer for a match against the word provided as argument */
int find_word(const char *w) {
	int i;
	for(i = 0; i < numWords; i++)
		if(!strcasecmp(w, inBuffer + words[i])) { palindromes[i]=1; return i; } //if word parameter matches current word, returns its index
	return -1; // if no match return -1
}

int main(int argc, char *argv[]) {
	FILE *inFile;
	long numBytes, l;
	double start_time, end_time;
	int i, j, wordstart, numWorkers;
 	pthread_attr_t attr;
  	pthread_t workerid[W];

  	if(argc>2) numWorkers = atoi(argv[2]);
  	else numWorkers = MAXWORKERS;
  	numWorkers = numWorkers > MAXWORKERS ? MAXWORKERS : numWorkers;
  	
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
	palindromes = malloc(sizeof(int) * numWords); //allocate appropriate amount of heap memory for palindromes array
	for(i=0; i<numWords; i++) //zero-initiate palindromes array
		palindromes[i]=0;
	for(i = 0, j=0, wordstart=0; i < numBytes; i++) //assign each word its offset in the array
		if(inBuffer[i]=='\n') {
			inBuffer[i]='\0';
			words[j++] = wordstart;
			wordstart = i+1;
		}
	if(argc>1) numWords= atoi(argv[1]) > numWords ? numWords : atoi(argv[1]); //limits the dictionary
	omp_set_num_threads(numWorkers);

	int count, start, end, isPalindrome, myid;
	char wordBuffer[30];
	start_time = omp_get_wtime();
	#pragma omp parallel num_threads(numWorkers) private(count, start, end, wordBuffer, isPalindrome, myid) shared(gcount)
	{
		myid = omp_get_thread_num();
		start=0;
		count=0;
		while(1) {
			#pragma omp critical (bag)
			bag_of_tasks(&start,&end); //aquire a range of tasks
			if(start==-1) break; //if no more tasks, break
			while(start<=end) { //while all tasks have not been done
				isPalindrome=0;
				strcpy(wordBuffer, inBuffer + words[start]); //copy word to small buffer
				strrev(wordBuffer); //reverse the word
				if(!strcasecmp(wordBuffer, inBuffer + words[i])) isPalindrome=1;
				else if(palindromes[start]) isPalindrome=1;
				else if( -1 != find_word(wordBuffer) ) isPalindrome=1; //search for reversed word in the largebuffer
				if(isPalindrome) {
					count++; //increment threads private sum of palindromes
					#pragma omp atomic
					gcount++;
					#pragma omp critical (write)
					write_output_buffer(inBuffer + words[start]); //write the word to output buffer
				}
			start++;
			}
		}
		if(!argc>3)cprintf("Thread with ID %lu found %d palindromes\n", myid, count); //when finished, print some info
	}
	//implicit barrier
	end_time = omp_get_wtime();
   	outBuffer[outBuffer_offset]='\0'; //null-terminate the output buffer
   	fprintf(outFile, "%s", (const char *)outBuffer); //write output buffer to output file
   	fclose(outFile); free(inBuffer); free(outBuffer); free(words); //close output file and free memory
   	/* print out info */
   	if(argc>3) printf("%lf\n", (end_time-start_time));
   	else {
   		printf("A total number of %d palindromes found by %d threads!\n",gcount, W);
  	 	printf("The execution time was %g sec\n", end_time - start_time);
   	}
  			
}
