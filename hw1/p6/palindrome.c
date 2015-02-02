
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include <sys/time.h>
#include <stdbool.h>


#define MAXWORKERS 8
#ifndef WORKERS
	#define WORKERS MAXWORKERS
#endif
#define WORDS 26000
#define STRIP 100

int words[WORDS], numWords, palindromesOffset = 0, totalPalindromes = 0;
char *buffer;
FILE *of;
double start_time, end_time;

char *strrev(char *str)
{
      char *p1, *p2;

      if (! str || ! *str)
            return str;
      for (p1 = str, p2 = str + strlen(str) - 1; p2 > p1; ++p1, --p2)
      {
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


pthread_mutex_t pali_lock;
void write_palindromes(const char *p) {
	pthread_mutex_lock(&pali_lock);
	fprintf(of, "%s", (const char *)p);
	pthread_mutex_unlock(&pali_lock);
}

pthread_mutex_t tot_pali;
void incr_pali() {
	pthread_mutex_lock(&tot_pali);
	totalPalindromes++;
	pthread_mutex_unlock(&tot_pali);
}

pthread_mutex_t bag_lock;
int current_word = 0;
void bag(int *start, int *end) {
	pthread_mutex_lock(&bag_lock);
	if(current_word==numWords) *start = -1;
	else {
		*start = current_word;
		*end = (current_word + STRIP -1 > numWords -1) ? numWords -1 : current_word + STRIP -1;
		current_word = *end + 1;
	}
	pthread_mutex_unlock(&bag_lock);
	
}

int find_word(const char *w) {
	int i, cmp;

	for(i = 0; i < numWords; i++) {
		cmp = strcasecmp(w, buffer + words[i]);
		if(!cmp) return i;
	}
	return -1;
}

void bag(int*, int*);
int find_word(const char*);
char *strrev(char *);
void write_palindromes(const char*);
void incr_pali(void);

void worker(void *arg) {
	int start, end, match, numPalindromes, offset;
	long myid = (long) arg;
	char buf[30];
	char res[5000];
	while(1) {
		bag(&start,&end);
		if(start==-1) break;
		while(start<=end) {
			strcpy(buf, buffer + words[start]);	
			strrev(buf);
			if(find_word(buf)>-1) {
				incr_pali();
				numPalindromes++;
				strcpy(res + offset, buffer + words[start]);
				offset+=strlen(buffer + words[start]);
				res[offset] = '\n';
				offset++;
			}
			start++;
		}
	}
	res[offset]='\0';
	write_palindromes((const char *) &res);
	printf("Thread with ID %lu found %d palindromes\n", myid, numPalindromes);
}

int main(int argc, char *argv[]) {
	
	FILE *file;
	long numbytes;
	int index, i, wordstart, numWorkers;
	long l; /* use long in case of a 64-bit system */
 	pthread_attr_t attr;
  	pthread_t workerid[MAXWORKERS];

	file = fopen("words","r");
	of = fopen("output", "w");
	if(!file) {
		fprintf(stderr, "no such file\n");
		exit(1);
	}
	fseek(file, 0L, SEEK_END);
	numbytes = ftell(file);
	fseek(file, 0L, SEEK_SET);	
	buffer = (char*)calloc(numbytes, sizeof(char));	

	fread(buffer, sizeof(char), numbytes, file);
	fclose(file);

	numWords=0;
	wordstart=0;
	for(i = 0; i < numbytes; i++)
		if(buffer[i]=='\n') {
			buffer[i]='\0';
			words[numWords++] = wordstart;
			wordstart = i+1;
		}
	numWorkers = WORKERS > MAXWORKERS ? MAXWORKERS : WORKERS;
	pthread_attr_init(&attr);
  	pthread_attr_setscope(&attr, PTHREAD_SCOPE_SYSTEM);

  	pthread_mutex_init(&bag_lock, NULL);
  	pthread_mutex_init(&pali_lock, NULL);
  	pthread_mutex_init(&tot_pali, NULL);

  	start_time = read_timer();
  	for (l = 0; l < numWorkers; l++)
    	pthread_create(&workerid[l], &attr, (void *)&worker, (void *) l);
   	for (l = 0; l < numWorkers; l++)
       pthread_join(workerid[l], NULL);
   	end_time = read_timer();
  	printf("Total palindromes found: %d\n",totalPalindromes);
   	printf("The execution time was %g sec\n", end_time - start_time);
   	fclose(of);
	free(buffer);
}