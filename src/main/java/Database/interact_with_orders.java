//package Database;
//
//import java.sql.*;
//import java.util.*;
//
//public class interact_with_orders {
//	private static Connection conn;
//
//	static {
//		connect_database c = new connect_database();
//		c.connect_to_database();
//		conn = c.connect;
//	}
//
//	public static void create_order(
//			int new_id_order, float total_money, String phone, String detail_address, String province, String district, String sub
//			) {
//		// các thông số còn thiếu là.
//		// expectation date = ngày hiện tại + 5.
//		// date = ngày hiện tại
//		// deleted	= 0.
//		// status = 1 <=> confirmming
//		try {
//            Calendar cal = Calendar.getInstance();
//            cal.add(Calendar.DATE, 5);
//            java.sql.Date expectation_date = new java.sql.Date(cal.getTimeInMillis());
//
//            java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
//
//            int deleted = 0;
//            int status = 1;
//
//            String query = "INSERT INTO orders (id, expectation_date, status, total_money, detail_address, province, district, sub, phone, date, deleted) " +
//                            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//            PreparedStatement statement = conn.prepareStatement(query);
//            statement.setInt(1, new_id_order);
//            statement.setDate(2, expectation_date);
//            statement.setInt(3, status);
//            statement.setFloat(4, total_money);
//            statement.setString(5, detail_address);
//            statement.setString(6, province);
//            statement.setString(7, district);
//            statement.setString(8, sub);
//            statement.setString(9, phone);
//            statement.setDate(10, date);
//            statement.setInt(11, deleted);
//            statement.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//	
//	}
//	public void create_all_order_detail_from_order(ArrayList<Integer> id_product, int id_user, int id_order, float size) {
//		try {
//			String query = "INSERT INTO order_detail (id_order, id_user, id_product, size) VALUES (?, ?, ?, ?)";
//			PreparedStatement statement = conn.prepareStatement(query);
//			for (int productID : id_product) {
//				statement.setInt(1, id_order);
//				statement.setInt(2, id_user);
//				statement.setInt(3, productID);
//				statement.setFloat(4, size);
//				statement.addBatch(); 
//			}
//			statement.executeBatch(); 
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
//	public static int create_id_order() { // trả về id order mới (max(id_order) + 1)
//		int new_id_order = 0;
//        try {
//            String query = "SELECT MAX(id) AS max_id FROM orders";
//            Statement statement = conn.createStatement();
//            ResultSet rs = statement.executeQuery(query);
//            if (rs.next()) {
//                new_id_order = rs.getInt("max_id") + 1;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return new_id_order;
//	}
//}

package Database;

