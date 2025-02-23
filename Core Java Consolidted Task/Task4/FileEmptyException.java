import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
public class EmptyFileException extends Exception {
	public EmptyFileException(String message) {
		super(message);
	}
}
public class FileEmptyException {
public static void main(String[] args) throws EmptyFileException, FileNotFoundException {
	File fl=new File("C:\\Users\\visha\\Downloads\\fileInput (3).txt");
	if(fl.exists()) {
		Scanner sc=new Scanner(System.in);
		if(!sc.hasNextLine()) {
			sc.close();
			throw new EmptyFileException("The file is Empty");
		}
		while(sc.hasNextLine())
			System.out.println(sc.nextLine());
		sc.close();
	}
	else
		throw new FileNotFoundException("File Not Found");
}
}

//Output:
