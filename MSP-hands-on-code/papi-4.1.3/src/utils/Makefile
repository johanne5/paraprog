# File: utils/Makefile
# CVS:  $Id: Makefile,v 1.18 2011/03/25 21:15:46 ralph Exp $
INCLUDE = -I../ctests -I. 
LIBRARY = -lpapi
PAPILIB = $(LIBRARY)
CC	= gcc
CC_R	= $(CC) -pthread
CFLAGS	= -g -O -Wall

ALL = papi_avail papi_mem_info papi_cost papi_clockres papi_native_avail papi_command_line \
	  papi_event_chooser papi_decode papi_xml_event_info papi_version papi_multiplex_cost
UTILOBJS= do_loops.o dummy.o test_utils.o

default all utils: $(UTIL_TARGETS)

papi_event_chooser: event_chooser.c $(PAPILIB) $(UTILOBJS)
	$(CC) $(INCLUDE) $(CFLAGS) $(TOPTFLAGS) event_chooser.c $(UTILOBJS) $(PAPILIB) $(LDFLAGS) -o papi_event_chooser -lm

papi_xml_event_info: event_info.c $(PAPILIB) $(UTILOBJS)
	$(CC) $(INCLUDE) $(CFLAGS) $(TOPTFLAGS) event_info.c $(UTILOBJS) $(PAPILIB) $(LDFLAGS) -o papi_xml_event_info -lm

papi_clockres: ../ctests/clockcore.c clockres.c $(PAPILIB) $(UTILOBJS)
	$(CC) $(INCLUDE) $(CFLAGS) $(TOPTFLAGS) ../ctests/clockcore.c clockres.c $(UTILOBJS) $(PAPILIB) $(LDFLAGS) -o papi_clockres -lm

papi_cost: cost.c $(UTILOBJS) $(PAPILIB) cost_utils.o
	$(CC) $(INCLUDE) $(CFLAGS) $(TOPTFLAGS) cost.c $(UTILOBJS) cost_utils.o $(PAPILIB) $(LDFLAGS) -o papi_cost -lm

papi_multiplex_cost: multiplex_cost.c $(UTILOBJS) $(PAPILIB) cost_utils.o
	$(CC) $(INCLUDE) $(CFLAGS) $(TOPTFLAGS) multiplex_cost.c $(UTILOBJS) cost_utils.o $(PAPILIB) $(LDFLAGS) -o papi_multiplex_cost -lm

papi_command_line: command_line.c $(UTILOBJS) $(PAPILIB)
	$(CC) $(INCLUDE) $(CFLAGS) $(TOPTFLAGS) command_line.c $(UTILOBJS) $(PAPILIB) $(LDFLAGS) -o papi_command_line

papi_mem_info: mem_info.c $(PAPILIB) $(UTILOBJS)
	$(CC) $(INCLUDE) $(CFLAGS) $(TOPTFLAGS) mem_info.c $(UTILOBJS) $(PAPILIB) $(LDFLAGS) -o papi_mem_info

papi_version: version.c $(PAPILIB)
	$(CC) $(INCLUDE) $(CFLAGS) $(TOPTFLAGS) version.c $(PAPILIB) $(LDFLAGS) -o papi_version

papi_avail: avail.c $(PAPILIB) $(UTILOBJS)
	$(CC) $(INCLUDE) $(CFLAGS) $(TOPTFLAGS) avail.c $(UTILOBJS) $(PAPILIB) $(LDFLAGS) -o papi_avail

papi_decode: decode.c $(PAPILIB) $(UTILOBJS)
	$(CC) $(INCLUDE) $(CFLAGS) $(TOPTFLAGS) decode.c $(UTILOBJS) $(PAPILIB) $(LDFLAGS) -o papi_decode

papi_native_avail: native_avail.c $(PAPILIB) $(UTILOBJS)
	$(CC) $(INCLUDE) $(CFLAGS) $(TOPTFLAGS) native_avail.c $(UTILOBJS) $(PAPILIB) $(LDFLAGS) -o papi_native_avail

test_utils.o: ../ctests/test_utils.c ../ctests/papi_test.h ../ctests/test_utils.h
	$(CC) $(INCLUDE) $(CFLAGS) $(TOPTFLAGS) -c ../ctests/test_utils.c

do_loops.o: ../ctests/do_loops.c ../ctests/papi_test.h ../ctests/test_utils.h
	$(CC) $(INCLUDE) $(CFLAGS) $(TOPTFLAGS) -c ../ctests/do_loops.c

dummy.o: ../ctests/dummy.c
	$(CC) $(INCLUDE) $(CFLAGS) $(TOPTFLAGS) -c ../ctests/dummy.c

cost_utils.o: ../ctests/papi_test.h cost_utils.c
	$(CC) $(INCLUDE) $(CFLAGS) $(TOPTFLAGS) -c cost_utils.c

clean:
	rm -f *.o *.stderr *.stdout core *~ $(ALL)

install: $(UTIL_TARGETS)
	@echo "Utilities (BINDIR) being installed in: \"$(BINDIR)\""; 
	-mkdir -p $(BINDIR)
	-chmod go+rx $(BINDIR)
	-find . -perm -100 -type f -exec cp {} $(BINDIR) \;
