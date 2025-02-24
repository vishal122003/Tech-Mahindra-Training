import java.util.ArrayList;
import java.util.List;

class PrimeSumThread extends Thread {
    private int start;
    private int end;
    private List<Integer> primes;

    public PrimeSumThread(int start, int end) {
        this.start = start;
        this.end = end;
        this.primes = new ArrayList<>();
    }

    public List<Integer> getPrimes() {
        return primes;
    }

    @Override
    public void run() {
        for (int i = start; i <= end; i++) {
            if (isPrime(i)) {
                primes.add(i);
            }
        }
    }

    private boolean isPrime(int num) {
        if (num <= 1) return false;
        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) return false;
        }
        return true;
    }
}

public class MultiThreadedPrimeSum {
    public static void main(String[] args) {
        int limit = 100;
        int numberOfThreads = 4;

        int range = limit / numberOfThreads;
        PrimeSumThread[] threads = new PrimeSumThread[numberOfThreads];
        int start = 1;

        for (int i = 0; i < numberOfThreads; i++) {
            int end = (i == numberOfThreads - 1) ? limit : start + range - 1;
            threads[i] = new PrimeSumThread(start, end);
            threads[i].start();
            start = end + 1;
        }

        int sum = 0;

        for (PrimeSumThread thread : threads) {
            try {
                thread.join();
                for (int prime : thread.getPrimes()) {
                    sum += prime;
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println("Sum of all prime numbers up to " + limit + " is: " + sum);
    }
}
