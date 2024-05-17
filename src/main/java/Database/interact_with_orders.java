package Database;

import java.sql.*;
import java.util.*;

public class interact_with_orders {
	private static Connection conn;

	static {
		connect_database c = new connect_database();
		c.connect_to_database();
		conn = c.connect;
	}

	public static void create_order(
			int new_id_order, float total_money, String phone, String detail_address, String province, String district, String sub
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

            String query = "INSERT INTO orders (id, expectation_date, status, total_money, detail_address, province, district, sub, phone, date, deleted) " +
                            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
}