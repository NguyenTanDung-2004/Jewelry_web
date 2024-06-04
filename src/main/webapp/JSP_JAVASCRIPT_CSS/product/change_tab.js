/**
 * 
 */
var account_tab = document.querySelector("body header .header_child .user img ");
 account_tab.addEventListener("click", () => 
	{
		window.location = "http://localhost:8080/Jewelry_web/account";
	}
)
var product_tab = document.querySelector("#home_tab");
product_tab.addEventListener("click", () => 
	{
		window.location = "http://localhost:8080/Jewelry_web/home";
	}
)

function scrollToDiv() {
  var targetElement = document.querySelector('.footer');
  targetElement.scrollIntoView({ behavior: 'smooth' });
}

var about_tab = document.querySelector("#about_tab");
about_tab.addEventListener("click", () => 
	{
		scrollToDiv();
	}
)

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
