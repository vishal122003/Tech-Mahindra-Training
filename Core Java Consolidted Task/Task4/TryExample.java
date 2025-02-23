public class TryExample {
public static void main(String[] args) {
	try {
		System.out.println(1/0);
	}
	catch (ArithmeticException e) {
		// TODO: handle exception
		System.out.println("Exception Occured:"+e.getMessage());
	}
}
}

//Output:  
// Exception Occured:/ by zero
