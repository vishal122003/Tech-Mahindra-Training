import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
public class ConvertStringCase {
public static void main(String[] args) {
	List<String> word=Arrays.asList("Hello","Hi");
	List<String> upper=word.stream().map(String::toUpperCase).collect(Collectors.toList());
	List<String> lower=word.stream().map(String::toLowerCase).collect(Collectors.toList());
	System.out.println("Uppercase words"+upper);
	System.out.println("Lowercase words"+lower);
}
}

//Output:
//Uppercase words[HELLO, HI]
//Lowercase words[hello, hi]
