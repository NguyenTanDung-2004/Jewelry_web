
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page import="org.json.JSONArray" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/JSP_JAVASCRIPT_CSS/cart/style.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/fontawesome.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/brands.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/solid.css">
        <link href='https://fonts.googleapis.com/css?family=Istok Web' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Podkova' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Itim' rel='stylesheet'>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/fontawesome.css">
        <title>Cart</title>
    </head>


    <%  ArrayList<ArrayList<String>> product_details = (ArrayList<ArrayList<String>>) request.getAttribute("product_detail");
        ArrayList<String> coupon_info = (ArrayList<String>) request.getAttribute("coupon_info");
        ArrayList<ArrayList<String>> cartList = new ArrayList<ArrayList<String>>();
        if (session.getAttribute("cartList") != null) {
            cartList = (ArrayList<ArrayList<String>>) session.getAttribute("cartList");
        }

        DecimalFormat formatter = new DecimalFormat("#,###");
        String action = "";
        if (session.getAttribute("action") != null) {
            action = String.valueOf(session.getAttribute("action"));
//            System.out.println(action);
        }

        int is_used_coupon = Integer.parseInt(String.valueOf(request.getAttribute("is_used_coupon")));
        int total_amount = 0;
        for (int j = 0; j < product_details.size(); j++) {
            int quantity = Integer.parseInt(product_details.get(j).get(4));
            int price = Integer.parseInt(product_details.get(j).get(5));
            total_amount += quantity * price;
        }
        int all_cart_amount = product_details.size();
        String img = (String) session.getAttribute("img");
    %>

    <body>

        <div class="wrapper">
            <div class="header">
                <div class="nav_bar">

                    <div class="nav_bar_item">

                        <a href="http://localhost:8080/Jewelry_web/home" class="nav_bar_item_link">Home</a>
                    </div>

                    <div class="nav_bar_item">

                        <a href="http://localhost:8080/Jewelry_web/product" class="nav_bar_item_link">Product's</a>
                    </div>

                    <div style="visibility: hidden"class="nav_bar_item">

                        <a href="#" class="nav_bar_item_link">About</a>
                    </div>

                </div>

                <ul class="drop_down_menu">
                    <i class="fa-solid fa-bars"></i>
                    <li class="dropdown_nav_bar_item">

                        <a href="http://localhost:8080/Jewelry_web/home" class="nav_bar_item_link">Home</a>
                    </li>

                    <li class="dropdown_nav_bar_item">

                        <a href="http://localhost:8080/Jewelry_web/product" class="nav_bar_item_link">Product's</a>
                    </li>

                    <li style="visibility: hidden" class="dropdown_nav_bar_item">

                        <a href="#" class="nav_bar_item_link">About us</a>
                    </li>
                </ul>

                <div class="logo">
                    <img id="logo_img" src="<%= request.getContextPath()%>//JSP_JAVASCRIPT_CSS//img//image.png" alt="">
                    <div>Me & Jewelry</div>
                </div>

                <div class="cart">
