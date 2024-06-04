<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONString"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Home - Expense Management</title>
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/product/css.css"/>
        <!-- Unicons -->
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/fontawesome.css">
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/brands.css">
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/solid.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    </head>
    <%
    	ArrayList<ArrayList<Object>> all_data_product = (ArrayList<ArrayList<Object>>)request.getAttribute("all_data_product");
   		ArrayList<Integer> first_id_collections = (ArrayList<Integer>)request.getAttribute("first_id_collections");
    	ArrayList<Integer> rings = (ArrayList<Integer>)request.getAttribute("rings");
    	ArrayList<Integer> bracelets = (ArrayList<Integer>)request.getAttribute("bracelets");
    	ArrayList<Integer> necklaces = (ArrayList<Integer>)request.getAttribute("necklaces");
    	ArrayList<Integer> earrings = (ArrayList<Integer>)request.getAttribute("earrings");
    	ArrayList<Integer> spring = (ArrayList<Integer>)request.getAttribute("spring");
    	ArrayList<Integer> summer = (ArrayList<Integer>)request.getAttribute("summer");
    	ArrayList<Integer> autumn = (ArrayList<Integer>)request.getAttribute("autumn");
    	ArrayList<Integer> winter = (ArrayList<Integer>)request.getAttribute("winter");
    	ArrayList<Integer> love = (ArrayList<Integer>)request.getAttribute("love"); 	
    	String action = (String)session.getAttribute("action_home_to_product");
    	String img = (String)session.getAttribute("img"); 	
    %>
    <%! 
    public String formatMoneyVND(String numberString) {
        if (numberString == null || numberString.isEmpty()) {
            return "0"; // Default to 0 if the string is empty or null
        }

        // Reverse iteration to add dots every three characters
        StringBuilder formatted = new StringBuilder();
        int count = 0;

        for (int i = numberString.length() - 1; i >= 0; i--) {
            formatted.append(numberString.charAt(i));
            count++;
            if (count == 3 && i != 0) { // Add dot if count is 3 and it's not the last character
                formatted.append('.');
                count = 0;
            }
        }

        // Reverse back to the correct order
        return formatted.reverse().toString();
    }
    public boolean check_discount(ArrayList<ArrayList<Object>> all_data_product, int index){
    	int a = (int)((Float)all_data_product.get(index).get(4) * 100);
    	if (a == 0){
    		return false;
    	}
    	return true;
    }
    public String convert_2_way_ArrayList_to_Json(ArrayList<ArrayList<Object>> all_data_product){
    	JSONArray json = new JSONArray();
        for (ArrayList<Object> innerList : all_data_product) {
            JSONArray jsonInnerList = new JSONArray(innerList);
            json.put(jsonInnerList);
        }
    	return json.toString();
    }
    public String convert_1_way_ArrayList_to_Json(ArrayList<Integer> list){
    	JSONArray json = new JSONArray(list);
    	return json.toString();
    }
    public String convert_1_String_to_String(String s){
    	Gson gson = new Gson();
    	return gson.toJson(s);
    }
    public String toFriendlyUrl(String name) {
        return name.toLowerCase().replaceAll("[^a-z0-9]+", "-").replaceAll("-+$", "");
    }
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
                    <img src="<%=img%>" alt="">
                    <div class="user_hover">
                        <div class="arrow"></div>
                        <div class="content">
                            <p id="user_setting">User Setting</p>
                            <p id="order_history">Order history</p>
                            <p id="logout">Logout</p>
                        </div>
                    </div>
                </div>
            	<a class="link_to_cart" href="http://localhost:8080/Jewelry_web/cart">
                    <i class="fa-solid fa-cart-shopping text_child" style="color: gray"></i>
                </a>
            </div>
            <%} %>
        </header>
        <main>
            <div class="search">

                <input id="search" type="text">
                <div class="line search_child"></div>
                <i class="fa-solid fa-magnifying-glass search_child"></i>
                <div class="result">
                    <i id="close_result" class="fa-solid fa-xmark"></i>
                    <div class="result_scroll">
              
                    </div>
                </div>
            </div>
            <div class="filter_ngang">
                <p id="collection_tab_button">COLLECTIONS</p>
                <p id="bracelets_tab_button">BRACELETS</p>
                <p id="rings_tab_button">RINGS</p>
                <p id="necklaces_tab_button">NECKLACES</p>
                <p id="earrings_tab_button">EARRINGS</p>
                <p id="sales_tab_button">SALES</p>
                <p id="all_tab_button">All</p>
            </div>
            <div class="line1">
                <div class="line1_child"></div>
            </div>
            <div class="main_child">
                <div class="title_search">
                    <p class="child">Products</p>
                    <i class="fa-solid fa-chevron-right child"></i>
                    <p class="name"></p>
                </div>
                <div class="line2">
                    <div class="line2_child"></div>
                </div>
                <div class="content">
                    <div class="left">
                        <div class="sort_by left_child">
                            <p class="title">SORT BY</p>
                            <div class="high_to_low left_child_child">
                                <input id="max_to_min" type="radio" id="checkbox" name="checkbox2" value="checkbox" class="left1">
                                <p>PRICE HIGH TO LOW</p>
                            </div>
                            <div class="low_to_high left_child_child">
                                <input id="min_to_max" type="radio" id="checkbox" name="checkbox2" value="checkbox" class="left1">
                                <p>PRICE LOW TO HIGH</p>
                            </div>
                        </div>
                        <div class="filter_by left_child">
                            <p class="title">FILTER BY</p>
                            <div class="new_arrival left_child_child">
                                <input id="checkbox_new"  type="radio" id="checkbox" name="checkbox" value="checkbox" class="left1">
                                <span class="checkmark"></span>
                                <p>NEW ARRIVALS</p>
                            </div>
                        </div>
                        <div class="categories left_child">
                            <p class="title">CATEGORIES</p>
                            <div class="bracelet left_child_child">
                                <input id="checkbox_bracelets"  type="radio" id="checkbox" name="checkbox1" value="checkbox" class="left1">
                                <span class="checkmark"></span>
                                <p>BRACELETS</p>
                            </div>
                            <div class="ring left_child_child">
                                <input id="checkbox_rings" type="radio" id="checkbox" name="checkbox1" value="checkbox" class="left1">
                                <span class="checkmark"></span>
                                <p>RINGS</p>
                            </div>
                            <div class="necklace left_child_child">
                                <input id="checkbox_necklaces" type="radio" id="checkbox" name="checkbox1" value="checkbox" class="left1">
                                <span class="checkmark"></span>
                                <p>NECKLACES</p>
                            </div>
                            <div class="earring left_child_child">
                                <input id="checkbox_earrings" type="radio" id="checkbox" name="checkbox1" value="checkbox" class="left1">
                                <span class="checkmark"></span>
                                <p>EARRINGS</p>
                            </div>
                        </div>
                    </div>
                    <div class="right">
                        <p id="so_luong_product"><%=all_data_product.size() + " products"%></p>
                        <div class="sanpham_cha">
                           	<%
                           		for (int i = 0; i < all_data_product.size(); i++){      
                           			String productId = all_data_product.get(i).get(0).toString();
                                    String productName = all_data_product.get(i).get(1).toString();
                                    String friendlyUrl = toFriendlyUrl(productName) + "-" + productId + ".html";
                           	%>
                           	<div class="sanpham">
							    <a href="<%= request.getContextPath() %>/product/<%= friendlyUrl %>" class="links">
							        <img src="<%="/Jewelry_web/img_product/" + all_data_product.get(i).get(0) + "_1.png" %>" style="height: 200px;" alt="">
							        <div class="content1">
							            <p class="name1"><%=all_data_product.get(i).get(1) %></p>
							            <p class="money"><%= formatMoneyVND(all_data_product.get(i).get(2) + "") + " VND" %></p>
							        </div>
							        <% if (check_discount(all_data_product, i)){ %>
							            <div class="sale"><%="-" + ((int)((Float)all_data_product.get(i).get(4) * 100)) + "%"%></div>
							        <% } %>
							    </a>
							</div><%}%>
                        </div>
                        <div id="load_more" class="loadmore">
                              <p>Showing 6 of <%=all_data_product.size()%> items</p>
                              <button>LOAD MORE</button>  
                        </div>
                    </div>
            </div>
            </div>
        </main>
        <!--phần dưới đây dùng để hiển thị collection-->
        <div class="collections">
            <div class="products">
                <div id="spring_collections" class="product1 product_child">
                    <img src="<%="/Jewelry_web/img_product/" + first_id_collections.get(0) + "_1.png" %>" style="height: 150px;" alt="">
                    <p>SPRING</p>
                </div>
                <div id="summer_collections" class="product2 product_child">
                    <img src="<%="/Jewelry_web/img_product/" + first_id_collections.get(1) + "_1.png" %>" style="height: 150px;" alt="">
                    <p>SUMMER</p>
                </div>
                <div id="autumn_collections" class="product3 product_child">
                    <img src="<%="/Jewelry_web/img_product/" + first_id_collections.get(2) + "_1.png" %>" style="height: 150px;" alt="">
                    <p>AUTUMN</p>
                </div>
                <div id="winter_collections" class="product4 product_child">
                    <img src="<%="/Jewelry_web/img_product/" + first_id_collections.get(3) + "_1.png" %>" style="height: 150px;" alt="">
                    <p>WINTER</p>
                </div>
                <div id="love_collections" class="product5 product_child">
                    <img src="<%="/Jewelry_web/img_product/" + first_id_collections.get(4) + "_1.png" %>" style="height: 150px;" alt="">
                    <p>LOVE</p>
                </div>
            </div>
            <div class="line">
                <div class="line_child"></div>
            </div>
            <div class="text">
                <p class="top">CHOOSE YOUR UNIQUE STYLE</p>
                <p class="bottom">AND EXPRESS YOURSELF</p>
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
    <!--main-->
    <script type="text/javascript">
    	var all_data_product = <%= convert_2_way_ArrayList_to_Json(all_data_product)%>
    	var spring = <%= convert_1_way_ArrayList_to_Json(spring)%>
    	var summer = <%= convert_1_way_ArrayList_to_Json(summer)%>
    	var autumn = <%= convert_1_way_ArrayList_to_Json(autumn)%>
    	var winter = <%= convert_1_way_ArrayList_to_Json(winter)%>
    	var love = <%= convert_1_way_ArrayList_to_Json(love)%>
    	var rings = <%= convert_1_way_ArrayList_to_Json(rings)%>
    	var bracelets = <%= convert_1_way_ArrayList_to_Json(bracelets)%>
    	var necklaces = <%= convert_1_way_ArrayList_to_Json(necklaces)%>
    	var earrings = <%= convert_1_way_ArrayList_to_Json(earrings)%>
    	var action = <%=convert_1_String_to_String(action)%>
    	console.log(action);
    </script>
    <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/product/product.js"></script>
    <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/product/service_for_event_for_tab.js"></script>
    <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/product/event_for_tab.js"></script>
    <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/product/sort.js"></script>
    <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/product/collections.js"></script>
    <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/product/search.js"></script>
    <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/product/change_tab.js"></script>
    <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/product/load_items.js"></script>
    <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/product/handle_parameter_from_home.js"></script>
    <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/product/event_filter_from_detail.js"></script>
    </body>
</html>