public class EvenThread extends Thread{
	@Override
	public void run() {
		// TODO Auto-generated method stub
		for(int i=0;i<=20;i++) {
			if(i%2==0)
				System.out.println("Even"+i);
		}
	}
}
public class OddThread extends Thread{
	@Override
	public void run() {
		// TODO Auto-generated method stub
		for(int i=0;i<=20;i++) {
			if(i%2==1)
				System.out.println("Odd:"+i);
		}
	}
}
public class EvenOddThread extends Thread{
public static void main(String[] args) {
	EvenThread ethread=new EvenThread();
	OddThread othread=new OddThread();
	ethread.start();
	othread.start();
}
}
