	package Program;
	
	import java.util.ArrayList;
	import java.util.LinkedList;
	import java.util.List;
	import java.util.Stack;
	import java.util.Vector;
	
	public class Main {
	public static void main(String[] args) {
		new LinkList().start();
		new Vectorlist().start();
		new StackList().start();
		new Arraylist().start();
	}
	}
	class LinkList extends Thread{
		public void run() {
	List<Integer> list1=new LinkedList<>();
	list1.add(35);
	list1.add(23);
	System.out.println("The given list is :"+list1);
	System.out.println("The number of elements in the list: "+list1.size());
	}
	}
	class Vectorlist extends Thread{
		public void run() {
			List<Integer> list1=new Vector<>();
			list1.add(67);
			list1.add(82);
			System.out.println("The given list is :"+list1);
			System.out.println("The number of elements in the list: "+list1.size());
		}
		}
	class Arraylist extends Thread{
		public void run() {
	        List<Integer> list1 = new ArrayList<>();
	        //System.out.println("Is list1 empty? "+list1.isEmpty());
	        list1.add(56);
	        list1.add(49);
	        System.out.println("The given list is :"+list1);
	        System.out.println("The number of elements in the list: "+list1.size());
	}
	}
	class StackList extends Thread{
	public void run() {
		List<Integer> list1=new Stack<>();
		list1.add(49);
		list1.add(49);
		System.out.println("The given list is :"+list1);
		System.out.println("The number of elements in the list: "+list1.size());
	}
	}
