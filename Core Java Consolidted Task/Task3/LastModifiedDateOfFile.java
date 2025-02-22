import java.io.File;
import java.text.SimpleDateFormat;
public class LastModifiedDate {
public static void main(String[] args) {
	String path="C:\\Users\\visha\\OneDrive\\Documents\\Document1.docx";
	File fl=new File(path);
	if(fl.exists() && fl.isFile()) {
		long lastModified=fl.lastModified();
		SimpleDateFormat date=new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		String str=date.format(lastModified);
		System.out.println("The Last modified date of:"+path+" is:"+str);
	}
	else
		System.out.println("The path does not exist");
}
}

//Output:
//The Last modified date of:C:\Users\visha\OneDrive\Documents\Document1.docx is:02/13/2025 12:55:04
