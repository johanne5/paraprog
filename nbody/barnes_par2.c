#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <limits.h>
#include <omp.h>

#define DT = 0.5
//#define G = 6.67*exp(-11)
//#define read(b) (*b)

typedef struct Vector2s {
   int x;
   int y;
} Vector2;

typedef struct Body2s {
   int mass;
   Vector2 force;
   Vector2 position;
   Vector2 velocity;
} Body2;

typedef struct Limits {
	int north;
	int west;
	int south;
	int east;
} Limit;

typedef struct Hut2s
{
	struct Hut2s *nw;
	struct Hut2s *ne;
	struct Hut2s *sw;
	struct Hut2s *se;
	Vector2 massCenter;
	Limit limits;
	int mass;
	int bodyCount;
	omp_lock_t *lock;

} Hut2;

void approxForces2(Hut2 *, Body2 *);
void approxForces2_calculateForce(Hut2 *, Body2 *);
void addBodyToHut(Hut2 *, Body2 *);
void moveBodies();
void init();
void printBodies();
//void approxForces(struct Hut *, struct Body *);
void findRootLimits(Limit *);
//void genHut(struct Hut *, int, int, int, int);
//void printHut(struct Hut *, int);
//void indent(int);
void taskHandler();
void cleanUp();
Hut2 *makeHut();

int numBodies=3, numTimeSteps=20, approxLim=10000, numWorkers=1, hutCounter=0;
omp_lock_t *locks = NULL;
Hut2 *huts = NULL;
//b t a w
Body2 *bodyArray;

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
	
	bodyArray = malloc(numBodies*sizeof(Body2));
	printf("Bodies: %d\nTime steps: %d\nApprox lim: %d\nWorkers: %d\n", numBodies, numTimeSteps, approxLim, numWorkers);
	
	init();	

	#pragma omp parallel num_threads(numWorkers)
		#pragma omp single
			taskHandler();
	cleanUp();
	return 0;
}

void taskHandler(){
	int i, j;
	double tmp=0;
	Limit rootLimits;
	Hut2 *root;

	for (i=0; i<numTimeSteps; i++){
		#ifdef DEBUG 
			printf("--- NEW ROUND %d ---\n", i ); 
		#endif
		hutCounter=0;
		
		findRootLimits(&rootLimits);

		#pragma omp taskwait
		#ifdef DEBUG 
			printf("taskhandler: calculating largest side\n"); 
		#endif
		if((rootLimits.north - rootLimits.south) > tmp || (rootLimits.east - rootLimits.west) > tmp) {
			tmp = (rootLimits.north - rootLimits.south) > (rootLimits.east - rootLimits.west) ? (rootLimits.north - rootLimits.south) : (rootLimits.east - rootLimits.west);
			locks = realloc(locks, 1+(int)(log2(tmp)+1)*4*sizeof(omp_lock_t));
			huts = realloc(huts, 1+(int)(log2(tmp)+1)*4*sizeof(Hut2));
			#ifdef DEBUG 
				printf("now memory for %d huts\n", 1+(int)(log2(tmp)+1)*4); 
			#endif	
		}
		root = makeHut();
		root->limits = rootLimits;
		
		
		#ifdef DEBUG 
			printf("taskhandler: findRootLimits OK\n"); 
		#endif
		for(j=0; j<numBodies; j++){
			#pragma omp task shared(root, bodyArray)
			{
				printf("taskhandler: root bodyCount=%d\n", root->bodyCount);
					addBodyToHut(root, &bodyArray[j]);
			}
		}
		#pragma omp taskwait
		#ifdef DEBUG 
				printf("taskhandler: addBodyToHut OK\n"); 
		#endif
		for(j=0; j<numBodies; j++){
			#pragma omp task shared(root, bodyArray)
				approxForces2(root, &bodyArray[j]);
		}
		#pragma omp taskwait
		#ifdef DEBUG 
				printf("taskhandler: approxForces2 OK\n"); 
		#endif
		#pragma omp task
			moveBodies();
		#pragma omp taskwait
		#ifdef DEBUG 
				printf("taskhandler: moveBodies OK\n"); 
		#endif
		printBodies();
		
	}
}

void init(){
	int i;
	for(i = 0; i < numBodies; i++){
		bodyArray[i] = (Body2) {1,{0,0},{0,i%2==0?10:-10}, {0,i%2==0?10:-10}};
	}
	bodyArray[0] = (Body2) {1,{0,0},{0,0}, {0,0}};
	bodyArray[1] = (Body2) {1,{0,0},{10,10}, {0,0}};
	bodyArray[2] = (Body2) {1,{0,0},{20,20}, {0,0}};
}

