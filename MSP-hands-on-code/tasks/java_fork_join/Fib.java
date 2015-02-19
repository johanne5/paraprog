import java.io.*;

import java.util.concurrent.*;

import java.util.concurrent.ForkJoinPool;

class FibonacciProblem {
 
    public int n;

    FibonacciProblem(int n) {
	this.n = n;
    }
 
    public long solve() {
	return fibonacci(n);
    }
 
    private long fibonacci(int n) {
	if (n <= 1)
	    return n;
	else 
	    return fibonacci(n-1) + fibonacci(n-2);
    }
}

class FibonacciTask extends RecursiveTask<Long> {
    private static final int THRESHOLD = 5;

    private FibonacciProblem problem;
    public long result;
 
    FibonacciTask(FibonacciProblem problem) {
	this.problem = problem;
    }

 @Override
     public Long compute() {
     if (problem.n < THRESHOLD) {
	 result = problem.solve();
     }
     else {
	 FibonacciTask worker1 = new FibonacciTask(new FibonacciProblem(problem.n-1));
	 FibonacciTask worker2 = new FibonacciTask(new FibonacciProblem(problem.n-2));
	 worker1.fork();
	 result = worker2.compute() + worker1.join();

     }
     return result;
 }

}




public class Fib {
 
    public static void main(String[] args) throws Exception {
  
	int n = 42;
	int processors =1;
  
	processors = Integer.parseInt(args[0]) ;

	long startTime = System.currentTimeMillis();

	FibonacciProblem bigProblem = new FibonacciProblem(n); 
  
	FibonacciTask task = new FibonacciTask(bigProblem);
	ForkJoinPool pool = new ForkJoinPool(processors);
	pool.invoke(task);
  
	long result = task.result;


	long endTime = System.currentTimeMillis();
  
	System.out.println("Computing Fib number: " + n);
	System.out.println("Computed Result: " + result);
	System.out.println("Elapsed Time: " + (endTime - startTime));
  
    }

}
