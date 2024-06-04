/**
 * 
 */
var spring_collections = document.querySelector("#spring_collections")
var summer_collections = document.querySelector("#summer_collections")
var autumn_collections = document.querySelector("#autumn_collections")
var winter_collections = document.querySelector("#winter_collections")
var love_collections = document.querySelector("#love_collections")

spring_collections.addEventListener("click", () => 
	{
		render_products_for_1_tab("spring")
		uncheck_checkbox()
	}
)
summer_collections.addEventListener("click", () => 
	{
		render_products_for_1_tab("summer")
		uncheck_checkbox()
	}
)
autumn_collections.addEventListener("click", () => 
	{
		render_products_for_1_tab("autumn")
		uncheck_checkbox()
	}
)
winter_collections.addEventListener("click", () => 
	{
		render_products_for_1_tab("winter")
		uncheck_checkbox()
	}
)
love_collections.addEventListener("click", () => 
	{
		render_products_for_1_tab("love")
		uncheck_checkbox()
	}
)


//sự kiện được gọi từ detail
document.addEventListener("DOMContentLoaded", () => {
    const collection = localStorage.getItem("selectedCollection");
    
    if (collection) {
        displayProducts(collection);
        localStorage.removeItem("selectedCollection");  // Xóa thông tin sau khi sử dụng
    }
})
function displayProducts(collection) {
    if (collection === "spring") {
        spring_collections.click();
        console.log("Displaying Spring Products");
    } 
    else if (collection === "summer") {
        summer_collections.click();
        console.log("Displaying Summer Products");
    } 
    else if (collection === "autumn") {
        autumn_collections.click();
        console.log("Displaying Autumn Products");
    } 
    else if (collection === "winter") {
        winter_collections.click();
        console.log("Displaying Winter Products");
    } 
    else if (collection === "love") {
        love_collections.click();
        console.log("Displaying Love Products");
    }
    else if (collection === "all") {
        all_button.click();
        console.log("Displaying all");
    } 
    else if (collection === "bracelets") {
        bracelets_tab_button.click();
        console.log("Displaying bracelets");
    } 
    else if (collection === "rings") {
        rings_tab_button.click();
        console.log("Displaying rings");
    } 
    else if (collection === "necklaces") {
        necklaces_tab_button.click();
        console.log("Displaying necklaces");
    } 
    else if (collection === "earrings") {
        earrings_tab_button.click();
        console.log("Displaying earrings");
    }
    else if (collection === "sales") {
        sales_tab_button.click();
        console.log("Displaying sales");
    }
}