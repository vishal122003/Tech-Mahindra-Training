import java.util.Arrays;
import java.util.List;
public class MaxMin {
public static void main(String[] args) {
	List<Integer> l=Arrays.asList(1,2,23,45,54);
	int max=l.stream().mapToInt(Integer::intValue).max().orElseThrow();
	int min=l.stream().mapToInt(Integer::intValue).min().orElseThrow();
	System.out.println("Maximum:"+max+"\nMinimum:"+min);
}
}

//Output:
// Maximum:54
// Minimum:1
