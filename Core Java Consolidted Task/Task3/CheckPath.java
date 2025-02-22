import java.io.File;
public class CheckPath {
public static void main(String[] args) {
	String path="C:\\Users\\";
	File fl=new File(path);
	if(fl.exists()) {
		if(fl.isDirectory())
			System.out.println("The specified path is a directory");
		else if(fl.isFile())
			System.out.println("The specified path is a file");
	}
	else
		System.out.println("The specified path does not exist");
}
}

//Output:
// The specified path is a directory
