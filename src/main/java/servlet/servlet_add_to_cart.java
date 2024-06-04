package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.interact_with_cart;
import Database.interact_with_product;
import entry.Cart;
import service.service_servlet_detail_product;

public class servlet_add_to_cart  extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		HttpSession session = req.getSession();
        Integer userId = (Integer) session.getAttribute("id_user");
        try (PrintWriter out = resp.getWriter()) {
            int id = Integer.parseInt(req.getParameter("id"));
            float size = Float.parseFloat(req.getParameter("size"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            
            // Thêm sản phẩm vào giỏ hàng
            service_servlet_detail_product.insert_cart(userId, id, size, quantity);
            System.out.println(id);
            System.out.println(size);
            System.out.println(quantity);

            // Trả về phản hồi thành công
            out.print("successful");
        }

	}

}
