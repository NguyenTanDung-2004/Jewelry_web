package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.interact_with_user;
import service.service_servlet_account_receive_request;
import service.service_servlet_home_receive_request;
import service.service_servlet_product_from_product;

public class servlet_account_receive_request extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	req.setCharacterEncoding("UTF-8");
    	resp.setCharacterEncoding("UTF-8");
    	
		String action = req.getParameter("action");
		
		if (action.equals("update_profile")) {
			service_servlet_account_receive_request.update_profile(req, resp);
		}
		
		if (action.equals("update_address")) {
			service_servlet_account_receive_request.update_address(req, resp);
		}
		if (action.equals("delete_order")) {
			service_servlet_account_receive_request.delete_order(req, resp);
		}
		if (action.equals("send_code_change_pass")) {
			service_servlet_account_receive_request.send_code_change_pass(req, resp);
		}
		if (action.equals("check_code")) {
			service_servlet_account_receive_request.check_code(req, resp);
		}
		if (action.equals("save_new_pass")) {
			service_servlet_account_receive_request.save_new_pass(req, resp);
		}
		if (action.equals("logout")) {
			service_servlet_account_receive_request.handle_logout(req, resp);
		}
    }
}