import java.util.Arrays;
import java.util.List;
public class ElementFinder {
public static void main(String[] args) {
	List<Integer> l=Arrays.asList(1,2,3,4,5,6,7);
	int target=6;
	int idx=findElement(l,target);
	System.out.println("The index of "+target+" is "+idx);
	target=5;
	idx=findElement(l, target);
	System.out.println("The index of "+target+" is "+idx);
}
static <T> int findElement(List<T> list,T target) {
	for(int i=0;i<list.size();i++) {
		if(list.get(i)==target)
			return i;
	}
	return -1;
}
}

//Output:
// The index of 6 is 5
// The index of 5 is 4
