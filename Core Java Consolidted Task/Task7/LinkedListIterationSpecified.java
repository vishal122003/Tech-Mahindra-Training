import java.util.LinkedList;
public class LinkedListIterationSpecified {
public static void main(String[] args) {
	LinkedList<Integer> al=new LinkedList<Integer>();
	al.add(1);al.add(2);al.add(3);al.add(4);al.add(5);
	int pos=3;
	if(pos<al.size()-1) {
	for(int i=pos;i<al.size();i++)
		System.out.println(al.get(i)+" ");
	}
	else
		System.out.println("Index Out Of Bounds Iteration");
}
}

//Output:
// 4 
// 5 
