import java.util.LinkedList;
public class InsertionAtFirst {
public static void main(String[] args) {
	LinkedList<Integer> al=new LinkedList<Integer>();
	al.add(1);al.add(2);al.add(3);al.add(4);al.add(5);
	int element=6;
	System.out.println("Linked List:"+al);
	al.addFirst(element);
	System.out.println("After Insertion At First:"+al);
}
}

//Output:
// Linked List:[1, 2, 3, 4, 5]
// After Insertion At First:[6, 1, 2, 3, 4, 5]
