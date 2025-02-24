public class ArrayComparison {
public static void main(String[] args) {
	Integer[] arr= {1,2,3,4,5,6};
	Integer[] arr1= {6,7,8,9,10,11};
	if(arrayEqual(arr, arr1))
		System.out.println("Arrays are equal");
	else
		System.out.println("Array are not equal");
}
public static<T> boolean arrayEqual(T[] arr1,T[] arr2) {
	if(arr1.length!=arr2.length)
		return false;
	for(int i=0;i<arr1.length;i++) {
		if(arr1[i]!=arr2[i])
			return false;
	}
	return true;
}
}

//Output:
//Array are not equal
