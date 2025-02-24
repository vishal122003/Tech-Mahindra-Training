import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
public class RecursivelyInsert {
	static String url="jdbc:mysql://localhost:3306/your_database";
	static String user="root";
	static String pass="Vishal@123";
public static void main(String[] args) throws SQLException{
	List<String> l=Arrays.asList("ram","sam","kishore");
	for(int i=0;i<l.size();i++) {
    Connection connection = DriverManager.getConnection(url,user, pass);
    String query="insert into name values(?)";
    PreparedStatement pst = connection.prepareStatement(query);
    pst.setString(1,l.get(i));
    pst.executeUpdate();
    connection.close();
    }
	System.out.println("Insertion Successfully");
}
}
