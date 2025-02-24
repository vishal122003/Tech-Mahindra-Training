import java.util.ArrayList;
public class SearchElement {
public static void main(String[] args) {
	ArrayList<Integer> al=new ArrayList<>();
	al.add(1);al.add(2);al.add(3);al.add(4);al.add(5);
	System.out.println("The element is found at:"+al.indexOf(3));
}
}

//Output:
// The element is found at:2
