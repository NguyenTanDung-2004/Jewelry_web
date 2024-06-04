var saveAccountBtn = document.getElementById("save-account");

var name1 = document.getElementById("name").value;
var email = document.getElementById("email").value;
var phone = document.getElementById("phone").value;
var sex = document.querySelector('input[name="gender"]:checked').value;
var day = document.querySelector('.day-select').value;
var month = document.querySelector('.month-select').value;
var year = document.querySelector('.year-select').value;
var image = document.querySelector('.avatar-img img').src;

setInterval(checkFieldChanges, 10);

function checkFieldChanges() {
  var currentName = document.getElementById("name").value;
  var currentEmail = document.getElementById("email").value;
  var currentPhone = document.getElementById("phone").value;
  var currentSex = document.querySelector('input[name="gender"]:checked').value;
  var currentDay = document.querySelector('.day-select').value;
  var currentMonth = document.querySelector('.month-select').value;
  var currentYear = document.querySelector('.year-select').value;
  var currentAvatarImg = document.querySelector('.avatar-img img').src;

  if (
    currentName !== name1 ||
    currentEmail !== email ||
    currentPhone !== phone ||
    currentSex !== sex ||
    currentDay !== day ||
    currentMonth !== month ||
    currentYear !== year ||
    currentAvatarImg !== image
  ) {
    saveAccountBtn.classList.add("active");
  } else {
    saveAccountBtn.classList.remove("active");
  }
  
}

saveAccountBtn.addEventListener("click", function() {
	if (saveAccountBtn.classList.contains("active")) 
		saveProfile()
});

function saveProfile() {
  name1 = document.getElementById("name").value;
  email = document.getElementById("email").value;
  phone = document.getElementById("phone").value;
  sex = document.querySelector('input[name="gender"]:checked').value;
  day = document.querySelector('.day-select').value;
  month = document.querySelector('.month-select').value;
  year = document.querySelector('.year-select').value;
  image = document.querySelector('.avatar-img img').src;

  var dob = year + "-" + month + "-" + day;

  var http = new XMLHttpRequest();
  http.open("POST", "http://localhost:8080/Jewelry_web/servlet_account_receive_request", true);
  http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  var params = "name=" + name1 + "&email=" + email + "&phone=" + phone + "&sex=" + sex + "&dob=" + dob + "&img=" + encodeURIComponent(image) + "&action=update_profile";

  http.send(params);
  http.onload = function() {
    var resp = JSON.parse(http.responseText);

    if (resp === "update_profile_successfully") {
      showModalSuccess("Profile updated successfully");
      document.querySelector(".main .category .account .text .name").textContent = name1;
    } else {
      showModalFailed("Profile update failed");
    }
  };
}

