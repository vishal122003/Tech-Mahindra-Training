import java.util.Arrays;
import java.util.List;
public class CountStrings {
public static void main(String[] args) {
	List<String> l=Arrays.asList("hello","sorry","thank you","how are you");
	char letter='h';
	long c=l.stream().filter(lt->lt.startsWith(String.valueOf(letter))).count();
	System.out.println("The count of the strings starting with "+letter+" is "+c);
}
}

//Output:
//The count of the strings starting with h is 2
