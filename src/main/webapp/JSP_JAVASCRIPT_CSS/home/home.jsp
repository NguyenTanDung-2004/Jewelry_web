<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="utf-8"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Home - Expense Management</title>
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/home/home.css"/>
        <!-- Unicons -->
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/fontawesome.css">
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/brands.css">
        <link rel="stylesheet" href="/Jewelry_web/JSP_JAVASCRIPT_CSS/fontawesome-free-6.5.1-web/css/solid.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    </head>
    <% 
    	ArrayList<Integer> first_id_product = (ArrayList<Integer>)request.getAttribute("first_id_product"); 
    	ArrayList<Integer> new_arrivals = (ArrayList<Integer>)request.getAttribute("new_arrivals");
    	ArrayList<String> tradition = (ArrayList<String>)request.getAttribute("tradition");
    	String[] words_tradtional = tradition.get(2).split(" ");
    	ArrayList<Float> list_price = (ArrayList<Float>)request.getAttribute("list_price"); 
    %>
    <%!
	    public String convert_1_way_ArrayList_to_Json(ArrayList<String> list){
	    	JSONArray json = new JSONArray(list);
	    	return json.toString();
	    }
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
    %>
    <body>
        <!--trang tri-->
        <div id="div1" class="1"></div>
        <i id="bar" class="fa-solid fa-bars"></i>
        <div class="logo1">
            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/image.png" alt="" style="width: 100px;">
            <p>You & Jewelry</p>
        </div>
    <!--header-->
        <header>
            <div class="content">
                <div class="left text">
                    <p class="text_child">Home</p>
                    <p id="product_tab" class="text_child">Product's</p>
                    <p id="about_tab" class="text_child">About</p>
                </div>
                <div class="right text">
                   <div class="right_child">
                        <p class="text_child" id="p_login_header">Login</p>
                        <i class="fa-solid fa-cart-shopping text_child"></i>
                   </div>
                </div>
            </div>
            <i id="close" class="fa-solid fa-xmark"></i>
        </header>
    <!--main1-->
        <div class="main1">
            <div class="top">
                <div class="left">
                    <div class="top">
                        <p>Embrace the</p>
                        <div class="">
                            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/main1/nhanvang.png" style="height: 70px;" alt="">
                            <p>Elegance</p>
                        </div>
                    </div>
                    <div class="bottom1">
                        <p>Explore the Latest Fashion Trends and Elevate Your Style with Timeless Elegance.</p>
                    </div>
                    <div id="see_all_black" class="button">
                        <p>See All</p>
                        <i class="fa-solid fa-arrow-right"></i>
                    </div>
                </div>
                <div class="img_center img">
                    <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/main1/img_center.png" alt="">
                </div>
                <div class="img_right img">
                    <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/main1/img_right.png" style="height: 250px; border-top-left-radius: 130px; border-top-right-radius: 130px;" alt="">
                </div>
            </div>
            <div class="bottom">
                <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/main1/image.png" alt="" style="width: 200px; height: 200px;">
                <div class="data">
                    <div class="first data1">
                        <p class="top">100</p>
                        <p class="bottom2">All Over World</p>
                    </div>
                    <div class="line"></div>
                    <div class="second data1">
                        <p class="top">100</p>
                        <p class="bottom2">Product Available</p>
                    </div>
                    <div class="line"></div>
                    <div class="third data1">
                        <p class="top">1K+</p>
                        <p class="bottom2">Product Review</p>
                    </div>
                </div>
                <div class="arrow">
                    <i class="fa-solid fa-arrow-down"></i>
                </div>
            </div>
        </div>
    <!--main2-->
        <div class="main2">
            <div class="top">
                <p>Discover Jewelry</p>
                <p>Collection</p>
            </div>
            <div class="main">
                <div class="img1 img" style="background-image: url('<%= "/Jewelry_web/img_product/" + first_id_product.get(0) + "_1.png" %>');right: calc(50vw - 300px);
    background-size: cover;
    border-top-left-radius: 200px;
    background-position: center center;
    border-top-right-radius: 200px; background-repeat: no-repeat">
                    <div class="button button_img1">
                        <div class="text">
                            <p>Inspiration with</p>
                            <p>necklaces</p>
                        </div>
                        <div id="see_all_necklaces" class="button1">
                            <p>See All</p>
                            <i class="fa-solid fa-arrow-right"></i>
                        </div>
                    </div>
                </div>
                <div class="img2 img" style="background-image: url('<%= "/Jewelry_web/img_product/" + first_id_product.get(1) + "_1.png" %>');top: 400px;
    left: calc(50vw - 300px);
    display: flex;
    align-items: center;
    background-position: center center;
    justify-content: center; background-size: cover; background-repeat: no-repeat;
    background-size: contain;
   ">

                    <div class="button button_img2">
                        <div class="text">
                            <p>Ring for joyful</p>
                            <p>Connection</p>
                        </div>
                        <div id="see_all_rings" class="button1">
                            <p>See All</p>
                            <i class="fa-solid fa-arrow-right"></i>
                        </div>
                    </div>
                </div>
                <div class="img3 img" style="background-image: url('<%= "/Jewelry_web/img_product/" + first_id_product.get(2) + "_1.png" %>'">
                    <div class="button button_img3">
                        <div class="text">
                            <p>Discover Amazing</p>
                            <p>Earrings</p>
                        </div>
                        <div id="see_all_earrings" class="button1">
                            <p>See All</p>
                            <i class="fa-solid fa-arrow-right"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--main3-->
        <div class="main3">
            <div class="top">
                <p class="top">New Arrival</p>
                <p class="bottom">Anyone can get dressed up and glamorous, but it is how people dress in their days off.</p>
            </div>
            <div class="img">
                <div class="img1 img_child">
                    <img src="<%= "/Jewelry_web/img_product/" + new_arrivals.get(0) + "_1.png" %>"  alt="">
                    <div class="detail">
                        <div class="left">
                            <p class="name">Ring</p>
                            <p class="money"><%=formatMoneyVND((int)(float)list_price.get(0) + "") %> VND</p>
                        </div>
                        <i class="fa-solid fa-cart-shopping"></i>
                    </div>
                </div>
                <div class="img2 img_child">
                    <img src="<%= "/Jewelry_web/img_product/" + new_arrivals.get(1) + "_1.png" %>"  alt="">
                    <div class="detail">
                        <div class="left">
                            <p class="name">Bracelet</p>
                            <p class="money"><%=formatMoneyVND((int)(float)list_price.get(1) + "") %> VND</p>
                        </div>
                        <i class="fa-solid fa-cart-shopping"></i>
                    </div>
                </div>
                <div class="img3 img_child">
                   <img src="<%= "/Jewelry_web/img_product/" + new_arrivals.get(2) + "_1.png" %>"  alt="">
                    <div class="detail">
                        <div class="left">
                            <p class="name">Necklace</p>
                            <p class="money"><%=formatMoneyVND((int)(float)list_price.get(2) + "") %> VND</p>
                        </div>
                        <i class="fa-solid fa-cart-shopping"></i>
                    </div>
                </div>
                <div class="img4 img_child">
                   <img src="<%= "/Jewelry_web/img_product/" + new_arrivals.get(3) + "_1.png" %>"  alt="">
                    <div class="detail">
                        <div class="left">
                            <p class="name">Earring</p>
                            <p class="money"><%=formatMoneyVND((int)(float)list_price.get(3) + "") %> VND</p>
                        </div>
                        <i class="fa-solid fa-cart-shopping"></i>
                    </div>
                </div>
            </div>
            <div class="see_all">
                <p id="see_all_new">See All</p>
            </div>
        </div>
        <!--main4-->
        <div class="main4">
            <div class="top">
                <div class="left">
                    <img class="large" src="<%= "/Jewelry_web/img_traditional/" + tradition.get(0) + "_1.png" %>" style="height: 520px; width: 375px; scale: 0.8;" alt="">
                    <img class="small" src="<%= "/Jewelry_web/img_traditional/" + tradition.get(0) + "_2.png" %>" style="height: 213px; width: 203px; scale: 0.8;" alt="">
                </div>
                <div class="right">
                    <div class="top1">
                        <p class="top2"><%=words_tradtional[0] + " " + words_tradtional[1] + " "%></p>
                        <p class="bottom2"><%for (int i = 2; i < words_tradtional.length; i++){
                        	%>
                        	<%=words_tradtional[i] + " "%>
                        	<%} %>
                        	</p>
                    
                    </div>
                    <div class="bottom">
                        <p><%=tradition.get(3) %></p>
                    </div>
                    <div id="see_all_black1" class="button">
                        <p>See All</p>
                        <i class="fa-solid fa-arrow-right"></i>
                    </div>
                </div>
            </div>
            <div class="bottom1">
                <div class="img">
                    <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/main4/image11.png" alt="" class="child">
                    <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/main4/image12.png" alt="" class="child">
                    <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/main4/image13.png" alt="" class="child">
                    <div id="facebook" class="facebook child">
                        <i class="fa-brands fa-facebook-f"></i>
                        <p>Join our Facebook</p>
                        <i class="fa-solid fa-arrow-right"></i>
                    </div>
                </div>
                <div class="footer">
                    <div class="main">
                        <div class="location main_child">
                            <div class="top3">Location</div>
                            <div class="bottom3">
                                <i class="fa-solid fa-location-dot"></i>
                                <p id="location1">UIT - University Information Of Technology.</p>
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
            </div>
        </div>
        <!--blur-->
        <div class="blur" style="display: none;"></div>
        <!--login-->
        <div class="login">
            <div class="logo login_child">
                <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/image.png" style="height: 150px;" alt="">
            </div>
            <div class="content">
                <div class="text1 login_child">
                    <p class="p1">Login</p>
                    <p class="p2">To get full gemstones unlimited searches, please login or register.</p>
                </div>
                <div id="continue_google" class="google login_child">
                    <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/google.png" style="height: 15px;" alt="">
                    <p>Continue with Google.</p>
                </div>
                <div class="or login_child">
                    <div class="left line"></div>
                    <p>OR</p>
                    <div class="right line"></div>
                </div>
                <div class="input login_child">
                    <div class="email input1">
                        <p class="title_input">Email</p>
                        <input id="login_email" type="email" placeholder="Your Email:">
                    </div>
                    <div class="password">
                        <div class="password1 input1">
                            <p class="title_input">Password</p>
                            <input id="login_pass" class="input_eye" type="password" placeholder="Your Password:">
                            <i id="login_eye" class="fa-solid fa-eye-slash"></i>
                        </div>
                        <p id="p_display_forgot" class="forgot_password">Forgot Password?</p>
                    </div>
                </div>
                <button id="button_login_in_login" class="login1 login_child">Login</button>
                <div class="text2">
                    <p class="p1">Don't have and Account yet?</p>
                    <p id="p_display_register" class="p2">Register</p>
                </div>
            </div>
            <i id="close_login" class="fa-solid fa-xmark"></i>
        </div>
        <!--Register-->
        <div class="register">
            <div class="logo login_child">
                <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/image.png" style="height: 150px;" alt="">
            </div>
            <div class="content">
                <div class="text1 login_child">
                    <p class="p1">Register</p>
                    <p class="p2">Register your account to explore my products.</p>
                </div>
                <div class="input login_child">
                    <div class="email input1">
                        <p class="title_input">Email</p>
                        <input id="register_email" type="email" placeholder="Your Email:">
                    </div>
                    <div class="password">
                        <div class="password1 input1">
                            <p class="title_input">Password</p>
                            <input id="register_password" class="input_eye" type="password" placeholder="Your Password;">
                            <i id="login_eye" class="fa-solid fa-eye-slash"></i>
                        </div>
                    </div>
                    <div class="code input1">
                        <p class="title_input">Code</p>
                        <div class="input_code">
                            <input id="register_code" type="text" placeholder="Your Code:">
                            <button id = "register_sendcode">Send Code</button>
                        </div>
                    </div>
                </div>
                <button id="register_register" class="login1 login_child">Register</button>
                <div class="text2">
                    <p class="p1">Already have an Account?</p>
                    <p id="back_to_login_from_register" class="p2">Login</p>
                </div>
            </div>
            <i id="close_login" class="fa-solid fa-xmark"></i>
        </div>
        <!--forgot-->
        <div class="forgot">
            <div class="logo login_child">
                <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/image.png" style="height: 150px;" alt="">
            </div>
            <div class="content">
                <div class="text1 login_child">
                    <p class="p1">Forgot Password</p>
                    <p class="p2">Don't worry, we'll help you reset it.</p>
                </div>
                <div class="input login_child">
                    <div class="email input1">
                        <p class="title_input">Email</p>
                        <input id="forgot_email" type="email" placeholder="Your Email:">
                    </div>
                    <div class="password">
                        <div class="password1 input1">
                            <p class="title_input">New Password</p>
                            <input id="forgot_new" class="input_eye" type="password" placeholder="New Password;">
                            <i id="login_eye" class="fa-solid fa-eye-slash"></i>
                        </div>
                    </div>
                    <div class="confirm">
                        <div class="password1 input1">
                            <p class="title_input">Confirm Password</p>
                            <input id="forgot_confirm" class="input_eye" type="password" placeholder="Confirm Password;">
                            <i id="login_eye" class="fa-solid fa-eye-slash"></i>
                        </div>
                    </div>
                    <div class="code input1">
                        <p class="title_input">Code</p>
                        <div class="input_code">
                            <input id="forgot_code" type="text" placeholder="Your Code:">
                            <button id="button_send_code_in_forgot">Send Code</button>
                        </div>
                    </div>
                </div>
                <button id="reset_password" class="login1 login_child">Reset Password</button>
                <div class="text2">
                    <p class="p1">Already have an Account?</p>
                    <p id="back_login_from_forgot" class="p2">Login</p>
                </div>
            </div>
            
            <i id="close_login" class="fa-solid fa-xmark"></i>
        </div>
        <div class="success">
            <img src="/Jewelry_web/JSP_JAVASCRIPT_CSS/img/success.png" alt="" style="height: 200px;">
            <p>Congratulations, you have successfully registered an account</p>
            <i class="fa-solid fa-xmark"></i>
        </div>
        <script type="text/javascript">
        	var tradition = <%=convert_1_way_ArrayList_to_Json(tradition)%>
        </script>
        <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/home/home_login_forgot_register.js"></script>
        <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/home/home_responsive.js"></script>
        <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/home/all_event.js"></script>
        <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/home/register.js"></script>
        <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/home/login.js"></script>
        <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/home/forgot.js"></script>
        <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/home/change_tab.js"></script>
        <script src="/Jewelry_web/JSP_JAVASCRIPT_CSS/home/auto_click_login.js"></script>
    </body>
</html>