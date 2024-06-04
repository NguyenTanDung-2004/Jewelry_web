
// handle all tab button click
var all_button = document.querySelector("#all_tab_button");
all_button.addEventListener("click", () => 
	{
		localStorage.setItem("selectedFilter", "all");
		window.location = "http://localhost:8080/Jewelry_web/product";
	}
)

// handle tab bracelets

var bracelets_tab_button = document.querySelector("#bracelets_tab_button");
bracelets_tab_button.addEventListener("click", () => 
	{
		localStorage.setItem("selectedFilter", "bracelets");
		window.location = "http://localhost:8080/Jewelry_web/product";
	}
)

// handle tab rings
var rings_tab_button = document.querySelector("#rings_tab_button");
rings_tab_button.addEventListener("click", () => 
	{
		localStorage.setItem("selectedFilter", "rings");
		window.location = "http://localhost:8080/Jewelry_web/product";
	}
)

// handle tab necklaces
var necklaces_tab_button = document.querySelector("#necklaces_tab_button");
necklaces_tab_button.addEventListener("click", () => 
	{
		localStorage.setItem("selectedFilter", "necklaces");
		window.location = "http://localhost:8080/Jewelry_web/product";
	}
)

// handle tab earrings
var earrings_tab_button = document.querySelector("#earrings_tab_button");
earrings_tab_button.addEventListener("click", () => 
	{
		localStorage.setItem("selectedFilter", "earrings");
		window.location = "http://localhost:8080/Jewelry_web/product";
	}
)

// handle tab sales tab
var sales_tab_button = document.querySelector("#sales_tab_button");
sales_tab_button.addEventListener("click", () => 
	{
		localStorage.setItem("selectedFilter", "sales");
		window.location = "http://localhost:8080/Jewelry_web/product";
	}
)