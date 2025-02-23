import java.util.Scanner;
public class ReadConsole {
public static void main(String[] args) {
	Scanner sc=new Scanner(System.in);
	System.out.println("Enter your input:");
	String str=sc.nextLine();
	System.out.println("The entered input is:"+str);
	sc.close();
}
}
//Output:
//Enter your input:
// hello
// The entered input is:hello
