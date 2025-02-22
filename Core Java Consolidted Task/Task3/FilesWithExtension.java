import java.io.File;
import java.io.FilenameFilter;
public class FilesWithExtension {
public static void main(String[] args) {
	String path="C:\\Users\\visha\\OneDrive\\Documents";
	String ext=".txt";
	File dir=new File(path);
	File[] filelist=dir.listFiles(new FilenameFilter() {
		
		@Override
		public boolean accept(File dir, String name) {
			// TODO Auto-generated method stub
			return name.endsWith(ext);
		}
	});
	if(filelist!=null && filelist.length>0) {
		System.out.println("List Of files with extension "+ext+" in "+path+":");
		for(File fl:filelist)
			System.out.println(fl.getName());
	}
	else
		System.out.println("No files with extension "+ext+" found in specified directory");
}
}

//Output:
// List Of files with extension .txt in C:\Users\visha\OneDrive\Documents:
// abc.txt
// text.txt
