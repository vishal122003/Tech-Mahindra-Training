import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Scanner;
class Student{
	String name;
	int[] marks;
	int total;
	float avg;
	public Student(String name, int[] marks, int total, float avg) {
		this.name = name;
		this.marks = marks;
		this.total = total;
		this.avg = avg;
	}
}
public class StudentMarks {
public static void main(String[] args) {
	Scanner s=new Scanner(System.in);
	ArrayList<Student> st=new ArrayList<>();
	System.out.println("Enter No.of Students");
	int c=s.nextInt();
	for (int i = 0; i <c; i++) {
		System.out.println("Enter the Student name");
		String name=s.next();
		System.out.println("Enter the no.of subjects");
		int subc=s.nextInt();
		int marks[]=new int[subc];
		System.out.println("Enter the Subject martks");
		int total=0;float avg=0;
		for (int j = 0; j < subc; j++) {
			marks[j]=s.nextInt();
			total=total+marks[j];
		}
		avg=total/subc;
		
		st.add(new Student(name, marks, total, avg));
	}
	Collections.sort(st,new Comparator<Student>() {
		public int compare(Student s1,Student s2) {
			return Integer.compare(s1.total, s2.total);
		}
	});
	System.out.println("Sorted List of Students by total marks");
	for(Student stu:st) {
		System.out.println("Name:"+stu.name+"\t Total Marks:"+stu.total+"\t Average:"+stu.avg);
	}
}
}

//output:
// Enter No.of Students
// 5
// Enter the Student name
// sam
// Enter the no.of subjects
// 5
// Enter the Subject martks
// 81
// 89
// 82
// 93
// 72
// Enter the Student name
// ram
// Enter the no.of subjects
// 5
// Enter the Subject martks
// 81
// 72
// 91
// 78
// 89
// Enter the Student name
// john
// Enter the no.of subjects
// 5
// Enter the Subject martks
// 89
// 81
// 92
// 78
// 81
// Enter the Student name
// jose
// Enter the no.of subjects
// 5
// Enter the Subject martks
// 91
// 82
// 73
// 87
// 78
// Enter the Student name
// vicky
// Enter the no.of subjects
// 5
// Enter the Subject martks
// 81
// 71
// 82
// 93
// 85
// Sorted List of Students by total marks
// Name:ram	 Total Marks:411	 Average:82.0
// Name:jose	 Total Marks:411	 Average:82.0
// Name:vicky	 Total Marks:412	 Average:82.0
// Name:sam	 Total Marks:417	 Average:83.0
// Name:john	 Total Marks:421	 Average:84.0
