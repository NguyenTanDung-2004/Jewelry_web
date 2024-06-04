package service;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Database.interact_with_user;
import Database.interact_with_orders;
import utils.encrypt_password;
import utils.handle_email;

public class service_servlet_account_receive_request {
	
	public static void send_response(String response_content, HttpServletResponse resp) {
		Gson gson = new Gson();
	    resp.setCharacterEncoding("UTF-8");
	    try {
	    	String json_resp = gson.toJson(response_content);
			resp.getWriter().write(json_resp);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void update_profile(HttpServletRequest req, HttpServletResponse resp) {
    	HttpSession session = req.getSession();
        Integer id_user = (Integer) session.getAttribute("id_user");
        
	    String name = req.getParameter("name");
	    String email = req.getParameter("email");
	    String phone = req.getParameter("phone");
	    String sex = req.getParameter("sex");
	    String dob = req.getParameter("dob");
	    String img = req.getParameter("img"); 
	    
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    
	    java.util.Date utilDate;
	    try {
	        utilDate = dateFormat.parse(dob);
	        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

	        interact_with_user.update_profile_user(id_user, name, phone, email, sex, sqlDate, img); 
		    session.setAttribute("img", img);
		    
	        send_response("update_profile_successfully", resp);
	    } catch (ParseException e) {
	        e.printStackTrace();
	        send_response("update_profile_failed", resp);
	    }
	}
	public static void update_address(HttpServletRequest req, HttpServletResponse resp) {
    	HttpSession session = req.getSession();
        Integer id_user = (Integer) session.getAttribute("id_user");
        
	    String address = req.getParameter("address");
	    String city = req.getParameter("city");
	    String district = req.getParameter("district");
	    String ward = req.getParameter("ward");

	    try {
		    interact_with_user.update_address_user(id_user, address, city, district, ward);
		    
		    send_response("update_address_successfully", resp);
	    } catch (Exception e) {
	        e.printStackTrace();
		    send_response("update_address_failed", resp);
	    }

	}
	
	public static void delete_order(HttpServletRequest req, HttpServletResponse resp) {
	    try {
	    	String id_order = req.getParameter("id_order");
	    	
	        interact_with_orders.delete_order_by_id(Integer.parseInt(id_order));
	        send_response("delete_order_success", resp);
	    } catch (Exception e) {
	        e.printStackTrace();
	        send_response("delete_order_failed", resp);
	    }
	}
	
	public static void send_code_change_pass(HttpServletRequest request, HttpServletResponse resp) {
		String email = request.getParameter("email");
		String code = handle_email.send_code(email, 0);
		if (code.equals("0")) {
			send_response("send_error", resp);
		}
		else { 
			if (interact_with_user.check_email_exist_in_database(email) == 0) {
				send_response("send_error", resp);
				return;
			}
			HttpSession session = request.getSession();
			if (session.getAttribute("code_change_pass") != null) {
				session.removeAttribute("code_change_pass");
			}
			session.setAttribute("code_change_pass", code);
			send_response("send_successfully", resp);
		}
	}
	public static void check_code(HttpServletRequest request, HttpServletResponse resp) {
		String input_code = request.getParameter("code");
    	HttpSession session = request.getSession();
    	String code = (String) session.getAttribute("code_change_pass");
    	
		if (input_code.equals(code)) {
			send_response("check_success", resp);
		} else {
			send_response("check_failed", resp);
		}
	}
	public static void save_new_pass(HttpServletRequest req, HttpServletResponse resp) {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

    	System.out.println(email + "    " + password);
	    try {
	    	interact_with_user.update_password(encrypt_password.ecrypt_to_SHA1(password), email);
	        send_response("save_success", resp);
	    } catch (Exception e) {
	        e.printStackTrace();
	        send_response("save_failed", resp);
	    }

	}
	public static void handle_logout(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		session.removeAttribute("id_user");
		send_response("logout_successfully", resp);
	}
}