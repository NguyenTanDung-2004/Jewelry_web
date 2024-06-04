package Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entry.Product;

public class interact_with_product {
	private static Connection conn;
	 
	 static {
		 connect_database c = new connect_database();
	     c.connect_to_database();
	     conn = c.connect;
	 }
	public static ArrayList<Integer> get_all_necklaces(){
		// trả về một mảng chứa các id của necklaces
		ArrayList<Integer> necklacesID = new ArrayList<>();
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT id_product FROM categories WHERE id = 3";
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	Integer id_necklaces = resultSet.getInt("id_product");
	        	necklacesID.add(id_necklaces);
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
		return necklacesID;
	}
	public static ArrayList<Integer> get_all_rings(){
		// trả về một mảng chứa các id của rings
		ArrayList<Integer> ringsID = new ArrayList<>();
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT id_product FROM categories WHERE id = 1";
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	Integer id_rings = resultSet.getInt("id_product");
	        	ringsID.add(id_rings);
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
		return ringsID;
	}
	public static ArrayList<Integer> get_all_earrings(){
		// trả về một mảng chứa các id của earrings
		ArrayList<Integer> earringsID = new ArrayList<>();
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT id_product FROM categories WHERE id = 4";
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	Integer id_earrings = resultSet.getInt("id_product");
	        	earringsID.add(id_earrings);
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
		return earringsID;
	}
	public static ArrayList<Integer> get_all_bracelets(){
		// trả về một mảng chứa các id của earrings
		ArrayList<Integer> braceletsID = new ArrayList<>();
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT id_product FROM categories WHERE id = 2";
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	Integer id_bracelets = resultSet.getInt("id_product");
	        	braceletsID.add(id_bracelets);
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
		return braceletsID;
	}
	public static ArrayList<Integer> get_all_new_arrivals_top10(){
		// trả về một mảng chứa các id của 10 sản phẩm gần nhất
		ArrayList<Integer> arrivalsID = new ArrayList<>();
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT TOP 10 id FROM product ORDER BY date DESC";
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	Integer id_arrivals = resultSet.getInt("id");
	        	arrivalsID.add(id_arrivals);
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
		return arrivalsID;
	}
	public static ArrayList<Integer> get_all_new_arrivals_top4(){
		// trả về một mảng chứa các id của 4 sản phẩm gần nhất
		ArrayList<Integer> arrivals4ID = new ArrayList<>();
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT TOP 4 id FROM product ORDER BY date DESC";
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	Integer id_arrivals = resultSet.getInt("id");
	        	arrivals4ID.add(id_arrivals);
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
		return arrivals4ID;
	}
	
	public static ArrayList<String> get_detail_product(int id){
		// arraylist này lưu trữ (giá gốc, giá hiện tại, info, tên)
	    ArrayList<String> detail = new ArrayList<>();
	    
	    try
	    {
	        String query = "SELECT price, discount, name, info FROM product WHERE id = ? ";
	        PreparedStatement preparedStatement = conn.prepareStatement(query);
	        preparedStatement.setInt(1, id);
	        
	        ResultSet resultSet = preparedStatement.executeQuery();
	        
	        if(resultSet.next()) {
	        	float price = resultSet.getFloat("price");
	        	float discount = resultSet.getFloat("discount");
	        	float currentPrice = price * (1 - discount);
	        	String name = resultSet.getString("name");
	        	String info = resultSet.getString("info");
	        	
	        	detail.add(name);
	        	detail.add(info);
	        	detail.add(String.format("%.2f",price));
	        	detail.add(String.format("%.2f",currentPrice));
	        	detail.add(String.format("%.2f",discount));
	        }
	    }
	    catch(Exception e){
			System.out.println(e);
		}
		return detail;
	}
	
