# Makefile for varius omp test or example binaries

CC          = icc
CLINKER     = $(CC)
OPTFLAGS    = -O -g
LIBS        = -lm

CFLAGS	  = $(OPTFLAGS) 

OBJ=o
RM=rm

EXES=mm prime

all: $(EXES)

mm: mm.$(OBJ) 
	$(CLINKER) $(OPTFLAGS) -o mm mm.$(OBJ) $(LIBS)

prime: prime.$(OBJ) 
	$(CLINKER) $(OPTFLAGS) -o prime prime.$(OBJ) $(LIBS)

clean:
	$(RM) $(EXES) *.$(OBJ)

.SUFFIXES:
.SUFFIXES: .c .$(OBJ)

.c.$(OBJ):
	$(CC) $(OPTFLAGS) $(CFLAGS) -c $<
