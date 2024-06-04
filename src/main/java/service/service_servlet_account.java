package service;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.interact_with_orders;
import Database.interact_with_user;

public class service_servlet_account {
	public static ArrayList<Object> get_user_info_by_id(HttpServletRequest req) {
    	HttpSession session = req.getSession();
        Integer id_user = (Integer) session.getAttribute("id_user");
        
		interact_with_user obj = new interact_with_user();
		return interact_with_user.get_user_info_by_id(id_user);
	}
	
		 
}
