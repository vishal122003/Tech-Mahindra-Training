import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;
public class MenuDrivenJDBC {
	static String url = "jdbc:mysql://localhost:3306/jdbc";
	static String username = "root";
	static String password = "Vishal@123";
public static void main(String[] args) throws SQLException {
	Scanner sc=new Scanner(System.in);
	System.out.println("1:Insert a new row \n 2:Update a row \n 3:Delete a row \n"
			+ "4:Select a row \n 5:Exit\n Enter a choice:");
	int choice=sc.nextInt();
	switch(choice) {
	case 1:{
		System.out.println("Enter the Employee id:");
		int id=sc.nextInt();
		System.out.println("Enter the Employee name:");
		String name=sc.nextLine();
		System.out.println("Enter the salary:");
		int sal=sc.nextInt();
		insertRecordWithPreparedStatement(choice, name, sal);
		break;
	}
	case 2:{
		System.out.println("Enter the Employee id:");
		int id=sc.nextInt();
		System.out.println("Enter the salary to be updated:");
		int sal=sc.nextInt();
		updateRecordWithPreparedStatement(id, sal);
		break;
	}
	case 3:{
		System.out.println("Enter the id to be deleted:");
		int id=sc.nextInt();
		deleteRecordWithPreparedStatement(id);
		break;
	}
	case 4:{
		System.out.println("Enter the id to be selected:");
		int id=sc.nextInt();
		selectRecordsWithPreparedStatement(id);
		break;
	}
	case 5:
		break;
	default:{
		System.out.println("Enter the correct choice");
		break;
	}}}
	public static void insertRecordWithPreparedStatement(int id,String  name, int salary) throws SQLException {
		String query = "insert into employee values(?,?,?);";
		Connection connect = DriverManager.getConnection(url,username,password);
		PreparedStatement pst = connect.prepareStatement(query);
		pst.setInt(1,id);
		pst.setString(2,name);
		pst.setInt(3,salary);
		System.out.println("Number of rows affected:"+pst.executeUpdate());
		connect.close();
	}
	 public static void updateRecordWithPreparedStatement(int id, int salary) throws SQLException {
	        String query = "update employee set salary=? where id=?;";
	        Connection connect = DriverManager.getConnection(url,username,password);
	        PreparedStatement pst = connect.prepareStatement(query);
	        pst.setInt(1,salary);
	        pst.setInt(2,id);
	        System.out.println("Number of rows affected:"+pst.executeUpdate());
	        connect.close();
	    }
	 public static void deleteRecordWithPreparedStatement(int id) throws SQLException {
	        String query = "delete from employee where id=?;";
	        Connection connect = DriverManager.getConnection(url,username,password);
	        PreparedStatement pst = connect.prepareStatement(query);
	        pst.setInt(1,id);
	        System.out.println("Number of rows affected:"
	                +pst.executeUpdate());
	        connect.close();
	    }
		public static  void selectRecordsWithPreparedStatement(int id) throws SQLException {
	        Connection connection = DriverManager.getConnection(url,username, password);
	        PreparedStatement pstmt = connection.prepareStatement("select id,name from employee where id=?");
	        pstmt.setInt(1,id);
	        ResultSet rs = pstmt.executeQuery();
	        while(rs.next()) {
	            System.out.print("\nId is:" + rs.getInt(1));
	            System.out.print("\nName is:" + rs.getString(2));

	        }
	        connection.close();
	    }
}
