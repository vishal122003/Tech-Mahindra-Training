public class ListFilesInDirectory {
public static void main(String[] args) {
	File dir=new File("C:\\Program Files\\");
	File[] fileList=dir.listFiles();
	if(fileList!=null) {
		System.out.println("List Of Files and directories in "+dir+":");
		for(File file:fileList)
			System.out.println(file.getName());
	}
	else
		System.out.println("The file does not exist");
}
}

//Output:
// List Of Files and directories in C:\Program Files:
// Common Files
// desktop.ini
// Google
// Intel
// Internet Explorer
