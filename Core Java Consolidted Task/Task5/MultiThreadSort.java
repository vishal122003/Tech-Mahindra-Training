public class MultiSortThread extends Thread{
	int[] array;
	int left,right;
	
	public MultiSortThread(int[] array, int left, int right) {
		this.array = array;
		this.left = left;
		this.right = right;
	}
	@Override
	public void run() {
		// TODO Auto-generated method stub
		mergeSort(array,left,right);
	}
	void mergeSort(int[] arr,int left,int right){
		if(left<right) {
            int middle=(left+right)/2;
            Thread leftThread = new MultiSortThread(array,left, middle);
            Thread rightThread = new MultiSortThread(array,middle+1,right);
            leftThread.start();
            rightThread.start();
            try {
                leftThread.join();
                rightThread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            merge(array,left,middle,right);
	}
}
	void merge(int[] array, int left, int middle, int right) {
        int n1=middle-left+1;
        int n2=right-middle;
        int[] leftArray=new int[n1];
        int[] rightArray=new int[n2];
        System.arraycopy(array, left, leftArray, 0, n1);
        System.arraycopy(array, middle + 1, rightArray, 0, n2);
        int i=0,j=0;
        int k = left;
        while (i < n1 && j < n2) {
            if (leftArray[i] <= rightArray[j]) {
                array[k] = leftArray[i];
                i++;
            } 
            else {
                array[k] = rightArray[j];
                j++;
            }
            k++;
        }
        while (i < n1) {
            array[k] = leftArray[i];
            i++;
            k++;
        }
        while (j < n2) {
            array[k] = rightArray[j];
            j++;
            k++;
        }
    }
}
import java.util.Arrays;
public class MultiThreadedSort {
public static void main(String[] args) {
	int[] arr= {10,3,8,12,15,1};
	System.out.println("Original Array:"+Arrays.toString(arr));
	MultiSortThread thread=new MultiSortThread(arr, 0, arr.length-1);
	thread.start();
	try {
		thread.join();
	}
	catch(InterruptedException e){
		e.printStackTrace();
	}
	System.out.println("Sorted Array:"+Arrays.toString(arr));
}
}
