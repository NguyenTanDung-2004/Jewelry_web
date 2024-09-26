package Database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class interact_with_collections {

	private static Connection conn;
	 
	 static {
		 connect_database c = new connect_database();
	     c.connect_to_database();
	     conn = c.connect;
	}

	public static ArrayList<Integer> get_all_spring(){

		ArrayList<Integer> springsID = new ArrayList<>();
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT id_product FROM collections WHERE id = 1";
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	Integer id_springs = resultSet.getInt("id_product");
	        	springsID.add(id_springs);
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
		return springsID;
	}

	public static ArrayList<Integer> get_all_summer(){
		
		ArrayList<Integer> summersID = new ArrayList<>();
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT id_product FROM collections WHERE id = 2";
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	Integer id_summers = resultSet.getInt("id_product");
	        	summersID.add(id_summers);
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
		return summersID;
	}

	public static ArrayList<Integer> get_all_autumn(){
		
		ArrayList<Integer> autumnsID = new ArrayList<>();
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT id_product FROM collections WHERE id = 3";
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	Integer id_autumns = resultSet.getInt("id_product");
	        	autumnsID.add(id_autumns);
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
		return autumnsID;
	}

	public static ArrayList<Integer> get_all_winter(){
		
		ArrayList<Integer> wintersID = new ArrayList<>();
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT id_product FROM collections WHERE id = 4";
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	Integer id_winters = resultSet.getInt("id_product");
	        	wintersID.add(id_winters);
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
		return wintersID;
	}

	public static ArrayList<Integer> get_all_love(){
		
		ArrayList<Integer> lovesID = new ArrayList<>();
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT id_product FROM collections WHERE id = 5";
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	Integer id_loves = resultSet.getInt("id_product");
	        	lovesID.add(id_loves);
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
		return lovesID;
	}
	public static ArrayList<Integer> get_first_id(){
		ArrayList<Integer> list = new ArrayList<Integer>();
		list.add(get_all_spring().get(0));
		list.add(get_all_summer().get(3));
		list.add(get_all_autumn().get(4));
		list.add(get_all_winter().get(7));
		list.add(get_all_love().get(1));
		return list;
	}
}