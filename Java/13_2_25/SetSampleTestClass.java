package Program;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.TreeSet;

public class SetSampleTestClass {
public static void main(String[] args) {
	HashSet<Integer> list1=new HashSet<>();
	list1.add(7);
	list1.add(14);
	list1.add(21);
	list1.add(35);
	list1.add(1);
	list1.add(4);
	list1.add(2);
	list1.add(3);
	setSample(list1);
	LinkedHashSet<String> list2=new LinkedHashSet<String>();
	list2.add("hello");
	list2.add("how are you");
	list2.add("where are you");
	list2.add("hi");
	list2.add("where");list2.add("when are going");
	list2.add("what ate you doing");
	list2.add("which");
	setSample(list2);
	TreeSet<Float> list3=new TreeSet<Float>();
	list3.add(1.1f);
	list3.add(2.3f);
	list3.add(3.4f);
	list3.add(5.4f);
	list3.add(20.3f);
	list3.add(25.3f);
	list3.add(27.3f);
	list3.add(29.3f);
	setSample(list3);
}
public static void setSample(HashSet<Integer> hs) {
	System.out.println("The given list is :"+hs);
	System.out.println("The number of elements in the list: "+hs.size());
	hs.remove(1);
	System.out.println("After Removal"+hs);
	hs.removeIf(num->num%7==0);
	System.out.println("Size"+hs.size()+"Elements: "+hs);
}
static void setSample(LinkedHashSet<String> hs) {
	System.out.println("The given list is :"+hs);
	System.out.println("The number of elements in the list: "+hs.size());
	hs.remove("what");
	System.out.println("After Removal"+hs);
	hs.removeIf(str->str.length()<7);
	System.out.println("Size"+hs.size()+"Elements: "+hs);
}
static void setSample(TreeSet<Float> hs) {
	System.out.println("The given list is :"+hs);
	System.out.println("The number of elements in the list: "+hs.size());
	hs.remove(1.1f);
	System.out.println("After Removal"+hs);
	hs.removeIf(f->f<20);
	System.out.println("Size"+hs.size()+"Elements: "+hs);
}
}
