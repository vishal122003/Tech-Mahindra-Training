import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
public class MergeList {
public static void main(String[] args) {
	List<Integer> l=Arrays.asList(1,2,3,4,5);
	List<Integer> lt=Arrays.asList(6,7,8,9,10);
	List<Integer> res=mergelist(l,lt);
	System.out.println(res);
}
static <T> List<T> mergelist(List<T> l,List<T> lt){
	List<Integer> les=new ArrayList<>();
	for(int i=0;i<l.size();i++)
		les.add((Integer) l.get(i));
	for(int i=0;i<lt.size();i++) {
		les.add((Integer) lt.get(i));
	}
	return (List<T>) les;
}
}

//Output:
// [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
