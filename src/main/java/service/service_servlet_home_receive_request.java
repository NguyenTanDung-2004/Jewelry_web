package service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Database.interact_with_user;
import utils.encrypt_password;
import utils.handle_email;

public class service_servlet_home_receive_request {
	// this function is used to handle when send code is clicked
	public static void handle_send_code_in_register(String email, HttpServletRequest request, HttpServletResponse resp) {
		String code = handle_email.send_code(email, 1);
		if (code.equals("0")) {
			send_response("send_error", resp);
		}
		else {
			HttpSession session = request.getSession();
			if (session.getAttribute("code_register") != null) {
				session.removeAttribute("code_register");
			}
			session.setAttribute("code_register", code);
			send_response("send_successfully", resp);
		}
	}
	public static void send_response(String response_content, HttpServletResponse resp) {
		Gson gson = new Gson();
	    resp.setCharacterEncoding("UTF-8");
	    try {
	    	String json_resp = gson.toJson(response_content);
			resp.getWriter().write(json_resp);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// this function is used to handle when register is clicked
	public static void handle_register(HttpServletRequest req, HttpServletResponse resp) {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String code = req.getParameter("code");
		if (interact_with_user.check_email_exist_in_database(email) == 0) {
			
		}
		else {
			send_response("email_exist", resp);
			return;
		}
		if (code.equals((String)req.getSession().getAttribute("code_register")) == true) {
			
		}
		else {
			send_response("code_wrong", resp);
			return;
		}
		interact_with_user.insert_user(email, encrypt_password.ecrypt_to_SHA1(password));
		req.getSession().removeAttribute("code_register");
		send_response("register_successfull", resp);
	}
	
	public static void handle_login(HttpServletRequest req, HttpServletResponse resp) {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		if (interact_with_user.check_email_exist_in_database(email) == 1) {
			
		}
		else {
			send_response("email_not_exist", resp);
			return;
		}
		if (interact_with_user.check_password_with_email(email, encrypt_password.ecrypt_to_SHA1(password)) == 1) {
			
		}
		else {
			send_response("password_wrong", resp);
			return;
		}
		int id_user = interact_with_user.get_id_user(email);
		HttpSession session = req.getSession();
		session.setAttribute("id_user", id_user);
		session.setAttribute("img", interact_with_user.get_img_user(id_user));
		send_response("login_successfull", resp);
	}
	
	// this function is used to handle when send code is clicked
		public static void handle_send_code_in_forgot(HttpServletRequest request, HttpServletResponse resp) {
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
				if (session.getAttribute("code_forgot") != null) {
					session.removeAttribute("code_forgot");
				}
				session.setAttribute("code_forgot", code);
				send_response("send_successfully", resp);
			}
		}
		
		// this function is used to handle when register is clicked
		public static void handle_reset_password(HttpServletRequest req, HttpServletResponse resp) {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String code = req.getParameter("code");
			if (code.equals((String)req.getSession().getAttribute("code_forgot")) == true) {
				
			}
			else {
				send_response("code_wrong", resp);
				return;
			}
			interact_with_user.update_password(encrypt_password.ecrypt_to_SHA1(password), email);
			req.getSession().removeAttribute("code_forgot");
			send_response("forgot_successfully", resp);
		}
}
