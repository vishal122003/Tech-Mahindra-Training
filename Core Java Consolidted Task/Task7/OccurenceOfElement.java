import java.util.LinkedList;
public class OcurrenceOfElement {
public static void main(String[] args) {
	LinkedList<Integer> al=new LinkedList<Integer>();
	al.add(1);al.add(2);al.add(3);al.add(4);al.add(5);al.add(1);
	System.out.println("First Index Of 1 is:"+al.indexOf(1));
	System.out.println("Last Index Of 1 is:"+al.lastIndexOf(1));
}
}

//Output:
// First Index Of 1 is:0
// Last Index Of 1 is:5
