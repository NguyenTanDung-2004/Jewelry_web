const $ = (selector) => document.querySelector(selector);
const $$ = (selector) => document.querySelectorAll(selector);

const buyButton = $("#buy_btn")
const deliveryInfoButton = $("#delivery_info_btn")
const modal = $(".modal")
const successOrderForm = $(".order_successfully")
const plusButton = $("#plus_btn")
const minusButton = $("#minus_btn")
const productQuantity = $("#product_quantity")
const orderProductQuantity = $(".order_product_quantity")
const orderSummary = $(".order_summmary")
const saveButton = $("#save_btn")
const deliveryInfoPhone = $("#delivery_info_phone")
const deliveryInfoShippingCompany = $("#delivery_info_shipping_company")
const deliveryInfoAdress = $("#delivery_info_address")
const filter = $("#filter")
const allCart = $("#all_cart")
const checkAllBtn = $("#check_box_all")
const productCheckBox = $$(".product_check_box")
const filterDropDownMenu = $(".user_hover")
const dropdownNavBarItem = $$(".dropdown_nav_bar_item ")
const displayProduct = $$(".product_detail")
const dropDownMenu = $(".drop_down_menu ")
const laptopScreen = 1120;

const product_name = $$(".product_name_2")
const product_size = $$(".product_size")
const order_amount = $(".order_amount_total_price")
const order_total = $(".order_total_price")
const product_quantity_all = $$(".order_product_quantity")
const coupon_discount_value = $(".order_discount_value")
const shipping_value = $(".shipping_fee_value")


var phone = ''
var adrress = ''
var province = ''
var city = ''
var district = ''
var amountWithoutCoupon = 0;
var amountWithCoupon = 0;
var selectedProduct = []
var orderInfo = $(".order_info")
var id = '';
var summaryId = '';
var cartProductName = '';
var cartProductPrice = '';
var cartProductQuantity = '';
var cartProductTotalPrice = 0;
var hasDeliveryInfo = false;



//new: handle buy now action from Quynh An code
function buyNow() {
    for (let checkBox of productCheckBox) {
        if (checkBox.checked == true) {
            const temp_id = checkBox.parentElement.parentElement.id;
            const temp_summaryId = "summary_" + id
            const temp_cartProductName = $("#" + id.toString() + " #name_" + id.toString()).innerHTML
            const temp_cartProductPrice = $("#" + id.toString() + " #price_" + id.toString()).innerHTML
            const temp_cartProductQuantity = $("#" + id.toString() + " #quantity_" + id.toString()).innerHTML
            const temp_cartProductTotalPrice = parseInt(cartProductPrice.replace("VND", "")) * parseInt(cartProductQuantity.replace("x", ""))
            const htmlContent = `<div class="order_info">

                        <div id="` + summaryId + `" class="order_product_info" >
                            <div class="order_product_quantity"> x` + cartProductQuantity + `</div>
                            <div class="order_product_name">` + cartProductName + `</div>
                            <div class="order_product_price">` + cartProductPrice + `</div>
                        </div>
                    </div>`;

            orderInfo.innerHTML += htmlContent;
            amountWithoutCoupon += cartProductTotalPrice;
            order_amount.innerHTML = amountWithoutCoupon;
            if ($(".order_discount_value").innerHTML == 0) {
                order_total.innerHTML = amountWithoutCoupon + 50000
                console.log(amountWithCoupon);
            } else {
                var discountValue = parseFloat($(".order_discount_value").innerHTML.replace("%", ""))
                amountWithCoupon = amountWithoutCoupon - amountWithoutCoupon * discountValue * 0.01;
                order_total.innerHTML = amountWithCoupon + 50000

            }

            selectedProduct.push([cartProductName, cartProductPrice, cartProductQuantity])
            console.log(selectedProduct)
        }
    }
}

buyNow()


//
buyButton.addEventListener("click", (event) => {
    successOrderForm.style.visibility = "visible"

    event.stopPropagation()
})

deliveryInfoButton.addEventListener("click", (event) => {
    modal.style.visibility = "visible"
    event.stopPropagation()
})


// + and - quantity button
function decrease(ele) {

    const decreaseAmount = parseInt($("#price_" + ele.nextElementSibling.id.replace("quantity_", "")).innerHTML.replace("VND", ""))
    const checkBox = $("#check_box_" + ele.nextElementSibling.id.replace("quantity_", ""))
    if (checkBox.checked == true) {
        if (parseInt(ele.nextElementSibling.innerHTML) > 0) {
            amountWithoutCoupon -= decreaseAmount;

            order_amount.innerHTML = amountWithoutCoupon
            order_total.innerHTML = amountWithoutCoupon + 50000
                const displayInfo = $("#summary_" + ele.nextElementSibling.id.replace("quantity_", "") + " .order_product_quantity")

            ele.nextElementSibling.innerHTML = (parseInt(ele.nextElementSibling.innerHTML) - 1).toString()
            displayInfo.innerHTML = "x" + ele.nextElementSibling.innerHTML
        }


    }
}

