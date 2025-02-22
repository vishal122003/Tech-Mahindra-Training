public class AlternativeCapitilization {
public static void main(String[] args) {
	String str="anurag";
	String alt="";
	for (int i = 0; i < str.length(); i++) {
		if(i%2==0)
			alt=alt+Character.toUpperCase(str.charAt(i));
		else
			alt=alt+str.charAt(i);
	}
	System.out.println(str);
	System.out.println("Alternative Uppercase Characters in string:"+alt);
}
}

//Output:
// anurag
// Alternative Uppercase Characters in string:AnUrAg
