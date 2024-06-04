var saveAddressBtn = document.getElementById("save-address");

var address = document.getElementById("address").value;
var cityName = document.getElementById("city").options[document.getElementById("city").selectedIndex].text;
var districtName = document.getElementById("district").options[document.getElementById("district").selectedIndex].text;
var wardName = document.getElementById("ward").options[document.getElementById("ward").selectedIndex].text;

setInterval(checkAddressChanges, 10);

function checkInput() {
  if (
    document.getElementById("address").value !== "" &&
    document.getElementById("city").options[document.getElementById("city").selectedIndex].text !== "Select City" &&
    document.getElementById("district").options[document.getElementById("district").selectedIndex].text !== "Select District" &&
    document.getElementById("ward").options[document.getElementById("ward").selectedIndex].text !== "Select Ward"
  )
    return 1;
  else
    return 0;
}

function checkAddressChanges() {
  var currentAddress = document.getElementById("address").value;
  var currentCity = document.getElementById("city").options[document.getElementById("city").selectedIndex].text;
  var currentDistrict = document.getElementById("district").options[document.getElementById("district").selectedIndex].text;
  var currentWard = document.getElementById("ward").options[document.getElementById("ward").selectedIndex].text;

  if (checkInput() == 0) {
	saveAddressBtn.classList.remove("active");
    return;
  }
  if (
    currentAddress !== address ||
    currentCity !== cityName ||
    currentDistrict !== districtName ||
    currentWard !== wardName
  ) {
    saveAddressBtn.classList.add("active");
  } else {
    saveAddressBtn.classList.remove("active");
  }
}

saveAddressBtn.addEventListener("click", function () {
  if (saveAddressBtn.classList.contains("active")) saveAddress();
});

function saveAddress() {
  address = document.getElementById("address").value;
  cityName = document.getElementById("city").options[document.getElementById("city").selectedIndex].text;
  districtName = document.getElementById("district").options[document.getElementById("district").selectedIndex].text;
  wardName = document.getElementById("ward").options[document.getElementById("ward").selectedIndex].text;

  var http = new XMLHttpRequest();
  http.open("POST", "http://localhost:8080/Jewelry_web/servlet_account_receive_request", true);
  http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  var params = "address=" + address + "&city=" + cityName + "&district=" + districtName + "&ward=" + wardName + "&action=update_address";
  http.send(params);
  http.onload = function () {
    var resp = JSON.parse(http.responseText);

    if (resp == "update_address_successfully") {
      showModalSuccess("Address update successfully !");
    } else {
      showModalFailed("Address update failed !");
    }
  };

  saveAddressBtn.classList.remove("active"); // Xóa lớp "active" sau khi lưu thành công
}