package wc;

import java.util.Random;

public class Wc {
	
	final int MAN=0, WOMAN=1, NUMGUESTS=6;
	
	int womenInside=0, womenWaiting=0, menInside=0, menWaiting=0, sign=0;
	
	class Person extends Thread{
		
		int gender;
		Random r;
		
		Person(int gender){
			this.gender=gender;
			r = new Random();
		}
		
		boolean isMan(){
			return MAN==gender ? true : false;
		}	
		
		/* forever: sleep for random time, enter bathroom, exit bathroom */
		public void run(){
			while(true){
				try {
					sleep(r.nextInt(15000));
				} catch (InterruptedException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				enter(this);
				System.out.println((isMan() ? "Man " : "Woman ") + Thread.currentThread().getId() + " uses the bathroom");
				try {
					sleep(3000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				exit(this);
			}
		}
	}
	
	synchronized void enter(Person p){	
		if(p.isMan()){ //this block executed by men only
			if(0<womenInside || 0<womenWaiting){ //if women in bathroom or women wait - wait for monitor
				menWaiting++;
				while(true){
					try {
						wait();
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					if(MAN==sign){ //if it is men's turn when awaken: enter -else keep waiting
						menWaiting--;
						break;
					}
				}
			}
			sign=MAN;
			menInside++;
		}
		else{
			if(0<menInside || 0<menWaiting){
				womenWaiting++;
				while(true){
					try {
						wait();
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					if(WOMAN==sign){
						womenWaiting--;
						break;
					}
				}
			}
			sign=WOMAN;
			womenInside++;
		}
	}
	
	synchronized void exit(Person p){
		
		if(p.isMan()){ //this block is executed by men only
			menInside--;
			if(0==menInside && 0<womenWaiting){ //if last man to exit and one or more women wait
				System.out.println("GENDER SWAP");
				sign=WOMAN; //set sign to make it womens turn
				this.notifyAll(); //awaken everyone waiting
			}
		}
		else{
			womenInside--;
			if(0==womenInside && 0<menWaiting){
				System.out.println("GENDER SWAP");
				sign=MAN;
				this.notifyAll();
			}
			
		}
		
	}
	
	public Wc() {
		
		for(int i=0; i<NUMGUESTS; i++) new Person(i%2).start();
		
	}

	public static void main(String[] args) {
		new Wc();
	}

}
