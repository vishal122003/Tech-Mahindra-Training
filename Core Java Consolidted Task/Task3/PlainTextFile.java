import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
public class PlainTextFile {
public static void main(String[] args) {
	String path="C:\\Users\\visha\\Downloads\\fileInput (3).txt";
	try(BufferedReader br=new BufferedReader(new FileReader(path))){
		String line;
		while((line=br.readLine())!=null)
			System.out.println(line);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}
