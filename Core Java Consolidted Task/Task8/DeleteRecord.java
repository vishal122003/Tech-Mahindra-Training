import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;
public class DeleteRow {
	static String url="jdbc:mysql://localhost:3306/jdbc";
	static String user="root";
	static String pass="Vishal@123";
public static void main(String[] args) throws SQLException {
	Scanner sc=new Scanner(System.in);
	System.out.println("Enter the row to be deleted");
	int row=sc.nextInt();
	Connection connection = DriverManager.getConnection(url,user, pass);
	String query = "delete from employee where id=?;";
	PreparedStatement pst = connection.prepareStatement(query);
	pst.setInt(1,row);
    System.out.println("Number of rows affected:"
            +pst.executeUpdate());
    connection.close();
}
}
