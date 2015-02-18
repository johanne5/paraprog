all:
	icc -O pi_cilk_solution.c -o pi_cilk
	icc -O -openmp pi_omp_solution.c -o pi_omp
	gcc -O -ltbb pi_tbb_solution.cpp -o pi_tbb


clean:
	rm -rf *.o
