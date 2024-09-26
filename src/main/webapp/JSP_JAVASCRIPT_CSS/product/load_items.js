
var div_product = document.querySelectorAll(".sanpham");
for (var i = 6; i < all_data_product.length; i++){
	div_product[i].style.display = "none";
}
var current_items = 5;
var load_more = document.querySelector("#load_more");
load_more.addEventListener("click", () => 
	{
		if (current_items < all_data_product.length - 1){
			for (var i = current_items + 1; i <= Math.min(all_data_product.length - 1, current_items + 6); i++){
				div_product[i].style.display = "flex";
			}
			current_items = current_items + 6;
			console.log(current_items);
			if (current_items >= all_data_product.length){
				current_items = all_data_product.length - 1;
			}
			load_more.querySelector("p").innerHTML = "Showing " + (current_items + 1) + " of " + all_data_product.length + " items";
		}
	}
)
function back_to_all(){
	load_more.style.display = "flex";
	current_items = 5;
	load_more.querySelector("p").innerHTML = "Showing " + (current_items + 1) + " of " + all_data_product.length + " items";
	div_product = [];
	div_product = document.querySelectorAll(".sanpham");
	for (var i = 6; i < all_data_product.length; i++){
		div_product[i].style.display = "none";
	}
}