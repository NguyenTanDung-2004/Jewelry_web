// Tháo tác điều hướng bên trái
const categoryItems = document.querySelectorAll(".category-item");
const subItems = document.querySelectorAll(".sub-item");
const accountItem = document.querySelector(".js-item-account");
const subList = document.querySelector(".sub-list");
const orderHistoryItem = document.querySelector(".js-item-order");
const gridOrder = document.querySelector(".grid-order");
const gridMain= document.querySelector(".main .grid__column-3-4 .grid-main");

const profileGrid = document.querySelector(".profile");
const addressGrid = document.querySelector(".address");
const changePassGrid = document.querySelector(".change-pass");
const gridMains = document.querySelectorAll(".js-grid-main");

for (const categoryItem of categoryItems) {
  categoryItem.addEventListener("click", function () {
    for (const item of categoryItems) {
      item.classList.remove("active");
    }
    this.classList.add("active");
    if (categoryItem.classList.contains("js-item-account")) {
      gridMain.classList.remove("display-none");
      gridMain.classList.add("display-block");
    }
    if (!categoryItem.classList.contains("js-item-account") && subList.classList.contains("open")) {
      gridMain.classList.add("display-none");

      for (const subItem of subItems) {
        subItem.classList.remove("active");
      }
    }
    if (!categoryItem.classList.contains("js-item-order")) {
      gridOrder.classList.remove("display-block");
    }

  });
}

orderHistoryItem.addEventListener("click", function() {
  gridOrder.classList.add("display-block");
})

accountItem.addEventListener("click", function () {
  subList.classList.toggle("open");
});


for (const subItem of subItems) {
  subItem.addEventListener("click", function () {
    gridMain.classList.remove("display-none");
    gridMain.classList.add("display-block");
    for (const item of subItems) {
      item.classList.remove("active");
    }
    for (const categoryItem of categoryItems) {
      categoryItem.classList.remove("active");
    }
    this.classList.add("active");
    accountItem.classList.add("active");

    for (const grid of gridMains) {
      grid.classList.remove("display-block");
    }

    if (gridOrder.classList.contains("display-block")) {
      gridOrder.classList.remove("display-block");
    }
    if (subItem.classList.contains("js-item-profile")) {
      profileGrid.classList.add("display-block");
    }
    if (subItem.classList.contains("js-item-address")) {
      addressGrid.classList.add("display-block");
    }
    if (subItem.classList.contains("js-item-change--pass")) {
      changePassGrid.classList.add("display-block");
    }
  });
}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// js for input info

const nameInput = document.getElementById("name");
const emailInput = document.getElementById("email");
const phoneInput = document.getElementById("phone");
const updateName = document.querySelector("#name + button");
const updateEmail = document.querySelector("#email + button");
const updatePhone = document.querySelector("#phone + button");

nameInput.readOnly = true;
emailInput.readOnly = true;
phoneInput.readOnly = true;

updateName.addEventListener("click", function () {
  nameInput.readOnly = false;
});
updateEmail.addEventListener("click", function () {
  emailInput.readOnly = false;
});
updatePhone.addEventListener("click", function () {
  phoneInput.readOnly = false;
});


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//  CALENDAR - DATE OF BIRTH
const monthNames = ["January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"];

const yearSelect = document.querySelector('.year-select');
const monthSelect = document.querySelector('.month-select');
const daySelect = document.querySelector('.day-select');

const date = new Date();
const currentYear = date.getFullYear(); // Lấy năm hiện tại

// Hàm tạo tùy chọn tháng
function createOptionMonth() {
  for (let i = 0; i < monthNames.length; i++) {
    const option = document.createElement('option');
    option.value = i + 1;
    option.textContent = monthNames[i];
    monthSelect.appendChild(option);
  }
}

// Hàm tạo tùy chọn năm
function createOptionYear() {
  for (let y = currentYear; y >= 1970; y--) {
    const option = document.createElement('option');
    option.value = option.textContent = y;
    yearSelect.appendChild(option);
  }
}

// Hàm tạo tùy chọn ngày
function createOptionDay(year, month) {
  daySelect.innerHTML = '';
  const daysInMonth = new Date(year, month, 0).getDate();

  for (let day = 1; day <= daysInMonth; day++) {
    const option = document.createElement('option');
    option.value = option.textContent = day;
    daySelect.appendChild(option);
  }

}

