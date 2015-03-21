#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <omp.h>
#include <pthread.h>

#define DT = 0.5
//#define G = 6.67*exp(-11)

void calculateForces(int);
void moveBodies(int);
void init();
void printBodies();

struct Vector
{
   int x;
   int y;
};

struct Body
{
   int m;
   struct Vector force;
   struct Vector position;
   struct Vector velocity;
};

int numBodies=2, numTimeSteps=5, approxLim=1337, numWorkers=13, taskNum;
//b t a w
struct Body* bodyArray;

int main(int argc, char *argv[]){
	while(argc){
		if(!strncasecmp(argv[0], (char * const )"-b", 2))
			numBodies = atoi(argv[0]+2);
		else if(!strncasecmp(argv[0], (char * const )"-t", 2))
			numTimeSteps = atoi(argv[0]+2);
		else if(!strncasecmp(argv[0], (char * const )"-a", 2))
			approxLim = atoi(argv[0]+2);
		else if(!strncasecmp(argv[0], (char * const )"-w", 2))
			numWorkers = atoi(argv[0]+2);
		argc--;
		argv++;
	}
	
	bodyArray = malloc(numBodies*sizeof(struct Body));
	printf("Bodies: %d\nTime steps: %d\nApprox lim: %d\nWorkers: %d\n", numBodies, numTimeSteps, approxLim, numWorkers);
	
	init();
	int i, task;
	#pragma omp parallel num_threads(numWorkers) private(i, task) shared(taskNum) firstprivate(numTimeSteps, numBodies)
	{
		#ifdef DEBUG
			#pragma omp single
			{
				printf("---Concurrency info---\n");
				printf("	Threads: %d\n", omp_get_num_threads());
				printf("\n\n");
			}	
		#endif

		for (i=0; i<numTimeSteps; i++, task=0) {
			#ifdef DEBUG
				printf("---Iteration info---\n");
				printf("	Round: %d\n", i);
				printf("	Task: %d\n", task);
				printf("\n\n");
			#endif

			while(1){
				#pragma omp critical (calcTask)
				{
					task = taskNum++;
				}
				if(task>=numBodies)
					break;
				calculateForces(task);
			}
			#pragma omp barrier
			task=0;
			#pragma omp single
			{
				taskNum=0;
			}
			while(1){
				#pragma omp critical (calcTask)
				{
					task = taskNum++;
				}
				if(task>=numBodies)
					break;
				moveBodies(task);
			}
			#pragma omp barrier
			#pragma omp single
			{
				taskNum=0;
			}
			#pragma omp barrier
		}
	}

	return 0;
}

void init(){
	int i;
	for(i = 0; i < numBodies; i++){
		bodyArray[i] = (struct Body) {1,{0,0},{i%2==0?10:-10,0},{i%2==0?10:-10,5}};
	}
}

//calculate total force for every pair of bodies
void calculateForces(int bodyNum) {
	struct Vector direction;
	double distance, magnitude;
	int j;
		for(j = bodyNum+1; j < numBodies; j++){
			distance = sqrt(pow((bodyArray[bodyNum].position.x - bodyArray[j].position.x),2) + pow((bodyArray[bodyNum].position.y - bodyArray[j].position.y),2));
			magnitude = ( 5000 * bodyArray[bodyNum].m * bodyArray[j].m) /pow(distance,2); //6.67*exp(-11)
			direction = (struct Vector) {bodyArray[j].position.x-bodyArray[bodyNum].position.x, bodyArray[j].position.y-bodyArray[bodyNum].position.y};
			
			#pragma omp critical (force)
			{
				bodyArray[bodyNum].force.x = bodyArray[bodyNum].force.x + magnitude*direction.x/distance;
				bodyArray[j].force.x = bodyArray[j].force.x - magnitude*direction.x/distance;
				bodyArray[bodyNum].force.y = bodyArray[bodyNum].force.y + magnitude*direction.y/distance;
				bodyArray[j].force.y = bodyArray[j].force.y - magnitude*direction.y/distance;
			}
			
		}

		#ifdef DEBUG
			printf("---Force info---\n");
			printf("Force on %d: [%d,%d]\n",bodyNum,bodyArray[bodyNum].force.x,bodyArray[bodyNum].force.y);
			printf("\n\n");
		#endif
}

//calculate new velocity and position for each body

void moveBodies(int bodyNum) {
	struct Vector deltav; //dv=f/m * numTimeSteps
	struct Vector deltap; //dp=(v+dv/2) * numTimeSteps
	int interval=1;
	deltav = (struct Vector) {bodyArray[bodyNum].force.x/bodyArray[bodyNum].m * interval, bodyArray[bodyNum].force.y/bodyArray[bodyNum].m * interval};
	deltap = (struct Vector) {(bodyArray[bodyNum].velocity.x + deltav.x/2) * interval,
			 (bodyArray[bodyNum].velocity.y + deltav.y/2) * interval};
	bodyArray[bodyNum].velocity.x = bodyArray[bodyNum].velocity.x + deltav.x;
	bodyArray[bodyNum].velocity.y = bodyArray[bodyNum].velocity.y + deltav.y;
	bodyArray[bodyNum].position.x = bodyArray[bodyNum].position.x + deltap.x;
	bodyArray[bodyNum].position.y = bodyArray[bodyNum].position.y + deltap.y;
	bodyArray[bodyNum].force.x = bodyArray[bodyNum].force.y = 0.0; //reset force vector
	#ifdef DEBUG
			printf("---Move info---\n");
			printf("	DV on %d: [%d,%d]\n",bodyNum,bodyArray[bodyNum].velocity.x,bodyArray[bodyNum].velocity.y);
			printf("	DP on %d: [%d,%d]\n",bodyNum,bodyArray[bodyNum].position.x,bodyArray[bodyNum].position.y);
			printf("\n\n");
	#endif
}

void printBodies(){
	int i;
	for(i = 0; i < numBodies; i++){
		printf("Body nr %d: Position: x:%d y: %d ---- Mass: %d --- velocity: x:%d y: %d\n",i, bodyArray[i].position.x, bodyArray[i].position.y, bodyArray[i].m, bodyArray[i].velocity.x, bodyArray[i].velocity.y);
	}
}
