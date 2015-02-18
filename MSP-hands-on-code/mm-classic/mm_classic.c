// classic.cpp : "Textbook" implementation of matrix multiply

// Author:  Paul J. Drongowski
// Address: Boston Design Center
//          Advanced Micro Devices, Inc.
//          Boxborough, MA 01719
// Date:    20 October 2005
//
// Copyright (c) 2005 Advanced Micro Devices, Inc.

// The purpose of this program is to demonstrate measurement
// and analysis of program performance using AMD CodeAnalyst(tm).
// All engineers are familiar with simple matrix multiplication,
// so this example should be easy to understand.
//
// This implementation of matrix multiplication is a direct
// translation of the "classic" textbook formula for matrix multiply.
// Performance of the classic implementation is affected by an
// inefficient data access pattern, which we should be able to
// identify using CodeAnalyst(TM).

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <omp.h>

#define ROWS 1000     // Number of rows in each matrix
#define COLUMNS 1000  // Number of columns in each matrix

float matrix_a[ROWS][COLUMNS] ;    // Left matrix operand
float matrix_b[ROWS][COLUMNS] ;    // Right matrix operand
float matrix_r[ROWS][COLUMNS] ;    // Matrix result

FILE *result_file ;

void print_and_exit(const char* msg) {
    printf("%s\n", msg);
    exit(119);
}

#define ENABLE_PROFILE_HW 1

#ifdef ENABLE_PROFILE_HW
#include <papi.h>
#define NUM_EVENTS 4
char* events[NUM_EVENTS] = { "PAPI_TOT_INS", 
    "PAPI_L1_DCM", 
    "PAPI_L2_DCM", 
    "PAPI_L3_TCM" };

int event_set = PAPI_NULL;

void add_events_to_counters() {
    PAPI_create_eventset(&event_set);
    for(int i=0; i<NUM_EVENTS; i++) {
        int event_code;
        if (PAPI_event_name_to_code(events[i],&event_code) != PAPI_OK)
            print_and_exit("Error: Could not translate events!");

        if(PAPI_OK != PAPI_add_event(event_set, event_code))
            print_and_exit("Error: Could not add events!");
    }
}

void start_counters() {
    PAPI_start(event_set);
}

void read_counters() {
    long long int event_val[NUM_EVENTS] = {0};
    PAPI_read(event_set, event_val);
    for(int i=0; i<NUM_EVENTS; i++) 
        printf("%s=%lld\n", events[i], event_val[i]);
}

void reset_counters() {
    PAPI_reset(event_set);
}

void init_counters() {
    if(PAPI_VER_CURRENT != PAPI_library_init( PAPI_VER_CURRENT ))
        print_and_exit("Error: Could not init counters!");
    PAPI_register_thread();
}

void remove_counters() {
    PAPI_unregister_thread();
    PAPI_shutdown();
}
#endif

void initialize_matrices()
{
    for (int i = 0 ; i < ROWS ; i++) {
        for (int j = 0 ; j < COLUMNS ; j++) {
            matrix_a[i][j] = (float) 3.14;
            matrix_b[i][j] = (float) 42;
            matrix_r[i][j] = 0.0 ;
        }
    }
}

void print_result()
{
    for (int i = 0 ; i < ROWS ; i++) {
        for (int j = 0 ; j < COLUMNS ; j++) {
            fprintf(result_file, "%6.4f ", matrix_r[i][j]) ;
        }
        fprintf(result_file, "\n") ;
    }
}

void multiply_matrices_improved_parallel() 
{ 
#ifdef ENABLE_PROFILE_HW
    start_counters();
#endif

#pragma omp parallel for 
for (int i = 0 ; i < ROWS ; i++) { 
    for (int k = 0 ; k < COLUMNS ; k++) { 
        for (int j = 0 ; j < COLUMNS ; j++) { 
            matrix_r[i][j] = matrix_r[i][j] + 
            matrix_a[i][k] * matrix_b[k][j] ; 
        } 
    } 
} 

#ifdef ENABLE_PROFILE_HW
    read_counters();
    //reset_counters();
#endif
}

void multiply_matrices_improved() 
{ 
#ifdef ENABLE_PROFILE_HW
    start_counters();
#endif

for (int i = 0 ; i < ROWS ; i++) { 
    for (int k = 0 ; k < COLUMNS ; k++) { 
        for (int j = 0 ; j < COLUMNS ; j++) { 
            matrix_r[i][j] = matrix_r[i][j] + 
            matrix_a[i][k] * matrix_b[k][j] ; 
        } 
    } 
} 

#ifdef ENABLE_PROFILE_HW
    read_counters();
    //reset_counters();
#endif
}

void multiply_matrices_poor()
{
#ifdef ENABLE_PROFILE_HW
    start_counters();
#endif

    for (int i = 0 ; i < ROWS ; i++) {
        for (int j = 0 ; j < COLUMNS ; j++) {
            float sum = 0.0 ;
            for (int k = 0 ; k < COLUMNS ; k++) {
                sum = sum + matrix_a[i][k] * matrix_b[k][j] ;
            }
            matrix_r[i][j] = sum ;
        }
    }

#ifdef ENABLE_PROFILE_HW
    read_counters();
    //reset_counters();
#endif
}

long bots_usecs(void)
{
    struct timeval t;
    gettimeofday(&t, ((void *) 0));
    return t.tv_sec * 1000000 + t.tv_usec;
}

int main(int argc, char* argv[])
{
    if ((result_file = fopen("result.txt", "w")) == NULL) {
        fprintf(stderr, "Couldn't open result file\n") ;
        perror("classic") ;
        return(-1) ;
    }

    fprintf(result_file, "Matrix multiplication\n") ;

#ifdef ENABLE_PROFILE_HW
    init_counters();
    add_events_to_counters();
#endif

    initialize_matrices() ;

    long par_start = bots_usecs();
    multiply_matrices_improved_parallel() ;
    long par_end = bots_usecs();

#ifdef ENABLE_PROFILE_HW
    remove_counters();
#endif

    // Output to file
    print_result();
    fclose(result_file) ;

    printf("Elapsed time: %f sec\n", ((double) (par_end - par_start)) / 1000000) ;


    return( 0 ) ;
}
