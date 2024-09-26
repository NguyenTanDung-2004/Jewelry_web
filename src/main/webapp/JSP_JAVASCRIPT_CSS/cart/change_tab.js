/**
 * 
 */

var user_setting = document.querySelector("#user_setting");
user_setting.addEventListener("click", () => 
	{
		window.location = "http://localhost:8080/Jewelry_web/account";
	}
)
var order_history = document.querySelector("#order_history");
order_history.addEventListener("click", () => 
	{
		window.location = "http://localhost:8080/Jewelry_web/account?orderHistory=true";
	}
)
