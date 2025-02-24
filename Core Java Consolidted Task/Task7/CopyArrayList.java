import java.util.ArrayList;
public class CopyArrayList {
public static void main(String[] args) {
	ArrayList<Integer> al=new ArrayList<Integer>();
	al.add(1);al.add(2);al.add(3);al.add(4);al.add(5);
	ArrayList<Integer> al1=new ArrayList<Integer>(al);
	System.out.println("Array List:"+al);
	System.out.println("Array List Copy:"+al1);
}
}

//Output:
// Array List:[1, 2, 3, 4, 5]
// Array List Copy:[1, 2, 3, 4, 5]
