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
import entry.Cart;
import service.service_servlet_detail_product;

public class check_product_in_cart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	resp.setContentType("text/plain;charset=UTF-8");
        
        // Lấy thông tin sản phẩm từ request
        int id = Integer.parseInt(req.getParameter("id"));
        String size = req.getParameter("size");
        Float size_product = Float.parseFloat(size);
        String existsInCart = req.getParameter("exist");
        // Lấy danh sách sản phẩm trong giỏ hàng từ csdl
        HttpSession session = req.getSession();
        Integer userId = (Integer) session.getAttribute("id_user");

        // Kiểm tra sản phẩm đã tồn tại trong giỏ hàng csdl
        boolean productExistsInCart = service_servlet_detail_product.check_product_in_cart(id, userId, size_product);

        resp.getWriter().write(productExistsInCart ? "true" : "false");
    }
}
