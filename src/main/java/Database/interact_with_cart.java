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

	//newly update: get product detail from cart

    public static ArrayList<ArrayList<String>> get_detail_product_cart(int id_user) {
        // id, categories, info, size, quantity, money * quantitty = total, name
        // trả về Arraaylist hai chiều với một hàng lưu trữ dữ liệu như trên

        ArrayList<ArrayList<String>> productDetails = new ArrayList<>();
        try {
            String query = "SELECT p.id, c.product_type, p.info, ca.size, ca.quantity, p.price, (p.price * ca.quantity) AS total, p.name, p.discount "
                    + "FROM cart ca "
                    + "INNER JOIN product p ON ca.id_product = p.id "
                    + "INNER JOIN categories c ON p.id = c.id_product "
                    + "WHERE ca.id_user = ?";

            PreparedStatement statement = conn.prepareStatement(query);
            statement.setInt(1, id_user);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ArrayList<String> detail = new ArrayList<>();
                detail.add(String.valueOf(rs.getInt("id")));
                detail.add(rs.getString("product_type"));
                detail.add(rs.getString("info"));
                detail.add(String.valueOf(rs.getInt("size")));
                detail.add(String.valueOf(rs.getInt("quantity")));
                detail.add(String.valueOf(rs.getInt("price")));
                detail.add(String.valueOf(rs.getInt("total")));
                detail.add(rs.getString("name"));
                detail.add(String.valueOf(rs.getFloat("discount")));
                productDetails.add(detail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productDetails;
    }
	//THÊM MỘT CART VÀO CƠ SỞ DỮ LIỆU KHI ADD VÀ BUY
		public static void insert_cart(int id_user, int id_product, float size, int quantity) {
			try {
				String query = "INSERT INTO cart (id_user, id_product, size, quantity) VALUES (?, ?, ?, ?);";
				PreparedStatement statement = conn.prepareStatement(query);
				statement.setInt(1, id_user);
				statement.setInt(2, id_product);
				statement.setFloat(3, size);
				statement.setInt(4, quantity);
				int rowsInserted = statement.executeUpdate();
	            if (rowsInserted > 0) {
	                System.out.println("A new cart was inserted successfully!");
	            }
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		//new: check coupon info

	    public static ArrayList<String> get_coupon_info(String coupon_code) {
	        ArrayList<String> couponInfo = new ArrayList<>();
	        try {
	            String query = "SELECT * FROM coupon WHERE code = ?";
	            PreparedStatement statement = conn.prepareStatement(query);
	            statement.setString(1, coupon_code);
	            ResultSet rs = statement.executeQuery();
	            while (rs.next()) {
	                couponInfo.add(String.valueOf(rs.getInt("id")));
	                couponInfo.add(rs.getString("code"));
	                couponInfo.add(rs.getString("date"));
	                couponInfo.add(String.valueOf(rs.getFloat("ratio")));
	                couponInfo.add(String.valueOf(rs.getInt("number")));
	                couponInfo.add(String.valueOf(rs.getInt("current_number")));
	                couponInfo.add(rs.getString("user_ids"));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return couponInfo;
	    }
	    //new: check used coupon
	    public static int check_used_coupon(int id_user, String coupon_code) {
	        if (coupon_code == null) {
	            return 0;
	        }
	        int result = 0;
	        try {
	            String query = "SELECT COUNT(*) FROM coupon WHERE user_ids LIKE ? AND code = ? ";
	            PreparedStatement statement = conn.prepareStatement(query);
	            statement.setString(1, "%" + id_user + "%");
	            statement.setString(2, coupon_code);
	            ResultSet rs = statement.executeQuery();
	            if (rs.next()) {
	                int count = rs.getInt(1);
	                if (count > 0) {
	                    result = 1;
	                } else {
	                    String new_query = "UPDATE coupon SET user_ids = CONCAT(user_ids, ?) WHERE code = ? ;"
	                            + "UPDATE coupon SET number = number -1";
	                    PreparedStatement new_statement = conn.prepareStatement(new_query);
	                    new_statement.setString(1, "_" + id_user); // assuming you want to append the user ID with an underscore separator
	                    new_statement.setString(2, coupon_code);
	                    new_statement.executeUpdate();
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return result;
	    }
	    //new: check expired coupon
	    public static int check_expired_coupon(int id_user, String coupon_code) {
	        if (coupon_code == null) {
	            return 0;
	        }
	        int result = 0;
	        try {
	            String query = "SELECT date FROM coupon WHERE user_ids LIKE ? AND code = ? ";
	            PreparedStatement statement = conn.prepareStatement(query);
	            statement.setString(1, "%" + id_user + "%");
	            statement.setString(2, coupon_code);
	            ResultSet rs = statement.executeQuery();

	            if (rs.next()) {

	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return result;
	    }
	    //new: filter by catergories
	    public static ArrayList<ArrayList<String>> filter_by_catergories(int id_user, int id_catergories) {
	        ArrayList<ArrayList<String>> productDetailsFilter = new ArrayList<>();
	        try {
	            String query = "SELECT p.id, c.product_type, p.info, ca.size, ca.quantity, p.price, (p.price * ca.quantity) AS total, p.name, p.discount "
	                    + "FROM cart ca "
	                    + "INNER JOIN product p ON ca.id_product = p.id "
	                    + "INNER JOIN categories c ON p.id = c.id_product "
	                    + "WHERE ca.id_user = ? AND c.id = ?";

	            PreparedStatement statement = conn.prepareStatement(query);
	            statement.setInt(1, id_user);
	            statement.setInt(2, id_catergories);
	            ResultSet rs = statement.executeQuery();
	            while (rs.next()) {
	                ArrayList<String> detail = new ArrayList<>();
	                detail.add(String.valueOf(rs.getInt("id")));
	                detail.add(rs.getString("product_type"));
	                detail.add(rs.getString("info"));
	                detail.add(String.valueOf(rs.getInt("size")));
	                detail.add(String.valueOf(rs.getInt("quantity")));
	                detail.add(String.valueOf(rs.getInt("price")));
	                detail.add(String.valueOf(rs.getInt("total")));
	                detail.add(rs.getString("name"));
	                detail.add(String.valueOf(rs.getInt("discount")));
	                productDetailsFilter.add(detail);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return productDetailsFilter;
	    }
	  //new: get id and size by name to add to order detail

	    public static ArrayList<Integer> get_id_and_size_by_name(String product_name) {
	        ArrayList<Integer> productIdAndSize = new ArrayList<>();
	        try {
	            String query = "SELECT id_product, cart.size "
	                    + "FROM cart "
	                    + "JOIN product ON product.id = cart.id_product "
	                    + "WHERE product.name = ?";

	            PreparedStatement statement = conn.prepareStatement(query);
	            statement.setString(1, product_name);
	            ResultSet rs = statement.executeQuery();
	            while (rs.next()) {
	                productIdAndSize.add(rs.getInt("id_product"));
	                productIdAndSize.add(rs.getInt("size"));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return productIdAndSize;
	    }
}