function increase(ele) {
    debugger;
    const increaseAmount = parseInt($("#price_" + ele.previousElementSibling.id.replace("quantity_", "")).innerHTML.replace("VND", ""))
    const checkBox = $("#check_box_" + ele.previousElementSibling.id.replace("quantity_", ""))
    if (checkBox.checked == true) {
        amountWithoutCoupon += increaseAmount;

        order_amount.innerHTML = amountWithoutCoupon
        order_total.innerHTML = amountWithoutCoupon + 50000

        const displayInfo = $("#summary_" + ele.previousElementSibling.id.replace("quantity_", "") + " .order_product_quantity")
        ele.previousElementSibling.innerHTML = (parseInt(ele.previousElementSibling.innerHTML) + 1).toString()
        displayInfo.innerHTML = "x" + ele.previousElementSibling.innerHTML

    }

}


//fliter
function productFilter(ele) {
    for (var product of displayProduct) {
        if (product.querySelector(".product_type").innerHTML !== ele.innerHTML) {
            product.style.display = "none";
        } else {
            product.style.display = "block";
        }
    }
}

allCart.addEventListener("click", () => {
    for (var product of displayProduct) {
        product.style.display = "block";
    }
})

function checkAll(ele) {

    if (ele.checked == true) {
        for (var product of productCheckBox) {
            if (product.checked == false) {
                id = product.parentElement.parentElement.id;
                summaryId = "summary_" + id
                cartProductName = $("#" + id.toString() + " #name_" + id.toString()).innerHTML
                cartProductPrice = $("#" + id.toString() + " #price_" + id.toString()).innerHTML
                cartProductQuantity = $("#" + id.toString() + " #quantity_" + id.toString()).innerHTML
                cartProductTotalPrice = parseInt(cartProductPrice.replace("VND", "")) * parseInt(cartProductQuantity.replace("x", ""))

                const htmlContent = `<div class="order_info">

                        <div id="` + summaryId + `" class="order_product_info" >
                            <div class="order_product_quantity"> x` + cartProductQuantity + `</div>
                            <div class="order_product_name">` + cartProductName + `</div>
                            <div class="order_product_price">` + cartProductPrice + `</div>
                        </div>
                    </div>`;
                orderInfo.innerHTML += htmlContent;
                amountWithoutCoupon += cartProductTotalPrice;
                order_amount.innerHTML = amountWithoutCoupon;
                order_total.innerHTML = amountWithoutCoupon + 50000
                console.log(amountWithCoupon);
                selectedProduct.push([cartProductName, cartProductPrice, cartProductQuantity])
                console.log(selectedProduct)
                product.checked = true;



            }

        }
    }
    if (ele.checked == false) {
        for (var product of productCheckBox) {
            id = product.parentElement.parentElement.id;
            summaryId = "summary_" + id;
            const removedDiv = $("#" + summaryId);
            removedDiv.remove();
            amountWithoutCoupon = 0;
            order_amount.innerHTML = amountWithoutCoupon;
            order_total.innerHTML = amountWithoutCoupon;
            shipping_value.innerHTML = "0"
            product.checked = false;
        }
    }

}


//chose product from cart to buy
function add_to_cart(ele) {
    shipping_value.innerHTML = "50000"
    id = ele.parentElement.parentElement.id;
    summaryId = "summary_" + id
    cartProductName = $("#" + id.toString() + " #name_" + id.toString()).innerHTML
    cartProductPrice = $("#" + id.toString() + " #price_" + id.toString()).innerHTML
    cartProductQuantity = $("#" + id.toString() + " #quantity_" + id.toString()).innerHTML
    cartProductTotalPrice = parseInt(cartProductPrice.replace("VND", "")) * parseInt(cartProductQuantity.replace("x", ""))
    if (ele.checked) {
        debugger;

        const htmlContent = `<div class="order_info">

                        <div id="` + summaryId + `" class="order_product_info" >
                            <div class="order_product_quantity"> x` + cartProductQuantity + `</div>
                            <div class="order_product_name">` + cartProductName + `</div>
                            <div class="order_product_price">` + cartProductPrice + `</div>
                        </div>
                    </div>`;

        orderInfo.innerHTML += htmlContent;
        amountWithoutCoupon += cartProductTotalPrice;
        order_amount.innerHTML = amountWithoutCoupon;
        order_total.innerHTML = amountWithoutCoupon + 50000
        console.log(amountWithCoupon);
        selectedProduct.push([cartProductName, cartProductPrice, cartProductQuantity])
        console.log(selectedProduct)


    } else {
        checkAllBtn.checked = false;

        const removedDiv = $("#" + summaryId);
        removedDiv.remove();
        amountWithoutCoupon -= cartProductTotalPrice;
        order_amount.innerHTML = amountWithoutCoupon;
        order_total.innerHTML = amountWithoutCoupon + 50000
        console.log(amountWithCoupon);

        for (let product of selectedProduct) {
            if (product[0] == cartProductName) {
                let indexToRemove = selectedProduct.indexOf(product);
                selectedProduct.splice(indexToRemove, 1)
                break;
            }
        }

        console.log(selectedProduct)
    }

}




