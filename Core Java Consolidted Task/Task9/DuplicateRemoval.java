import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
public class DuplicateRemoval {
public static void main(String[] args) {
	List<Integer> l=Arrays.asList(1,2,1,3,4,23,2,12,1,2,12,67);
	List<Integer> unique=l.stream().distinct().collect(Collectors.toList());
	System.out.println("The unique list is:"+unique);
}
}

//Output:
//The unique list is:[1, 2, 3, 4, 23, 12, 67]
