/*
 
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Database.interact_with_cart;
import Database.interact_with_orders;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import java.io.BufferedReader;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

public class servlet_cart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        int user_id = (int) session.getAttribute("id_user");
        String coupon_code = String.valueOf(session.getAttribute("coupon_code"));

        ArrayList<ArrayList<String>> product_detail = interact_with_cart.get_detail_product_cart(user_id);
        ArrayList<String> coupon_info = interact_with_cart.get_coupon_info(coupon_code);
        int is_used_coupon = interact_with_cart.check_used_coupon(user_id, coupon_code);

        request.setAttribute("product_detail", product_detail);
        request.setAttribute("coupon_info", coupon_info);
        request.setAttribute("is_used_coupon", is_used_coupon);

        RequestDispatcher dispatcher = request.getRequestDispatcher("//JSP_JAVASCRIPT_CSS//cart//cart.jsp");
        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");

        // Set content type of the response
        response.setContentType("application/json");

        // Get the JSON data from the request body
        BufferedReader reader = request.getReader();
        StringBuilder jsonBuffer = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonBuffer.append(line);
        }

        // Parse JSON using Gson
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(jsonBuffer.toString(), JsonObject.class);

        String action = jsonObject.get("action").getAsString();
        System.out.println(action);

        String coupon_code = request.getParameter("inputField");
        HttpSession session = request.getSession();
        int user_id = (int) session.getAttribute("id_user");
        session.setAttribute("coupon_code", coupon_code);

        ArrayList<ArrayList<String>> product_detail = interact_with_cart.get_detail_product_cart(user_id);
        int order_id = interact_with_orders.create_id_order();
        if (action.equals("buy")) {
            String phone = jsonObject.get("phone").getAsString();
            float total_money = jsonObject.get("total_money").getAsFloat();
            String adrress = jsonObject.get("adrress").getAsString();
            String province = jsonObject.get("province").getAsString();
            String city = jsonObject.get("city").getAsString();
            String district = jsonObject.get("district").getAsString();
            Float coupon_ratio = (float) 0;
            Float shipping_fee = jsonObject.get("shipping_fee").getAsFloat();
            interact_with_orders.create_order(order_id, total_money, phone, adrress, province, district, city, coupon_ratio, shipping_fee);
            JsonArray order_detail = jsonObject.get("product_detail").getAsJsonArray();
            for (JsonElement element : order_detail) {

                JsonArray productArray = element.getAsJsonArray();
                ArrayList<Integer> get_id_and_size_by_name = interact_with_cart.get_id_and_size_by_name(productArray.get(0).getAsString());
                int id_product = get_id_and_size_by_name.get(0);
                int quantity = Integer.parseInt(productArray.get(2).getAsString());
                int size = get_id_and_size_by_name.get(1);
                interact_with_orders.create_all_order_detail_from_order(id_product, user_id, order_id, quantity, size);
            }
            System.out.println(order_detail);

//
//            for (int i = 0; i < order_detail_array.length / 3; i = i + 3) {
//                ArrayList<Integer> get_id_and_size_by_name = interact_with_cart.get_id_and_size_by_name(order_detail_array[i]);
//                int id_product = get_id_and_size_by_name.get(0);
//                int quantity = Integer.parseInt(order_detail_array[i + 2]);
//                int size = get_id_and_size_by_name.get(1);
//                interact_with_orders.create_all_order_detail_from_order(id_product, user_id, order_id, quantity, size);
//            }
//            
            String responseData = "Data processed successfully";

            response.getWriter().println(responseData);
        }
        
        
        if(action.equals("delete")) {
        	int productId = jsonObject.get("id").getAsInt();
            String productName = jsonObject.get("name").getAsString();
            int sizeToDelete = jsonObject.get("size").getAsInt();
            System.out.println(productId);
            System.out.println(productName);
            System.out.println(sizeToDelete);
            
//        	ArrayList<Integer> get_id_and_size_by_name = interact_with_cart.get_id_and_size_by_name(jsonObject.get("name").getAsString());
//            int product_id = get_id_and_size_by_name.get(0);
//            int size_to_delete = jsonObject.get("size").getAsInt();
            interact_with_cart.delete_product_from_cart(user_id ,productId,sizeToDelete);       
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
