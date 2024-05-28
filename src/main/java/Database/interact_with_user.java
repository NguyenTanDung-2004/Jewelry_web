package Database;

import java.sql.*;  
import java.util.*;


public class interact_with_user {    

    public static int check_email_exist_in_database(String email) {
        int emailExists = 0;

        connect_database connection = new connect_database();
        connection.connect_to_database();

        try {
            Statement statememt = connection.connect.createStatement();
            String sql = "SELECT COUNT(*) FROM [user] WHERE email = '" + email + "'";
            ResultSet resultSet = statememt.executeQuery(sql);

            if (resultSet.next()) {
		int count = resultSet.getInt(1);
                if( count > 0) {
			emailExists = 1;
		}
            }

            resultSet.close();
            statememt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.connect.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return emailExists;
    }

    public static int check_password_with_email(String email, String password) {
        int passwordMatches = 0;

        connect_database connection = new connect_database();
        connection.connect_to_database();

        try {
            Statement statement = connection.connect.createStatement();
            String sql = "SELECT COUNT(*) FROM [user] WHERE email = '" + email + "' AND pass = '" + password + "'";
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                if( count > 0) {
			passwordMatches = 1;
		}
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.connect.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return passwordMatches;
    }

    public static void insert_user(String email, String password) {
        connect_database connection = new connect_database();
        connection.connect_to_database();

        try {
            PreparedStatement statement = connection.connect.prepareStatement("INSERT INTO [user] (id, email, pass) VALUES (?, ?, ?)");
            statement.setInt(1, create_id_user());
            statement.setString(2, email);
            statement.setString(3, password);
            statement.executeUpdate();

            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            try {
                connection.connect.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void update_password(String password, String email) {
        connect_database connection = new connect_database();
        connection.connect_to_database();

        try {
            PreparedStatement statement = connection.connect.prepareStatement("UPDATE [user] SET pass = ? WHERE email = ?");
            statement.setString(1, password);
            statement.setString(2, email);
            statement.executeUpdate();

            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.connect.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public static String get_current_code(int id_user) {
    	String code = "";

        connect_database connection = new connect_database();
        connection.connect_to_database();

        try {
            Statement statement = connection.connect.createStatement();
            String sql = "select current_code from [user]\r\n"
            		+ "	where id = " + id_user;
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
		        code = resultSet.getString(1);
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return code;
    }
    public static void insert_code(int id_user, String code) {
    	connect_database connection = new connect_database();
        connection.connect_to_database();
        try {
            PreparedStatement statement = connection.connect.prepareStatement("update [user]\r\n"
            		+ "	set [user].current_code = '" + code + "'"
            		+ "	where [user].id = " + id_user);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.connect.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public static int create_id_user() {
    	int result = 0;

        connect_database connection = new connect_database();
        connection.connect_to_database();

        try {
            Statement statement = connection.connect.createStatement();
            String sql = "select max(id) from [user]";
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
		        result = resultSet.getInt(1) + 1;
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return result;
    }
    public static int get_id_user(String email) {
    	int result = 0;

        connect_database connection = new connect_database();
        connection.connect_to_database();

        try {
            Statement statement = connection.connect.createStatement();
            String sql = "select id from [user]\r\n"
            		+ "where email = '" + email + "'";
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
		        result = resultSet.getInt(1);
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return result;
    }
    public static String get_img_user(int id_user) {
    	connect_database connection = new connect_database();
        connection.connect_to_database();
        String result = "";
        try {
            Statement statement = connection.connect.createStatement();
            String sql = "select img from [user] where id = " + id_user;
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
		        result = resultSet.getString(1);
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return result;
    }
    
}