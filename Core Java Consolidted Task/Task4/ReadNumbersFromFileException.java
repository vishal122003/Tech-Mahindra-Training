import java.io.File;
import java.util.Scanner;
public class PositiveNumberException extends Exception {
	public PositiveNumberException(String message) {
		super(message);
	}
}
public class ReadNumbersFromFileException {
public static void main(String[] args) throws Exception,PositiveNumberException {
	try {
	File fl=new File("C:\\Users\\visha\\Downloads\\fileInput (3).txt");
	Scanner sc=new Scanner(fl);
	while(sc.hasNextLine()) {
		int num=Integer.parseInt(sc.nextLine());
		if(num>0)
			throw new PositiveNumberException("The Number is positive");
	}}
	catch (PositiveNumberException e) {
		// TODO: handle exception
		System.out.println("Exception Caught:"+e.getMessage());
	}
}
}

//output:
//Exception in thread "main" java.lang.NumberFormatException: For input string: 804
