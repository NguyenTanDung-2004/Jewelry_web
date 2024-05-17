package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.get_data_in_home;
import service.service_servlet_home;

public class servlet_home extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// list_first_id_product
		ArrayList<Integer> list_first_id_product = service_servlet_home.first_id_product();
		req.setAttribute("first_id_product", list_first_id_product);
		// new arrivals
		ArrayList<Integer> list_arrivals = service_servlet_home.new_arrivals();
		req.setAttribute("new_arrivals", list_arrivals);
		// tradition
		ArrayList<String> traditional_data = service_servlet_home.create_data_for_traditional();
		req.setAttribute("tradition", traditional_data);
		//price 
		ArrayList<Float> list_price = service_servlet_home.prices();
		req.setAttribute("list_price", list_price);
		// forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("//JSP_JAVASCRIPT_CSS//home//home.jsp");
		dispatcher.forward(req, resp);
	}
}