<!--                    <div class="user">-->
                        <img class="user" style="cursor: pointer; border-radius: 50%; max-height: 30px; max-width: 30px; min-height: 30px; min-width: 30px; object-fit: cover;" src="<%=img%>" alt="">
                    <div class="user_ava_hover">
                        <div class="user_ava_arrow"></div>
                        <div class="user_ava_hover_content">
                            <p id="user_setting">User Setting</p>
                            <p id="order_history">Order history</p>
                            <p id="logout">Logout</p>
                        </div>
                    </div>    
                    <div style="visibility: hidden;"class="shopping_cart">
                        <i class="fa-solid fa-cart-shopping"></i>
                    </div>
                </div>

            </div>

            <div class="line"></div>
            <div class="main_content">
                <div class="display">
                    <div class="display_cart">
                        <div class="my_cart">
                            <div class="my_cart_text">My Cart</div>
                            <div class="cart_amount"><%=all_cart_amount%></div>

                        </div>

                        <div class="cart_info">
                            <ul class="cart_info_ul" id="all_cart">All Cart</ul>
                            <ul style="cursor: pointer;" class="cart_info_ul" id="filter">Filter</ul>
                            <div class="user_hover">
                                <div class="arrow"></div>
                                <div class="user_hover_content">
                                    <p onclick="productFilter(this)">Ring</p>
                                    <p onclick="productFilter(this)">Bracelet</p>
                                    <p onclick="productFilter(this)">Necklace</p>
                                    <p onclick="productFilter(this)">Earring</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="all_product">
                        <input type="checkbox" id="check_box_all" onclick="checkAll(this)">
                        Choose all products
                    </div>

                    <div class="line"></div>

                    <div class="product">
                        <% if (action == "") {
                                for (int i = 0; i < product_details.size(); i++) {
                                    String imageUrl = request.getContextPath() + "/img_product/" + product_details.get(i).get(0) + "_1.png";
                                    String id = "index_" + String.valueOf(i);

                        %>
                        <div id=<%=id%> class="product_detail">
                            <div class="product_name">
                                <input type="checkbox" class="product_check_box" id="<%="check_box_" + id%>" onclick="add_to_cart(this);">
                                <h3 id=<%="name_" + id%> class="product_name_2"><%=product_details.get(i).get(7)%></h3>
                                <h3 class="product_type"><%=product_details.get(i).get(1)%></h3>
                            </div>

                            <div id=<%="product_info_" + id%> class="product_info">
                                <image src=<%=imageUrl%> class="product_image"></image>
                                <div class="product_description">
                                    <p><%=product_details.get(i).get(2)%> </p>
                                    <div id=<%="size_" + id%> class="product_size">Size : <%=product_details.get(i).get(3)%></div>
                                    <div class="product_price_and_update">
                                        <div id=<%="price_" + id%> class="product_price"><%=formatter.format(Double.parseDouble(product_details.get(i).get(5)))%> VND</div>
                                        <div class="product_update">
                                            <i id="delete_<%= product_details.get(i).get(0) %>" style="cursor:pointer;" class="fa-solid fa-trash-can"></i>
                                            <button type="button" id="minus_btn" onclick=decrease(this) class="product_quantity">−</button>
                                            <div id=<%="quantity_" + id%> class="product_quantity"><%=product_details.get(i).get(4)%></div>
                                            <button type="button" id="plus_btn" onclick=increase(this) class="product_quantity">+</button>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="line"></div>
                        </div> 
                        <% } %> 
                        <% } else {
                            for (int i = 0; i < product_details.size(); i++) {
                                String imageUrl = request.getContextPath() + "/img_product/" + product_details.get(i).get(0) + "_1.png";
                                String id = "index_" + String.valueOf(i);
                                for (int m = 0; m < cartList.size(); m++) {
                                    if (product_details.get(i).get(0).equals(cartList.get(m).get(1)) && product_details.get(i).get(3).equals(cartList.get(m).get(2))) {%> 

                        <div id=<%=id%> class="product_detail">
                            <div class="product_name">
                                <input type="checkbox" class="product_check_box" onclick="add_to_cart(this)" checked>
                                <h3 id=<%="name_" + id%> class="product_name_2"><%=product_details.get(i).get(7)%></h3>
                                <h3 class="product_type"><%=product_details.get(i).get(1)%></h3>
                            </div>

                            <div id=<%="product_info_" + id%> class="product_info">
                                <image src=<%=imageUrl%> class="product_image"></image>
                                <div class="product_description">
                                    <p><%=product_details.get(i).get(2)%> </p>
                                    <div id=<%="size_" + id%> class="product_size">Size : <%=product_details.get(i).get(3)%></div>
                                    <div class="product_price_and_update">
                                        <div id=<%="price_" + id%> class="product_price"><%=formatter.format(Double.parseDouble(product_details.get(i).get(5)))%> VND</div>
                                        <div class="product_update">
                                            <i id=<%="delete_" + id%> style="cursor:pointer;" class="fa-solid fa-trash-can"></i>
                                            <button type="button" id="minus_btn" onclick=decrease(this) class="product_quantity">−</button>
                                            <div id=<%="quantity_" + id%> class="product_quantity"><%=product_details.get(i).get(4)%></div>
                                            <button type="button" id="plus_btn" onclick=increase(this) class="product_quantity">+</button>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="line"></div>
                        </div> 
                        <% } else {%>        
                        <div id=<%=id%> class="product_detail">
                            <div class="product_name">
                                <input type="checkbox" class="product_check_box" onclick="add_to_cart(this)">
                                <h3 id=<%="name_" + id%> class="product_name_2"><%=product_details.get(i).get(7)%></h3>
                                <h3 class="product_type"><%=product_details.get(i).get(1)%></h3>
                            </div>

                            <div id=<%="product_info_" + id%> class="product_info">
                                <image src=<%=imageUrl%> class="product_image"></image>
                                <div class="product_description">
                                    <p><%=product_details.get(i).get(2)%> </p>
                                    <div id=<%="size_" + id%> class="product_size">Size : <%=product_details.get(i).get(3)%></div>
                                    <div class="product_price_and_update">
                                        <div id=<%="price_" + id%> class="product_price"><%=formatter.format(Double.parseDouble(product_details.get(i).get(5)))%> VND</div>
                                        <div class="product_update">
                                            <i id=<%="delete_" + id%> style="cursor:pointer;" class="fa-solid fa-trash-can"></i>
                                            <button type="button" id="minus_btn" onclick=decrease(this) class="product_quantity">−</button>
                                            <div id=<%="quantity_" + id%> class="product_quantity"><%=product_details.get(i).get(4)%></div>
                                            <button type="button" id="plus_btn" onclick=increase(this) class="product_quantity">+</button>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="line"></div>
                        </div> 
                        <% } %>
                        <% }
                            session.removeAttribute("action");
                            session.removeAttribute("cartList");%> 
                        <% } %>             
                        <% }%>

                    </div>
                </div>

                <div class="order_summmary">
                    <h3>Order Summary</h3>
                    <div class="order_info">

                    </div>

                    <div class="line"></div>

                    <div class="delivery">
                        <h3>Delivery</h3>
                        <div class="no_delivery_info">NO INFORMATION</div>
                        <div class="has_delivery_info">
                            <div class="delivery_info" id="delivery_info_phone"></div>
                            <div class="delivery_info" id="delivery_info_address"></div>
                        </div>
                        <button style="margin-top: 10px;" type="submit" id="delivery_info_btn">CHOOSE</button>
                    </div>

                    <div class="line"></div>
                    <div class="order_amount">
                        <h3>Amount</h3>
                        <div class="order_amount_total_price" onchange="disable(this)">0</div>
                    </div>

                    <%
                        if (coupon_info.size() == 0) {
                    %>
                    <!--                    <div class="coupon_code">
                                            <h3>Coupon Code</h3>
                                            <div class="coupon_code_value">0</div>
                                        </div>
                                        <div class="order_discount">
                                            <h3>Discount Value </h3>
                                            <div class="order_discount_value">0</div>
                                        </div>-->
                    <div class="shipping_fee">
                        <h3>Shipping</h3>
                        <div class="shipping_fee_value">0</div>
                    </div>
                    <div class="line"></div>
                    <div class="order_total">
                        <h3>Order total</h3>
                        <div class="order_total_price">0</div>
                    </div>
                    <% } %>

                    <%
                        if (coupon_info.size() != 0 && is_used_coupon == 0) {

                            String couponDateStr = coupon_info.get(2); // Assuming date is stored at index 2

                            // Parse the coupon date string to a Date object
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // Adjust the format as per your data
                            Date couponDate = sdf.parse(couponDateStr);

                            // Get today's date
                            Date today = new Date();

                            // Create a Calendar instance for today's date
                            Calendar calendar = Calendar.getInstance();
                            calendar.setTime(today);

                            // Add 1 day to today's date
                            calendar.add(Calendar.DAY_OF_MONTH, 1);
                            Date tomorrow = calendar.getTime();

                            // Compare tomorrow's date with the coupon date
                            boolean isTomorrowOneDayAfterCouponDate = tomorrow.after(couponDate);
                            if (isTomorrowOneDayAfterCouponDate == true) {

                    %>
                    <!--                    <div class="coupon_code">
                                            <h3>Coupon Code</h3>
                                            <div class="coupon_code_value"><%=coupon_info.get(1)%></div>
                                        </div>
                                        <div class="order_discount">
                                            <h3>Discount Value </h3>
                                            <div class="order_discount_value"><%=Float.parseFloat(coupon_info.get(3)) * 100%> %</div>
                                        </div>-->
                    <div class="shipping_fee">
                        <h3>Shipping</h3>
                        <div class="shipping_fee_value">0</div>
                    </div>
                    <div class="line"></div>
                    <div class="order_total">
                        <h3>Order total</h3>
                        <div class="order_total_price"></div>
                    </div>
                    <% }%>
                    <% }%>

                    <%
                        if (coupon_info.size() != 0 && is_used_coupon == 1) {


                    %>
                    <!--                    <div class="coupon_code">
                                            <h3>Coupon Code</h3>
                                            <div class="coupon_code_value">Invalid. Try another</div>
                                        </div>
                                        <div class="order_discount">
                                            <h3>Discount Value </h3>
                                            <div class="order_discount_value">0</div>
                                        </div>-->
                    <div class="shipping_fee">
                        <h3>Shipping</h3>
                        <div class="shipping_fee_value">0</div>
                    </div>
                    <div class="line"></div>
                    <div class="order_total">
                        <h3>Order total</h3>
                        <div class="order_total_price"></div>
                    </div>
                    <% }%>




                    <!--                    <div class="coupon_code">
                                            <h3>COUPON CODE</h3>
                                            <div class="coupon_code_value">0</div>
                                        </div>
                                        <div class="order_discount">
                                            <h3>DISCOUNT VALUE</h3>
                                            <div class="order_discount_value">0</div>
                                        </div>
                                        <div class="line"></div>-->



                    <div class="line"></div>

                    <!--                    <div style="visibility: hidden;"class="coupon">
                                            <img id="coupon_image"src="./assests/voucher.png" alt="">
                                            <form id="coupon_form" method="post">
                                                <input style="padding-top: 10px" type="text" id="coupon_input" placeholder="Add coupon code here" name="inputField">
                                                <button type="submit"></button>
                                            </form>
                    
                                        </div>-->


                    <button id="buy_btn" disabled>Buy</button>

                </div>

            </div>
        </div>


        <!-- modal -->

        <div class="modal">
            <div class="main_modal">
                <div class="input_line">
                    <div class="phone_input input-container">
                        <input type="number" id="phone_input_box" required>
                        <label for="phone_input_box">Phone</label>
                        <!--                        <span style="width:100%; height: 50px; display:none" id="errorMessage"></span>-->
                    </div>
                    <!-- 
                                    <div class="name_input input-container">
                                        <input id="name_input_box" type="text">
                                        <label for="name_input_box">Name</label>
                                    </div> -->
                </div>
                <!-- <div class="input_line">
                    <div class="shipping_company_input input-container">
                        <select name="shipping_company" id="shipping_company">
                            <option value="volvo">Volvo</option>
                            <option value="saab">Saab</option>
                            <option value="mercedes">Mercedes</option>
                            <option value="audi">Audi</option>
                        </select>
                        <label for="shipping_company">Shipping company</label>
                    </div>
    
                    <div class="email_input input-container">
                        <input id="mail_input_box" type="text">
                        <label for="mail_input_box">Email</label>
                    </div>
                </div> -->






                <div class="input_line">
                    <div class="address_input input-container">
                        <input id="address_input_box" type="text" required>
                        <label for="address_input_box">Address</label>
                    </div>
                </div>
                <div class="input_line">
                    <div class="province_input input-container">
                        <label for="selectProvince">Province/City</label>
                        <select name="province_input_box" id="province_input_box" onchange="populateCities(this.value)"></select>
                    </div>
                    <div class="city_input input-container">
                        <label for="selectCity">District</label>
                        <select name="city_input_box" id="city_input_box" onchange="populateDistricts(this.value)"></select>
                    </div>
                    <div class="district_input input-container">
                        <label for="selectDistrict">Sub-district</label>
                        <select name="district_input_box" id="district_input_box"></select>
                    </div>
                </div>
                <div class="input_line">

                    <button id="save_btn">SAVE</button>

                </div>
            </div>
        </div>

        <!-- Order Successfully -->
        <div class="order_successfully">
            <div class="main_order_successfully">
                <div class="order_successfully_logo">
                    <img src="<%= request.getContextPath()%>/JSP_JAVASCRIPT_CSS/img/success.png" alt="">
                </div>

                <p>THANK YOU FOR YOUR ORDER !<br>
                    WE WILL CONFIRM YOUR ORDER SHORTLY.</p>
            </div>
        </div>

    </body>

    <script src="<%= request.getContextPath()%>/JSP_JAVASCRIPT_CSS/cart/main.js"></script>
    <script src="<%= request.getContextPath()%>/JSP_JAVASCRIPT_CSS/cart/get_provinces_data.js"></script>
    <script src="<%= request.getContextPath()%>/JSP_JAVASCRIPT_CSS/cart/logout.js"></script>
     <script src="<%= request.getContextPath()%>/JSP_JAVASCRIPT_CSS/cart/change_tab.js"></script>
    <!--    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>-->

</html>