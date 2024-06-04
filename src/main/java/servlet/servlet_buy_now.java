package servlet;

import java.io.IOException; 
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.google.gson.Gson;

import service.service_servlet_detail_product;
import service.service_servlet_product_from_product;

public class servlet_buy_now extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		// handle logout
		if (action.equals("buy_now")) {
			HttpSession session = req.getSession();
			ArrayList<ArrayList<String>> cartList = (ArrayList<ArrayList<String>>) session.getAttribute("cartList");
		    
		    Integer userId = (Integer) session.getAttribute("id_user");
		    int id = Integer.parseInt(req.getParameter("id"));
            float size = Float.parseFloat(req.getParameter("size"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            // Thêm sản phẩm vào giỏ hàng csdl
            service_servlet_detail_product.insert_cart(userId, id, size, quantity);
	        
            
            String userIdString = String.valueOf(userId);
		    String id_productString = req.getParameter("id");
            String sizeString = req.getParameter("size");
            String quantityString = req.getParameter("quantity");
            //Thêm sản phẩm vào giỏ hàng trên session
            ArrayList<String> detail_cart = new ArrayList<String>();
            detail_cart.add(userIdString);
            detail_cart.add(id_productString);
            detail_cart.add(sizeString);
            detail_cart.add(quantityString);
            
		    if (cartList == null) {
		        cartList = new ArrayList<>();
		    }
		    cartList.add(detail_cart);		    
	        session.setAttribute("cartList", cartList);
		    send_response("buy_now_successfully", resp);
		    //System.out.println("Cart List: " + cartList);
		}
		else {
            send_response("invalid_action", resp);
        }
	}
	public static void send_response(String response_content, HttpServletResponse resp) {
		Gson gson = new Gson();
	    resp.setCharacterEncoding("UTF-8");
	    resp.setContentType("application/json");
	    try {
	    	String json_resp = gson.toJson(response_content);
			resp.getWriter().write(json_resp);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
