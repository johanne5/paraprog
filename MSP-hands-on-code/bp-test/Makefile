#!/bin/bash

# Makefile make me fast and accurate

CC = gcc
EXE = scanner
EXE_ARGS = ./robinson_crusoe.txt

CFLAGS = -Wall -g -Wno-error -std=c99 -O0
LFLAGS = -lpapi

SRC = scanner.c
OBJ = $(SRC:.c=.o)

.PHONY: clean

all: $(EXE)

$(EXE): $(OBJ)
	$(CC) $(OBJ) $(CFLAGS) $(LFLAGS) -o $(EXE)

$(OBJ): $(SRC)
	$(CC) -c $(SRC) $(CFLAGS)

clean: 
	rm -rf $(OBJ) $(EXE)

run_test: $(EXE)
	./$(EXE) $(EXE_ARGS)

dump: $(EXE)
	objdump -d -M amd -S $(OBJ)

# End of Makefile