// Thêm tùy chọn cho năm và tháng
createOptionMonth();
createOptionYear();

// Bắt sự kiện thay đổi của năm và tháng => thuy đổi tùy chọn cho ngày
monthSelect.addEventListener('change', function () {
  const selectedMonth = monthSelect.value;
  const selectedYear = yearSelect.value;
  createOptionDay(selectedYear, selectedMonth);
})
yearSelect.addEventListener('change', function() {
  const selectedMonth = monthSelect.value;
  const selectedYear = yearSelect.value;
  createOptionDay(selectedYear, selectedMonth);
})

// Dặt giá trị mặc định cho ngày sinh

monthSelect.value = y; 
yearSelect.value = z;
createOptionDay(z,y);
daySelect.value = x;

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Upload avatar
const avatarUpload = document.querySelector('#avatar-upload');
const avatarImg = document.querySelector('.avatar-img img');
const avatarImg1 = document.querySelector('.category .account .avatar img');
const avatarImg2 = document.querySelector('header .user img');

avatarUpload.addEventListener('change', function() {
  if (this.files && this.files[0]) {
    const reader = new FileReader();
    reader.onload = function() {
      avatarImg.src = reader.result;
      avatarImg1.src = reader.result;
      avatarImg2.src = reader.result;
    }
    reader.readAsDataURL(this.files[0])
  }
})

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// UPDATE - VERTIFICATION CODE

const updateBtns = document.querySelectorAll(".js-update");

const closeBtns = document.querySelectorAll('.btn-close');
const itemChangePass = document.querySelector('.js-item-change--pass');

function showModalSuccess(text) {
  var modal = document.querySelector(".js-modal-success");
  var p = modal.querySelector("p");
  p.innerHTML = text;
  modal.classList.add('openFlex')
}
function hideModalSuccess() {
  if (document.querySelector(".js-modal-success").classList.contains("openFlex")) 
    document.querySelector(".js-modal-success").classList.remove('openFlex')
}
function showModalFailed(text) {
  var modal = document.querySelector(".js-modal-failed");
  var p = modal.querySelector("p");
  p.innerHTML = text;
  modal.classList.add('openFlex');
}
function hideModalFailed() {
  if (document.querySelector(".js-modal-failed").classList.contains("openFlex")) 
    document.querySelector(".js-modal-failed").classList.remove('openFlex')
}
function showModalSendReason() {
  document.querySelector(".js-modal-reason-canceled").classList.add('openFlex')
}
function hideModalSendReason() {
  if (document.querySelector(".js-modal-reason-canceled").classList.contains("openFlex")) 
    document.querySelector(".js-modal-reason-canceled").classList.remove('openFlex')
}
function showModalSentReason() {
  document.querySelector(".js-modal-sent-reason-canceled").classList.add('openFlex')
}
function hideModalSentReason() {
  if (document.querySelector(".js-modal-sent-reason-canceled").classList.contains("openFlex")) 
    document.querySelector(".js-modal-sent-reason-canceled").classList.remove('openFlex')
}
function showModalSend() {
  document.querySelector(".js-modal-send").classList.add('openFlex')
}
function showModalSent() {
  document.querySelector(".js-modal-sent").classList.add('openFlex')
}
function hideModalSend() {
  if (document.querySelector(".js-modal-send").classList.contains("openFlex")) 
    document.querySelector(".js-modal-send").classList.remove('openFlex')
}
function hideModalSent() {
  if (document.querySelector(".js-modal-sent").classList.contains("openFlex")) 
   document.querySelector(".js-modal-sent").classList.remove('openFlex')
}

/* 
for (const updateBtn of updateBtns) {
  updateBtn.addEventListener('click', function () {
    hideModalSent()
    showModalSend()
  })
}
*/

itemChangePass.addEventListener('click', function () {
  hideModalSent()
  showModalSend()
})



for(const closeBtn of closeBtns) {
  closeBtn.addEventListener("click", function() {
    hideModalSendReason();
    hideModalSentReason();
    hideModalSuccess();
    hideModalFailed();
  })
}


