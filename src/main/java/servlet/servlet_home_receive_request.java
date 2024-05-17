package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import service.service_servlet_home_receive_request;

public class servlet_home_receive_request extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		// xử lí trường hợp là send code in register
		if (action.equals("send_code_in_register")) {
			String email = req.getParameter("email");
			service_servlet_home_receive_request.handle_send_code_in_register(email, req, resp);
		}
		
		//handle when have request from register button
		if (action.equals("register")) {
			service_servlet_home_receive_request.handle_register(req, resp);
		}
		
		// handel when have request from login button
		if (action.equals("login")){
			service_servlet_home_receive_request.handle_login(req, resp);
		}
		
		// handle when have request send code forgot
		if (action.equals("send_code_in_forgot")) {
			service_servlet_home_receive_request.handle_send_code_in_forgot(req, resp);
		}
		
		// handle when have request reset password 
		if (action.equals("reset_password")) {
			service_servlet_home_receive_request.handle_reset_password(req, resp);
		}
	}
	
	
	
}
