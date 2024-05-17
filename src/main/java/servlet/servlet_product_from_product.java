package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.service_servlet_product_from_product;

public class servlet_product_from_product extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		// handle logout
		if (action.equals("logout")) {
			service_servlet_product_from_product.handle_logout(req, resp);
		}
	}

}
