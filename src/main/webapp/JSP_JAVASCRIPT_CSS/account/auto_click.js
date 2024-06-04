  window.onload = function() {
    var urlParams = new URLSearchParams(window.location.search);
    var autoOrderHistory = urlParams.get('orderHistory');

    if (autoOrderHistory === 'true') {
      var tab_order = document.querySelector(".js-item-order");
      if (tab_order) {
        tab_order.click();
      }
    }
  };