Hut2 *makeHut() {
	#ifdef DEBUG 
			printf("making new hut\n"); 
	#endif
	int i;
	#pragma omp critical (makeHut)
		i=hutCounter++;
	omp_init_lock(&(locks[i]));
	huts[i] = (Hut2) {NULL,NULL,NULL,NULL,{0,0},{0,0,0,0},0,0, &(locks[i])};
	return &(huts[i]);
}

void cleanUp() {
	free(bodyArray);
	free(locks);
	free(huts);
}


void findRootLimits(Limit *lims) {

	#ifdef DEBUG
		printf("findRootLimits: running\n");
	#endif
	int i;
	lims->west=INT_MAX;
	lims->south=INT_MAX;
	lims->east=INT_MIN;
	lims->north=INT_MIN;
	for (i = 0; i < numBodies; i++){
		#pragma omp task
		{
			lims->south = lims->south>bodyArray[i].position.y ? bodyArray[i].position.y : lims->south;
		}
		#pragma omp task
		{
			lims->west = lims->west>bodyArray[i].position.x ? bodyArray[i].position.x : lims->west;
		}
		#pragma omp task
		{
			lims->east = lims->east<bodyArray[i].position.x ? bodyArray[i].position.x : lims->east;	
		}
		#pragma omp task
		{
			lims->north = lims->north<bodyArray[i].position.y ? bodyArray[i].position.y : lims->north;
		}
		#pragma omp taskwait
	
	}
	#ifdef DEBUG
		printf("findRootLimits: finished [%d,%d,%d,%d]\n",lims->north, lims->west, lims->south, lims->east); 
	#endif
}

int addBodyToHut_belongsNW(Limit, Vector2);
int addBodyToHut_belongsNE(Limit, Vector2);
int addBodyToHut_belongsSW(Limit, Vector2);
int addBodyToHut_belongsSE(Limit, Vector2);
void addBodyToHut_limitsNW(Limit *, Limit *);
void addBodyToHut_limitsNE(Limit *, Limit *);
void addBodyToHut_limitsSW(Limit *, Limit *);
void addBodyToHut_limitsSE(Limit *, Limit *);
void *addBodyToHut_makeNewHut(Limit);

