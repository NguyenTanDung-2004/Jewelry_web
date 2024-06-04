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
function toFriendlyUrl(name) {
        return name.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/-+$/, "");
}



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
	result1Div.className = "result_child";
	
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
	
	//tạo link
	var name = toFriendlyUrl(product[1]);
	var friendlyUrl = `${name}-${product[0]}.html`;
	const link = document.createElement("a");
    link.href = "/Jewelry_web/product/" + friendlyUrl; 
    link.className = "linkSearch";
    
    // Append result1Div to the <a> element
    link.appendChild(result1Div);
    
    // Append the <a> element to the result_scroll
    var result_scroll = document.querySelector(".result_scroll");
    result_scroll.appendChild(link);
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
			var search_result = document.querySelector(".search .result")
			search_result.style.display = "block";
			var result_scroll = document.querySelector(".result_scroll");
			result_scroll.innerHTML = "";
            add_data(input_search.value);
        }
    }
)
var search_result = document.querySelector(".search .result")
			search_result.style.display = "none";
	
		