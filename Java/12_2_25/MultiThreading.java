class Thread1 extends Thread {
    public void run() {
        System.out.println("From Thread1! " + this.getName());
    }
}
class Thread2 implements Runnable {
    public void run() {
        try {
            System.out.println(10 / 0); 
        } catch (ArithmeticException e) {
            System.out.println("Exception caught in Thread2: " + e.getMessage());
        }
    }
}
public class MultiThreadingExample {
    public static void main(String[] args) { 
        System.out.println("From Main thread!");
        System.out.println("From Main thread!");
        System.out.println("From Main thread!");
        Thread1 t1=new Thread1();
        t1.start(); 
        Thread2 t2=new Thread2();
        Thread tt2=new Thread(t2);
        new Thread(t2).start();
        tt2.start();
        t2.run();
        try {
            System.out.println(10 / 0);
        } catch (ArithmeticException e) {
            System.out.println("Exception caught in main: " + e.getMessage());
        }
    }
}
