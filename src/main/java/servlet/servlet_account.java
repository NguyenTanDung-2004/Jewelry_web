package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.service_servlet_account;


public class servlet_account extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
    	req.setCharacterEncoding("UTF-8");
    	resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        Integer id_user = (Integer) session.getAttribute("id_user");
        if (id_user != null) {
        	ArrayList<Object> user_info = service_servlet_account.get_user_info_by_id(req);
        	req.setAttribute("user_info", user_info);
            
            // Session có id_user, cho phép chuyển hướng đến trang account
            req.getRequestDispatcher("//JSP_JAVASCRIPT_CSS/account//account.jsp").forward(req, resp);
        } else {
        	
            // Session không có id_user, chuyển hướng đến trang home với tham số action=login
            resp.sendRedirect("http://localhost:8080/Jewelry_web/home?autoClick=true");
        }
	}
}
