all:
	icc -O mxm_cilk_solution.c -o mxm_cilk
	gcc -O -fopenmp mxm_omp_solution.c -o mxm_omp
	gcc -O -ltbb mxm_tbb_solution.cpp -o mxm_tbb


clean:
	rm -rf *.o
