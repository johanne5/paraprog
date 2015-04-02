#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <limits.h>

#define DT = 0.5
//#define G = 6.67*exp(-11)

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

struct Limits
{
	int north;
	int west;
	int south;
	int east;
};

struct Hut
{
	struct Hut *upperLeft;
	struct Hut *upperRight;
	struct Hut *lowerLeft;
	struct Hut *lowerRight;
	struct Vector massCenter;
	struct Body *hutBody;
	struct Limits limit;
	int mass;

};

void calculateForce(struct Body *, struct Body *);
void moveBodies();
void init();
void printBodies();
void approxForces(struct Hut *, struct Body *);
void findLimits(int *, int *, int *, int *);
void genHut(struct Hut *, int, int, int, int);
void printHut(struct Hut *, int);
void indent(int);
void worker();

int numBodies=3, numTimeSteps=20, approxLim=10000, numWorkers=1;
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


	printBodies();
	

	#pragma omp parallel num_threads(numWorkers)
	{
		worker();
	}



	return 0;
}

void worker(){
	#pragma omp single
	{
		int i, j, minX, minY, maxX, maxY;
		struct Hut root;
		for (i=0; i<numTimeSteps; i++){
			#pragma omp task shared(minX, minY, maxX, maxY)
				findLimits(&minX, &minY, &maxX, &maxY);
			#pragma omp taskwait
			#pragma omp task shared(root, minX, minY, maxX, maxY)
				genHut(&root, minX, minY, maxX, maxY);
			#pragma omp taskwait
			printf("generation OK!\n");

			//printHut(&root,0);
			

			for(j=0; j<numBodies; j++){
				//printHut(&root,0);
				#pragma omp task shared(root, bodyArray)
					approxForces(&root, &bodyArray[j]);
			}
			#pragma omp taskwait
			printf("root is: %p\n",&root);
			#pragma omp task
				moveBodies();
			#pragma omp taskwait
			printBodies();
		}
	}

}

void init(){
	int i;
	for(i = 0; i < numBodies; i++){
		bodyArray[i] = (struct Body) {1,{0,0},{0,i%2==0?10:-10}, {0,i%2==0?10:-10}};
	}
	bodyArray[1] = (struct Body) {1,{0,0},{10,0}, {0,0}};
}


void findLimits(int *minX, int *minY, int *maxX, int *maxY){
	int i, lminX=INT_MAX, lminY=INT_MAX, lmaxX=INT_MIN, lmaxY=INT_MIN;
	for (i = 0; i < numBodies; i++){
		#pragma omp task shared(lminX, lminY, lmaxX, lmaxY)
			lminX = lminX>bodyArray[i].position.x ? bodyArray[i].position.x : lminX;
		#pragma omp task shared(lminX, lminY, lmaxX, lmaxY)
			lminY = lminY>bodyArray[i].position.y ? bodyArray[i].position.y : lminY;
		#pragma omp task shared(lminX, lminY, lmaxX, lmaxY)
			lmaxX = lmaxX<bodyArray[i].position.x ? bodyArray[i].position.x : lmaxX;
		#pragma omp task shared(lminX, lminY, lmaxX, lmaxY)
			lmaxY = lmaxY<bodyArray[i].position.y ? bodyArray[i].position.y : lmaxY;
		#pragma omp taskwait
	}
	//printf(" %d 	%d 	%d 	%d", lminX, lminY, lmaxX, lmaxY);

	*minX=lminX;
	*minY=lminY;
	*maxX=lmaxX;
	*maxY=lmaxY;
	//printf(" %d 	%d 	%d 	%d\n", minX, minY, maxX, maxY);
}
//gör rutor

