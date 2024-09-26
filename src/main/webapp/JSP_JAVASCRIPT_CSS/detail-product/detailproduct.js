
//Swiper related products
var swiper = new Swiper('.mySwiper', {
    slidesPerView: 3,
    spaceBetween: 15,
    slidesPerGroup: 3,
    watchSlidesProgress: true,
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
    navigation: {
        nextEl:'.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    breakpoints: {
        320: {
            slidesPerView: 2,
            slidesPerGroup: 2,
        },
        610: {
            slidesPerView: 2,
            spaceBetween: 15,
            slidesPerGroup: 2,
        },
        692: {
            slidesPerView: 3,
            spaceBetween: 25,
            slidesPerGroup: 3,
        },
        830: {
            slidesPerView: 3,
            spaceBetween: 15,
            slidesPerGroup: 3,
        },
        1073: {
            slidesPerView: 3,
            spaceBetween: 15,
            slidesPerGroup: 3,
        },
    }
});

//Content-product-left-center
var MainImg = document.getElementById('MainImg');
var tempImg = document.getElementById('MainImg');
var SmallImg = document.querySelectorAll('.hinh1');
var CenterImage = document.querySelector('.content-product-center');
var numberofCenterImg = CenterImage.querySelectorAll("*").length;
for(i = 0; i<numberofCenterImg; i++){
    SmallImg[i].addEventListener("click", function(event){
        MainImg.src =  this.src;
    })
};

//Quantity of product:
const increaseBtn = document.querySelector('.increase');
const decreaseBtn = document.querySelector('.decrease');
const quantities = document.querySelector('.numbers');

document.addEventListener("DOMContentLoaded", function() {
    increaseBtn.onclick = () => {
        let currentValue1 = parseInt(quantities.value);
        if (!isNaN(currentValue1)) {
            quantities.value = currentValue1 + 1;
        } else {
            quantities.value = 1;
        }
    };
    decreaseBtn.onclick = () => {
        let currentValue2 = parseInt(quantities.value);
        if (!isNaN(currentValue2) && currentValue2 > 1) {
            quantities.value = currentValue2 - 1;
        } else {
            quantities.value = 1;
        }
    };
});

//Menu-size
const downBtn = document.querySelector('.angledown');
const dropdown = document.querySelector('.drop-down');
const upBtn = document.querySelector('.angleup');

downBtn.addEventListener("click", function(event){
    dropdown.style.display= "block";
    downBtn.style.display="none";
    upBtn.style.display="block";
});
upBtn.addEventListener("click", function(event){
    dropdown.style.display= "none";
    downBtn.style.display="block";
    upBtn.style.display="none";
});

//Select - menu - size
const size = document.querySelectorAll('.value-size');
const inputSize = document.querySelector('.size-numbers');

size.forEach(size => {
    size.addEventListener("click", function(event){
        inputSize.value = size.textContent;
    })
});

//Button: Icon-cart1, icon-plus1
document.addEventListener('DOMContentLoaded', function () {
    var iconCart1 = document.getElementById('icon-cart1');
    var iconPlus1 = document.getElementById('icon-plus1');

    iconCart1.addEventListener('click', function () {
        window.location.href = '';
    });

    // Thêm sự kiện click cho icon-plus1
    iconPlus1.addEventListener('click', function () {
        window.location.href = '';
    });
});
document.addEventListener('DOMContentLoaded', function () {
    var iconCart1 = document.getElementById('icon-cart2');
    var iconPlus1 = document.getElementById('icon-plus2');

    iconCart1.addEventListener('click', function () {
        window.location.href = '';
    });

    // Thêm sự kiện click cho icon-plus1
    iconPlus1.addEventListener('click', function () {
        window.location.href = '';
    });
});
document.addEventListener('DOMContentLoaded', function () {
    var iconCart1 = document.getElementById('icon-cart3');
    var iconPlus1 = document.getElementById('icon-plus3');

    iconCart1.addEventListener('click', function () {
        window.location.href = '';
    });

    // Thêm sự kiện click cho icon-plus1
    iconPlus1.addEventListener('click', function () {
        window.location.href = '';
    });
});
document.addEventListener('DOMContentLoaded', function () {
    var iconCart1 = document.getElementById('icon-cart4');
    var iconPlus1 = document.getElementById('icon-plus4');

    iconCart1.addEventListener('click', function () {
        window.location.href = '';
    });

    // Thêm sự kiện click cho icon-plus1
    iconPlus1.addEventListener('click', function () {
        window.location.href = '';
    });
});
document.addEventListener('DOMContentLoaded', function () {
    var iconCart1 = document.getElementById('icon-cart5');
    var iconPlus1 = document.getElementById('icon-plus5');

    iconCart1.addEventListener('click', function () {
        window.location.href = '';
    });

    // Thêm sự kiện click cho icon-plus1
    iconPlus1.addEventListener('click', function () {
        window.location.href = '';
    });
});
document.addEventListener('DOMContentLoaded', function () {
    var iconCart1 = document.getElementById('icon-cart6');
    var iconPlus1 = document.getElementById('icon-plus6');

    iconCart1.addEventListener('click', function () {
        window.location.href = '';
    });

    // Thêm sự kiện click cho icon-plus1
    iconPlus1.addEventListener('click', function () {
        window.location.href = '';
    });
});

// xử lí result
var result = document.querySelector(".search .result")
var close_result = document.querySelector("#close_result");
close_result.addEventListener("click", () => 
    { 
        result.style.display = "none";
    }
);

// xử lí sự kiện vào trang collections
var collection_tab = document.querySelector("body .collections");
var collection_tab_button = document.querySelector("#collection_tab_button");
var frame_parent = document.querySelector(".frame-parent");
var clickCount = 0;
collection_tab_button.addEventListener("click", () => {
    clickCount++;
    if (clickCount % 2 != 0) {
        frame_parent.style.display = "none";
        collection_tab.style.display = "block";
    } else {
        frame_parent.style.display = "block";
        collection_tab.style.display = "none";
    }
});


//User
// xử lí hover vào avt
var user_img = document.querySelector("body header .header_child .user img")
    // lấy ra đối tượng user hover
var user_hover = document.querySelector("body header .header_child .user .user_hover");
user_img.addEventListener("mouseenter", () =>
    {
        user_hover.style.transformOrigin = "10px 30px";
        user_hover.style.scale = "1";
    }
)

user_img.addEventListener("click", () =>
    {
        user_hover.style.scale = "0";
    }
)
var logout = document.querySelector("#logout");
logout.addEventListener("click", () => 
	{
		submit_logout();
	}
)
function submit_logout() {
    var http = new XMLHttpRequest();
    http.open("POST", "http://localhost:8080/Jewelry_web/servlet_product_from_product", true);
    http.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
    var params = "action=logout"; // probably use document.getElementById(...).value
    http.send(params);
    http.onload = function() {
    	var resp = JSON.parse(http.responseText);
        // Sử dụng dữ liệu từ mảng
       	if (resp == "logout_successfully"){
			   window.location = "http://localhost:8080/Jewelry_web/product";
		   }
			  		    
    }
}
