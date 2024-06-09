
let pathInfo = window.location.pathname;
sessionStorage.setItem("returnUrl",  window.location.href);
let pathParts = pathInfo.split('-');
let idPart = pathParts[pathParts.length - 1];
let id = idPart.replace('.html', '');
let productId = parseInt(id, 10);

let sizeSelected = false;
function checkSize() {
    return sizeSelected;
}
// Function to handle size selection
function selectSize(size) {
    let sizeInput = document.querySelector(".size-numbers");
    sizeInput.value = size;
    sizeSelected = true;
}
// Add event listeners to size options
document.querySelectorAll('.value-size').forEach(sizeElement => {
    sizeElement.addEventListener('click', (event) => {
        let selectedSize = event.target.innerText;
        selectSize(selectedSize);
        
		let sizeArray = selectedSize.split(" ");
        checkProductInCart(productId, sizeArray[0], (exists) => {
            let btn = document.getElementById('btn_add'); 
            if (exists) {
               btn.style.opacity = "0.5"; 
                    btn.disabled = true;
                    btn.style.cursor = "not-allowed";
            } else {
                btn.style.opacity = "1"; 
                    btn.disabled = false;
                    btn.style.cursor = "pointer";
            }
        });
    });
});


// Function to check if the product exists in the cart

function checkProductInCart(productId, size, callback) {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", `http://localhost:8080/Jewelry_web/check-product-in-cart?id=${productId}&size=${size}`, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            let exist = xhr.responseText; 
            if (exist === "true") {
                callback(true);
            } else {
                callback(false);
            }
        }
    };
    xhr.send();
}


// Function to buy now (not in cart before)
function buyNow(productId, size, quantity) {
    let buyRequest = new XMLHttpRequest();
  	buyRequest.open("POST", "http://localhost:8080/Jewelry_web/buy", true);
   	buyRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
    var params = "id=" + productId + "&size=" + size + "&quantity=" + quantity + "&action=buy_now" + "&cartList"; 
    buyRequest.send(params);
    buyRequest.onload = function() {
		console.log("Response from server:", buyRequest.responseText);
    	var resp = JSON.parse(buyRequest.responseText);
        // Sử dụng dữ liệu từ mảngd
       	if (resp == "buy_now_successfully"){
			window.location = "http://localhost:8080/Jewelry_web/cart";
		   }
		else{
		}	    
    }
}
// Function to buy now update (in cart before)
function buyNowUpdate(productId, size, quantity) {
    let buyRequest = new XMLHttpRequest();
  	buyRequest.open("POST", "http://localhost:8080/Jewelry_web/update", true);
   	buyRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
    var params = "id=" + productId + "&size=" + size + "&quantity=" + quantity + "&action=buy_now" + "&cartList"; 
    buyRequest.send(params);
    buyRequest.onload = function() {
		console.log("Response from server:", buyRequest.responseText);
    	var resp = JSON.parse(buyRequest.responseText);
        // Sử dụng dữ liệu từ mảngd
       	if (resp == "buy_now_successfully"){
			window.location = "http://localhost:8080/Jewelry_web/cart";
		   }
		else{
		}	    
    }
}
// Function to add the product to the cart
function addProductToCart(productId, size, quantity) {
    let addToCartURL = `http://localhost:8080/Jewelry_web/add-to-cart?id=${productId}&size=${size}&quantity=${quantity}`;
    let addToCartRequest = new XMLHttpRequest();
    addToCartRequest.open("GET", addToCartURL, true);
    addToCartRequest.onreadystatechange = function() {
        if (addToCartRequest.readyState == 4) {
            if (addToCartRequest.status == 200) {
                alert("Product added to cart successfully!");
            } 
            else {
                alert("An error occurred. Please try again.");
            }
        }
    };
    addToCartRequest.send();
}


//Click ADD_TO_CART
let btn_add = document.getElementById('btn_add'); 
btn_add.addEventListener("click", () => {
// Main function to handle the process
function handleAddToCart() {
	//Kiểm tra người dùng đã chọn size chưa
    let sizeInput = document.querySelector(".size-numbers");
    let selectedSize = sizeInput.value;
    let sizeArray = selectedSize.split(" ");
    if (!selectedSize) {
        alert("Please select a size.");
        return; 
    }
    if (userID != null) {
            checkProductInCart(productId, sizeArray[0], function(productExists) {
                if (productExists) {
                    btn_add.style.opacity = "0.5"; 
                    btn_add.disabled = true;
                    btn_add.style.cursor = "not-allowed";
                } else {
                    // Get selected quantity
                    let quantityInput = document.querySelector(".numbers");
                    let selectedQuantity = quantityInput.value;
                    // Add product to cart
                    addProductToCart(productId, sizeArray[0], selectedQuantity);
                }
            });
        } else {
           alert("Please log in first.");
           window.location.href="http://localhost:8080/Jewelry_web/home?autoClick=true";
        }
}

// Call the main function
handleAddToCart();
});


//Click BUY_NOW
let btn_buy = document.getElementById('buy_now');
btn_buy.addEventListener("click", () =>{
	function handleBuy() {
		let sizeInput = document.querySelector(".size-numbers");
	    let selectedSize = sizeInput.value;
	    let sizeArray = selectedSize.split(" ");
	    if (!selectedSize) {
	        alert("Please select a size.");
	        return; 
	    }
        if (userID != null) {
            checkProductInCart(productId, sizeArray[0], function(productExists) {
                if (productExists) {
                    let quantityInput = document.querySelector(".numbers");
                    let selectedQuantity = quantityInput.value;
                    // Add product to cart
                    buyNowUpdate(productId, sizeArray[0], selectedQuantity);
                } else {
                    // Get selected quantity
                    let quantityInput = document.querySelector(".numbers");
                    let selectedQuantity = quantityInput.value;
                    // Add product to cart
                    buyNow(productId, sizeArray[0], selectedQuantity);
                }
            });
        } else {
           alert("Please log in first.");
           window.location.href="http://localhost:8080/Jewelry_web/home?autoClick=true";
        }
}

// Call the main function
handleBuy();
});