	public static ArrayList<Product> get_related_products(int id){
		//trả về Danh sach nhung detail của related product (những sản phẩm cùng categories của sản phẩm đang hiện)
		Product product = new Product();
		ArrayList<Product> relatedList = new ArrayList<Product>();
	    ArrayList<Integer> relatedProducts = new ArrayList<Integer>();
	    
	    try
	    {
	    	String query = "SELECT TOP 6 c2.id_product FROM categories c1 JOIN categories c2 ON c2.id = c1.id WHERE c1.id_product = ? AND c2.id_product != ? ORDER BY NEWID()";
	        PreparedStatement preparedStatement = conn.prepareStatement(query);
	        preparedStatement.setInt(1, id);
	        preparedStatement.setInt(2, id);
	        
	        ResultSet resultSet = preparedStatement.executeQuery();
	        while(resultSet.next()) {
	        	Integer relatedProductID = resultSet.getInt("id_product");
	        	relatedProducts.add(relatedProductID);
	        }

		    for(Integer relatedID : relatedProducts ) {
	        	product = getProductByID(relatedID);
	        	relatedList.add(product);
	        }
	    }
	    catch (SQLException e) { 
           System.out.println(e);
       }
	    catch(Exception e){
			System.out.println(e);
		}
		return relatedList;
	}
	public static boolean check_product_in_cart(int id_product, int id_user, float size) {
		// true là có, false là không có.
		boolean check = false;
	    try
	    {
	        String query = "SELECT COUNT(*) AS SL FROM cart c WHERE id_user = ? AND id_product = ? AND size = ? ";
	        PreparedStatement preparedStatement = conn.prepareStatement(query);
	        preparedStatement.setInt(1, id_user);
	        preparedStatement.setInt(2, id_product);
	        preparedStatement.setFloat(3, size);
	        
	        ResultSet resultSet = preparedStatement.executeQuery();
	        if(resultSet.next()) {
	        	int count = resultSet.getInt("SL");
	        	check = (count > 0);
	        	
	        }
	    }
	    catch (SQLException e) { 
           System.out.println(e);
       }
	    catch(Exception e){
			System.out.println(e);
		}
		return check;
	}
	public static ArrayList<ArrayList<Object>> get_all_product_orderby_random(){
		ArrayList<ArrayList<Object>> list = new ArrayList<>();
	    try
	    {
	        Statement statement = conn.createStatement();
	        String query = "SELECT *\r\n"
	        		+ "FROM product\r\n"
	        		+ "ORDER BY NEWID();";
	        ResultSet resultSet = statement.executeQuery(query);
	        while(resultSet.next()) {
	        	ArrayList<Object> list1 = new ArrayList<>();
	        	list1.add(resultSet.getInt(1)); // id
	        	list1.add(resultSet.getString(2)); // name
	        	list1.add(resultSet.getInt(3)); //price
	        	list1.add(resultSet.getDate(4)); //date
	        	list1.add(resultSet.getFloat(5)); // discount
	        	list1.add(resultSet.getString(7));// info
	        	list1.add(resultSet.getString(8)); // material
	        	list.add(list1);
	        }
	    }
		catch(Exception e)
		{
			System.out.println( e);
		}
		return list;
	}
	// Quynh Anh 
	//TRẢ VỀ THÔNG TIN CỦA ĐỐI TƯỢNG PRODUCT
		public static Product getProductByID(Integer id) {
			try
		    {
		        String query = "SELECT * FROM product WHERE id = ? ";
		        PreparedStatement preparedStatement = conn.prepareStatement(query);
		        preparedStatement.setInt(1, id);
		        
		        ResultSet resultSet = preparedStatement.executeQuery();
		        
		        while(resultSet.next())
		        {
		        	return new Product(resultSet.getInt(1),  // id
							        	resultSet.getString(2), // name
							        	resultSet.getInt(3), //price
							        	resultSet.getDate(4), //date
							        	resultSet.getFloat(5), // discount
							        	resultSet.getString(7),// info
							        	resultSet.getString(8)); // material
		        }
		    }
		    catch(Exception e){
				System.out.println(e);
			}
			return null;
		}
		
		//LẤY DANH SÁCH SIZE CỦA MỘT SẢN PHẨM
		public static ArrayList<String> get_size(int id){
		    ArrayList<String> sizeProducts = new ArrayList<String>();
		    
		    try
		    {
		    	String query = "SELECT size1, size2, size3, size4, unit FROM size s JOIN categories c ON c.id = s.id JOIN product p ON p.id = c.id_product WHERE p.id = ?";
		        PreparedStatement preparedStatement = conn.prepareStatement(query);
		        preparedStatement.setInt(1, id);
		        
		        ResultSet resultSet = preparedStatement.executeQuery();
		        while(resultSet.next()) {
		        	Float size1 = resultSet.getFloat("size1");
		        	String sizeString1 = String.valueOf(size1);
		        	Float size2 = resultSet.getFloat("size2");
		        	String sizeString2 = String.valueOf(size2);
		        	Float size3 = resultSet.getFloat("size3");
		        	String sizeString3 = String.valueOf(size3);
		        	Float size4 = resultSet.getFloat("size4");
		        	String sizeString4 = String.valueOf(size4);
		        	String unit = resultSet.getString("unit");
		        	sizeProducts.add(sizeString1);
		        	sizeProducts.add(sizeString2);
		        	sizeProducts.add(sizeString3);
		        	sizeProducts.add(sizeString4);
		        	sizeProducts.add(unit);
		        }
		    }
		    catch (SQLException e) { 
	           System.out.println(e);
	       }
		    catch(Exception e){
				System.out.println(e);
			}
			return sizeProducts;
		}
	
}