//sự kiện được gọi từ detail
var spring_collections = document.querySelector("#spring_collections")
var summer_collections = document.querySelector("#summer_collections")
var autumn_collections = document.querySelector("#autumn_collections")
var winter_collections = document.querySelector("#winter_collections")
var love_collections = document.querySelector("#love_collections")
var sales_tab_button = document.querySelector("#sales_tab_button")
var earrings_tab_button = document.querySelector("#earrings_tab_button")
var necklaces_tab_button = document.querySelector("#necklaces_tab_button")
var rings_tab_button = document.querySelector("#rings_tab_button")
var bracelets_tab_button = document.querySelector("#bracelets_tab_button")
var all_button = document.querySelector("#all_tab_button")


document.addEventListener("DOMContentLoaded", () => {
    const filter = localStorage.getItem("selectedFilter");
    
    if (filter) {
        displayProducts(filter);
        localStorage.removeItem("selectedFilter");  // Xóa thông tin sau khi sử dụng
    }
})
function displayProducts(filter) {
    if (filter === "spring") {
        spring_collections.click();
        console.log("Displaying Spring Products");
    } 
    else if (filter === "summer") {
        summer_collections.click();
        console.log("Displaying Summer Products");
    } 
    else if (filter === "autumn") {
        autumn_collections.click();
        console.log("Displaying Autumn Products");
    } 
    else if (filter === "winter") {
        winter_collections.click();
        console.log("Displaying Winter Products");
    } 
    else if (filter === "love") {
        love_collections.click();
        console.log("Displaying Love Products");
    }
    else if (filter === "all") {
        all_button.click();
        console.log("Displaying all");
    } 
    else if (filter === "bracelets") {
        bracelets_tab_button.click();
        console.log("Displaying bracelets");
    } 
    else if (filter === "rings") {
        rings_tab_button.click();
        console.log("Displaying rings");
    } 
    else if (filter === "necklaces") {
        necklaces_tab_button.click();
        console.log("Displaying necklaces");
    } 
    else if (filter === "earrings") {
        earrings_tab_button.click();
        console.log("Displaying earrings");
    }
    else if (filter === "sales") {
        sales_tab_button.click();
        console.log("Displaying sales");
    }
}