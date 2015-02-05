ifdef NODEBUG
DEBUG = 
else
DEBUG = -ggdb
endif

#variables
CC = gcc
CFLAGS = $(DEBUG) $(WARNINGS) -DW=10 -Wall

#files
#DEPS = matrix.h
SOURCE_FILES = palindrome.c
OBJECT_FILES = $(SOURCE_FILES:.c=.o)

all: palindrome

%: %.o
	$(CC) -o $@ $^

%.o: %.c $(DEPS)
	$(CC) -c $(CFLAGS) $<

clear:
	rm -rf *.o palindrome output