
//curent list
var current_id_list = [];
for (var i = 0; i < all_data_product.length; i++){
	current_id_list.push(i);
}


// function format money
function formatMoneyVND(numberString) {
    if (!numberString || numberString === "") {
        return "0"; // Default to 0 if the string is empty or null
    }

    // Convert to string if not already
    numberString = numberString.toString();

    // Reverse iteration to add dots every three characters
    let formatted = "";
    let count = 0;

    for (let i = numberString.length - 1; i >= 0; i--) {
        formatted = numberString.charAt(i) + formatted;
        count++;
        if (count == 3 && i != 0) { // Add dot if count is 3 and it's not the last character
            formatted = "." + formatted;
            count = 0;
        }
    }

    return formatted;
}

// Function to check for discount
function checkDiscount(allDataProduct, index) {
    let discount = Math.floor(allDataProduct[index][4] * 100);
    return discount != 0;
}

// Function to generate HTML content
function generateProductHTML(product, index) {
    var productHTML = `
        <div class="sanpham">
            <img src="/Jewelry_web/img_product/${product[0]}_1.png" style="height: 200px;" alt="">
            <div class="content1">
                <p class="name1">${product[1]}</p>
                <p class="money">${formatMoneyVND(product[2])} VND</p>
            </div>
            ${checkDiscount(all_data_product, index) ? `<div class="sale">-${Math.floor(product[4] * 100)}%</div>` : ''}
        </div>
    `;
    return productHTML;
}
// render all product
function render_all_Products() {
    var container = document.querySelector(".sanpham_cha");
    container.innerHTML = "";
    all_data_product.forEach((product, index) => {
        container.innerHTML += generateProductHTML(product, index);
    });
}

// render product for 1 tab
function render_products_for_1_tab(name_tab){
	collection_tab.style.display = "none"
	main_child.style.display = "block"
	var list = getVariableByName(name_tab);
	var container = document.querySelector(".sanpham_cha");
    container.innerHTML = "";
    for (var i = 0; i < list.length; i++){
		container.innerHTML += generateProductHTML(get_product_by_id(list[i]), get_id_by_id(list[i]));
	}
	var number_products = document.querySelector("#so_luong_product");
	number_products.innerHTML = list.length + " products";
	var title_search = document.querySelector("body main .title_search .name");
	title_search.innerHTML = name_tab.toUpperCase();
	current_id_list = list;
	load_more.style.display = "none";
}
// fucntion get variable same argument
function getVariableByName(variableName) {
    return window[variableName];
}

// function get product  by id
function get_product_by_id(id){
	for (var i = 0; i < all_data_product.length; i++){
		if (all_data_product[i][0] == id){
			return all_data_product[i];
		}
	}
}
//
function get_id_by_id(id){
	for (var i = 0; i < all_data_product.length; i++){
		if (all_data_product[i][0] == id){
			return i;
		}
	}
}
//function create list sale
function create_saled_list(){
	var list = [];
	for (var i = 0; i < all_data_product.length; i++){
		if (checkDiscount(all_data_product, i)){
			list.push(all_data_product[i]);
		}
	}
	return list;
}
//function create list id sale
function create_id_saled_list(){
	var list = [];
	for (var i = 0; i < all_data_product.length; i++){
		if (checkDiscount(all_data_product, i)){
			list.push(i);
		}
	}
	return list;
}
// function render sales tab
function render_products_for_sales_tab(){
	collection_tab.style.display = "none"
	main_child.style.display = "block"
	var container = document.querySelector(".sanpham_cha");
    container.innerHTML = "";
    for (var i = 0; i < create_saled_list().length; i++){
		container.innerHTML += generateProductHTML(create_saled_list()[i], create_id_saled_list()[i]);
	}
	var number_products = document.querySelector("#so_luong_product");
	number_products.innerHTML = create_saled_list().length + " products";
	var title_search = document.querySelector("body main .title_search .name");
	title_search.innerHTML = "SALES";
	current_id_list = create_id_saled_list();
	load_more.style.display = "none";
}
// render for all product
function render_products_for_all_tab(){
	collection_tab.style.display = "none"
	main_child.style.display = "block"
	var container = document.querySelector(".sanpham_cha");
    container.innerHTML = "";
    current_id_list = [];
    for (var i = 0; i < all_data_product.length; i++){
		container.innerHTML += generateProductHTML(all_data_product[i], i);
		current_id_list.push(i);
	}
	var number_products = document.querySelector("#so_luong_product");
	number_products.innerHTML = all_data_product.length + " products";
	var title_search = document.querySelector("body main .title_search .name");
	title_search.innerHTML = ""; 
	back_to_all();
}
