import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
public class SortString {
public static void main(String[] args) {
	List<String> l=Arrays.asList("hello","sorry","thank you","how are you");
	List<String> asc=l.stream().sorted().collect(Collectors.toList());
	List<String> des=l.stream().sorted((a,b)->b.compareTo(a)).collect(Collectors.toList());
	System.out.println(asc);
	System.out.println(des);
}
}

//Output:
// [hello, how are you, sorry, thank you]
// [thank you, sorry, how are you, hello]
