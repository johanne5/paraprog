/* 
* File:    prof_utils.h
* CVS:     $Id: prof_utils.h,v 1.8 2010/02/16 20:54:56 terpstra Exp $
* Author:  Dan Terpstra
*          terpstra@cs.utk.edu
* Mods:    Maynard Johnson
*          maynardj@us.ibm.com
* Mods:    <your name here>
*          <your email address>
*/

/* This file contains utility definitions useful for all profiling tests
   It should be #included in:
   - profile.c,
   - sprofile.c,
   - profile_pthreads.c,
   - profile_twoevents.c,
   - earprofile.c,
   - future profiling tests.
*/

#include "papi_test.h"

/* value for scale parameter that sets scale to 1 */
#define FULL_SCALE 65536

/* Internal prototype */
void prof_init(int argc, char **argv, const PAPI_hw_info_t **hw_info, const PAPI_exe_info_t **prginfo);
int prof_events(int num_tests, const PAPI_hw_info_t *hw_info);
void prof_print_address(char *title, const PAPI_exe_info_t *prginfo);
void prof_print_prof_info(caddr_t start, caddr_t end, int threshold, char *event_name);
void prof_alloc(int num, unsigned long plength);
void prof_head(unsigned long blength, int bucket_size, int num_buckets, char *header);
void prof_out(caddr_t start, int n, int bucket, int num_buckets, unsigned int scale);
unsigned long prof_size(unsigned long plength, unsigned scale, int bucket, int *num_buckets);
int prof_check(int n, int bucket, int num_buckets);
int prof_buckets(int bucket);
void do_no_profile(void);

/* variables global to profiling tests */
extern long long **values;
extern char event_name[PAPI_MAX_STR_LEN];
extern int PAPI_event;
extern int EventSet;
extern void *profbuf[5];

/* Itanium returns function descriptors instead of function addresses.
   I couldn't find the following structure in a header file,
   so I duplicated it below.
*/
#if (defined(ITANIUM1) || defined(ITANIUM2))
   struct fdesc {
      void *ip;	/* entry point (code address) */
      void *gp;	/* global-pointer */
   };
#elif defined(__powerpc64__)
	struct fdesc {
		void * ip;   // function entry point
		void * toc;
		void * env;
	};
#endif
