import java.util.Arrays;
import java.util.List;
public class EvenOddSum {
public static void main(String[] args) {
	List<Integer> l=Arrays.asList(1,2,3,4,5,6,7,8,9,10);
	evenodd(l);
}
public static <T extends Number> void evenodd(List<T> num) {
	int sumEven=0,sumOdd=0;
	for(T no:num) {
		int val=no.intValue();
		if(val%2==0)
			sumEven=sumEven+val;
		else
			sumOdd=sumOdd+val;
	}
	System.out.println("The sum of even numbers:"+sumEven);
	System.out.println("The sum of odd numbers:"+sumOdd);
}
}

//Output:
// The sum of even numbers:30
// The sum of odd numbers:25
