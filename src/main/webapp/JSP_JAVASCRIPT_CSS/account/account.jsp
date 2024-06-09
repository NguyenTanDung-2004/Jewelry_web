<%@page import="java.util.ArrayList"%>
<%@page import="Database.interact_with_orders"%>
<%@page import="java.text.NumberFormat" %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="utf-8"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>My Account - You & Jewelry</title>
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/account/account.css"/>
        <!-- Unicons -->
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/fontawesome.css">
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/brands.css">
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/solid.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    </head>
	<%
    	ArrayList<Object> user_info = (ArrayList<Object>)request.getAttribute("user_info");
		String dob = (String) user_info.get(1);
		NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
		int day = -1;
		int month = -1;
		int year = -1;
		if (dob != "") {
			day = Integer.parseInt(dob.split("/")[0]);
			month = Integer.parseInt(dob.split("/")[1]);
			year = Integer.parseInt(dob.split("/")[2]);
		}
		int count = 0;
		String img = (String)session.getAttribute("img"); 
		int id_user = (Integer)session.getAttribute("id_user"); 
		ArrayList<ArrayList<Object>> list_orders_confirming = interact_with_orders.get_order_by_id_status(id_user, 0);

		ArrayList<ArrayList<Object>> list_orders_shipping = interact_with_orders.get_order_by_id_status(id_user, 1);
		
		ArrayList<ArrayList<Object>> list_orders_delivered = interact_with_orders.get_order_by_id_status(id_user, 2);
		
		ArrayList<ArrayList<Object>> list_orders_canceled = interact_with_orders.get_order_by_id_status(id_user, 3);
    %>
    <body>
        <div class="logo">
            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/image.png" alt="" style="width: 100px;">
            <p>You & Jewelry</p>
        </div>
    <!--header-->
        <header>
            <div class="left header_child">
                <p id="home_tab">Home</p>
                <p id="product_tab">Product's</p>
                <p id="about_tab">About</p>
            </div>
            <%if(request.getSession().getAttribute("id_user") != null) {%>
            	<div class="right header_child">
                <div class="user">
                   <img style="max-height: 30px; max-width: 30px; min-height: 30px; min-width: 30px; object-fit: cover;" src="<%=img%>" alt="">
                    <div class="user_hover">
                        <div class="arrow"></div>
                        <div class="content">
                            <p id="user_setting">User Setting</p>
                            <p id="order_history">Order history</p>
                            <p id="logout">Logout</p>
                        </div>
                    </div>
                </div>
                <i id="icon_cart" class="fa-solid fa-cart-shopping text_child" style="color: gray"></i>
            
            </div>
            <%} %>
        </header>
    <!-- main -->
        <div class="main">
            <div class="grid">
                <div class="line"></div>
                <div class="grid__row">
                    <div class="grid__column-1-4">
                        <nav class="category">
                            <div class="account">
                                <div class="avatar">
                                    <img src="<%=img%>" alt="Avatar">
                                </div>
								<div class="text">
								    <p class="name"><%= user_info.get(0) %></p>
								    <p class="category">My account</p>
								</div>
                            </div>
                            <div class="category-list">
                                <div class="js-item-account category-item  active">
                                    <i class="fa-regular fa-user"></i>
                                    <span class="link">My Account</span>
                                    
                                </div>
                                <div class="sub-list open">
                                    <ul >
                                        <li class="js-item-profile sub-item active">
                                            <span class="link">Profile</span>
                                        </li>
                                        <li class="js-item-address sub-item">
                                            <span class="link">Address</span>
                                        </li>
                                        <li class="js-item-change--pass sub-item">
                                            <span class="link">Change Password</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="js-item-order category-item">
                                    <i class="fa-solid fa-bag-shopping"></i>
                                    <span class="link">Order History</span>
                                </div>
                                <div class="js-item-log--out category-item">
                                    <i class="fa-solid fa-right-from-bracket"></i>
                                    <span class="link">Log out</span>
                                </div>
                            </div>
                        </nav>
                    </div>
                    <div class="grid__column-3-4">
                        <div class="grid-order ">
                            <div class="category-order">
                                <div class="item js-item-all category-order-active">
                                    <span>All Orders</span>
                                </div>
                                <div class="item js-item-confirming">
                                    <span>Order Confirming</span>
                                </div>
                                <div class="item js-item-shipping">
                                    <span>Shipping</span>
                                </div>
                                <div class="item js-item-delivered">
                                    <span>Delivered</span>
                                </div>
                                <div class="item js-item-canceled">
                                    <span>Canceled</span>
                                </div>
                            </div>
                            <div class="line-order "></div>
                            <div class="order-main openFlex js-all-orders">
                          <!-- confirming -->
								    <%
								if (list_orders_confirming.size() < 1) {
								count = count + 1;
								} 
								else {
								
								for(ArrayList<Object> order : list_orders_confirming) { 
								    int orderId = (Integer) order.get(0);
								    String expectationDate = (String) order.get(1);
								    int status = (Integer) order.get(2);
								    String totalMoney = (String) order.get(3);
								    String detailAddress = (String) order.get(4);
								    String province = (String) order.get(5);
								    String district = (String) order.get(6);
								    String sub = (String) order.get(7);
								    String phone = (String) order.get(8);
								    String date = (String) order.get(9);
								    int deleted = (Integer) order.get(10);
								    float ratioOfCoupon = (Float) order.get(11);
								    String ship = (String) order.get(12);
								    float total_price =  interact_with_orders.get_total_price_of_products(orderId);
								    float coupon = ratioOfCoupon * total_price;
								    
								    String discount = numberFormat.format(coupon);
								    String subtotal = numberFormat.format(total_price);
								    ArrayList<ArrayList<Object>> product_list_of_order = interact_with_orders.get_products_by_order_id(orderId);
								%>
								<div class="order-item js-order-confirm" data-order-id="<%= orderId %>" 
								data-total-money="<%= totalMoney %>" data-detail-address="<%= detailAddress %>" 
								data-province="<%= province %>" data-district="<%= district %>" data-sub="<%= sub %>"
								data-phone="<%= phone %>" data-date="<%= date %>" data-subtotal="<%= subtotal %>"
								data-discount="<%= discount %>" data-ship="<%= ship %>">
								    <div class="info">
								        <div class="item date">
								            <span class="label">Date Ordered</span>
								            <span class="content"><%= date %></span>
								        </div>
								        <div class="item total-amount">
								            <span class="label">Total Amount</span>
								            <span class="content"><%= totalMoney + " VND" %></span>
								        </div>
								        <div class="status status-confirm ">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/confirm.png" alt="">
								            <span>Being Confirmed</span>
								        </div>
								        <div class="status status-shipping">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/shipping.png" alt="">
								            <span>Being Shipped</span>
								        </div>
								        <div class="status status-success">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/sucess.png" alt="">
								            <span>Delivered Completely</span>
								        </div>
								        <div class="status status-canceled">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/cancel.png" alt="">
								            <span>Unsuccess Delivery</span>
								        </div>
								    </div>
								    <div class="line-1"></div>
								    <ul class="product-list">
								    <% for(ArrayList<Object> product : product_list_of_order) { %>
								        <li class="product-item">
								        <% String link = "http://localhost:8080/Jewelry_web/product/" +  product.get(1) + "-" + product.get(0) + ".html";
								        	link = link.replaceAll("\\s", "-"); %>
								            <a href="<%= link %>" class="product-link">
								                <img src="<%="/Jewelry_web/img_product/" + product.get(0) + "_1.png" %>" alt="Product" class="product-img">
								                <div class="product-info">
								                    <span class="product-name"><%= product.get(1) %></span>
								                    <span class="product-desc">Product classicfication: <%= product.get(4)%> , size: <%= product.get(5)%></span>
								                    <span class="product-quantity">Quantity: <%= product.get(6)%></span>
								                </div>
								                <div class="product-money">
								                    <span><%= product.get(2) %> VND</span>
								                </div>
								            </a>
								        </li>
								    <% }%>
								    </ul>
								    <div class="line-1"></div>
								    <div class="footer">
								        <span class="expected-date">Expected delivery: <%=expectationDate%></span>
								        <button class="btn btn-view-product">
								            View product
								        </button>
								        <button class="btn-canceled-order display-block js-btn-cancel">
								            Canceled
								        </button>
								    </div>
								</div>
								<% }
								} %>
                          <!-- shipping -->
								<% 
								if (list_orders_shipping.size() < 1) {
								count = count + 1;} 
								else {
								for(ArrayList<Object> order : list_orders_shipping) { 
								    int orderId = (Integer) order.get(0);
								    String expectationDate = (String) order.get(1);
								    int status = (Integer) order.get(2);
								    String totalMoney = (String) order.get(3);
								    String detailAddress = (String) order.get(4);
								    String province = (String) order.get(5);
								    String district = (String) order.get(6);
								    String sub = (String) order.get(7);
								    String phone = (String) order.get(8);
								    String date = (String) order.get(9);
								    int deleted = (Integer) order.get(10);
								    float ratioOfCoupon = (Float) order.get(11);
								    String ship = (String) order.get(12);
								    float total_price =  interact_with_orders.get_total_price_of_products(orderId);
								    float coupon = ratioOfCoupon * total_price;
								    
								    String discount = numberFormat.format(coupon);
								    String subtotal = numberFormat.format(total_price);
								    ArrayList<ArrayList<Object>> product_list_of_order = interact_with_orders.get_products_by_order_id(orderId);
								%>
								<div class="order-item js-order-ship" data-order-id="<%= orderId %>" 
								data-total-money="<%= totalMoney %>" data-detail-address="<%= detailAddress %>" 
								data-province="<%= province %>" data-district="<%= district %>" data-sub="<%= sub %>"
								data-phone="<%= phone %>" data-date="<%= date %>" data-subtotal="<%= subtotal %>"
								data-discount="<%= discount %>" data-ship="<%= ship %>">
								    <div class="info">
								        <div class="item date">
								            <span class="label">Date Ordered</span>
								            <span class="content"><%= date %></span>
								        </div>
								        <div class="item total-amount">
								            <span class="label">Total Amount</span>
								            <span class="content"><%= totalMoney + " VND" %></span>
								        </div>
								        <div class="status status-confirm ">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/confirm.png" alt="">
								            <span>Being Confirmed</span>
								        </div>
								        <div class="status status-shipping">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/shipping.png" alt="">
								            <span>Being Shipped</span>
								        </div>
								        <div class="status status-success">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/sucess.png" alt="">
								            <span>Delivered Completely</span>
								        </div>
								        <div class="status status-canceled">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/cancel.png" alt="">
								            <span>Unsuccess Delivery</span>
								        </div>
								    </div>
								    <div class="line-1"></div>
								    <ul class="product-list">
								    <% for(ArrayList<Object> product : product_list_of_order) { %>
								        <li class="product-item">
								        <% String link = "http://localhost:8080/Jewelry_web/product/" +  product.get(1) + "-" + product.get(0) + ".html";
								        	link = link.replaceAll("\\s", "-"); %>
								            <a href="<%= link %>" class="product-link">
								                <img src="<%="/Jewelry_web/img_product/" + product.get(0) + "_1.png" %>" alt="Product" class="product-img">
								                <div class="product-info">
								                    <span class="product-name"><%= product.get(1) %></span>
								                    <span class="product-desc">Product classicfication: <%= product.get(4)%> , size: <%= product.get(5)%></span>
								                    <span class="product-quantity">Quantity: <%= product.get(6)%></span>
								                </div>
								                <div class="product-money">
								                    <span><%= product.get(2) %> VND</span>
								                </div>
								            </a>
								        </li>
								    <% }%>
								    </ul>
								    <div class="line-1"></div>
								    <div class="footer">
								        <span class="expected-date">Expected delivery: <%=expectationDate%></span>
								        <button class="btn btn-view-product">
								            View product
								        </button>
								        <button class="btn-canceled-order display-block js-btn-cancel">
								            Canceled
								        </button>
								    </div>
								</div>
								<% }
								} %>
                          <!-- delivered -->
								<% 
								if (list_orders_delivered.size() < 1) {
								count = count + 1;
								} 
								else { 
								
								for(ArrayList<Object> order : list_orders_delivered) { 
								    int orderId = (Integer) order.get(0);
								    String expectationDate = (String) order.get(1);
								    int status = (Integer) order.get(2);
								    String totalMoney = (String) order.get(3);
								    String detailAddress = (String) order.get(4);
								    String province = (String) order.get(5);
								    String district = (String) order.get(6);
								    String sub = (String) order.get(7);
								    String phone = (String) order.get(8);
								    String date = (String) order.get(9);
								    int deleted = (Integer) order.get(10);
								    float ratioOfCoupon = (Float) order.get(11);
								    String ship = (String) order.get(12);
								    float total_price =  interact_with_orders.get_total_price_of_products(orderId);
								    float coupon = ratioOfCoupon * total_price;
								    
								    String discount = numberFormat.format(coupon);
								    String subtotal = numberFormat.format(total_price);
								    ArrayList<ArrayList<Object>> product_list_of_order = interact_with_orders.get_products_by_order_id(orderId);
								%>
								<div class="order-item js-order-success" data-order-id="<%= orderId %>" 
								data-total-money="<%= totalMoney %>" data-detail-address="<%= detailAddress %>" 
								data-province="<%= province %>" data-district="<%= district %>" data-sub="<%= sub %>"
								data-phone="<%= phone %>" data-date="<%= date %>" data-subtotal="<%= subtotal %>"
								data-discount="<%= discount %>" data-ship="<%= ship %>">
								    <div class="info">
								        <div class="item date">
								            <span class="label">Date Ordered</span>
								            <span class="content"><%= date %></span>
								        </div>
								        <div class="item total-amount">
								            <span class="label">Total Amount</span>
								            <span class="content"><%= totalMoney + " VND" %></span>
								        </div>
								        <div class="status status-confirm ">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/confirm.png" alt="">
								            <span>Being Confirmed</span>
								        </div>
								        <div class="status status-shipping">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/shipping.png" alt="">
								            <span>Being Shipped</span>
								        </div>
								        <div class="status status-success">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/sucess.png" alt="">
								            <span>Delivered Completely</span>
								        </div>
								        <div class="status status-canceled">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/cancel.png" alt="">
								            <span>Unsuccess Delivery</span>
								        </div>
								    </div>
								    <div class="line-1"></div>
								    <ul class="product-list">
								    <% for(ArrayList<Object> product : product_list_of_order) { %>
								        <li class="product-item">
								        <% String link = "http://localhost:8080/Jewelry_web/product/" +  product.get(1) + "-" + product.get(0) + ".html";
								        	link = link.replaceAll("\\s", "-"); %>
								            <a href="<%= link %>" class="product-link">
								                <img src="<%="/Jewelry_web/img_product/" + product.get(0) + "_1.png" %>" alt="Product" class="product-img">
								                <div class="product-info">
								                    <span class="product-name"><%= product.get(1) %></span>
								                    <span class="product-desc">Product classicfication: <%= product.get(4)%> , size: <%= product.get(5)%></span>
								                    <span class="product-quantity">Quantity: <%= product.get(6)%></span>
								                </div>
								                <div class="product-money">
								                    <span><%= product.get(2) %> VND</span>
								                </div>
								            </a>
								        </li>
								    <% }%>
								    </ul>
								    <div class="line-1"></div>
								    <div class="footer">
								        <span class="expected-date">Expected delivery: <%=expectationDate%></span>
								        <button class="btn btn-view-product">
								            View product
								        </button>
								        <button class="btn-canceled-order display-block js-btn-cancel">
								            Canceled
								        </button>
								    </div>
								</div>
								<% }
								} %>
                          <!-- canceled -->
								<% 
								if (list_orders_canceled.size() < 1) {
								count = count + 1;} 
								else { 
								
								for(ArrayList<Object> order : list_orders_canceled) { 
								    int orderId = (Integer) order.get(0);
								    String expectationDate = (String) order.get(1);
								    int status = (Integer) order.get(2);
								    String totalMoney = (String) order.get(3);
								    String detailAddress = (String) order.get(4);
								    String province = (String) order.get(5);
								    String district = (String) order.get(6);
								    String sub = (String) order.get(7);
								    String phone = (String) order.get(8);
								    String date = (String) order.get(9);
								    int deleted = (Integer) order.get(10);
								    float ratioOfCoupon = (Float) order.get(11);
								    String ship = (String) order.get(12);
								    float total_price =  interact_with_orders.get_total_price_of_products(orderId);
								    float coupon = ratioOfCoupon * total_price;
								    
								    String discount = numberFormat.format(coupon);
								    String subtotal = numberFormat.format(total_price);
								    ArrayList<ArrayList<Object>> product_list_of_order = interact_with_orders.get_products_by_order_id(orderId);
								%>
								<div class="order-item js-order-canceled" data-order-id="<%= orderId %>" 
								data-total-money="<%= totalMoney %>" data-detail-address="<%= detailAddress %>" 
								data-province="<%= province %>" data-district="<%= district %>" data-sub="<%= sub %>"
								data-phone="<%= phone %>" data-date="<%= date %>" data-subtotal="<%= subtotal %>"
								data-discount="<%= discount %>" data-ship="<%= ship %>">
								    <div class="info">
								        <div class="item date">
								            <span class="label">Date Ordered</span>
								            <span class="content"><%= date %></span>
								        </div>
								        <div class="item total-amount">
								            <span class="label">Total Amount</span>
								            <span class="content"><%= totalMoney + " VND" %></span>
								        </div>
								        <div class="status status-confirm ">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/confirm.png" alt="">
								            <span>Being Confirmed</span>
								        </div>
								        <div class="status status-shipping">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/shipping.png" alt="">
								            <span>Being Shipped</span>
								        </div>
								        <div class="status status-success">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/sucess.png" alt="">
								            <span>Delivered Completely</span>
								        </div>
								        <div class="status status-canceled">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/cancel.png" alt="">
								            <span>Unsuccess Delivery</span>
								        </div>
								    </div>
								    <div class="line-1"></div>
								    <ul class="product-list">
								    <% for(ArrayList<Object> product : product_list_of_order) { %>
								        <li class="product-item">
								        <% String link = "http://localhost:8080/Jewelry_web/product/" +  product.get(1) + "-" + product.get(0) + ".html";
								        	link = link.replaceAll("\\s", "-"); %>
								            <a href="<%= link %>" class="product-link">
								                <img src="<%="/Jewelry_web/img_product/" + product.get(0) + "_1.png" %>" alt="Product" class="product-img">
								                <div class="product-info">
								                    <span class="product-name"><%= product.get(1) %></span>
								                    <span class="product-desc">Product classicfication: <%= product.get(4)%> , size: <%= product.get(5)%></span>
								                    <span class="product-quantity">Quantity: <%= product.get(6)%></span>
								                </div>
								                <div class="product-money">
								                    <span><%= product.get(2) %> VND</span>
								                </div>
								            </a>
								        </li>
								    <% }%>
								    </ul>
								    <div class="line-1"></div>
								    <div class="footer">
								        <span class="expected-date">Expected delivery: <%=expectationDate%></span>
								        <button class="btn btn-view-product">
								            View product
								        </button>
								        <button class="btn-canceled-order display-block js-btn-cancel">
								            Canceled
								        </button>
								    </div>
								</div>
								<% }
								} %>
								<% if (count == 4) { %>
								<span class="empty">There are no orders.</span>
								<% } %>
                            </div>
                       
                            <div class="order-main js-order-confirming">
								    <% 
								if (list_orders_confirming.size() < 1) {
								%>
								<span class="empty">There are no orders.</span>
								<%} 
								else { %>
								<% 
								for(ArrayList<Object> order : list_orders_confirming) { 
								    int orderId = (Integer) order.get(0);
								    String expectationDate = (String) order.get(1);
								    int status = (Integer) order.get(2);
								    String totalMoney = (String) order.get(3);
								    String detailAddress = (String) order.get(4);
								    String province = (String) order.get(5);
								    String district = (String) order.get(6);
								    String sub = (String) order.get(7);
								    String phone = (String) order.get(8);
								    String date = (String) order.get(9);
								    int deleted = (Integer) order.get(10);
								    float ratioOfCoupon = (Float) order.get(11);
								    String ship = (String) order.get(12);
								    float total_price =  interact_with_orders.get_total_price_of_products(orderId);
								    float coupon = ratioOfCoupon * total_price;
								    
								    String discount = numberFormat.format(coupon);
								    String subtotal = numberFormat.format(total_price);
								    ArrayList<ArrayList<Object>> product_list_of_order = interact_with_orders.get_products_by_order_id(orderId);
								%>
								<div class="order-item js-order-confirm" data-order-id="<%= orderId %>" 
								data-total-money="<%= totalMoney %>" data-detail-address="<%= detailAddress %>" 
								data-province="<%= province %>" data-district="<%= district %>" data-sub="<%= sub %>"
								data-phone="<%= phone %>" data-date="<%= date %>" data-subtotal="<%= subtotal %>"
								data-discount="<%= discount %>" data-ship="<%= ship %>">
								    <div class="info">
								        <div class="item date">
								            <span class="label">Date Ordered</span>
								            <span class="content"><%= date %></span>
								        </div>
								        <div class="item total-amount">
								            <span class="label">Total Amount</span>
								            <span class="content"><%= totalMoney + " VND" %></span>
								        </div>
								        <div class="status status-confirm ">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/confirm.png" alt="">
								            <span>Being Confirmed</span>
								        </div>
								        <div class="status status-shipping">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/shipping.png" alt="">
								            <span>Being Shipped</span>
								        </div>
								        <div class="status status-success">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/sucess.png" alt="">
								            <span>Delivered Completely</span>
								        </div>
								        <div class="status status-canceled">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/cancel.png" alt="">
								            <span>Unsuccess Delivery</span>
								        </div>
								    </div>
								    <div class="line-1"></div>
								    <ul class="product-list">
								    <% for(ArrayList<Object> product : product_list_of_order) { %>
								        <li class="product-item">
								        <% String link = "http://localhost:8080/Jewelry_web/product/" +  product.get(1) + "-" + product.get(0) + ".html";
								        	link = link.replaceAll("\\s", "-"); %>
								            <a href="<%= link %>" class="product-link">
								                <img src="<%="/Jewelry_web/img_product/" + product.get(0) + "_1.png" %>" alt="Product" class="product-img">
								                <div class="product-info">
								                    <span class="product-name"><%= product.get(1) %></span>
								                    <span class="product-desc">Product classicfication: <%= product.get(4)%> , size: <%= product.get(5)%></span>
								                    <span class="product-quantity">Quantity: <%= product.get(6)%></span>
								                </div>
								                <div class="product-money">
								                    <span><%= product.get(2) %> VND</span>
								                </div>
								            </a>
								        </li>
								    <% }%>
								    </ul>
								    <div class="line-1"></div>
								    <div class="footer">
								        <span class="expected-date">Expected delivery: <%=expectationDate%></span>
								        <button class="btn btn-view-product">
								            View product
								        </button>
								        <button class="btn-canceled-order display-block js-btn-cancel">
								            Canceled
								        </button>
								    </div>
								</div>
								<% }
								} %>
                            </div>
                       
                            <div class="order-main js-order-shipping">
								<% 
								if (list_orders_shipping.size() < 1) {
								%>
								<span class="empty">There are no orders.</span>
								<%} 
								else { %>
								<% 
								for(ArrayList<Object> order : list_orders_shipping) { 
								    int orderId = (Integer) order.get(0);
								    String expectationDate = (String) order.get(1);
								    int status = (Integer) order.get(2);
								    String totalMoney = (String) order.get(3);
								    String detailAddress = (String) order.get(4);
								    String province = (String) order.get(5);
								    String district = (String) order.get(6);
								    String sub = (String) order.get(7);
								    String phone = (String) order.get(8);
								    String date = (String) order.get(9);
								    int deleted = (Integer) order.get(10);
								    float ratioOfCoupon = (Float) order.get(11);
								    String ship = (String) order.get(12);
								    float total_price =  interact_with_orders.get_total_price_of_products(orderId);
								    float coupon = ratioOfCoupon * total_price;
								    
								    String discount = numberFormat.format(coupon);
								    String subtotal = numberFormat.format(total_price);
								    ArrayList<ArrayList<Object>> product_list_of_order = interact_with_orders.get_products_by_order_id(orderId);
								%>
								<div class="order-item js-order-ship" data-order-id="<%= orderId %>" 
								data-total-money="<%= totalMoney %>" data-detail-address="<%= detailAddress %>" 
								data-province="<%= province %>" data-district="<%= district %>" data-sub="<%= sub %>"
								data-phone="<%= phone %>" data-date="<%= date %>" data-subtotal="<%= subtotal %>"
								data-discount="<%= discount %>" data-ship="<%= ship %>">
								    <div class="info">
								        <div class="item date">
								            <span class="label">Date Ordered</span>
								            <span class="content"><%= date %></span>
								        </div>
								        <div class="item total-amount">
								            <span class="label">Total Amount</span>
								            <span class="content"><%= totalMoney + " VND" %></span>
								        </div>
								        <div class="status status-confirm ">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/confirm.png" alt="">
								            <span>Being Confirmed</span>
								        </div>
								        <div class="status status-shipping">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/shipping.png" alt="">
								            <span>Being Shipped</span>
								        </div>
								        <div class="status status-success">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/sucess.png" alt="">
								            <span>Delivered Completely</span>
								        </div>
								        <div class="status status-canceled">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/cancel.png" alt="">
								            <span>Unsuccess Delivery</span>
								        </div>
								    </div>
								    <div class="line-1"></div>
								    <ul class="product-list">
								    <% for(ArrayList<Object> product : product_list_of_order) { %>
								        <li class="product-item">
								        <% String link = "http://localhost:8080/Jewelry_web/product/" +  product.get(1) + "-" + product.get(0) + ".html";
								        	link = link.replaceAll("\\s", "-"); %>
								            <a href="<%= link %>" class="product-link">
								                <img src="<%="/Jewelry_web/img_product/" + product.get(0) + "_1.png" %>" alt="Product" class="product-img">
								                <div class="product-info">
								                    <span class="product-name"><%= product.get(1) %></span>
								                    <span class="product-desc">Product classicfication: <%= product.get(4)%> , size: <%= product.get(5)%></span>
								                    <span class="product-quantity">Quantity: <%= product.get(6)%></span>
								                </div>
								                <div class="product-money">
								                    <span><%= product.get(2) %> VND</span>
								                </div>
								            </a>
								        </li>
								    <% }%>
								    </ul>
								    <div class="line-1"></div>
								    <div class="footer">
								        <span class="expected-date">Expected delivery: <%=expectationDate%></span>
								        <button class="btn btn-view-product">
								            View product
								        </button>
								        <button class="btn-canceled-order display-block js-btn-cancel">
								            Canceled
								        </button>
								    </div>
								</div>
								<% }
								} %>
                            </div>

                            <div class="order-main js-order-delivered">
								<% 
								if (list_orders_delivered.size() < 1) {
								%>
								<span class="empty">There are no orders.</span>
								<%} 
								else { %>
								<% 
								for(ArrayList<Object> order : list_orders_delivered) { 
								    int orderId = (Integer) order.get(0);
								    String expectationDate = (String) order.get(1);
								    int status = (Integer) order.get(2);
								    String totalMoney = (String) order.get(3);
								    String detailAddress = (String) order.get(4);
								    String province = (String) order.get(5);
								    String district = (String) order.get(6);
								    String sub = (String) order.get(7);
								    String phone = (String) order.get(8);
								    String date = (String) order.get(9);
								    int deleted = (Integer) order.get(10);
								    float ratioOfCoupon = (Float) order.get(11);
								    String ship = (String) order.get(12);
								    float total_price =  interact_with_orders.get_total_price_of_products(orderId);
								    float coupon = ratioOfCoupon * total_price;
								    
								    String discount = numberFormat.format(coupon);
								    String subtotal = numberFormat.format(total_price);
								    ArrayList<ArrayList<Object>> product_list_of_order = interact_with_orders.get_products_by_order_id(orderId);
								%>
								<div class="order-item js-order-success" data-order-id="<%= orderId %>" 
								data-total-money="<%= totalMoney %>" data-detail-address="<%= detailAddress %>" 
								data-province="<%= province %>" data-district="<%= district %>" data-sub="<%= sub %>"
								data-phone="<%= phone %>" data-date="<%= date %>" data-subtotal="<%= subtotal %>"
								data-discount="<%= discount %>" data-ship="<%= ship %>">
								    <div class="info">
								        <div class="item date">
								            <span class="label">Date Ordered</span>
								            <span class="content"><%= date %></span>
								        </div>
								        <div class="item total-amount">
								            <span class="label">Total Amount</span>
								            <span class="content"><%= totalMoney + " VND" %></span>
								        </div>
								        <div class="status status-confirm ">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/confirm.png" alt="">
								            <span>Being Confirmed</span>
								        </div>
								        <div class="status status-shipping">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/shipping.png" alt="">
								            <span>Being Shipped</span>
								        </div>
								        <div class="status status-success">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/sucess.png" alt="">
								            <span>Delivered Completely</span>
								        </div>
								        <div class="status status-canceled">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/cancel.png" alt="">
								            <span>Unsuccess Delivery</span>
								        </div>
								    </div>
								    <div class="line-1"></div>
								    <ul class="product-list">
								    <% for(ArrayList<Object> product : product_list_of_order) { %>
								        <li class="product-item">
								        <% String link = "http://localhost:8080/Jewelry_web/product/" +  product.get(1) + "-" + product.get(0) + ".html";
								        	link = link.replaceAll("\\s", "-"); %>
								            <a href="<%= link %>" class="product-link">
								                <img src="<%="/Jewelry_web/img_product/" + product.get(0) + "_1.png" %>" alt="Product" class="product-img">
								                <div class="product-info">
								                    <span class="product-name"><%= product.get(1) %></span>
								                    <span class="product-desc">Product classicfication: <%= product.get(4)%> , size: <%= product.get(5)%></span>
								                    <span class="product-quantity">Quantity: <%= product.get(6)%></span>
								                </div>
								                <div class="product-money">
								                    <span><%= product.get(2) %> VND</span>
								                </div>
								            </a>
								        </li>
								    <% }%>
								    </ul>
								    <div class="line-1"></div>
								    <div class="footer">
								        <span class="expected-date">Expected delivery: <%=expectationDate%></span>
								        <button class="btn btn-view-product">
								            View product
								        </button>
								        <button class="btn-canceled-order display-block js-btn-cancel">
								            Canceled
								        </button>
								    </div>
								</div>
								<% }
								} %>
                            </div>

                            <div class="order-main js-order-canceled">
								<% 
								if (list_orders_canceled.size() < 1) {
								%>
								<span class="empty">There are no orders.</span>
								<%} 
								else { %>
								<% 
								for(ArrayList<Object> order : list_orders_canceled) { 
								    int orderId = (Integer) order.get(0);
								    String expectationDate = (String) order.get(1);
								    int status = (Integer) order.get(2);
								    String totalMoney = (String) order.get(3);
								    String detailAddress = (String) order.get(4);
								    String province = (String) order.get(5);
								    String district = (String) order.get(6);
								    String sub = (String) order.get(7);
								    String phone = (String) order.get(8);
								    String date = (String) order.get(9);
								    int deleted = (Integer) order.get(10);
								    float ratioOfCoupon = (Float) order.get(11);
								    String ship = (String) order.get(12);
								    float total_price =  interact_with_orders.get_total_price_of_products(orderId);
								    float coupon = ratioOfCoupon * total_price;
								    
								    String discount = numberFormat.format(coupon);
								    String subtotal = numberFormat.format(total_price);
								    ArrayList<ArrayList<Object>> product_list_of_order = interact_with_orders.get_products_by_order_id(orderId);
								%>
								<div class="order-item js-order-canceled" data-order-id="<%= orderId %>" 
								data-total-money="<%= totalMoney %>" data-detail-address="<%= detailAddress %>" 
								data-province="<%= province %>" data-district="<%= district %>" data-sub="<%= sub %>"
								data-phone="<%= phone %>" data-date="<%= date %>" data-subtotal="<%= subtotal %>"
								data-discount="<%= discount %>" data-ship="<%= ship %>">
								    <div class="info">
								        <div class="item date">
								            <span class="label">Date Ordered</span>
								            <span class="content"><%= date %></span>
								        </div>
								        <div class="item total-amount">
								            <span class="label">Total Amount</span>
								            <span class="content"><%= totalMoney + " VND" %></span>
								        </div>
								        <div class="status status-confirm ">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/confirm.png" alt="">
								            <span>Being Confirmed</span>
								        </div>
								        <div class="status status-shipping">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/shipping.png" alt="">
								            <span>Being Shipped</span>
								        </div>
								        <div class="status status-success">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/sucess.png" alt="">
								            <span>Delivered Completely</span>
								        </div>
								        <div class="status status-canceled">
								            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/cancel.png" alt="">
								            <span>Unsuccess Delivery</span>
								        </div>
								    </div>
								    <div class="line-1"></div>
								    <ul class="product-list">
								    <% for(ArrayList<Object> product : product_list_of_order) { %>
								        <li class="product-item">
								        <% String link = "http://localhost:8080/Jewelry_web/product/" +  product.get(1) + "-" + product.get(0) + ".html";
								        	link = link.replaceAll("\\s", "-"); %>
								            <a href="<%= link %>" class="product-link">
								                <img src="<%="/Jewelry_web/img_product/" + product.get(0) + "_1.png" %>" alt="Product" class="product-img">
								                <div class="product-info">
								                    <span class="product-name"><%= product.get(1) %></span>
								                    <span class="product-desc">Product classicfication: <%= product.get(4)%> , size: <%= product.get(5)%></span>
								                    <span class="product-quantity">Quantity: <%= product.get(6)%></span>
								                </div>
								                <div class="product-money">
								                    <span><%= product.get(2) %> VND</span>
								                </div>
								            </a>
								        </li>
								    <% }%>
								    </ul>
								    <div class="line-1"></div>
								    <div class="footer">
								        <span class="expected-date">Expected delivery: <%=expectationDate%></span>
								        <button class="btn btn-view-product">
								            View product
								        </button>
								        <button class="btn-canceled-order display-block js-btn-cancel">
								            Canceled
								        </button>
								    </div>
								</div>
								<% }
								} %>
                            </div>

                        </div>
                        <div class="grid-detail-order">
                            <div class="header">
                                <div class="btn-back">
                                    <i class="fa-solid fa-angle-left"></i>
                                    <span>BACK</span>
                                </div>
                                <div class="header-info">
                                    <div class="id">
                                        <span class="id-label">ORDER</span>
                                        <span class="order-id">#29034</span>
                                    </div>
                                    <span class="time-order">May 04, 2024 at 09:22 am</span>
                                </div>
                            </div>
                            <div class="order-processing">
                                <div class="header">
                                    <span>ORDER PROGRESSION</span>
                                </div>
                                <div class="line-1"></div>
                                <span class="text_order-canceled">
                                        Order Canceled
                                </span>
                                <div class="main">
                                    <div class="item order-comfirmed">
                                        <div class="img">
                                            <img class="border-gray" src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/progress-confirm.png" alt="">
                                        </div>
                                        <span class="label">Comfirming</span>

                                    </div>
                                    <div class="item order-shipped">
                                        <div class="img">
                                            <img class="border-gray" src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/progress-shipping.png" alt="">
                                        </div>
                                        <span class="label">Shipping</span>

                                    </div>
                                    <div class="item order-delivered">
                                        <div class="img">
                                            <img class="border-gray" src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/progress-delivered.png" alt="">
                                        </div>
                                        <span class="label">Delivered</span>
                                        <span class="date-delivered"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="order-detail-product">
                                <div class="header">
                                    <span>ORDERED ITEMS</span>
                                </div>
                                <div class="line-1 js-line-1"></div>
                                <div class="line-1"></div>
                                <div class="total-amount">
                                    <div class="item">
                                        <span class="label">Subtotal</span>
                                        <span class="money js-subtotal-money">57 000 000 VND</span>
                                    </div>
                                    <div class="item">
                                        <span class="label">Shipping</span>
                                        <span class="money js-shipping-money">50 000 VND</span>
                                    </div>
                                    <div class="line-2"></div>
                                    <div class="item item-total">
                                        <span class="label">Total</span>
                                        <span class="money js-total-money">56 000 000 VND</span>
                                    </div>
                                </div>
                            </div>
                            <div class="order-customer">
                                <div class="header">
                                    <span>DELIVERY DETAILS</span>
                                </div>
                                <div class="line-1"></div>
                                <div class="main">
                                    <div class="row-1">
                                        <div class="name">
                                            <i class="fa-solid fa-user"></i>
                                            <span >Phan Nguyen Tra Giang</span>
                                        </div>
                                        <div class="phone">
                                            <i class="fa-solid fa-phone"></i>                                            
                                            <span>0926123456</span>
                                        </div>
                                    </div>
                                    <div class="customer-address">
                                        <i class="fa-solid fa-location-pin"></i>                                        
                                        <span>123 Nguyen Du, Quan 12, Ho Chi Minh</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="grid-main ">
                            <div class="js-grid-main profile display-block">
                                <div class="grid__row header">
                                    <span class="active-item name">My Profile</span>
                                    <div class="active-item text">Managing Profile Information for Account Security</div>
                                </div>
                                <div class="grid__row main">
                                    <div class="left">
                                        <div class="item">
                                            <span class="name">Name</span>
                                            <input  type="text" name="name" id="name" value="<%= user_info.get(0) %>">
                                            <button class="btn-update">Update</button>
                                        </div>
                                        <div class="item">
                                            <span class="name">Email</span>
                                            <input  type="text" name="email" id="email" value="<%= user_info.get(3) %>">
                                            <button style="visibility: hidden;" class="btn-update">Update</button>
                                        </div>
                                        <div class="item">
                                            <span class="name">Phone</span>
                                            <input  type="text" name="phone" id="phone" value="<%= user_info.get(2) %>">
                                            <button class="btn-update">Update</button>
                                        </div>
                                        <div class="item">
                                            <span class="name">Sex</span>
                                            <div class="sex-group">
                                                <div class="sex-type">
                                                    <input type="radio" id="male" name="gender" value="Male">
                                                    <span>Male</span>
                                                </div>
                                                <div class="sex-type">
                                                    <input type="radio" id="female" name="gender" value="Female">
                                                    <span>Female</span>
                                                </div>
                                                <div class="sex-type">
                                                    <input type="radio" id="other" name="gender" value="Other">
                                                    <span>Other</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <span class="name">Date of birth</span>
                                            <div class="calendar">
                                                <div class="day-selector">
                                                    <select class="day-select">
                                                      <option value="">Select Day</option>
                                                    </select>
                                                </div>
                                                <div class="month-selector">
                                                    <select class="month-select">
                                                        <option value="">Select Month</option>                                                
                                                    </select>
                                                </div>
                                                <div class="year-selector">
                                                    <select class="year-select">
                                                        <option value="">Select Year</option>
                                                    </select>
                                                </div>
                                              </div>
                                        </div>
                                    </div>
                                    <div class="right">
                                        <div class="avatar-img">
                                            <img src="<%=img%>" alt="Avatar">
                                        </div>
                                        <div class="avatar-uploader">
                                            <input type="file" id="avatar-upload" accept="image/*" hidden>
                                            <label for="avatar-upload">
                                              <span>Upload</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="grid__row footer">
                                    <button class="btn js-update" id="save-account">SAVE</button>
                                </div>
                            </div>
                            <div class="js-grid-main address ">
                                <div class="grid__row header">
                                    <span class="active-item name">My Address</span>
                                </div>
                                <div class="grid__row main">
                                    <div class="grid__row">
                                        <div class="input-address">
                                            <label for="address">Address</label>
                                            <input type="text" id="address" name="address" placeholder="Enter your address" value="<%= user_info.get(5) %>" />                                        
                                        </div>
                                    </div>
                                    <div class="grid__row">
                                        <select class="form-select" id="city" aria-label=".form-select-sm">
                                            <option value="" selected>Select City</option>           
                                        </select>
                                                      
                                        <select class="form-select" id="district" aria-label=".form-select-sm">
                                            <option value="" selected>Select District</option>
                                        </select>
                                            
                                        <select class="form-select" id="ward" aria-label=".form-select-sm">
                                            <option value="" selected>Select Ward</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="grid__row footer">
                                    <button class="btn js-update" id="save-address">SAVE</button>
                                </div>

                            </div>
                            <div class="js-grid-main change-pass ">
                                <div class="grid__row header">
                                    <span class="active-item name">Change Password</span>
                                </div>
                                <div class="grid__row main">
                                    <div class="left">
                                        <div class="input1">
                                            <input type="password" name="new-password" id="new-pass" placeholder="ENTER YOUR NEW PASSWORD">
                                            <i id="pass_eye" class="fa-solid fa-eye-slash"></i>
                                        </div>
                                        <div class="input2">
                                            <input type="password" name="re-enter-pass" id="re-enter-pass" placeholder="RE-ENTER YOUR NEW PASSWORD">
                                            <i id="pass_eye" class="fa-solid fa-eye-slash"></i>
                                        </div>
                                        <div class="request">
                                            <p>Must be at least 8 characters long. </p>
                                            <p>Must include uppercase, lowercase letters,  numbers. </p>
                                        </div>
                                    </div>
                                    <div class="right">
                                        <button class="btn" id="save-new-pass">SAVE</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <div class="footer">
                <div class="main">
                    <div class="location main_child">
                        <div class="top3">Location</div>
                        <div id="location" class="bottom3">
                            <i class="fa-solid fa-location-dot"></i>
                            <p>UIT - University Information Of Technology.</p>
                        </div>
                    </div>
                    <div class="About_us main_child">
                        <div class="top3">About Us</div>
                        <div class="bottom3">
                            <p>Nguyễn Tấn Dũng</p>
                            <p>Phan Nguyễn Trà Giang</p>
                            <p>Vũ Hồ Quỳnh Anh</p>
                            <p>Nguyễn Văn Duy Bảo</p>
                        </div>
                    </div>
                    <div class="hotlline main_child">
                        <div class="top3">Hotline</div>
                        <div class="bottom3">Timo - 0977482071</div>
                    </div>
             
                </div>
                <div class="line_copyright">
                    <div class="line"></div>
                    <p>@copyright</p>
                </div>
            </div>
        </footer>
    <!-- Modal send verification code -->
        <div class="modal js-modal-send">
            <div class="overlay"></div>
            <div class="body">
                <div class="btn-close-changepass">
                    <i class="fa-solid fa-xmark"></i>
                </div>
                <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/lock.png" alt="Security img">
                <div class="text">
                    <p>For your security, please verify your email address before making any changes.</p>
                </div>
                <div class="info">
                    <p class="mail"><%= user_info.get(3) %></p>
                    <button class="btn btn-modal js-send-mail">SEND</button>
                </div>
            </div>
        </div>
        <div class="modal js-modal-sent">
            <div class="overlay"></div>
            <div class="body">
                <div class="btn-close-changepass">
                    <i class="fa-solid fa-xmark"></i>
                </div>
                <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/sent-mail.png" alt="Send-Mail img">
                <div class="text">
                    <p>We have sent a verification code to your email.</p>
                </div>
                <div class="info">
                    <input type="text" id="verificationCode" name="verificationCode" maxlength="6" placeholder="Enter verification code">
                    <button class="btn btn-modal btn-confirm">CONFIRM</button>
                </div>
                <button class="btn-resend">Resend</button>
            </div>
        </div>
        <div class="modal js-modal-reason-canceled">
            <div class="overlay"></div>
            <div class="body">
                <div class="btn-close">
                    <i class="fa-solid fa-xmark"></i>
                </div>
                <h2 class="header">Please give us your reason</h2>
                <div class="radio-group">  
                    <div class="reason-option">
                        <input type="radio" id="reason1" name="reason" value="reason1">
                        <span>Payment issues.</span>
                    </div>
                    <div class="reason-option">
                        <input type="radio" id="reason2" name="reason" value="reason2">
                        <span>Change my mind.</span>
                    </div>
                    <div class="reason-option">
                        <input type="radio" id="reason3" name="reason" value="reason3">
                        <span>Product quality concerns.</span>
                    </div>
                    <div class="reason-option">
                        <input type="radio" id="reason4" name="reason" value="reason4">
                        <span>Customer service issues.</span>
                    </div>
                    <div class="reason-option">
                        <input type="radio" id="reason5" name="reason" value="reason5">
                        <span>Others</span>
                     <!--<input type="text" id="other-reason" name="reason" placeholder="Input your reason"> -->
                        
                    </div>
                </div>
                <button class="btn-send__reason">
                    <i class="fa-regular fa-paper-plane"></i>
                    SEND
                </button>
            </div>
        </div>
        <div class="modal js-modal-sent-reason-canceled">
            <div class="overlay"></div>
            <div class="body">
                <div class="btn-close">
                    <i class="fa-solid fa-xmark"></i>
                </div>
                <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/account/send_option_cancel.png" alt="Send-Mail img">
                <div class="text">
                    <p>THANK FOR SHARING YOUR OPINION !</p>
                </div>
            </div>
        </div>
        <div class="modal modal-status js-modal-success">
            <div class="overlay"></div>
            <div class="body">
                <div class="btn-close">
                    <i class="fa-solid fa-xmark"></i>
                </div>
                <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/success.png" alt="Send-Mail img">
                <div class="text">
                    <p>Successfull</p>
                </div>
            </div>
        </div>
        <div class="modal modal-status js-modal-failed">
            <div class="overlay"></div>
            <div class="body">
                <div class="btn-close">
                    <i class="fa-solid fa-xmark"></i>
                </div>
                <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/failed.png" alt="Send-Mail img">
                <div class="text">
                    <p>Failed</p>
                </div>
            </div>
        </div>
        
        <script>
		  var x = <%= day %>;
		  var y = <%= month %>;
		  var z = '<%= year %>';
		</script>
		        
		<script>
		  var add1 = '<%= user_info.get(6) %>';
		  var add2 = '<%= user_info.get(7) %>';
		  var add3 = '<%= user_info.get(8) %>';
		  
		</script>
		
		<script>
	        var genderInput = document.getElementsByName("gender");
	        var userGender = "<%= user_info.get(9) %>";
	        		
	        for (var i = 0; i < genderInput.length; i++) {
	        	if (genderInput[i].value === userGender) {
	        		genderInput[i].checked = true;
	        		            break;
	        	}
	        }
        </script>
		
        <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/account/account.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/account/option_address.js"></script>
        <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/account/logout.js"></script>
       <!--  <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/home/home_responsive.js"></script> -->
        <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/account/change_tab.js"></script>
		<script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/account/update_profile.js"></script>
		<script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/account/update_address.js"></script>
		<script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/account/update_pass.js"></script>
		<script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/account/delete_order.js"></script>
		<script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/account/auto_click.js"></script>

    </body>
</html>