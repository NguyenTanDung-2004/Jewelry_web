/**
 * 
 */
// xử lí sự kiện vào trang collections
var collection_tab = document.querySelector("body .collections");
var collection_tab_button = document.querySelector("#collection_tab_button");
var main_child = document.querySelector("body main .main_child");
collection_tab_button.addEventListener("click", () =>
    {
        main_child.style.display = "none"
        collection_tab.style.display = "block";
        uncheck_checkbox()
    }
)

// handle all tab button click
var all_button = document.querySelector("#all_tab_button");
all_button.addEventListener("click", () => 
	{
		render_products_for_all_tab();	
		uncheck_checkbox()	
	}
)

// handle tab bracelets

var bracelets_tab_button = document.querySelector("#bracelets_tab_button");
bracelets_tab_button.addEventListener("click", () => 
	{
		render_products_for_1_tab("bracelets")
		uncheck_checkbox()
	}
)

// handle tab rings
var rings_tab_button = document.querySelector("#rings_tab_button");
rings_tab_button.addEventListener("click", () => 
	{
		render_products_for_1_tab("rings")
		uncheck_checkbox()
	}
)

// handle tab necklaces
var necklaces_tab_button = document.querySelector("#necklaces_tab_button");
necklaces_tab_button.addEventListener("click", () => 
	{
		render_products_for_1_tab("necklaces")
		uncheck_checkbox()
	}
)

// handle tab earrings
var earrings_tab_button = document.querySelector("#earrings_tab_button");
earrings_tab_button.addEventListener("click", () => 
	{
		render_products_for_1_tab("earrings")
		uncheck_checkbox()
	}
)

// handle tab sales tab
var sales_tab_button = document.querySelector("#sales_tab_button");
sales_tab_button.addEventListener("click", () => 
	{
		render_products_for_sales_tab();
		uncheck_checkbox()
	}
)