// order historyv click category
const categoryOrderItem = document.querySelectorAll(".category-order .item");
const orderItems = document.querySelector(".grid-order .order-main .order-item")
const gridAllOrders = document.querySelector(".grid-order .order-main.js-all-orders")
const gridOrderConfirm = document.querySelector(".grid-order .order-main.js-order-confirming")
const gridOrderShipping = document.querySelector(".grid-order .order-main.js-order-shipping")
const gridOrderSuccess = document.querySelector(".grid-order .order-main.js-order-delivered")
const gridOrderCanceled = document.querySelector(".grid-order .order-main.js-order-canceled")


for (const item of categoryOrderItem) {
  item.addEventListener("click", function () {

    const selectedClass = this.classList[1];
    
    for (const item of categoryOrderItem) {
      item.classList.remove("category-order-active");
    }
    this.classList.add("category-order-active");

    switch (selectedClass) {
      case 'js-item-all':
        gridAllOrders.classList.add('openFlex');
        gridOrderConfirm.classList.remove('openFlex');
        gridOrderShipping.classList.remove('openFlex');
        gridOrderSuccess.classList.remove('openFlex');
        gridOrderCanceled.classList.remove('openFlex');
        break;
      case 'js-item-confirming':
        gridAllOrders.classList.remove('openFlex');
        gridOrderConfirm.classList.add('openFlex');
        gridOrderShipping.classList.remove('openFlex');
        gridOrderSuccess.classList.remove('openFlex');
        gridOrderCanceled.classList.remove('openFlex');
        break;
      case 'js-item-shipping':
        gridAllOrders.classList.remove('openFlex');
        gridOrderConfirm.classList.remove('openFlex');
        gridOrderShipping.classList.add('openFlex');
        gridOrderSuccess.classList.remove('openFlex');
        gridOrderCanceled.classList.remove('openFlex');
        break;
      case 'js-item-delivered':
        gridAllOrders.classList.remove('openFlex');
        gridOrderConfirm.classList.remove('openFlex');
        gridOrderShipping.classList.remove('openFlex');
        gridOrderSuccess.classList.add('openFlex');
        gridOrderCanceled.classList.remove('openFlex');
        break;
      case 'js-item-canceled':
        gridAllOrders.classList.remove('openFlex');
        gridOrderConfirm.classList.remove('openFlex');
        gridOrderShipping.classList.remove('openFlex');
        gridOrderSuccess.classList.remove('openFlex');
        gridOrderCanceled.classList.add('openFlex');
        break;
    }

  });
}


//view product
const orderDetailItems = document.querySelectorAll(".order-main .order-item");
const viewProductBtns = document.querySelectorAll(".order-main .order-item .btn-view-product");
const gridOrderDetail = document.querySelector(".grid-detail-order");
const backBtn = document.querySelector(".btn-back");
const productLists = document.querySelectorAll(".grid-detail-order .product-list");
const gridDetailProduct = document.querySelector('.grid-detail-order .order-detail-product .js-line-1');

