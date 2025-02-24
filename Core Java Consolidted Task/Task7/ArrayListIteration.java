import java.util.ArrayList;
public class ArrayListIteration {
public static void main(String[] args) {
	ArrayList<Integer> al=new ArrayList<Integer>();
	al.add(1);
	al.add(2);al.add(3);
	al.add(4);al.add(5);
	for(int i=0;i<al.size();i++)
		System.out.print(al.get(i)+" ");
}
}

//Output:
//1 2 3 4 5 
