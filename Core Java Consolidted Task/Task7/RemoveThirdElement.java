import java.util.ArrayList;
public class RemoveThirdElement {
public static void main(String[] args) {
	ArrayList<Integer> al=new ArrayList<>();
	al.add(1);al.add(2);al.add(3);al.add(4);al.add(5);
	System.out.println(al);
	al.remove(2);
	System.out.println(al);
}
}

//Output:
// [1, 2, 3, 4, 5]
// [1, 2, 4, 5]

