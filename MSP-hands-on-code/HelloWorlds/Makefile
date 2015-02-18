CC=icc
CFLAGS=-O -g # -openmp
LDFLAGS= # -lpthread
DEPS = 
OBJS = HelloWorlds.o 

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

mandelbrot: $(OBJS)
	$(CC) $(LDFLAGS) -o HelloWorlds $(OBJS)