void addBodyToHut(Hut2 *hut, Body2 *body) {
	
	#ifdef DEBUG 
		printf("addBodyToHut: running\n");
		printf("addBodyToHut: bodyCount = %d\n",hut->bodyCount);
	 	printf("addBodyToHut: waiting for %p\n",hut->lock);
	#endif
	omp_set_lock(hut->lock);
	hut->bodyCount++;
	#ifdef DEBUG 
		printf("addBodyToHut: aquired %p, bodyCount = %d\n",hut->lock, hut->bodyCount); 
	#endif
	if(hut->bodyCount-1 && hut->massCenter.x == body->position.x && hut->massCenter.y == body->position.y) {
		hut->mass += body->mass;
		#ifdef DEBUG 
			printf("addBodyToHut: at masscenter... adding it's weight\n"); 
		#endif
		#ifdef DEBUG 
			printf("addBodyToHut: releasing %p\n", hut->lock); 
		#endif
		omp_unset_lock(hut->lock);
	}
	else if(hut->bodyCount-1==0) {
		#ifdef DEBUG 
			printf("addBodyToHut: hut is empty\n"); 
		#endif
		hut->mass+=body->mass;
		hut->massCenter = body->position;
		#ifdef DEBUG 
			printf("addBodyToHut: releasing %p\n", hut->lock); 
		#endif
		omp_unset_lock(hut->lock);
	}	
	else {
		#ifdef DEBUG 
			printf("addBodyToHut: hut contains one or more bodies\n"); 
		#endif
		Hut2 *tmpHutPtr;
		if(hut->bodyCount-1==1) {
			#ifdef DEBUG 
				printf("addBodyToHut: hut contains exactly one body\n"); 
			#endif
			tmpHutPtr = makeHut();
			tmpHutPtr->massCenter =  hut->massCenter;
			tmpHutPtr->mass = hut->mass;
			tmpHutPtr->bodyCount = 1;
			if(addBodyToHut_belongsNW(hut->limits, hut->massCenter)){	
				addBodyToHut_limitsNW(&(hut->limits), &(tmpHutPtr->limits));
				hut->nw = tmpHutPtr;
			} 
				
			else if(addBodyToHut_belongsNE(hut->limits, hut->massCenter)){
				addBodyToHut_limitsNE(&(hut->limits), &(tmpHutPtr->limits));
				hut->ne = tmpHutPtr;
			}
			else if(addBodyToHut_belongsSW(hut->limits, hut->massCenter)){
				addBodyToHut_limitsSW(&(hut->limits), &(tmpHutPtr->limits));
				hut->sw = tmpHutPtr;
			}
			else if(addBodyToHut_belongsSE(hut->limits, hut->massCenter)){
				addBodyToHut_limitsSE(&(hut->limits), &(tmpHutPtr->limits));
				hut->se = tmpHutPtr;
			}
			else {
				fprintf(stderr, "Error 1\n");
				exit(1);
			}
		}

		hut->massCenter = (Vector2) {hut->mass*hut->massCenter.x + body->mass*body->position.x,hut->mass*hut->massCenter.y + body->mass*body->position.y};
		hut->mass = hut->mass + body->mass;
		hut->massCenter = (Vector2) {hut->massCenter.x/=hut->mass,hut->massCenter.y/=hut->mass};

		if(addBodyToHut_belongsNW(hut->limits, body->position)){	
			if(!hut->nw) {
				hut->nw = makeHut();
				addBodyToHut_limitsNW(&(hut->limits), &(hut->nw->limits));
			} 
			tmpHutPtr = hut->nw;
		}		
		else if(addBodyToHut_belongsNE(hut->limits, body->position)){
			if(!hut->ne) {
				hut->ne = makeHut();
				addBodyToHut_limitsNE(&(hut->limits), &(hut->ne->limits));
			}
			tmpHutPtr = hut->ne;
		}
		else if(addBodyToHut_belongsSW(hut->limits, body->position)){
			if(!hut->sw) {
				hut->sw = makeHut();
				addBodyToHut_limitsSW(&(hut->limits), &(hut->sw->limits));
			}
			tmpHutPtr = hut->sw;
		}
		else if(addBodyToHut_belongsSE(hut->limits, body->position)){
			if(!hut->se) {
				hut->se = makeHut();
				addBodyToHut_limitsSE(&(hut->limits), &(hut->se->limits));
			}
			tmpHutPtr = hut->se;
		}
		else {
				fprintf(stderr, "Error 2\n");
				fprintf(stderr, "Position: [%d,%d] Limits: [%d,%d,%d,%d]\n", body->position.x, body->position.y, hut->limits.north, hut->limits.west, hut->limits.south, hut->limits.east);
				exit(1);
		}
		#ifdef DEBUG 
			printf("addBodyToHut: going deeper\n"); 
		#endif
		#ifdef DEBUG 
			printf("addBodyToHut: releasing %p\n", hut->lock); 
		#endif
		omp_unset_lock(hut->lock);
		addBodyToHut(tmpHutPtr, body);
		#ifdef DEBUG 
			printf("addBodyToHut: check\n"); 
		#endif
	}

	#ifdef DEBUG
		printf("addBodyToHut: finished\n"); 
	#endif

}


int addBodyToHut_belongsNW(Limit lims, Vector2 pos) {
	return pos.y>(lims.north+lims.south)/2 && pos.x<=(lims.east+lims.west)/2 ? 1 : 0;
}
int addBodyToHut_belongsNE(Limit lims, Vector2 pos) {
	return pos.y>(lims.north+lims.south)/2 && pos.x>(lims.east+lims.west)/2 ? 1 : 0;
}
int addBodyToHut_belongsSW(Limit lims, Vector2 pos) {
	return pos.y<=(lims.north+lims.south)/2 && pos.x<=(lims.east+lims.west)/2 ? 1 : 0;
}
int addBodyToHut_belongsSE(Limit lims, Vector2 pos) {
	return pos.y<=(lims.north+lims.south)/2 && pos.x>(lims.east+lims.west)/2 ? 1 : 0;
}

