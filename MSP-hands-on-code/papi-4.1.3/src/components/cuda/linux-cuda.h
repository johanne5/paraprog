/****************************/
/* THIS IS OPEN SOURCE CODE */
/****************************/

/** 
 * @file    linux-cuda.h
 * CVS:     $Id: linux-cuda.h,v 1.1 2011/03/11 23:06:54 jagode Exp $
 * @author  Heike Jagode (in collaboration with Robert Dietrich, TU Dresden)
 *          jagode@eecs.utk.edu
 * Mods:	<your name here>
 *			<your email address>
 * @ingroup papi_components 		
 * 
 * CUDA component 
 * 
 * Tested version of CUPTI (CUDA Tools SDK 4.0)
 *
 * @brief
 *  This file has the source code for a component that enables PAPI-C to 
 *  access hardware monitoring counters for GPU devices through the  
 *  CUPTI library.
 */

#ifndef _PAPI_CUDA_H
#define _PAPI_CUDA_H

/* Headers required by CuPTI */
#include "cupti_events.h"
#include <cuda_runtime_api.h>

/* Specific errors from CUDA lib */
#define CHECK_CU_ERROR(err, cufunc) \
if (err != CUDA_SUCCESS) \
{ \
printf ("Error %d for CUDA Driver API function '%s'. cuptiQuery failed\n", err, cufunc); \
return -1;  \
}

/* Specific errors from CuPTI lib */
#define CHECK_CUPTI_ERROR(err, cuptifunc) \
if (err != CUPTI_SUCCESS) \
{ \
printf ("Error %d for CUPTI API function '%s'. cuptiQuery failed\n", err, cuptifunc); \
return -1;  \
}



/*************************  DEFINES SECTION  ***********************************
 *******************************************************************************/

/* this number assumes that there will never be more events than indicated */
#define CUDA_MAX_COUNTERS 512

typedef struct EventData
{
	CUpti_EventID eventId;			   // CuPTI event id 
	char name[PAPI_MIN_STR_LEN];	   // event name
	char desc[PAPI_2MAX_STR_LEN];	   // short desc of the event
} EventData_t;


typedef struct DomainData
{
	CUpti_EventDomainID domainId;	   // CuPTI domain id
	char name[PAPI_MIN_STR_LEN];	   // domain name
	int eventCount;					   // number of events per domain
	EventData_t *event;
} DomainData_t;


typedef struct DeviceData
{
	CUdevice dev;					   // CUDA device
	char name[PAPI_MIN_STR_LEN];	   // device name
	uint32_t domainCount;			   // number of domains per device
	DomainData_t *domain;
} DeviceData_t;


typedef struct AddedEvents
{
	int count;						   // number of events that have been added to the CuPTI eventGroup
	int *list;						   // list of the added events
} AddedEvents_t;


/** Structure that stores private information of each event */
typedef struct CUDA_register
{
	/* This is used by the framework.It likes it to be !=0 to do somehting */
	unsigned int selector;
	/* This is the information needed to locate a CUDA event */
	CUpti_EventID eventId;
} CUDA_register_t;


/** This structure is used to build the table of events */
typedef struct CUDA_native_event_entry
{
	CUDA_register_t resources;
	char name[PAPI_MAX_STR_LEN];
	char description[PAPI_2MAX_STR_LEN];
} CUDA_native_event_entry_t;


typedef struct CUDA_reg_alloc
{
	CUDA_register_t ra_bits;
} CUDA_reg_alloc_t;


typedef struct CUDA_control_state
{
	long long counts[CUDA_MAX_COUNTERS];
	int ncounter;
} CUDA_control_state_t;


typedef struct CUDA_context
{
	CUDA_control_state_t state;
} CUDA_context_t;


/*************************  GLOBALS SECTION  ***********************************
 *******************************************************************************/

static int enumEventDomains( CUdevice dev, int deviceId );
static int enumEvents( CUdevice dev, int domainId, int eventCount );

/* This table contains the CUDA native events */
static CUDA_native_event_entry_t *cuda_native_table;
/* number of events in the table */
static int NUM_EVENTS = 0;
static int deviceCount = 0;
static int totalDomainCount = 0;
static int totalEventCount = 0;
static int currentDeviceID;			   /* determine the actual device the user code is running on */

DeviceData_t *device;
AddedEvents_t addedEvents;
CUpti_EventGroup eventGroup;
CUcontext cuCtx;

#endif /* _PAPI_CUDA_H */
