ifdef NODEBUG
DEBUG = 
else
DEBUG = -ggdb
endif

#variables
CC = gcc
CFLAGS = $(DEBUG) $(WARNINGS)

#files
#DEPS = matrix.h
SOURCE_FILES = a.c b.c c.c
OBJECT_FILES = $(SOURCE_FILES:.c=.o)

all: a b c

%: %.o
	$(CC) -o $@ $^


matrixSum: $(OBJECT_FILES)
	$(CC) -o $@ $^

%.o: %.c $(DEPS)
	$(CC) -c $(CFLAGS) $<

clear:
	rm -rf *.o matrixSum a b c