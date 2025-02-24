import java.util.LinkedList;
public class AppendLinkedList {
public static void main(String[] args) {
	LinkedList<Integer> al=new LinkedList<Integer>();
	al.add(1);al.add(2);al.add(3);al.add(4);al.add(5);
	System.out.println("Original LinkedList:"+al);
	al.add(7);
	System.out.println("After append:"+al);
}
}

//Output:
// Original LinkedList:[1, 2, 3, 4, 5]
// After append:[1, 2, 3, 4, 5, 7]
