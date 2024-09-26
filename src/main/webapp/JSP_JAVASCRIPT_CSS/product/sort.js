/**
 * 
 */

 function create_product_from_current_id_list(){
	 var list = [];
	 for (var i = 0; i < current_id_list.length; i++){
		 for (var j = 0; j < all_data_product.length; j++){
			 if (all_data_product[j][0] == current_id_list[i]){
				 list.push(all_data_product[j]);
			 }
		 }
	 }
	 return list;
 }
 
 function sort_price_min_to_max(){
	 var list = create_product_from_current_id_list();
	 list.sort((a, b) => a[2] - b[2]);
	 return list;
 }
 
 function sort_price_max_to_min(){
	 var list = create_product_from_current_id_list();
	 list.sort((a, b) => b[2] - a[2]);
	 return list;
 }
 function sort_date(){
	 var list = create_product_from_current_id_list();
	 list.sort((a, b) => {
	    // Convert date strings to Date objects
	    let dateA = new Date(a[3]);
	    let dateB = new Date(b[3]);
	    
	    // Compare dates
	    return dateB - dateA;
	});
	 return list;
 }
 
 //function render product for sort 
 function render_sort(function_name){
	collection_tab.style.display = "none"
	main_child.style.display = "block"
	var container = document.querySelector(".sanpham_cha");
    container.innerHTML = "";
    var list = window[function_name]();
    for (var i = 0; i < list.length; i++){
		container.innerHTML += generateProductHTML(list[i], i);
	}
	current_items = all_data_product.length;
	load_more.querySelector("p").innerHTML = "Showing " + (all_data_product.length) + " of " + all_data_product.length + " items";
}
 
 
 var cb_min_to_max = document.querySelector("#min_to_max");
 var cb_max_to_min = document.querySelector("#max_to_min");
 var cb_new = document.querySelector("#checkbox_new");
 var cb_rings = document.querySelector("#checkbox_rings");
 var cb_bracelets = document.querySelector("#checkbox_bracelets");
 var cb_necklaces = document.querySelector('#checkbox_necklaces');
 var cb_earrings = document.querySelector("#checkbox_earrings");
 
 cb_min_to_max.addEventListener("click", () => 
 	{
		render_sort("sort_price_min_to_max");	 
	}
 )
 cb_max_to_min.addEventListener("click", () => 
 	{
		render_sort("sort_price_max_to_min");		 
	}
 )
 cb_new.addEventListener("click", () => 
 	{
		render_sort("sort_date");	 
	}
 )
  cb_rings.addEventListener("click", () => 
 	{
		render_products_for_1_tab("rings")
		uncheck_checkbox()	 
		cb_rings.checked = true;
	}
 )
  cb_bracelets.addEventListener("click", () => 
 	{
		render_products_for_1_tab("bracelets")
		uncheck_checkbox() 
		cb_bracelets.checked = true;
	}
 )
  cb_necklaces.addEventListener("click", () => 
 	{
		render_products_for_1_tab("necklaces")
		uncheck_checkbox()
		cb_necklaces.checked = true;
	}
 )
  cb_earrings.addEventListener("click", () => 
 	{
		render_products_for_1_tab("earrings")
		uncheck_checkbox() 
		cb_earrings.checked = true;
	}
 )
 function uncheck_checkbox(){
	 cb_min_to_max.checked = false;
	 cb_max_to_min.checked = false;
	 cb_new.checked = false;
	 cb_rings.checked = false;
	 cb_bracelets.checked = false;
	 cb_necklaces.checked = false;
	 cb_earrings.checked = false;
 }
 
var location1 = document.querySelector("#location");
location1.style.cursor = "pointer";
location1.addEventListener("click", () => 
	{
		window.location = "https://www.google.com/maps/place/Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+C%C3%B4ng+ngh%E1%BB%87+Th%C3%B4ng+tin+-+%C4%90HQG+TP.HCM/@10.8702176,106.8000212,17z/data=!4m10!1m2!2m1!1suit!3m6!1s0x317527587e9ad5bf:0xafa66f9c8be3c91!8m2!3d10.8700089!4d106.8030541!15sCgN1aXSSAQp1bml2ZXJzaXR54AEA!16s%2Fm%2F02qqlmm?entry=ttu";
	}
)
 
 