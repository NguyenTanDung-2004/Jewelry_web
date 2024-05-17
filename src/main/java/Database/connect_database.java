package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.microsoft.sqlserver.jdbc.SQLServerDriver;

public class connect_database {
	public Connection connect;
	public void connect_to_database()
	{
		try {
			DriverManager.registerDriver(new SQLServerDriver());
			String url = "jdbc:sqlserver://localhost:1433;databaseName=web_jewelry;user=sa;password=12345;trustServerCertificate = true;";
			connect = DriverManager.getConnection(url);
			System.out.println("nguyentandung");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
