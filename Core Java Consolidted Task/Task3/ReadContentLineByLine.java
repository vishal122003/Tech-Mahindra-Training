import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
public class ReadContentLineByLine {
public static void main(String[] args) {
	String path="C:\\Users\\visha\\OneDrive\\Documents\\Document1.docx";
	try (BufferedReader br=new BufferedReader(new FileReader(path))){
		String line;
		while((line=br.readLine())!=null)
			System.out.println(line);
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}
