import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
public class EvenOddSum {
public static void main(String[] args) {
	List<Integer> l=Arrays.asList(1,2,3,4,5,6,7,8,9,10);
	Map<Boolean,Integer> mp=l.stream().collect(Collectors.partitioningBy(n->n%2==0,Collectors.summingInt(Integer::intValue)));
	int sumEven=mp.get(true);
	int sumOdd=mp.get(false);
	System.out.println("Sum of even numbers:"+sumEven);
	System.out.println("Sum of odd numbers:"+sumOdd);
}
}

//Output:
// Sum of even numbers:30
// Sum of odd numbers:25
