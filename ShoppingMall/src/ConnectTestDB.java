import java.sql.*;

public class ConnectTestDB {
public static void main(String[] args){
	Connection conn = null;
	Statement stmt;
	String jdbcUrl = "jdbc:mysql://localhost:3306/shopdb1";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String userID = "root";
		String userPass ="lsks1878";
		System.out.println("-+-+-+-+-+");
		conn = DriverManager.getConnection(jdbcUrl, userID, userPass);
		System.out.println("******************");
		stmt = conn.createStatement();
		System.out.println("connect success");
		
		stmt.close();
		conn.close();
	} catch (Exception e) {
		System.out.println("connect fffff");
		// TODO: handle exception
	}
}
}
