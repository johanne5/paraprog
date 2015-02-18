/*
 *  A simple nqueens program that counts the number of possible solutions
 *  to the nqueens problem.
 */





#include <stdlib.h>
#include <stdio.h>
#include <stddef.h>
#include <memory.h>
#include <malloc.h>
#include <omp.h>

#ifndef FALSE
#define FALSE 0
#endif
 
#ifndef TRUE
#define TRUE 1
#endif

#ifndef DEBUG
#define DEBUG 0
#endif

#define BOARD_SIZE 14

static int solutions[] = { 
	1,
	0,
	0,
	2,
	10, /* 5 */
	4,
	40,
	92,
	352,
	724, /* 10 */
	2680,
	14200,
	73712,
	365596,
};
#define MAX_SOLUTIONS sizeof(solutions)/sizeof(int)

#ifndef TASKQ_DEPTH
# define TASKQ_DEPTH 5
#endif

int size = BOARD_SIZE;
int taskq_depth = TASKQ_DEPTH;
int threadreq = 0;
int parallel = TRUE;

double start_time, end_time;

int sol_count = 0;  /* count of solutions to problem */

void help_message(char *prog_name, char arg_type)
{
    fprintf(stderr, "\n");
    fprintf(stderr, "%s usage:\n", prog_name);
    if (arg_type == 'p' || arg_type == '\0') {
        fprintf(stderr, "\n");
        fprintf(stderr, "  Parameters:\n");
        fprintf(stderr, "    -n<num> : board dimensions (num x num)\n");
        fprintf(stderr, "    -d<num> : desired depth for taskq parallelism (num >= 0)\n");
        fprintf(stderr, "\n");
        fprintf(stderr, "  Testing Methods (override above parameters if later in option list):\n");
        fprintf(stderr, "    -c : use correctness testing parameter defaults\n");
        fprintf(stderr, "    -b : use benchmarking parameter defaults\n");
    }
    if (arg_type == 'e' || arg_type == '\0') {
        fprintf(stderr, "\n");
        fprintf(stderr, "  Execution Environment:\n");
        fprintf(stderr, "    -p[<num>] : run in parallel [with num >= 1 threads]\n");
        fprintf(stderr, "    -s        : run sequentially\n");
    }
    if (arg_type == '\0') {
        fprintf(stderr, "\n");
        fprintf(stderr, "  Help:\n");
        fprintf(stderr, "    -h : print this help message\n");
    }
    fprintf(stderr, "\n");
}

void process_args(int argc, char *argv[], int *size, int *taskq_depth, int *threadreq, int *parallel)
{
    int values, i;
 
    /* process command line arguments */
    for (i=1; i<argc; i++) {
        if (argv[i][0] == '-') {
            switch (argv[i][1]) {
              case 'n': /* set array size parameter */
                if (sscanf(&argv[i][2], "%d", size) != 1 || *size < 1) {
                    fprintf(stderr, "%s Warning: argument of -n option unacceptable: %s\n",
                            argv[0], &argv[i][2]);
                    help_message(argv[0], 'p');
                }
                break;
              case 'd': /* set taskq depth parameter */
                if (sscanf(&argv[i][2], "%d", taskq_depth) != 1 || *taskq_depth < 0) {
                    fprintf(stderr, "%s Warning: argument of -d option unacceptable: %s\n",
                            argv[0], &argv[i][2]);
                    help_message(argv[0], 'p');
                }
                break;
              case 'c': /* enable correctness parameter defaults */
                *size = 7;
		*taskq_depth = 20;
                break;
              case 'b': /* enable benchmarking parameter defaults */
                *size = 14;
		*taskq_depth = 4;
                break;
              case 's': /* execute serial run */
                *parallel = FALSE;
                *threadreq = 1;

                break;
              case 'p': /* execute parallel run */
                *parallel = TRUE;
                if ((values = sscanf(&argv[i][2], "%d", threadreq)) != 1) {
                    if (values != EOF) {
                        fprintf(stderr, "%s Warning: argument of -p option unacceptable: %s\n",
                                argv[0], &argv[i][2]);
                        help_message(argv[0], 'e');
                        *threadreq = 0;
                    }
                } else if (*threadreq < 1) {
                    fprintf(stderr, "%s Warning: argument of -p option unacceptable: %s\n",
                            argv[0], &argv[i][2]);
                    help_message(argv[0], 'e');
                    *threadreq = 0;
                } else {
                }
                break;
              case 'h': /* print help message */
                help_message(argv[0], '\0');
                exit(0);
                break;
              default:
                fprintf(stderr, "%s: Warning: command-line option ignored: %s\n",
                        argv[0], argv[i]);
                help_message(argv[0], '\0');
                break;
            }
        } else {
            fprintf(stderr, "%s: Warning: command-line option ignored: %s\n",
                    argv[0], argv[i]);
            help_message(argv[0], '\0');
        }
    }
}

