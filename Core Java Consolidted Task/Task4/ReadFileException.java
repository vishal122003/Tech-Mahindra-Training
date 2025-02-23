import java.io.File;
import java.io.FileNotFoundException;
public class ReadFileException {
public static void main(String[] args) throws FileNotFoundException {
	File fl=new File("C:\\Users\\visha\\Downloads\\fileInput (13).txt");
	if(fl.exists())
		System.out.println("The file is found");
	else
		throw new FileNotFoundException("Sorry File not found");
}
}

//Output:
// Exception in thread "main" java.io.FileNotFoundException: Sorry File not found
// 	at exceptionhandling.ReadFileException.main(ReadFileException.java:12)