void genHut(struct Hut *hut, int minX, int minY, int maxX, int maxY){ //hut as input
	struct Body *firstBodyFound;
	struct Hut *newHuts;
	struct Vector centerOfMass;
	int i=0, count=0;
	while(i<numBodies && count<2){

		if 	(bodyArray[i].position.x <= maxX &&
			bodyArray[i].position.y <= maxY &&
			bodyArray[i].position.x >= minX &&
			bodyArray[i].position.y >= minY) {
				count++;
				if(count==1)
					firstBodyFound=&bodyArray[i];
		}
		i++;
	}
	//printf(" %d 	%d 	%d 	%d\n", minX, minY, maxX, maxY);
	//printf("iran\n");

	(*hut).limit.south = minY;
	(*hut).limit.north = maxY;
	(*hut).limit.west = minX;
	(*hut).limit.east = maxX;
	(*hut).hutBody = NULL;
	(*hut).massCenter= (struct Vector) {0,0};
	if(count==0){
		#ifdef DEBUG
			printf("  Finalizing hut with no body\n");
		#endif
		(*hut).mass=0;
	}
	else if(count==1){
		#ifdef DEBUG
			printf("  Finalizing hut with one body\n");
		#endif
		
		(*hut).massCenter=(struct Vector) {(*firstBodyFound).position.x,(*firstBodyFound).position.y};
		(*hut).mass=(*firstBodyFound).m;
		(*hut).hutBody = firstBodyFound;
	}
	else{
		newHuts = malloc(4*sizeof(struct Hut));
		(*hut).upperLeft=&newHuts[0];
		(*hut).upperRight=&newHuts[1];
		(*hut).lowerLeft=&newHuts[2];
		(*hut).lowerRight=&newHuts[3];

		int horizontal = minX<maxX ? 1 : 0, vertical = minY<maxY ? 1:0;
		if(horizontal && vertical){
			#pragma omp task shared(hut, minX, minY, maxX, maxY)
				genHut((*hut).upperLeft, minX, (minY+maxY)/2+1, (minX+maxX)/2, maxY);
			#pragma omp task shared(hut, minX, minY, maxX, maxY)
				genHut((*hut).upperRight, (minX+maxX)/2+1, (minY+maxY)/2+1, maxX, maxY);
			#pragma omp task shared(hut, minX, minY, maxX, maxY)
				genHut((*hut).lowerLeft, minX, minY, (minX+maxX)/2, (minY+maxY)/2);
			#pragma omp task shared(hut, minX, minY, maxX, maxY)
				genHut((*hut).lowerRight, (minX+maxX)/2+1, minY, maxX, (minY+maxY)/2);
		}
		else if(horizontal){
			#pragma omp task shared(hut, minX, minY, maxX, maxY)
				genHut((*hut).upperLeft, minX, minY, (minX+maxX)/2, maxY);
			#pragma omp task shared(hut, minX, minY, maxX, maxY)
				genHut((*hut).upperRight, (minX+maxX)/2+1, minY, maxX, maxY);
			(*hut).lowerLeft=NULL;
			(*hut).lowerRight=NULL;
		}
		else if(vertical){
			#pragma omp task shared(hut, minX, minY, maxX, maxY)
				genHut((*hut).upperLeft, minX, (minY+maxY)/2+1, maxX, maxY);
			#pragma omp task shared(hut, minX, minY, maxX, maxY)
				genHut((*hut).lowerLeft, minX, minY, maxX, (minY+maxY)/2);		
			(*hut).upperRight=NULL;
			(*hut).lowerRight=NULL;
		}
		else{
			printf("merging!!\n");
			printf("%d %d %d %d\n",minX, minY, maxX, maxY);
			struct Body mergedBodies = (struct Body) {0,{0,0},{minX,minY}, {0,0}};
			for(i=0; i<numBodies; i++){
				printf("position: [%d,%d]\n", bodyArray[i].position.x, bodyArray[i].position.y);
				#pragma omp task shared(bodyArray, minX,minY, mergedBodies)
				{
					printf("position: [%d,%d] -- %d %d %d %d\n", bodyArray[i].position.x, bodyArray[i].position.y,minX, minY, maxX, maxY);
					if(bodyArray[i].position.x == minX && bodyArray[i].position.y == minY){
						printf("hit!!\n");
						#pragma omp atomic
							mergedBodies.m+=bodyArray[i].m;
						bodyArray[i].m=0;
						#pragma omp critical (hutBody)
						{
							if(!(*hut).hutBody)
								(*hut).hutBody=&bodyArray[i];
						}
					}
				}
				
			}
			#pragma omp taskwait
			fprintf(stderr, "iran\n");
			printf("%p\n",(*hut).hutBody);
			*(*hut).hutBody=mergedBodies;
			(*hut).mass=mergedBodies.m;
			(*hut).massCenter=mergedBodies.position;
			fprintf(stderr, "iraq\n");
			(*hut).upperLeft=NULL;
			(*hut).upperRight=NULL;
			(*hut).lowerLeft=NULL;
			(*hut).lowerRight=NULL;
		}

		#pragma omp taskwait

		if(!(*hut).mass){
			int massSum=0;
			centerOfMass = (struct Vector){0,0};
			struct Hut *huts[] = {(*hut).upperLeft, (*hut).upperRight, (*hut).lowerLeft, (*hut).lowerRight};
			
			for (i = 0; i < 4; i++){
				if(huts[i]) {
					massSum+=(*huts[i]).mass;
					centerOfMass.x+=(*huts[i]).massCenter.x;
					centerOfMass.y+=(*huts[i]).massCenter.y;
				}
			}
			(*hut).mass = massSum;
			(*hut).massCenter=(struct Vector){centerOfMass.x/massSum, centerOfMass.y/massSum};	
		}
		printf("quba\n");
		
		
	}
}

