import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;
public class DynamicUpdate {
	static String url="jdbc:mysql://localhost:3306/jdbc";
	static String user="root";
	static String pass="Vishal@123";
public static void main(String[] args) throws SQLException {
	Scanner sc=new Scanner(System.in);
	System.out.println("Enter the row to be updated");
	int row=sc.nextInt();
	System.out.println("Enter the new name");
	String str=sc.next();
	Connection connection = DriverManager.getConnection(url,user, pass);
	String query="update employee set name=? where id=?;";
	PreparedStatement pst = connection.prepareStatement(query);
	pst.setString(1,str);
	pst.setInt(2,row);
	pst.executeUpdate();
	connection.close();
}
}
