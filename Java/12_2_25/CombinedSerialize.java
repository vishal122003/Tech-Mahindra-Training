import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
public class CombinedSerializaedeserialize {
 public static void main(String[] args) {
    try {
        Student s1 = new Student(211, "ravi");
        FileOutputStream fout = new FileOutputStream("f.txt");
        ObjectOutputStream out = new ObjectOutputStream(fout);
        out.writeObject(s1);
        out.flush();
        out.close();
        System.out.println("success");
        ObjectInputStream in = new ObjectInputStream(new FileInputStream("f.txt"));
        Student s = (Student) in.readObject();
        System.out.println(s.rno + " " + s.name);
        in.close();
    } catch (Exception e) {
        System.out.println(e);
    }
}
}