void approxForces(struct Hut *hut, struct Body *body){
	int inside =
					(*body).position.x >= (*hut).limit.west &&
					(*body).position.x <= (*hut).limit.east &&
					(*body).position.y >= (*hut).limit.south &&
					(*body).position.y <= (*hut).limit.north
					? 1 : 0;
	struct Body *onlyBodyInHut = (*hut).hutBody;
	int isMyHut = body == onlyBodyInHut ? 1: 0;
	int i;
	
	if(inside && !isMyHut){
		#pragma omp task shared(hut, body)
			if((*hut).upperLeft)
				approxForces((*hut).upperLeft, body);
		#pragma omp task shared(hut, body)
			if((*hut).upperRight)
				approxForces((*hut).upperRight, body);
		#pragma omp task shared(hut, body)
			if((*hut).lowerLeft)
				approxForces((*hut).lowerLeft, body);
		#pragma omp task shared(hut, body)
			if((*hut).lowerRight)
				approxForces((*hut).lowerRight, body);
	}
	else if(!isMyHut){
		int tooClose = 0;
		int hasMass = (*hut).mass;
		

		if(hasMass){
			int distance = sqrt(pow(((*body).position.x - (*hut).massCenter.x),2) + pow(((*body).position.y - (*hut).massCenter.y),2));
			if(distance < approxLim){
				tooClose = 1;
				#ifdef DEBUG
				printf("  Determining too close to approximate (distance: %d)\n",distance);
				#endif
			}
		}
		else{
			#ifdef DEBUG
			printf("This hut looks empty! Is it prettier than mine? Maybe I should move in!\n");
		#endif
		}

		if(tooClose && hasMass){ //too close and has mass
			if(onlyBodyInHut)
				calculateForce(body, onlyBodyInHut);

			else{
				#pragma omp task shared(hut, body)
					if((*hut).upperLeft)
						approxForces((*hut).upperLeft, body);
				#pragma omp task shared(hut, body)
					if((*hut).upperRight)
						approxForces((*hut).upperRight, body);
				#pragma omp task shared(hut, body)
					if((*hut).lowerLeft)
						approxForces((*hut).lowerLeft, body);
				#pragma omp task shared(hut, body)
					if((*hut).lowerRight)
						approxForces((*hut).lowerRight, body);
					}
		}
		else if(hasMass){
			struct Body massCenterBody = (struct Body){(*hut).mass, (struct Vector){0,0}, (*hut).massCenter, (struct Vector){0,0}};
				calculateForce(body, &massCenterBody);
			
			#ifdef DEBUG
				printf("  Approximating using masscenter\n");
			#endif
		}
	}
	else{
		#ifdef DEBUG
			printf("Ooops, this was my own hut :$\n");
		#endif
	}
	#pragma omp taskwait
}

