package Database;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class get_data_in_home {
	static connect_database obj;
	public get_data_in_home() {
		this.obj = new connect_database();
		obj.connect_to_database();
	}
	public static int get_first_id_product_of_each_categories(int id_categories) {
		int result = 0;
	    try
	    {
	        Statement statement = obj.connect.createStatement();
	        String query = " select top 1 id_product from categories where id = " + id_categories;
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	result = resultSet.getInt(1);
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
	    return result;
	}
	public static int get_new_arrival_id_product_of_each_categories(int id_categories) {
		int result = 0;
	    try
	    {
	        Statement statement = obj.connect.createStatement();
	        String query = " select top 1 product.id from categories inner join product on categories.id_product = product.id \r\n"
	        		+ " where categories.id = " + id_categories
	        		+ " order by date desc";
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	result = resultSet.getInt(1);
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
	    return result;
	}
	public static float get_new_arrival_price_product_of_each_categories(int id_categories) {
		float result = 0;
	    try
	    {
	        Statement statement = obj.connect.createStatement();
	        String query = " select top 1 product.price from categories inner join product on categories.id_product = product.id \r\n"
	        		+ " where categories.id = " + id_categories
	        		+ " order by date desc";
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	result = resultSet.getFloat(1);
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
	    return result;
	}
	public static ArrayList<String> get_data_traditional() {
		ArrayList<String> list = new ArrayList<>();
		try
	    {
	        Statement statement = obj.connect.createStatement();
	        String query = "select * from traditional \r\n"
	        		+ "where id = (\r\n"
	        		+ "		select max(id) from traditional\r\n"
	        		+ "	)";
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	list.add(resultSet.getInt(1) + "");
	        	list.add(resultSet.getString(2) + "");
	        	list.add(resultSet.getString(3) + "");
	        	list.add(resultSet.getString(4) + "");
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		return list;
	}
}
