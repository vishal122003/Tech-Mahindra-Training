import java.io.File;
public class FileSize {
public static void main(String[] args) {
	File fl=new File("C:\\Users\\visha\\OneDrive\\Documents\\Document1.docx");
	long fileSizeInBytes=fl.length();
	int fileKB=(int)fileSizeInBytes/1024;
	int fileMB=(int)fileKB/1024;
	System.out.println("File Size in Bytes:"+fileSizeInBytes);
	System.out.println("File Size in KB:"+fileKB);
	System.out.println("File Size in MB:"+fileMB);
}
}

//Output:
// File Size in Bytes:3176632
// File Size in KB:3102
// File Size in MB:3
