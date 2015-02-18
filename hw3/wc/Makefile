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
SOURCE_FILES = wc.c
OBJECT_FILES = $(SOURCE_FILES:.c=.o)

all: wc

%: %.o
	$(CC) -o $@ $^


#matrixSum: $(OBJECT_FILES)
#	$(CC) -o $@ $^

%.o: %.c $(DEPS)
	$(CC) -c $(CFLAGS) $<

clear:
	rm -rf *.o wc