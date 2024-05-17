// xử lí hover vào avt
var user_img = document.querySelector("body header .header_child .user img")
    // lấy ra đối tượng user hover
var user_hover = document.querySelector("body header .header_child .user .user_hover");

    // lấy ra đối tượng user hover content
// xử lí result
var result = document.querySelector("body main .search .result")
var close_result = document.querySelector("#close_result");
close_result.addEventListener("click", () => 
    {
        result.style.display = "none";
    }
)
// xử lí sự kiện vào trang collections
var collection_tab = document.querySelector("body .collections");
var collection_tab_button = document.querySelector("#collection_tab_button");
var main_child = document.querySelector("body main .main_child");
collection_tab_button.addEventListener("click", () =>
    {
        main_child.style.display = "none"
        collection_tab.style.display = "block";
    }
)

// handle all tab button click
var all_button = document.querySelector("#all_tab_button");
all_button.addEventListener("click", () => 
	{
		collection_tab.style.display = "none"
		main_child.style.display = "block"
	}
)

user_img.addEventListener("mouseenter", () =>
    {
        user_hover.style.transformOrigin = "10px 30px";
        user_hover.style.scale = "1";
    }
)

user_img.addEventListener("click", () =>
    {
        user_hover.style.scale = "0";
    }
)
var logout = document.querySelector("#logout");
logout.addEventListener("click", () => 
	{
		submit_logout();
	}
)
function submit_logout() {
    var http = new XMLHttpRequest();
    http.open("POST", "http://localhost:8080/Jewelry_web/servlet_product_from_product", true);
    http.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
    var params = "action=logout"; // probably use document.getElementById(...).value
    http.send(params);
    http.onload = function() {
    	var resp = JSON.parse(http.responseText);
        // Sử dụng dữ liệu từ mảng
       	if (resp == "logout_successfully"){
			   window.location = "http://localhost:8080/Jewelry_web/product";
		   }
			  		    
    }
}
 
