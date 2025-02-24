import java.util.ArrayList;
public class IndexRetrieval {
public static void main(String[] args) {
	ArrayList<String> al=new ArrayList<>();
	al.add("car");al.add("bus");
	al.add("truck");
	int index=2;
	if(al.get(index)!=null)
		System.out.println("The element at "+index+" is:"+al.get(index));
	else
		System.out.println("The element is not fouhnd at the index");
}
}

//Output:
// The element at 2 is:truck
