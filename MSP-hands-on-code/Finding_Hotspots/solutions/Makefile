# Makefile for varius omp test or example binaries

CC          = icc
CLINKER     = $(CC)
OPTFLAGS    = -O -openmp -g
LIBS        = -lm

CFLAGS	  = $(OPTFLAGS) 

OBJ=o
RM=rm

EXES=omp_mm omp_prime

all: $(EXES)

omp_mm: omp_mm.$(OBJ) 
	$(CLINKER) $(OPTFLAGS) -o omp_mm omp_mm.$(OBJ) $(LIBS)

omp_prime: omp_prime.$(OBJ) 
	$(CLINKER) $(OPTFLAGS) -o omp_prime omp_prime.$(OBJ) $(LIBS)

clean:
	$(RM) $(EXES) *.$(OBJ)

.SUFFIXES:
.SUFFIXES: .c .$(OBJ)

.c.$(OBJ):
	$(CC) $(OPTFLAGS) $(CFLAGS) -c $<
