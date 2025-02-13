import java.io.*;

public class Deserialization {
    public static void main(String[] args) {
        try {
            ObjectInputStream in=new ObjectInputStream(new FileInputStream("f.txt"));
            Student s=(Student)in.readObject();
            System.out.println(s.rno + " " + s.name);
            in.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
class Student implements Serializable {
    Student(int rno, String name) {
        this.rno = rno;
        this.name = name;
    }
    int rno;
    String name;
}