//calculate total force for every pair of bodies
void calculateForce(struct Body *b1, struct Body *b2) {
	#ifdef DEBUG
		printf("Function calculateForce:\n");
	#endif
	struct Vector direction;
	double distance, magnitude;

	distance = sqrt(pow(((*b1).position.x - (*b2).position.x),2) + pow(((*b1).position.y - (*b2).position.y),2));
	if(!distance)
		return;
	magnitude = ( 5000 * (*b1).m * (*b2).m) /pow(distance,2); //6.67*exp(-11)
	direction = (struct Vector) {(*b2).position.x-(*b1).position.x, (*b2).position.y-(*b1).position.y};

	#pragma omp atomic
		(*b1).force.x += magnitude*direction.x/distance;
	#pragma omp atomic
		(*b1).force.y += magnitude*direction.y/distance;
			
}

//calculate new velocity and position for each body

void moveBodies() {
	#ifdef DEBUG
		printf("Function moveBodies\n");
	#endif
	struct Vector deltav; //dv=f/m * numTimeSteps
	struct Vector deltap; //dp=(v+dv/2) * numTimeSteps
	int i;
	for (i = 0; i < numBodies ; i++) {
		#pragma omp task
		{
			int interval=1;
			if(!bodyArray[i].m){
				deltav=(struct Vector) {0,0};
				deltap=(struct Vector) {0,0};
			}
			else{
			deltav = (struct Vector) {bodyArray[i].force.x/bodyArray[i].m * interval, bodyArray[i].force.y/bodyArray[i].m * interval};
			deltap = (struct Vector) {(bodyArray[i].velocity.x + deltav.x/2) * interval,
					 (bodyArray[i].velocity.y + deltav.y/2) * interval};				
			}
			bodyArray[i].velocity.x += deltav.x;
			bodyArray[i].velocity.y += deltav.y;
			bodyArray[i].position.x += deltap.x;
			bodyArray[i].position.y += deltap.y;
			bodyArray[i].force.x = bodyArray[i].force.y = 0.0; //reset force vector

		}
	}
	#pragma omp taskwait
}

void printBodies(){
	int i;
	for(i = 0; i < numBodies; i++){
		printf("Body nr %d: Position: x:%d y: %d ---- Mass: %d --- velocity: x:%d y: %d\n",i, bodyArray[i].position.x, bodyArray[i].position.y, bodyArray[i].m, bodyArray[i].velocity.x, bodyArray[i].velocity.y);
	}
}

void printHut(struct Hut * hut, int ind){
	indent(ind); printf("Mass: %d\n", (*hut).mass);
	indent(ind); printf("Limits: %d<=x<=%d, %d<=y<=%d\n", (*hut).limit.west, (*hut).limit.east, (*hut).limit.south, (*hut).limit.north);
	indent(ind); printf("Contains one body: %p\n", (*hut).hutBody);
	indent(ind); printf("Mass center: [%d,%d]\n", (*hut).massCenter.x, (*hut).massCenter.y);
	if((*hut).upperLeft){
		indent(ind); printf("Upper left:\n");
		printHut((*hut).upperLeft, ind+4);
		indent(ind); printf("Upper right:\n");
		printHut((*hut).upperRight, ind+4);
		indent(ind); printf("Lower left:\n");
		printHut((*hut).lowerLeft, ind+4);
		indent(ind); printf("Lower right:\n");
		printHut((*hut).lowerRight, ind+4);
	}
	
}
void indent(int indent){
	int i;
	for(i=0; i<indent; i++)
		printf(" ");
}