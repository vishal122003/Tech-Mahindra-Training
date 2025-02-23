import java.util.Scanner;
public class OddException {
public static void main(String[] args) throws Exception {
	Scanner sc=new Scanner(System.in);
	System.out.println("Enter the number:");
	int num=sc.nextInt();
	sc.close();
	if(num%2==0)
		System.out.println("The number is even");
	else
		throw new Exception("The number is odd");
}
}

//Output:
// Enter the number:
// 5
// Exception in thread "main" java.lang.Exception: The number is odd
// 	at exceptionhandling.OddException.main(OddException.java:14)
