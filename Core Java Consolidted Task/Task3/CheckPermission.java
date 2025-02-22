import java.io.File;
public class CheckPermission {
public static void main(String[] args) {
	String path="C:\\Users\\";
	File fl=new File(path);
	if(fl.exists()) {
		if(fl.canRead())
			System.out.println("The specified path has read permission");
		else
			System.out.println("The specified path does not have read permission");
		if(fl.canWrite())
			System.out.println("The specified path has write permission");
		else
			System.out.println("The specified path does not have write permission");
	}
	else
		System.out.println("The specified path does not exist");
}
}

//Output:
// The specified path has read permission
// The specified path has write permission
