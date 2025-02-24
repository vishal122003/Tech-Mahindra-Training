import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
public class RevreseList {
public static void main(String[] args) {
	List<Integer> l=Arrays.asList(1,2,3,4,5);
	List<Integer> rl=reverseList(l);
	System.out.println("List:"+l);
	System.out.println("Reverse List:"+rl);
}
static <T> List<T> reverseList(List<T> l) {
	List<T> reverse=new ArrayList<>();
	for(int i=l.size()-1;i>=0;i--)
		reverse.add(l.get(i));
	return reverse;
}
}

//Output:
// List:[1, 2, 3, 4, 5]
// Reverse List:[5, 4, 3, 2, 1]
