package Database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class interact_with_cart {
	private static Connection conn;

	static {
		connect_database c = new connect_database();
		c.connect_to_database();
		conn = c.connect;
	}

	public static ArrayList<Integer> get_id_product_in_cart(int id_user) {
		ArrayList<Integer> productIDs = new ArrayList<>();
		try {
			String query = "SELECT id_product FROM order_detail WHERE id_user = ?";
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setInt(1, id_user);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				productIDs.add(rs.getInt("id_product"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productIDs;
	}

	public static ArrayList<Float> get_size_product_in_cart(int id_user) {
		ArrayList<Float> productSizes = new ArrayList<>();
		try {
			String query = "SELECT size FROM order_detail WHERE id_user = ?";
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setInt(1, id_user);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				productSizes.add(rs.getFloat("size"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productSizes;
	}

	public static ArrayList<ArrayList<String>> get_detail_product_cart(int id_user) {
		// id, categories, info, size, quantity, money * quantitty = total, name
		// trả về Arraaylist hai chiều với một hàng lưu trữ dữ liệu như trên

		ArrayList<ArrayList<String>> productDetails = new ArrayList<>();
		try {
			String query = "SELECT p.id, c.categories, p.info, od.size, od.quantity, (p.price * od.quantity) AS total, p.name "
					+
					"FROM order_detail od " +
					"INNER JOIN product p ON od.id_product = p.id " +
					"INNER JOIN categories c ON p.id = c.id_product " +
					"WHERE od.id_user = ?";
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setInt(1, id_user);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				ArrayList<String> detail = new ArrayList<>();
				detail.add(String.valueOf(rs.getInt("id")));
				detail.add(rs.getString("categories"));
				detail.add(rs.getString("info"));
				detail.add(String.valueOf(rs.getFloat("size")));
				detail.add(String.valueOf(rs.getInt("quantity")));
				detail.add(String.valueOf(rs.getFloat("total")));
				detail.add(rs.getString("name"));
				productDetails.add(detail);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productDetails;
	}
}