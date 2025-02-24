import java.util.ArrayList;
import java.util.Collections;
public class ShuffleArrayList {
public static void main(String[] args) {
	ArrayList<Integer> al=new ArrayList<Integer>();
	al.add(1);al.add(2);al.add(3);al.add(4);al.add(5);
	System.out.println("Original List:"+al);
	Collections.shuffle(al);
	System.out.println("Shuffled List:"+al);
}
}

//Output:
// Original List:[1, 2, 3, 4, 5]
// Shuffled List:[4, 5, 3, 1, 2]
