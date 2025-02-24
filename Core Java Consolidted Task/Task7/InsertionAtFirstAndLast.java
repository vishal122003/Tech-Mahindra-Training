import java.util.LinkedList;
public class InsertionAtFirstAndLast {
public static void main(String[] args) {
	LinkedList<Integer> al=new LinkedList<Integer>();
	al.add(1);al.add(2);al.add(3);al.add(4);al.add(5);
	System.out.println("Linked List:"+al);
	al.addFirst(6);
	System.out.println("After Insertion At First:"+al);
	al.addLast(7);
	System.out.println("After Insertion At Last:"+al);
}
}

//Output:
// Linked List:[1, 2, 3, 4, 5]
// After Insertion At First:[6, 1, 2, 3, 4, 5]
// After Insertion At Last:[6, 1, 2, 3, 4, 5, 7]

