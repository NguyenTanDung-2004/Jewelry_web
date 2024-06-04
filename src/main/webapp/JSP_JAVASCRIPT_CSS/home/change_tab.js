/**
 * 
 */
var product_tab = document.querySelector("#product_tab");
product_tab.addEventListener("click", () => 
	{
		window.location = "http://localhost:8080/Jewelry_web/product";
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

var see_all_black = document.querySelector("#see_all_black");
see_all_black.style.cursor = "pointer";
see_all_black.addEventListener("click", () => 
	{
		window.location = "http://localhost:8080/Jewelry_web/product";
	}
)

var see_all_black1 = document.querySelector("#see_all_black1");
see_all_black1.style.cursor = "pointer";
see_all_black1.addEventListener("click", () => 
	{
		window.location = tradition[1];
	}
)

var location1 = document.querySelector("#location1");
location1.style.cursor = "pointer";
location1.addEventListener("click", () => 
	{
		window.location = "https://www.google.com/maps/place/Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+C%C3%B4ng+ngh%E1%BB%87+Th%C3%B4ng+tin+-+%C4%90HQG+TP.HCM/@10.8702176,106.8000212,17z/data=!4m10!1m2!2m1!1suit!3m6!1s0x317527587e9ad5bf:0xafa66f9c8be3c91!8m2!3d10.8700089!4d106.8030541!15sCgN1aXSSAQp1bml2ZXJzaXR54AEA!16s%2Fm%2F02qqlmm?entry=ttu";
	}
)

var facebook = document.querySelector("#facebook");
facebook.style.cursor = "pointer";
facebook.addEventListener("click", () => 
	{
		window.location = "https://www.facebook.com/UIT.Fanpage";
	}
)

var see_all_new = document.querySelector('#see_all_new');
see_all_new.style.cursor = "pointer";
see_all_new.addEventListener("click", () => 
	{
		submit_redirect("new_arrival");
	}
)

//
function submit_redirect(parameter) {
    var http = new XMLHttpRequest();
    http.open("POST", "http://localhost:8080/Jewelry_web/servlet_product_receive_request_from_home", true);
    http.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
    var params = "action=" + parameter;
    http.send(params);
    http.onload = function() {
		var resp = JSON.parse(http.responseText);
		if (resp == "set_session_successfully"){
			window.location = "http://localhost:8080/Jewelry_web/product";
		}
    }
}

var see_all_necklaces = document.querySelector("#see_all_necklaces")
see_all_necklaces.addEventListener("click", () => 
	{
		submit_redirect("necklaces");
	}
)
see_all_necklaces.style.cursor = "pointer";
var see_all_rings = document.querySelector("#see_all_rings")
see_all_rings.style.cursor = "pointer";
see_all_rings.addEventListener("click", () => 
	{
		submit_redirect("rings");
	}
)
var see_all_earrings = document.querySelector("#see_all_earrings")
see_all_earrings.style.cursor = "pointer";
see_all_earrings.addEventListener("click", () => 
	{
		submit_redirect("earrings");
	}
)
