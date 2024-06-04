function delete_order(orderId) {
  var http = new XMLHttpRequest();
  http.open("POST", "http://localhost:8080/Jewelry_web/servlet_account_receive_request", true);
  http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  var params = "id_order=" + orderId + "&action=delete_order";
  http.send(params);
  http.onload = function() {
    var resp = JSON.parse(http.responseText);
    if (resp == "delete_order_success") {
      showModalSuccess("Delete this order successfully !");
      
      // Cập nhật danh sách đơn hàng trực tiếp trên DOM
      var orderItems = document.querySelectorAll(`.order-item[data-order-id="${orderId}"]`);
      if (orderItems) {
        orderItems.forEach(function(orderItem) {
          orderItem.remove();
        });
      }
    } else {
      showModalFailed("Delete this order failed !");
    }
  };
}

const canceledBtns = document.querySelectorAll('.btn-canceled-order');
const sendReasonBtn = document.querySelector(".btn-send__reason");
const reasonOptions = document.querySelectorAll(".reason-option input[type='radio']");
let isReasonSelected = false;
let orderId = null; // Biến orderId để lưu giá trị id_order

function checkReasonSelected() {
  for (const option of reasonOptions) {
    if (option.checked) {
      isReasonSelected = true;
      break;
    }
  }
}

function handleSendReason() {
  checkReasonSelected();
  if (isReasonSelected) {
    hideModalSendReason();
    showModalSentReason();

    setTimeout(function() {
      hideModalSentReason();
    }, 2000);
    
    // Lấy giá trị orderId từ clickedOrderItem.dataset.orderId
    delete_order(orderId); // Gọi hàm delete_order với giá trị orderId
  } else {
    showModalFailed("Delete this order failed !");
  }
}

for (const canceledBtn of canceledBtns) {
  canceledBtn.addEventListener('click', function() {
    hideModalSentReason();
    showModalSendReason();

    // Lấy giá trị orderId từ clickedOrderItem.dataset.orderId
    orderId = this.closest('.order-item').dataset.orderId;
  });
}

sendReasonBtn.addEventListener('click', handleSendReason);