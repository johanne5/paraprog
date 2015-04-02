#variables
CC = gcc
CFLAGS = -c -O3 -fopenmp -pthread
ifdef DEBUG
CFLAGS += -ggdb -DDEBUG
endif
LINK = -lm -lgomp
PROGRAM_NAME = barnes_par2

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