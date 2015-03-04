package bees;

import java.util.Random;

public class Bees {
	
	class Bee extends Thread {
		Jar jar;
		Random r = new Random();
		public Bee(Jar jar) { //initiate common resource jar
			this.jar = jar;
		}
		
		public void run(){ //forever sleep and drop honey
			while(true){
				try {
					sleep(r.nextInt(5000));
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				jar.dropHoney();
				
			}
		}	
		
	}
	
	class Bear extends Thread { //wait for monitor and empty jar
		Jar jar;
		public Bear(Jar jar) {
			this.jar = jar;
		}
		public void run(){
			while(true){
				jar.eatHoney();
			}
			
		}
		
	}
	
	class Jar {
		int space=SIZE;
		
		synchronized void dropHoney(){
			space--;
			System.out.println("Bee " + Thread.currentThread().getId() + " dropped honey");
			if(space==0) {notify();}
		}
		
		synchronized void eatHoney(){
			while(space!=0){
				try {
					wait();
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}	
			System.out.println("Bear (" + Thread.currentThread().getId() + ") emptied the jar");
			space=SIZE;
		}
		
	}
	static final int SIZE=10;
	Jar jar;
	
	public Bees() {
		jar = new Jar();
		int numBees=3;
		for(int i=0;i<numBees;i++){
			new Bee(jar).start();
		}
		new Bear(jar).start();
	}
	public static void main(String[] args) {
		new Bees();
	}

}
