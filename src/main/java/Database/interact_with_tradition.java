package Database;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class interact_with_tradition {
	private static Connection conn;
	 
	 static {
		 connect_database c = new connect_database();
	     c.connect_to_database();
	     conn = c.connect;
	 }
	public static int get_current_tradition() {
		// trả về tradition có id lớn nhất
		Integer maxID = 0;
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT MAX(id) AS max_id FROM traditional";
	        ResultSet resultSet = statement.executeQuery(query);
	        if(resultSet.next()) {
	        	maxID = resultSet.getInt("max_id");
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
		return maxID;
	}
	public static String get_link_current() {
		// trả về link cuar tradition co id lon nhats
       String linkString = "";
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT TOP 1 link FROM traditional ORDER BY id DESC ";
	        ResultSet resultSet = statement.executeQuery(query);
	        if(resultSet.next()) {
	        	linkString = resultSet.getString("link");
	        }
	    }
		catch(Exception e)
		{
			System.out.println(e);
		}
		return linkString;
	}
	public static String get_title() {
		// trả về title cuar tradition co id lon nhats
       String titleString = "";
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT TOP 1 title FROM traditional ORDER BY id DESC ";
	        ResultSet resultSet = statement.executeQuery(query);
	        if(resultSet.next()) {
	        	titleString = resultSet.getString("title");
	        }
	    }
		catch(Exception e)
		{
			System.out.println(e);
		}
		return titleString;
	}
	public static String get_text() {
		// trả về text cuar tradition co id lon nhats
       String textString = "";
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT TOP 1 text FROM traditional ORDER BY id DESC ";
	        ResultSet resultSet = statement.executeQuery(query);
	        if(resultSet.next()) {
	        	textString = resultSet.getString("text");
	        }
	    }
		catch(Exception e)
		{
			System.out.println(e);
		}
		return textString;
	}
}