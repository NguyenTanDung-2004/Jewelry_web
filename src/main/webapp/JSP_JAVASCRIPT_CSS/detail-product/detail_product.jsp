<%@page import="java.lang.reflect.Array"%>
<%@page import="entry.Product"%>
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
    <title>Detail Product</title>
    <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/detail-product/detailproduct.css"/>
    <!-- Unicons -->
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/fontawesome.css">
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/brands.css">
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/solid.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
        />
</head>
	<%
    	ArrayList<ArrayList<Object>> all_data_product = (ArrayList<ArrayList<Object>>)request.getAttribute("all_data_product");
   		ArrayList<Integer> first_id_collections = (ArrayList<Integer>)request.getAttribute("first_id_collections");	
    	String img = (String)session.getAttribute("img"); 	
    	ArrayList<Product> related_products = (ArrayList<Product>)request.getAttribute("related_products");
    	ArrayList<String> size =  (ArrayList<String>)request.getAttribute("size");
    	ArrayList<ArrayList<String>> cartList = (ArrayList<ArrayList<String>>)request.getAttribute("cartList");
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
    public boolean check_discount(float discount){
    	int a = (int)(discount * 100);
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
                    <img style="max-height: 30px; max-width: 30px; min-height: 30px; min-width: 30px; object-fit: cover;" src="<%=img%>" alt="">
                    <div class="user_hover">
                        <div class="arrow"></div>
                        <div class="content">
                            <p>User Setting</p>
                            <p>Order history</p>
                            <p id="logout">Logout</p>
                        </div>
                    </div>
                </div>
                <i class="fa-solid fa-cart-shopping text_child" style="color: gray"></i>
            </div>
            <%} %>
        </header>

    <div class = "detail-product">
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


        <div class = "frame-parent">
          <div class = "frame-child1"> 
            <div class="title_search">
                    <p class="child">Products</p>
                    <i class="fa-solid fa-chevron-right child" id="icon_title_1"></i>
                    <p class="name1"></p>
                    <i class="fa-solid fa-chevron-right child" id="icon_title_1"></i>
                    <p class="name2"><%= ((Product)request.getAttribute("detail")).getName().toUpperCase() %></p>
             </div>
          </div>

          <div class = "frame-child2">
            <div class = "frame-child2-inner">
              <div class = "content-parent">
                <div class = "content-product">
                  <div class ="content-product-left-center">
                  <% 
                  float discount = ((Product) request.getAttribute("detail")).getDiscount();
                  if (check_discount(discount)){ %>
					<div class = "tagsale">
                      <button class = "rectangle-group">
                      <div class = "rectangle"></div>
                      <p class = "sale"><%out.println((int)(discount*100) + "%"); %></p>
                      </button>
                      <svg width="36" height="10">
                        <polygon points="36,0 18,10 0,0" fill="#F6E7D7" />
                      </svg>
                    </div>
                    <div class = "tagsale-res">
                      <button class = "rectangle-group-res">
                      <div class = "rectangle-res"></div>
                      <p class = "sale-res"><%out.println((int)(discount*100) + "%"); %></p>
                      </button>
                      <svg width="32" height="8">
                        <polygon points="32,0 16,8 0,0" fill="#F6E7D7" />
                      </svg>
                    </div>
					<% } %>
                     <!--Hinh anh san pham lon-->
                     <div class = "content-product-left" >
	                      <img id="MainImg" alt="" src="/Jewelry_web/img_product/<%= ((Product)request.getAttribute("detail")).getId() %>_1.png" />
	                 </div>
                    <!--Hinh anh san pham nho-->
                    <div class="outer-thumb ob cover">
                      <div class="thumbnail-image">
                        <div class="wrap">
                          <div class = "content-product-center"> 
                            <img class = "hinh1" src="/Jewelry_web/img_product/<%= ((Product)request.getAttribute("detail")).getId() %>_1.png" />
                            <img class = "hinh1" src="/Jewelry_web/img_product/<%= ((Product)request.getAttribute("detail")).getId() %>_2.png"/>
                            <img class = "hinh1" src="/Jewelry_web/img_product/<%= ((Product)request.getAttribute("detail")).getId() %>_3.png"/>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!--Hinh anh san pham nho 1-->
                    <div class="outer-thumb1 ob cover">
                      <div class="thumbnail-image1">
                        <div class="wrap1">
                          <div class = "content-product-center1"> 
                            <img class = "hinh1" src="/Jewelry_web/img_product/<%= ((Product)request.getAttribute("detail")).getId() %>_1.png" />
                            <img class = "hinh1" src="/Jewelry_web/img_product/<%= ((Product)request.getAttribute("detail")).getId() %>_2.png"/>
                            <img class = "hinh1" src="/Jewelry_web/img_product/<%= ((Product)request.getAttribute("detail")).getId() %>_3.png"/>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class ="content-product-right"> <!--Noi dung va gia tien san pham-->
                    <div class = "right1"> <!--name + status-->
                      <h1 class = "name"> <B><%= ((Product)request.getAttribute("detail")).getName() %></B> </h1>
                      <div class = "status">
                        <div class = "information">
                          <%= ((Product)request.getAttribute("detail")).getInfo() %>
                        </div>
                      </div>
                    </div>

                    <div class = "line-2"> <!--duong gach ngang-->
                      <hr class = "line2"/>
                    </div>

                    <div class = "right2"> <!--còn lại của phần right-->
                      <div class = "right2-part1"> <!--sao, luot danh gia-->
                        <div class = "stars">
                          <div class = "first-star">
                            <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                          </div>
                          <div class = "second-star">
                            <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                          </div>
                          <div class = "third-star">
                            <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                          </div>
                          <div class = "forth-star">
                            <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                          </div>
                          <div class = "fifth-star">
                            <i class="fa-solid fa-star" style="color: #b1b0aa;"></i>
                          </div>
                        </div>
                        <div class = "vote-reviewers"> <!--số lượt đánh giá-->
                          <p class = "numbervote">4 / 5</p>
                          <p class = "customers">(40 customers review)</p>
                        </div>
                      </div>

                      <div class = "right2-part2"> <!--money, buy now, add cart-->
                        <div class = "right2-part2-child1"> <!--money-->
                          <span class = "salevalue"><% 
						        // Lấy giá sản phẩm từ request attribute và chuyển đổi thành chuỗi
						        int sale = ((Product) request.getAttribute("detail")).getPrice();
                          		int sale_price = (int) Math.round(sale * (1-discount));
						        String saleString = String.valueOf(sale_price);
						        // Định dạng tiền tệ và hiển thị
						        out.println(formatMoneyVND(saleString) + " VNĐ"); 
						    %>
						   </span>
						   <%if (check_discount(discount)){ %>
						   <div class = "originalprice">
                            <span class = "originvalue"><% 
						        // Lấy giá sản phẩm từ request attribute và chuyển đổi thành chuỗi
						        int price = ((Product) request.getAttribute("detail")).getPrice();
						        String priceString = String.valueOf(price);
						        // Định dạng tiền tệ và hiển thị
						        out.println(formatMoneyVND(priceString) + " VNĐ"); 
						    %>
						    </span>
                          </div>
                          <%} %>
                        </div>
                        <div class = "right2-part2-child2"> <!--buy now, add cart-->
                          <div class = "child2-left"> <!--quantity, buy now-->
                            <div class="quantity-control">
                              <span>Quantity</span>
                              <div class="input-container">
                                <button class="decrease">-</button>
                                <input class="numbers" type="text" value="1">
                                <button class="increase">+</button>
                              </div>
                            </div>
                            <button class = "buy" id = "buy_now">BUY NOW</button>
                          </div>
                          <div class = "child2-right"> <!--size, add card-->
                            <div class = "sizes">
                              <span class = "size">Size</span>
                              <div class="size-selection">
                                <div class="main-size">
                                  <input class="size-numbers" type="text" >
                                  <button class="angledown"> <i class="fa-solid fa-angle-down"></i></button>
                                  <button class="angleup"><i class="fa-solid fa-angle-up"></i></button>
                                </div>
                                <ul class="drop-down">
                                <%
                                String unit = size.get(4);
                                for(int i = 0 ; i < size.size()-1; i++){
                                %>
                                  <li><p class="value-size"><%= size.get(i) %> <%= unit %></p></li>
                                <%} %>
                                </ul>
                              </div>
                            </div>
                            <button class = "add-to-cart" id="btn_add">ADD TO CART
                              <i class="fa-solid fa-cart-shopping"></i>
                            </button>
                          </div>
                        </div>
                      </div>
                      <div class = "right2-part3"> <!--ship, payment-->
                        <div class = "kindaship" > <p class = "ship">FreeShip</p> </div>
                        <div class = "dash1"> <i class="fa-solid fa-minus"></i> </div>
                        <div class = "kindaguarantee"> <p class = "guarantee">1 warrant year</p> </div>
                        <div class = "dash1"> <i class="fa-solid fa-minus"></i> </div>
                        <div class = "kindapayment"> <p class = "payment">Secure Payment</p> </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class = "content-line">
                  <hr class = "line4"/>
                </div>

                <div class = "content-related-products">
                  <div class="titlename">
                    <h1 class = "title-name">RELATED PRODUCTS</h1>
                  </div>
                  <div class = "img-relation">
                    <div class="swiper-container">
                      <div class="swipe mySwiper">
                          <div class="swiper-wrapper">
                              <%
                           		for (int i = 0; i < related_products.size(); i++){      
                           			String productId = String.valueOf(related_products.get(i).getId());
                                    String productName = related_products.get(i).getName();
                                    String friendlyUrl = toFriendlyUrl(productName) + "-" + productId + ".html";
                           	%>
                           	<div class="swiper-slide">
                                  <div class="card">
                                      <a href="<%= request.getContextPath() %>/product/<%= friendlyUrl %>" class="links">
                                      <div class = "rectangle-img1">
                                          <div class="imgleft">
                                          <%
                                          float discount1 = related_products.get(i).getDiscount();
                                          if (check_discount(discount1)){ %>
                                              <div class = "tagsale1">
                                                  <button class = "rectangleicon1">
                                                    <div class = "rectangle1"></div>
                                                    <p class = "sale1">
                                                    <%
                                                    out.println((int)(discount1*100) + "%");
                                                    %></p>
                                                  </button>
                                                  <svg width="32" height="7">
                                                    <polygon points="32,0 16,7 0,0" fill="#F6E7D7" />
                                                  </svg>
                                              </div>
                                              <div class = "tagsale1-res">
                                                  <button class = "rectangleicon1-res">
                                                    <div class = "rectangle1-res"></div>
                                                    <p class = "sale1-res"><%
                                                    out.println((int)(discount1*100) + "%");
                                                    %></p>
                                                  </button>
                                                  <svg width="28" height="5">
                                                    <polygon points="28,0 14,5 0,0" fill="#F6E7D7" />
                                                  </svg>
                                              </div>
                                              <%} %>
                                              <img class = "left" src="<%="/Jewelry_web/img_product/" + related_products.get(i).getId() + "_1.png" %>">
                                          </div>
                                          <div class = "icon1">
                                              <div class = "icon-cart1" id="icon-cart1">
                                                <div class="circle"></div>
                                                <i class="fa-solid fa-cart-plus"></i>
                                              </div>
                                              <div class = "icon-plus1" id="icon-plus2">
                                                <div class="circle"></div>
                                                <i class="fa-solid fa-plus"></i>
                                              </div>
                                          </div>
                                      </div>
                                      <div class = "rectangle-info1">
                                          <p class = "info-name1"><%=related_products.get(i).getName() %></p>
                                          <div class = "info-money1">
                                              <span class = "salevalue1"><% 
											        // Lấy giá sản phẩm từ request attribute và chuyển đổi thành chuỗi
											        int s = related_products.get(i).getPrice();
					                          		int p = (int) Math.round(s * (1-discount1));
											        String pString = String.valueOf(p);
											        // Định dạng tiền tệ và hiển thị
											        out.println(formatMoneyVND(pString) + " VNĐ"); 
											    %>
											    </span>
											  <%if (check_discount(discount1)){ %>
                                              <div class = "originalprice1">
                                                  <span class = "originvalue1">
                                                  <%
                                                  out.println(formatMoneyVND(String.valueOf(s)) + " VNĐ"); 
                                                  %>
                                                  </span>
                                              </div>
                                              <%} %>
                                          </div>
                                      </div>
                                      </a>
                                  </div>
                              </div>
                           	<%} %>
                          </div>
                      </div>
                      <!-- If we need pagination -->
                      <div class="swiper-pagination"></div>
          
                      <!-- If we need navigation buttons -->
                      <div class="swiper-button-prev"></div>
                      <div class="swiper-button-next"></div>
          
                      <!-- If we need scrollbar -->
                      <div class="swiper-scrollbar"></div>
                  </div>
                  </div>
                </div>
              </div>
            </div>

            <div class = "frame-child2-scroll">
              
            </div>
          </div>
        </div>
    </div>
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
                  <div class="bottom3">
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
              <div class="subcribe main_child">
                  <div class="top3">Subcribe Newletter</div>
                  <div class="bottom3">
                      <input type="email" placeholder="Your Email:">
                      <i class="fa-solid fa-arrow-right"></i>
                  </div>
              </div>
          </div>
          <div class="line_copyright">
              <div class="line"></div>
              <p>@copyright</p>
          </div>
      </div>                                                                 
    </footer>
    <script type="text/javascript">
    	var userID = <%=request.getSession().getAttribute("id_user")%>
    </script>
    <script type="text/javascript">
    	var all_data_product = <%= convert_2_way_ArrayList_to_Json(all_data_product)%>
    </script>
    <script type="text/javascript">
	    document.addEventListener('DOMContentLoaded', function() {
	        const name1 = sessionStorage.getItem('breadcrumbs');
	        document.querySelector('.name1').textContent = name1;
	        if (name1) {
	            document.querySelector('.name1').textContent = name1;
	            sessionStorage.removeItem('breadcrumbs');
	        } else {
	            document.querySelector('.name1').style.display = 'none';
	            document.getElementById('icon_title_1').style.display = 'none'; 
	            sessionStorage.removeItem('breadcrumbs');
	        }
	    });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src = "/Jewelry_web/JSP_JAVASCRIPT_CSS/detail-product/detailproduct.js"></script>
    <script src = "/Jewelry_web/JSP_JAVASCRIPT_CSS/detail-product/search.js"></script>
    <script src = "/Jewelry_web/JSP_JAVASCRIPT_CSS/detail-product/collections.js"></script>
    <script src = "/Jewelry_web/JSP_JAVASCRIPT_CSS/detail-product/event_for_category.js"></script>
    <script src = "/Jewelry_web/JSP_JAVASCRIPT_CSS/detail-product/change_tab.js"></script>
    <script src = "/Jewelry_web/JSP_JAVASCRIPT_CSS/detail-product/event_for_buy.js"></script>
  </body>
</html>
    	