#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

#define DT = 0.5
//#define G = 6.67*exp(-11)

void calculateForces();
void moveBodies();
void init();
void printBodies();

struct Vector
{
   int x;
   int y;
};

struct Body
{
   int x;
   int y;
   int m;
   struct Vector velocity;
   struct Vector force;

};

int numBodies=2, numTimeSteps=2, approxLim=1337, numWorkers=1;
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
	int i;
	for (i=0; i<numTimeSteps; i++) {
		printf("running calculateForces\n");
		calculateForces();
		printf("running moveBodies\n");
		moveBodies();
		printf("running printBodies\n");
		printBodies();
		printf("\n\n\n\n\n");
	}

	return 0;
}

void init(){
	int i;
	for(i = 0; i < numBodies; i++){
		bodyArray[i] = (struct Body) {i,i,1,{0,0},{0,0}};
	}
}

//calculate total force for every pair of bodies
void calculateForces() {
	struct Vector direction;
	double distance, magnitude;
	int i, j;
	for (i = 0; i < numBodies-1; i++){
		for(j = i+1; j < numBodies; j++){
			distance = sqrt(pow((bodyArray[i].x - bodyArray[j].x),2) + pow((bodyArray[i].y - bodyArray[j].y),2));
			magnitude = (6.67*exp(-11) * bodyArray[i].m * bodyArray[j].m) /pow(distance,2);
			direction = (struct Vector) {bodyArray[j].x-bodyArray[i].x, bodyArray[j].y-bodyArray[i].y};
			bodyArray[i].force.x = bodyArray[i].force.x + magnitude*direction.x/distance;
			bodyArray[j].force.x = bodyArray[j].force.x - magnitude*direction.x/distance;
			bodyArray[i].force.y = bodyArray[i].force.y + magnitude*direction.y/distance;
			bodyArray[j].force.y = bodyArray[j].force.y - magnitude*direction.y/distance;
		}
	}
}

//calculate new velocity and position for each body

void moveBodies() {
	struct Vector deltav; //dv=f/m * numTimeSteps
	struct Vector deltap; //dp=(v+dv/2) * numTimeSteps
	int i;
	for (i = 0; i < numBodies ; i++) {
		deltav = (struct Vector) {bodyArray[i].force.x/bodyArray[i].m * numTimeSteps, bodyArray[i].force.y/bodyArray[i].m * numTimeSteps};
		deltap = (struct Vector) {(bodyArray[i].velocity.x + deltav.x/2) * numTimeSteps,
				 (bodyArray[i].velocity.y + deltav.y/2) * numTimeSteps};
		bodyArray[i].velocity.x = bodyArray[i].velocity.x + deltav.x;
		bodyArray[i].velocity.y = bodyArray[i].velocity.y + deltav.y;
		bodyArray[i].x = bodyArray[i].x + deltap.x;
		bodyArray[i].y = bodyArray[i].y + deltap.y;
		bodyArray[i].force.x = bodyArray[i].force.y = 0.0; //reset force vector
	}
}

void printBodies(){
	int i;
	for(i = 0; i < numBodies; i++){
		printf("Body nr %d: Position: x:%d y: %d ---- Mass: %d --- velocity: x:%d y: %d\n",i, bodyArray[i].x, bodyArray[i].y, bodyArray[i].m, bodyArray[i].velocity.x, bodyArray[i].velocity.y);
	}
}
