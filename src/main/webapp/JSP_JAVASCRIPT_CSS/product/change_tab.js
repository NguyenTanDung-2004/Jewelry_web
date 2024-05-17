/**
 * 
 */
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
