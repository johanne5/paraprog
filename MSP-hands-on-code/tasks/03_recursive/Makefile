all:
	icc -O recursive_cilk_solution.c -o recursive_cilk
	icc -O -openmp recursive_omp_solution.c -o recursive_omp
	gcc -O -ltbb recursive_tbb_solution.cpp -o recursive_tbb


clean:
	rm -rf *.o
