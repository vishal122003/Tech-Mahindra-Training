import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class JDBCCrud {
	static String url="jdbc:mysql://localhost:3306/jdbc1";
	static String user="root";
	static String pass="Vishal@123";
public static void main(String[] args) {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connect=DriverManager.getConnection(url,user,pass);
		PreparedStatement pt=connect.prepareStatement("insert into employee value(?,?,?)");
		pt.setInt(1, 5);
		pt.setString(2, "Jose");
		pt.setInt(3, 17000);
		pt.executeUpdate();
		PreparedStatement selectpt=connect.prepareStatement("select * from employee");
		ResultSet rs=selectpt.executeQuery();
		while(rs.next())
			System.out.println("Id:"+rs.getInt("id")+", Name:"+rs.getString("name")+", Salary:"+rs.getInt("sal"));
		PreparedStatement updateps=connect.prepareStatement("update employee set sal=? where id=?");
		updateps.setInt(1,10000);
		updateps.setInt(2, 1);
		updateps.executeUpdate();
		PreparedStatement deleteps=connect.prepareStatement("delete from employee where id=?");
		deleteps.setInt(1, 1);
		deleteps.executeUpdate();
		connect.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}
