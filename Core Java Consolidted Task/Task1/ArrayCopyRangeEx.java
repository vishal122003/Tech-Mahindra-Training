import java.util.Arrays;
public class ArrayCopyRangeEx {
public static void main(String[] args) {
	int[] arr= {10,20,30,40,50,60,70,80,90,100};
	int[] arr1=Arrays.copyOfRange(arr, 2, 7);
	System.out.println(Arrays.toString(arr));
	System.out.println("Copy Of Range in Array:");
	System.out.println(Arrays.toString(arr1));
}
}

//Output:
// [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
// Copy Of Range in Array:
// [30, 40, 50, 60, 70]
