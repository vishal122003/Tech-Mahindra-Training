public class AlternativeElements {
	public static void main(String[] args) {
	int[] arr= {10,20,30,40,50,60,70,80,90,100};
	int[] arr1=new int[arr.length/2];
	int j=0;
	for(int i=0;i<arr.length;i=i+2) {
		arr1[j++]=arr[i];
	}
	System.out.println(Arrays.toString(arr));
	System.out.println(Arrays.toString(arr1));
}
}
