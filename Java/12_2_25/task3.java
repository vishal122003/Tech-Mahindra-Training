class ThreadThree extends Thread {
    @Override
    public void run() {
        for(int i=0;i<5;i++) {
            System.out.println("From ThreadThree!");
        }
    }
}
class ThreadRunnableOne implements Runnable {
    @Override
    public void run() {
        for(int i=0;i<2;i++) {
            System.out.println("From ThreadRunnableOne!");
        }
    }
}
public class Main {
    public static void main(String[] args) {
        ThreadThree threadThree1 =new ThreadThree();
        ThreadThree threadThree2 =new ThreadThree();
        ThreadThree threadThree3 =new ThreadThree();     
        threadThree1.start();
        threadThree2.start();
        threadThree3.start();
        Thread threadRunnableOne=new Thread(new ThreadRunnableOne());
        threadRunnableOne.start();
    }
}
