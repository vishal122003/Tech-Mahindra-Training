import java.util.LinkedList;
public class IterationReverseOrder {
public static void main(String[] args) {
	LinkedList<Integer> al=new LinkedList<Integer>();
	al.add(1);al.add(2);al.add(3);al.add(4);al.add(5);
	for(int i=al.size()-1;i>=0;i--)
		System.out.print(al.get(i)+" ");
}
}

//Output:
// 5 4 3 2 1 