//document.getElementById("coupon_input").addEventListener("keypress", function (event) {
//    if (event.keyCode === 13) { // 13 is the Enter key code
//        event.preventDefault(); // Prevent the default form submission behavior
//        document.getElementById("coupon_form").submit(); // Submit the form
//    }
//});


document.addEventListener('DOMContentLoaded', function () {
    window.addEventListener('scroll', stickToTop);

    var sticky = orderSummary.offsetTop;

    function stickToTop() {
        if (window.innerWidth > laptopScreen) {
            if (window.scrollY >= sticky) {
                console.log("window.pageYOffset >= sticky");
            } else {
                console.log("Not window.pageYOffset >= sticky");
            }
            if (window.scrollY >= sticky) {
                orderSummary.classList.add("sticky");
            } else {
                orderSummary.classList.remove("sticky");
            }
        }
    }
})

filter.addEventListener("click", () => {
    filterDropDownMenu.style.scale = "1";
})


dropDownMenu.addEventListener("click", () => {
    for (var item of dropdownNavBarItem) {
        item.style.display = "block"
    }
})





window.onclick = function (event) {
    if (successOrderForm.style.visibility !== "hidden" && !event.target.closest('.main_order_successfully')) {
        successOrderForm.style.visibility = "hidden"
    }
    if (modal.style.visibility !== "hidden" && !event.target.closest('.main_modal')) {
        modal.style.visibility = "hidden"
    }


    if (!event.target.matches('.drop_down_menu')) {
        for (var item of dropdownNavBarItem) {
            item.style.display = "none"
        }
    }

    if (!event.target.matches('.user_hover') && !event.target.matches('#filter')) {
        filterDropDownMenu.style.scale = "0";
    }


}




var total_money = $(".order_total_price").innerHTML
const save_btn = $("#save_btn")

const send_button = document.getElementById("buy_btn");


//function post(path, params, method) {
//
//    //Create form 
//    const hidden_form = document.createElement('form');
//
//    // Set method to post by default 
//    hidden_form.method = method || 'post';
//
//    // Set path 
//    hidden_form.action = path;
//
//    for (const key in params) {
//        if (params.hasOwnProperty(key)) {
//            const hidden_input = document.createElement('input');
//            hidden_input.type = 'hidden';
//            hidden_input.name = key;
//            hidden_input.value = params[key];
//
//            hidden_form.appendChild(hidden_input);
//        }
//    }
//
//    document.body.appendChild(hidden_form);
//    hidden_form.submit();
//}

function post(path, params) {
    return fetch(path, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json' // Adjust content type as needed
        },
        body: JSON.stringify(params)
    })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text(); // or response.json() if expecting JSON
            })
            .then(data => {
                // Handle the response as needed
                console.log(data);
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
}




save_btn.addEventListener('click', () => {
    debugger;
    modal.style.visibility = "hidden"
    $(".no_delivery_info").style.display = "none"
    $(".has_delivery_info").style.display = "block"
    deliveryInfoPhone.innerHTML = "Phone:" + $("#phone_input_box").value
    deliveryInfoAdress.innerHTML = "Address:" + $("#address_input_box").value + $("#district_input_box").options[$("#district_input_box").selectedIndex].textContent + "," + $("#city_input_box").options[$("#city_input_box").selectedIndex].textContent + "," + $("#province_input_box").options[$("#province_input_box").selectedIndex].textContent
    phone = $("#phone_input_box").value
    adrress = $("#address_input_box").value
    province = $("#province_input_box").options[$("#province_input_box").selectedIndex].textContent
    city = $("#city_input_box").options[$("#city_input_box").selectedIndex].textContent
    district = $("#district_input_box").options[$("#district_input_box").selectedIndex].textContent
    send_button.disabled = false;
    console.log(phone)
    console.log(adrress)
});



//
//send_button.addEventListener('click', () => {
//    post('http://localhost:8080/Jewelry/cart',
//            {
//                'action': 'buy',
//                'product_detail': selectedProduct,
//                'total_money': amountWithCoupon,
//                'phone': phone,
//                'adrress': adrress,
//                'province': province,
//                'city': city,
//                'district': district,
//                'coupon_value': parseFloat(coupon_discount_value.innerHTML),
//                'shipping_fee': parseFloat(shipping_value.innerHTML)});
//}); 

send_button.addEventListener('click', () => {
    post('http://localhost:8080/Jewelry_web/cart', {
        'action': 'buy',
        'product_detail': selectedProduct,
        'total_money': amountWithCoupon,
        'phone': phone,
        'adrress': adrress,
        'province': province,
        'city': city,
        'district': district,
        'coupon_value': parseFloat(coupon_discount_value.innerHTML),
        'shipping_fee': parseFloat(shipping_value.innerHTML)
    });
}
);