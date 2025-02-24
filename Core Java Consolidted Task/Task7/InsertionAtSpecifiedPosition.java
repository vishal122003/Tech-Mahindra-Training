import java.util.LinkedList;
public class InsertionAtSpecifiedPosition {
public static void main(String[] args) {
	LinkedList<Integer> al=new LinkedList<Integer>();
	al.add(1);al.add(2);al.add(3);al.add(4);al.add(5);
	int element=6,pos=3;
	System.out.println("Linked List:"+al);
	al.add(pos, element);
	System.out.println("After Insertion At "+pos+" Position:"+al);
}
}
//Output:
// Linked List:[1, 2, 3, 4, 5]
// After Insertion At 3 Position:[1, 2, 3, 6, 4, 5]
