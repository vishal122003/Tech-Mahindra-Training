public class ExThread extends Thread{
	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("Hello, Java!");
	}
	public static void main(String[] args) {
		ExThread thread=new ExThread();
		thread.start();
	}
}

//Output:
// Hello, Java!
