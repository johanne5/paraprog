ifdef NODEBUG
DEBUG = 
else
DEBUG = -ggdb
endif

#variables
CC = /usr/local/bin/gcc-4.9
CFLAGS = $(DEBUG) $(WARNINGS) -O3 -lpthread -fopenmp

#files
#DEPS = matrix.h
PROGRAM_NAME = birds
SOURCE_FILES = $(PROGRAM_NAME).c
OBJECT_FILES = $(SOURCE_FILES:.c=.o)

all: $(PROGRAM_NAME)

%: %.o
	$(CC) -o $@ $^

%.o: %.c $(DEPS)
	$(CC) -c $(CFLAGS) $<

clear:
	rm -rf *.o $(PROGRAM_NAME)
run:
	./$(PROGRAM_NAME)