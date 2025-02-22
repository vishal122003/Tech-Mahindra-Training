import java.util.Arrays;
public class EqualsAndDeepEquals {
public static void main(String[] args) {
	String s1="hello",s2="hi",s3="hello";
	Integer[] arr= {1,2,3,4};
	Integer[] arr1= {5,6,7,8};
	Integer[] arr2= {1,2,3,4};
	System.out.println(s1.equals(s2));
	System.out.println(s1.equals(s3));
	System.out.println(Arrays.deepEquals(arr,arr2));
	System.out.println(Arrays.deepEquals(arr, arr1));
}
}

// Output:
// false
// true
// true
// false
