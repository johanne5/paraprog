package birds;

import java.util.Random;

public class Birds {
	
	class Chick extends Thread {
		Plate jar;
		Random r = new Random();
		public Chick(Plate jar) {
			this.jar = jar;
		}
		
		public void run(){
			while(true){
				try {
					sleep(r.nextInt(5000));
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				jar.eatWorm();
				
			}
		}	
		
	}
	
	class MomaBird extends Thread {
		Plate plateOfWorms;
		public MomaBird(Plate jar) {
			this.plateOfWorms = jar;
		}
		public void run(){
			while(true){
				plateOfWorms.fillPlate();
			}
			
		}
		
	}
	
	class Plate {
		int numWormsOnPlate=NUM_OF_WORMS_THAT_FIT_ON_PLATE;
		
		synchronized void eatWorm(){
			numWormsOnPlate--;
			System.out.println("Chick " + Thread.currentThread().getId() + " eats worm");
			if(numWormsOnPlate==0) {notify();}
		}
		
		synchronized void fillPlate(){
			while(numWormsOnPlate!=0){
				try {
					wait();
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}	
			System.out.println("Moma (" + Thread.currentThread().getId() + ") fills the plate");
			numWormsOnPlate=NUM_OF_WORMS_THAT_FIT_ON_PLATE;
		}
		
	}
	static final int NUM_OF_WORMS_THAT_FIT_ON_PLATE=10;
	Plate plateOfWorms;
	
	public Birds() {
		plateOfWorms = new Plate();
		int numChicks=3;
		for(int i=0;i<numChicks;i++){
			new Chick(plateOfWorms).start();
		}
		new MomaBird(plateOfWorms).start();
	}
	public static void main(String[] args) {
		new Birds();
	}

}
