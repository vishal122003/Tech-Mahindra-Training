import java.util.Arrays;
import java.util.List;
public class AverageWithStreams {
    public static void main(String[] args) {
        List<Integer> numbers=Arrays.asList(10,20,30,40,50);
        double avg=numbers.stream().mapToInt(Integer::intValue).average().orElse(0.0);
        System.out.println("The average is: "+avg);
    }}
