#include <stdio.h>
#include <stdlib.h>

#define SPEC_CHAR 'j'
//#define ENABLE_PROFILE_HW 1

#define likely(x)       __builtin_expect((x),1)
#define unlikely(x)     __builtin_expect((x),0)

int is_special(char c) {
    if(c == SPEC_CHAR)
        return 1;
    else
        return 0;
}

#ifdef ENABLE_PROFILE_HW
typedef char * caddr_t;
#include <papi.h>
#define NUM_EVENTS 1
char* events[NUM_EVENTS] = { "PAPI_BR_MSP" };

int event_set = PAPI_NULL;

void print_and_exit(const char* msg) {
    printf("%s\n", msg);
    exit(0);
}

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

int main(int argc, char* argv[])
{
    if(argc!=2) {
        printf("Usage: %s <file_name>\n", argv[0]);
        exit(0);
    }
    
#ifdef ENABLE_PROFILE_HW
    init_counters();
    add_events_to_counters();
#endif

    int count = 0;
    int tot_count = 0;
    FILE* fp = fopen(argv[1], "r");
    char c;
    
#ifdef ENABLE_PROFILE_HW
    start_counters();
#endif
    while((c = fgetc(fp)) != EOF) {
        if(unlikely(is_special(c))) {
            count++;
        }
        tot_count++;
    }
#ifdef ENABLE_PROFILE_HW
    read_counters();
#endif

    fclose(fp);
    printf("Num %c characters = %d / %d\n", SPEC_CHAR, count, tot_count);
    return 0;
}