/*
 * <a> contains array of <n> queen positions.  Returns 1
 * if none of the queens conflict, and returns 0 otherwise.
 */
int ok(int n, char *a)
{
     int i, j;
     char p, q;

     for (i = 0; i < n; i++) {
	  p = a[i];

	  for (j = i + 1; j < n; j++) {
	       q = a[j];
	       if (q == p || q == p - (j - i) || q == p + (j - i))
		    return 0;
	  }
     }
     return 1;
}

/* fwd decl */
void nqueens(int n, int j, char *a, int d);

/*
 * Extract out directives to prevent tid calls from affecting performance.
 */
void nqueens_par(int n, int j, char *a, int d)
{
	 int i;
	 for (i = 0; i < n; i++) {
	      /* mallocte a temporary array and copy <a> into it */
	      #pragma omp task untied
	      {

		  char* b = malloc((j + 1) * sizeof(char));
		  memcpy(b, a, j * sizeof(char));
		  b[j] = i;
		  if (ok(j + 1, b)) {
		       nqueens(n, j + 1, b, d+1);
		  }

	      }
	 }
	 #pragma omp taskwait
}


char *sol = NULL;

void nqueens(int n, int j, char *a, int d)
{
     if (n == j) {
          if( sol == NULL ) {
              sol = malloc(n * sizeof(char));
              memcpy(sol, a, n * sizeof(char));
          }
	  sol_count += 1;
}

     /* try each possible position for queen <j> */
     if ( parallel && d < taskq_depth ) {
     	 nqueens_par(n, j, a, d);
     } else {
         int i;
         for (i = 0; i < n; i++) {
              /* mallocte a temporary array and copy <a> into it */
              char* b = malloc((j + 1) * sizeof(char));
              memcpy(b, a, j * sizeof(char));
              b[j] = i;
              if (ok(j + 1, b)) {
                   nqueens(n, j + 1, b, d+1);
              }
         }
     }
}

int main(int argc, char *argv[])
{
     char *a;
     int i;
     int total_count = 0;
     process_args(argc, argv, &size, &taskq_depth, &threadreq, &parallel);

     a = malloc(size * sizeof(char));

     printf( "Parameters:\n" );
     printf( "  algorithm:        %s\n", (parallel) ? "parallel" : "sequential" );
     printf( "  board size:       %d\n", size );
     printf( "  taskq depth:      %d\n", taskq_depth );
     printf( "\n" ) ;
     fflush( stdout );

     start_time = omp_get_wtime();
  #pragma omp parallel 
       {
        #pragma omp single
       {
                 nqueens(size, 0, a, 0);
		 }
	       }
     end_time = omp_get_wtime();

	total_count = sol_count;
     printf("   Number of solutions: %d\n", total_count);
     if ( size > MAX_SOLUTIONS )
	printf("Cannot perform verification\n");
     else
	printf("   Verification: %s\n", total_count == solutions[size-1] ? "Ok" : "FAILED!!!");

     printf("   Solution computation time (in seconds): %lf\n", end_time - start_time );
     printf("\n");
	
     return 0;
}






