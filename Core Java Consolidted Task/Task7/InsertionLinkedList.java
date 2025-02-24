import java.util.LinkedList;
public class InsertionLinkedList {
public static void main(String[] args) {
	LinkedList<Integer> al=new LinkedList<Integer>();
	al.add(1);al.add(2);al.add(3);al.add(4);al.add(5);
	int index=3;
	System.out.println("Before Insertion:"+al);
	al.set(index, 6);
	System.out.println("After Insertion at "+index+" Position:"+al);
}
}

//Output:
// Before Insertion:[1, 2, 3, 4, 5]
// After Insertion at 3 Position:[1, 2, 3, 6, 5]