void addBodyToHut_limitsNW(Limit *parent, Limit *child){
	*child = (Limit) {parent->north, parent->west, (parent->north+parent->south)/2+1, (parent->east+parent->west)/2};
}
void addBodyToHut_limitsNE(Limit *parent, Limit *child){
	*child = (Limit) {parent->north, (parent->east+parent->west)/2+1, (parent->north+parent->south)/2+1, parent->east};
}
void addBodyToHut_limitsSW(Limit *parent, Limit *child){
	*child = (Limit) {(parent->north+parent->south)/2,parent->west, parent->south, (parent->east+parent->west)/2};
}
void addBodyToHut_limitsSE(Limit *parent, Limit *child){
	*child = (Limit) {(parent->north+parent->south)/2,(parent->east+parent->west)/2+1, parent->south, parent->east};
}

void approxForces2(Hut2 *hut, Body2 *body){
	#ifdef DEBUG
		printf("approxForces2: running\n"); 
	#endif
	int sameHut =
					body->position.x >= hut->limits.west &&
					body->position.x <= hut->limits.east &&
					body->position.y >= hut->limits.south &&
					body->position.y <= hut->limits.north
					? 1 : 0;
	int i;
	int tooClose = sqrt(pow((body->position.x - hut->massCenter.x),2) + pow((body->position.y - hut->massCenter.y),2));
	tooClose = tooClose < approxLim ? 1 : 0;

	if(hut->massCenter.x == body->position.x && hut->massCenter.y == body->position.y);
	else if(hut->bodyCount==1)
		approxForces2_calculateForce(hut, body);
	else if(sameHut || tooClose) {
		if(hut->nw)
			approxForces2(hut->nw, body);
		if(hut->ne)
			approxForces2(hut->ne, body);
		if(hut->sw)
			approxForces2(hut->sw, body);
		if(hut->se)
			approxForces2(hut->se, body);
	}
	else if(!tooClose)
		approxForces2_calculateForce(hut, body);
	#ifdef DEBUG
		printf("approxForces2: finished\n"); 
	#endif
}

//calculate total force for every pair of bodies
void approxForces2_calculateForce(Hut2 *hut, Body2 *body) {
	#ifdef DEBUG 
		printf("approxForces2_calculateForce: running\n"); 
	#endif
	Vector2 direction;
	double distance, magnitude;

	distance = sqrt(pow((body->position.x - hut->massCenter.x),2) + pow((body->position.y - hut->massCenter.y),2));
	if(!distance)
		return;
	magnitude = ( 300 * body->mass * hut->mass/pow(distance,2)); //6.67*exp(-11)
	direction = (Vector2) {hut->massCenter.x-body->position.x, hut->massCenter.y-body->position.y};

	#pragma omp atomic
		body->force.x += magnitude*direction.x/distance;
	#pragma omp atomic
		body->force.y += magnitude*direction.y/distance;
	#ifdef DEBUG 
			printf("approxForces2_calculateForce: finished\n"); 
	#endif
}

//calculate new velocity and position for each body

void moveBodies() {
	#ifdef DEBUG 
		printf("moveBodies: running\n"); 
	#endif
	Vector2 deltav; //dv=f/m * numTimeSteps
	Vector2 deltap; //dp=(v+dv/2) * numTimeSteps
	int i;
	for (i = 0; i < numBodies ; i++) {
		#pragma omp task
		{
		int interval=1;
		
		deltav = (Vector2) {bodyArray[i].force.x/bodyArray[i].mass * interval, bodyArray[i].force.y/bodyArray[i].mass * interval};
		deltap = (Vector2) {(bodyArray[i].velocity.x + deltav.x/2) * interval,
				 (bodyArray[i].velocity.y + deltav.y/2) * interval};				
		
		bodyArray[i].velocity.x += deltav.x;
		bodyArray[i].velocity.y += deltav.y;
		bodyArray[i].position.x += deltap.x;
		bodyArray[i].position.y += deltap.y;
		bodyArray[i].force.x = bodyArray[i].force.y = 0.0; //reset force vector

		}
	}
	#pragma omp taskwait
	#ifdef DEBUG 
		printf("moveBodies: finished\n"); 
	#endif
}

void printBodies(){
	#ifdef DEBUG 
		printf("printBodies: running\n"); 
	#endif
	int i;
	for(i = 0; i < numBodies; i++){
		printf("Body nr %d: Position: x:%d y: %d ---- Mass: %d --- velocity: x:%d y: %d\n",i, bodyArray[i].position.x, bodyArray[i].position.y, bodyArray[i].mass, bodyArray[i].velocity.x, bodyArray[i].velocity.y);
	}
	#ifdef DEBUG 
		printf("printBodies: finished\n"); 
	#endif
}