/**
 * 
 */
var all_name = [];
for (var i = 0; i < all_data_product.length; i++){
	all_name.push(all_data_product[i][1]);
}
function check_child_text(checked_text, text){
    var checked_text_lower = checked_text.toLowerCase();
    var text_lower = text.toLowerCase();
    if (text_lower.indexOf(checked_text_lower) !== -1) {
        return true;
    } else {
        return false;
    }
}
function create_list(text){
	var result = [];
	for (var i = 0; i < all_name.length; i++){
		if (check_child_text(text, all_name[i]) == true){
			result.push(all_data_product[i]);
		}
	}
	return result;
}

function create_1_result(product){
	const result1Div = document.createElement("div");
	result1Div.className = "result1 result_child";
	
	const image = document.createElement("img");
	image.src = "/Jewelry_web/img_product/" + product[0] + "_1.png";
	image.style.height = "50px";
	image.alt = "";
	
	const textDiv = document.createElement("div");
	textDiv.className = "text";
	
	const name1P = document.createElement("p");
	name1P.className = "name1";
	name1P.textContent = product[1];
	
	const moneyP = document.createElement("p");
	moneyP.className = "money";
	moneyP.textContent = formatMoneyVND(product[2] + "") + " VND";
	
	// Append elements
	textDiv.appendChild(name1P);
	textDiv.appendChild(moneyP);
	
	result1Div.appendChild(image);
	result1Div.appendChild(textDiv);
	var result_scroll = document.querySelector(".result_scroll");
	result_scroll.appendChild(result1Div);
}
function add_data(text){
	var result = create_list(text);
	for (var i = 0; i < result.length; i++){
		create_1_result(result[i]);
	}
}

var input_search = document.querySelector("#search")
input_search.addEventListener("input", (event) => 
    {
        if (event.key === "Enter") {

        }
        else{
			var search_result = document.querySelector("body main .search .result")
			search_result.style.display = "block";
			var result_scroll = document.querySelector(".result_scroll");
			result_scroll.innerHTML = "";
            add_data(input_search.value);
        }
    }
)
var search_result = document.querySelector("body main .search .result")
			search_result.style.display = "none";
	
		