import java.util.ArrayList;
import java.util.Collections;
public class SortArrayList {
public static void main(String[] args) {
	ArrayList<Integer> al=new ArrayList<Integer>();
	al.add(67);al.add(46);al.add(12);al.add(35);
	System.out.println("Before Sorting:"+al);
	Collections.sort(al);
	System.out.println("After Sorting:"+al);
}
}

//Output:
// Before Sorting:[67, 46, 12, 35]
// After Sorting:[12, 35, 46, 67]
