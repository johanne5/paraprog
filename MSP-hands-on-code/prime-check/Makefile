# Makefile for varius omp test or example binaries

CC          = icc
CLINKER     = $(CC)
OPTFLAGS    = -O3 -openmp -g -std=c99
LIBS        = -lm 
CFLAGS      = $(OPTFLAGS) 
EXE         = prime-check

all: prime-check

prime-check.o: prime-check.c
	$(CC) $(CFLAGS) -c $<

prime-check: prime-check.o
	$(CLINKER) $(CFLAGS) -o prime-check prime-check.o $(LIBS)

clean:
	rm $(EXE) *.o