import java.sql.*;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class interact_with_orders {
	private static Connection conn;

	static {
		connect_database c = new connect_database();
		c.connect_to_database();
		conn = c.connect;
	}

	 //new: add ship and ratio of coupon
    public static void create_order(
            int new_id_order, float total_money, String phone, String detail_address, String province, String district, String sub, float ratio_of_coupon, float ship
    ) {
        // các thông số còn thiếu là.
        // expectation date = ngày hiện tại + 5.
        // date = ngày hiện tại
        // deleted	= 0.
        // status = 1 <=> confirmming
        try {
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.DATE, 5);
            java.sql.Date expectation_date = new java.sql.Date(cal.getTimeInMillis());

            java.sql.Date date = new java.sql.Date(System.currentTimeMillis());

            int deleted = 0;
            int status = 1;

            String query = "INSERT INTO orders (id, expectation_date, status, total_money, detail_address, province, district, sub, phone, date, deleted, ratio_of_coupon, ship) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setInt(1, new_id_order);
            statement.setDate(2, expectation_date);
            statement.setInt(3, status);
            statement.setFloat(4, total_money);
            statement.setString(5, detail_address);
            statement.setString(6, province);
            statement.setString(7, district);
            statement.setString(8, sub);
            statement.setString(9, phone);
            statement.setDate(10, date);
            statement.setInt(11, deleted);
            statement.setFloat(12, ratio_of_coupon);
            statement.setFloat(13, ship);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
	public void create_all_order_detail_from_order(ArrayList<Integer> id_product, int id_user, int id_order, float size) {
		try {
			String query = "INSERT INTO order_detail (id_order, id_user, id_product, size) VALUES (?, ?, ?, ?)";
			PreparedStatement statement = conn.prepareStatement(query);
			for (int productID : id_product) {
				statement.setInt(1, id_order);
				statement.setInt(2, id_user);
				statement.setInt(3, productID);
				statement.setFloat(4, size);
				statement.addBatch(); 
			}
			statement.executeBatch(); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static int create_id_order() { // trả về id order mới (max(id_order) + 1)
		int new_id_order = 0;
        try {
            String query = "SELECT MAX(id) AS max_id FROM orders";
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(query);
            if (rs.next()) {
                new_id_order = rs.getInt("max_id") + 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new_id_order;
	}

    private static String formatDate(String inputDate) {
        String formattedDate = "";
        try {
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
            java.util.Date date = inputFormat.parse(inputDate);
            formattedDate = outputFormat.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return formattedDate;
    }
    public static ArrayList<ArrayList<Object>> get_order_by_id_status(int idUser, int status) {
        ArrayList<ArrayList<Object>> ordersList = new ArrayList<>();

        connect_database connection = new connect_database();
        connection.connect_to_database();

        try {
            Statement statement = connection.connect.createStatement();
            String sql = "SELECT * FROM orders WHERE id IN (SELECT id_order FROM order_detail WHERE id_user = " + idUser + ") AND status = " + status;
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                ArrayList<Object> orderInfo = new ArrayList<>();
                orderInfo.add(resultSet.getInt("id"));
                orderInfo.add(formatDate(resultSet.getString("expectation_date")));
                orderInfo.add(resultSet.getInt("status"));
                NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
                String formattedPrice = numberFormat.format(resultSet.getFloat("total_money"));
                orderInfo.add(formattedPrice);
                
                orderInfo.add(resultSet.getString("detail_address"));
                orderInfo.add(resultSet.getString("province"));
                orderInfo.add(resultSet.getString("district"));
                orderInfo.add(resultSet.getString("sub"));
                orderInfo.add(resultSet.getString("phone"));

                orderInfo.add(formatDate(resultSet.getString("date")));
                orderInfo.add(resultSet.getInt("deleted"));
                orderInfo.add(resultSet.getFloat("ratio_of_coupon"));

                String ship = numberFormat.format(resultSet.getFloat("ship"));
                orderInfo.add(ship);

                ordersList.add(orderInfo);
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ordersList;
    }
	public static ArrayList<Object> get_detail_order_by_id(int idOrder) {
	    ArrayList<Object> orderDetailsList = new ArrayList<>();

	    connect_database connection = new connect_database();
	    connection.connect_to_database();

	    try {
	        Statement statement = connection.connect.createStatement();
	        String sql = "SELECT * FROM order_detail WHERE id_order = " + idOrder;
	        ResultSet resultSet = statement.executeQuery(sql);

	        while (resultSet.next()) {
	            ArrayList<Object> orderDetailInfo = new ArrayList<>();
	            orderDetailInfo.add(resultSet.getInt("id_order"));
	            orderDetailInfo.add(resultSet.getInt("id_user"));
	            orderDetailInfo.add(resultSet.getInt("id_product"));
	            orderDetailInfo.add(resultSet.getFloat("size"));
	            orderDetailInfo.add(resultSet.getInt("quantity"));

	            orderDetailsList.add(orderDetailInfo);
	        }

	        resultSet.close();
	        statement.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return orderDetailsList;
	}

	public static ArrayList<ArrayList<Object>> get_products_by_order_id(int idOrder) {
	    ArrayList<ArrayList<Object>> productList = new ArrayList<>();

	    connect_database connection = new connect_database();
	    connection.connect_to_database();

	    try {
	        Statement statement = connection.connect.createStatement();
	        String sql = "SELECT product_table.id,  product_table.name, product_table.price, product_table.discount, product_table.material, order_detail.size, order_detail.quantity " +
	                     "FROM product AS product_table " +
	                     "INNER JOIN order_detail ON product_table.id = order_detail.id_product " +
	                     "WHERE order_detail.id_order = " + idOrder;
	        ResultSet resultSet = statement.executeQuery(sql);

	        while (resultSet.next()) {
	            ArrayList<Object> productInfo = new ArrayList<>();
	            productInfo.add(resultSet.getString("id"));
	            productInfo.add(resultSet.getString("name"));
	            NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
	            String formattedPrice = numberFormat.format(resultSet.getFloat("price"));
	            productInfo.add(formattedPrice);
	            productInfo.add(resultSet.getFloat("discount"));
	            productInfo.add(resultSet.getString("material"));
	            productInfo.add(resultSet.getFloat("size"));
	            productInfo.add(resultSet.getInt("quantity"));
	            
	            productList.add(productInfo);
	        }

	        resultSet.close();
	        statement.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return productList;
	}
	public static float get_total_price_of_products(int id_order) {
	    float total_price = 0;

	    connect_database connection = new connect_database();
	    connection.connect_to_database();

	    try {
	        Statement statement = connection.connect.createStatement();
	        String sql = "SELECT SUM(p.price) AS total_price " +
	                     "FROM order_detail od " +
	                     "INNER JOIN product p ON od.id_product = p.id " +
	                     "WHERE od.id_order = " + id_order;
	        ResultSet resultSet = statement.executeQuery(sql);

	        if (resultSet.next()) {
	            total_price = resultSet.getFloat("total_price");
	        }

	        resultSet.close();
	        statement.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return total_price;
	}
	
	public static void delete_order_by_id(int id_order) {
	    try {
	        // Xóa dữ liệu trong bảng order_detail dựa trên id_order
	        String deleteOrderDetailQuery = "DELETE FROM order_detail WHERE id_order = ?";
	        PreparedStatement deleteOrderDetailStatement = conn.prepareStatement(deleteOrderDetailQuery);
	        deleteOrderDetailStatement.setInt(1, id_order);
	        deleteOrderDetailStatement.executeUpdate();

	        // Xóa dữ liệu trong bảng orders dựa trên id_order
	        String deleteOrderQuery = "DELETE FROM orders WHERE id = ?";
	        PreparedStatement deleteOrderStatement = conn.prepareStatement(deleteOrderQuery);
	        deleteOrderStatement.setInt(1, id_order);
	        deleteOrderStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	//new: Get order info
    public static ArrayList<ArrayList<Integer>> get_order_info() {

        ArrayList<ArrayList<Integer>> serverInfo = new ArrayList<>();
        try {
            String query = "SELECT id_user, id_order, status "
                    + "FROM orders "
                    + "JOIN order_detail on orders.id = order_detail.id_order "
                    + "GROUP BY id_order, id_user, status ";

            PreparedStatement statement = conn.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ArrayList<Integer> detail = new ArrayList<>();
                detail.add(rs.getInt("id_user"));
                detail.add(rs.getInt("id_order"));
                detail.add(rs.getInt("status"));
                serverInfo.add(detail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serverInfo;
    }
    
    // new: update status 

    public static void update_status(int order_id, int status) {
        try {
            String query = "UPDATE orders "
                    + "SET orders.status = ? "
                    + "WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setInt(1, status);
            statement.setInt(2, order_id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void create_all_order_detail_from_order(int id_product, int id_user, int id_order, int quantity, float size) {
        try {
            String query = "INSERT INTO order_detail (id_order, id_user, id_product, quantity, size) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(query);

            statement.setInt(1, id_order);
            statement.setInt(2, id_user);
            statement.setInt(3, id_product);
            statement.setInt(4, quantity);
            statement.setFloat(5, size);
            statement.addBatch();

            statement.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    } 
}