backBtn.addEventListener("click", function() {
  gridOrder.classList.remove("display-none");
  gridOrder.classList.add("display-block");
  gridOrderDetail.classList.remove("openFlex");
})
viewProductBtns.forEach((button) => {
  button.addEventListener("click", (event) => {
    event.preventDefault();
    gridOrder.classList.remove("display-block");
    gridOrder.classList.add("display-none");
    const clickedOrderItem = event.target.closest('.order-item');
    const clickedProductList = clickedOrderItem.querySelector(".product-list");
    const currentProductList = document.querySelector(".grid-detail-order .product-list");

    if (currentProductList) {
      currentProductList.remove(); 
    }
    const clonedProductList = clickedProductList.cloneNode(true);
    gridDetailProduct.appendChild(clonedProductList);
	
	
	const orderId = clickedOrderItem.dataset.orderId;
    const totalMoney = clickedOrderItem.dataset.totalMoney;
    const detailAddress = clickedOrderItem.dataset.detailAddress;
    const province = clickedOrderItem.dataset.province;
    const district = clickedOrderItem.dataset.district;
    const sub = clickedOrderItem.dataset.sub;
    const phone = clickedOrderItem.dataset.phone;
    const date = clickedOrderItem.dataset.date;
    const ship = clickedOrderItem.dataset.ship;
    const subtotal = clickedOrderItem.dataset.subtotal;
    const discount = clickedOrderItem.dataset.discount;
	

	document.querySelector(".grid-detail-order .header .header-info .order-id").textContent = "#" + orderId;
	document.querySelector(".grid-detail-order .header .header-info .time-order").textContent = date;
	document.querySelector(".js-subtotal-money").textContent = subtotal;
	document.querySelector(".js-shipping-money").textContent = ship;
	document.querySelector(".js-total-money").textContent = totalMoney;
	
	document.querySelector(".grid-detail-order .order-customer .name span").textContent 
	= document.querySelector("body .main .category .account .text .name").textContent;
	
	document.querySelector(".grid-detail-order .order-customer .phone span").textContent = phone;
	document.querySelector(".grid-detail-order .order-customer .customer-address span").textContent = detailAddress + ", " + sub + ", " + district + ", " + province;
	

	
	const confirmOrderItem = document.querySelector(".grid-detail-order .order-comfirmed");
	const shippingOrderItem = document.querySelector(".grid-detail-order .order-shipped");
	const deliveredOrderItem = document.querySelector(".grid-detail-order .order-delivered");
	
	if (clickedOrderItem.classList.contains("js-order-confirm")) {
	  confirmOrderItem.querySelector("img").classList.remove("border-gray");
	  confirmOrderItem.querySelector("img").classList.add("border-green");
	  shippingOrderItem.querySelector("img").classList.remove("border-green");
	  shippingOrderItem.querySelector("img").classList.add("border-gray");
	  deliveredOrderItem.querySelector("img").classList.remove("border-green");
	  deliveredOrderItem.querySelector("img").classList.add("border-gray");
	} 
	
	if (clickedOrderItem.classList.contains("js-order-ship")) {
	  confirmOrderItem.querySelector("img").classList.remove("border-gray");
	  confirmOrderItem.querySelector("img").classList.add("border-green");
	  shippingOrderItem.querySelector("img").classList.remove("border-gray");
	  shippingOrderItem.querySelector("img").classList.add("border-green");
	  deliveredOrderItem.querySelector("img").classList.remove("border-green");
	  deliveredOrderItem.querySelector("img").classList.add("border-gray");
	}
	
	if (clickedOrderItem.classList.contains("js-order-success")) {
	  confirmOrderItem.querySelector("img").classList.remove("border-gray");
	  confirmOrderItem.querySelector("img").classList.add("border-green");
	  shippingOrderItem.querySelector("img").classList.remove("border-gray");
	  shippingOrderItem.querySelector("img").classList.add("border-green");
	  deliveredOrderItem.querySelector("img").classList.remove("border-gray");
	  deliveredOrderItem.querySelector("img").classList.add("border-green");
	}


    if (clickedOrderItem.classList.contains("js-order-canceled")) {
      gridOrderDetail.classList.add("order-processing_canceled")
    }
    else {
      gridOrderDetail.classList.remove("order-processing_canceled")
    }
    gridOrderDetail.classList.add("openFlex");
  });
});


// status order item
orderDetailItems.forEach((orderItem) => {

  const statusConfirm = orderItem.querySelector('.status-confirm');
  const statusShipping = orderItem.querySelector('.status-shipping');
  const statusSuccess = orderItem.querySelector('.status-success');
  const statusCanceled = orderItem.querySelector('.status-canceled');

  if (!orderItem.classList.contains('js-order-confirm')) {
    const btnCancel = orderItem.querySelector('.btn-canceled-order');
    btnCancel.classList.remove('display-block');
    btnCancel.classList.add('display-none');
  }

  if (orderItem.classList.contains('js-order-confirm')) {
    statusConfirm.classList.add('openFlex');
    statusShipping.classList.remove('openFlex');
    statusSuccess.classList.remove('openFlex');
    statusCanceled.classList.remove('openFlex');
  } else if (orderItem.classList.contains('js-order-ship')) {
    statusConfirm.classList.remove('openFlex');
    statusShipping.classList.add('openFlex');
    statusSuccess.classList.remove('openFlex');
    statusCanceled.classList.remove('openFlex');
  } else if (orderItem.classList.contains('js-order-success')) {
    statusConfirm.classList.remove('openFlex');
    statusShipping.classList.remove('openFlex');
    statusSuccess.classList.add('openFlex');
    statusCanceled.classList.remove('openFlex');
  } else if (orderItem.classList.contains('js-order-canceled')) {
    statusConfirm.classList.remove('openFlex');
    statusShipping.classList.remove('openFlex');
    statusSuccess.classList.remove('openFlex');
    statusCanceled.classList.add('openFlex');
  }

});

