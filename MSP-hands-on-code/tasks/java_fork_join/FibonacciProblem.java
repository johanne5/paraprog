public class FibonacciProblem {
 
    public int n;

    public FibonacciProblem(int n) {
	this.n = n;
    }
 
    public long solve() {
	return fibonacci(n);
    }
 
    private long fibonacci(int n) {
	System.out.println("Thread: " +
			   Thread.currentThread().getName() + " calculates " + n);
	if (n <= 1)
	    return n;
	else 
	    return fibonacci(n-1) + fibonacci(n-2);
    }




}

public class FibonacciTask extends RecursiveTask<Long> {

    private static final long serialVersionUID = 6136927121059165206L;
 
    private static final int THRESHOLD = 5;

    private FibonacciProblem problem;
    public long result;
 
    public FibonacciTask(FibonacciProblem problem) {
	this.problem = problem;
    }

 @Override
     public Long compute() {
     if (problem.n < THRESHOLD) { // easy problem, don't bother with parallelism
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




public class fib {
 
    public static void main(String[] args) throws Exception {
  
	int n = 10;
  

	long startTime = System.currentTimeMillis();

	FibonacciProblem bigProblem = new FibonacciProblem(n); 
  
	long result = bigProblem.solve();   


	long endTime = System.currentTimeMillis();
  
	System.out.println("Computing Fib number: " + n);
	System.out.println("Computed Result: " + result);
	System.out.println("Elapsed Time: " + endTime-startTime);
  
    }

}

