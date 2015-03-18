ifdef NODEBUG
DEBUG = 
else
DEBUG = -ggdb
endif

#variables
CC = gcc
CFLAGS = -c $(DEBUG) $(WARNINGS) -O3 -fopenmp
LINK = -lm
PROGRAM_NAME = nbody

#files
DEPS =
SOURCE_FILES = $(PROGRAM_NAME).o
OBJECT_FILES = $(SOURCE_FILES:.c=.o)

all: $(SOURCE_FILES) $(PROGRAM_NAME)
$(PROGRAM_NAME): $(OBJECT_FILES)
	$(CC) $(OBJECT_FILES) -o $@ $(LINK)
.c.o:
	$(CC) $(CFLAGS) $< -o $@
clear:
	rm -rf *.o $(PROGRAM_NAME)
run:
	./$(PROGRAM_NAME) $(PARAMS)