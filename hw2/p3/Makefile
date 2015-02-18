ifdef NODEBUG
DEBUG = 
else
DEBUG = -ggdb
endif

#variables
CC = /usr/local/bin/gcc-4.9
CFLAGS = $(DEBUG) $(WARNINGS) -fopenmp

#files
#DEPS = matrix.h
SOURCE_FILES = palindrome.c
OBJECT_FILES = $(SOURCE_FILES:.c=.o)

all: palindrome

%: %.o
	$(CC) -o $@ $^


#matrixSum: $(OBJECT_FILES)
#	$(CC) -o $@ $^

%.o: %.c $(DEPS)
	$(CC) -c $(CFLAGS) $<

clear:
	rm -rf *.o palindrome output