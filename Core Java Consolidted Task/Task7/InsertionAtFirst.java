import java.util.ArrayList;
public class InsertionAtFirst {
public static void main(String[] args) {
	ArrayList<Integer> al=new ArrayList<Integer>();
	al.addFirst(1);
	al.addFirst(2);al.addFirst(3);al.addFirst(4);
	al.addFirst(5);
	System.out.println(al);
}
}

//Output:
//[5, 4, 3, 2, 1]
