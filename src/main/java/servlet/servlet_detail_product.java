package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.interact_with_product;
import entry.Product;
import service.service_servlet_detail_product;
import service.service_servlet_product;

public class servlet_detail_product extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    	//Create an object Product to get detail
    	 String pathInfo = req.getPathInfo(); // Lấy từ URL /ten-san-pham-id.html
    	 String[] pathParts = pathInfo.split("-");
         String idPart = pathParts[pathParts.length - 1];
         String id = idPart.replace(".html", ""); //Lấy ID từ URL
         int productId = Integer.parseInt(id);
         Product product = service_servlet_detail_product.getProductByID(productId);
         //detail
         req.setAttribute("detail", product);
         
 		
         // first id collections
 		ArrayList<Integer> first_id_collections = service_servlet_product.get_first_id();
 		req.setAttribute("first_id_collections", first_id_collections);
        
 		// all data product
 		ArrayList<ArrayList<Object>> all_data_product = service_servlet_product.get_all_product_orderby_random();
 		req.setAttribute("all_data_product", all_data_product);
 		
        // Related_Product
 		ArrayList<Product> related_products = service_servlet_detail_product.related_productsArrayList(productId);
 		req.setAttribute("related_products", related_products);
 		
 		//Size
 		ArrayList<String> size = service_servlet_detail_product.getSize(productId);
 		req.setAttribute("size", size);
 		
 		
 		//action
 		String action = req.getParameter("action");
		if(action != null) {
			req.setAttribute("action", action);
		}
         
         //Forward
         req.getRequestDispatcher("/JSP_JAVASCRIPT_CSS/detail-product/detail_product.jsp").forward(req, resp);    
    }
}
