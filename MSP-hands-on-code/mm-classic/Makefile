# Default target.
all:

CC = icc

EXE = mm_classic
SRCS = mm_classic.c
OBJS = $(SRCS:.c=.o)

OPT = -O2
CFLAGS = -Wall -Werror -g -Werror $(OPT) -std=gnu99 -openmp
LDFLAGS = -lpapi -openmp
LIBS = 
EXE_ARGS = 

$(EXE).o: $(SRCS)
	$(CC) $(CFLAGS) -c $< -o $@

$(EXE): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) $(LIBS) -o $@

all: $(EXE)

run_test: $(EXE)

run_gdb: gdb ./$(EXE)

clean:
	rm -f *.o $(EXE)

.PHONY: all clean run_test run_gdb


