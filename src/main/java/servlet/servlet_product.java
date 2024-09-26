package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.interact_with_user;
import service.service_servlet_product;

public class servlet_product extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//categories
		ArrayList<Integer> rings = service_servlet_product.product_rings();
		ArrayList<Integer> bracelets = service_servlet_product.product_bracelets();
		ArrayList<Integer> necklaces = service_servlet_product.product_necklaces();
		ArrayList<Integer> earrings = service_servlet_product.product_earrings();
		req.setAttribute("rings", rings);
		req.setAttribute("bracelets", bracelets);
		req.setAttribute("necklaces", necklaces);
		req.setAttribute("earrings", earrings);
		// collections
		ArrayList<Integer> spring = service_servlet_product.product_spring();
		ArrayList<Integer> summer = service_servlet_product.product_summner();
		ArrayList<Integer> autumn = service_servlet_product.product_autumn();
		ArrayList<Integer> winter = service_servlet_product.product_winter();
		ArrayList<Integer> love = service_servlet_product.product_love();
		req.setAttribute("spring", spring);
		req.setAttribute("summer", summer);
		req.setAttribute("autumn", autumn);
		req.setAttribute("winter", winter);
		req.setAttribute("love", love);
		// first id collections
		ArrayList<Integer> first_id_collections = service_servlet_product.get_first_id();
		req.setAttribute("first_id_collections", first_id_collections);
		
		// all data product
		ArrayList<ArrayList<Object>> all_data_product = service_servlet_product.get_all_product_orderby_random();
		req.setAttribute("all_data_product", all_data_product);
		
		// handle request from home 
		String action = req.getParameter("action");
		if (action != null) {
			req.setAttribute("action", action);
		}
		
		// 
		// forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("//JSP_JAVASCRIPT_CSS//product//product.jsp");
		dispatcher.forward(req, resp);
	}

}
