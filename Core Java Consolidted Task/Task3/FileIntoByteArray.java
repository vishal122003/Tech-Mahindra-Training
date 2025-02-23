import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;
public class FileIntoByteArray {
public static void main(String[] args) {
	File fl=new File("C:\\Users\\visha\\OneDrive\\Documents\\Document1.docx");
	try {
		FileInputStream fis=new FileInputStream(fl);
		byte[] content=new byte[(int)fl.length()];
		fis.read(content);
		fis.close();
		System.out.println("File into byte array"+Arrays.toString(content));
	} catch (IOException e) {
		e.printStackTrace();
	}
}
}

//Output:
// File into byte array[80, 75, 3, 4, 20, 0, 6, 0, 8] 
