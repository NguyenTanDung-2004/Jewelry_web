var send_to_email =  document.querySelector("body .modal .body .info p");
var sendMailBtn = document.querySelector(".js-send-mail");
var resendBtn = document.querySelector("body .modal .body .btn-resend");
var confirmBtn = document.querySelector("body .modal .body .info .btn-confirm");
var verificationCodeInput = document.querySelector("#verificationCode");
var new_pass = document.querySelector("#new-pass");
var re_new_pass = document.querySelector("#re-enter-pass");
var saveNewPassBtn = document.querySelector("#save-new-pass");

function submit_send_code_change_pass() {
	sendMailBtn.innerHTML = "SENDING...";
	resendBtn.innerHTML = "Sending...";
	var http = new XMLHttpRequest();
	http.open("POST", "http://localhost:8080/Jewelry_web/servlet_account_receive_request", true);
	http.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
	var params = "email=" + send_to_email.textContent + "&action=send_code_change_pass"; 
	http.send(params);
	http.onload = function() {
		sendMailBtn.innerHTML = "SEND";
		resendBtn.innerHTML = "Resend";
		var resp = JSON.parse(http.responseText);
		if (resp == "send_error"){
			showModalFailed("Send code failed !");
		} else {
			hideModalSend();
			showModalSent();
		}
	};
}

function check_input_null(input) {
	if (input.value == "") {
		return 0;
	} else {
		return 1;
	}
}

function check_code() {
	confirmBtn.innerHTML = "Confirming...";
	var http = new XMLHttpRequest();
	http.open("POST", "http://localhost:8080/Jewelry_web/servlet_account_receive_request", true);
	http.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
	
	if (check_input_null(verificationCodeInput) == 0) {
		confirmBtn.innerHTML = " CONFIRM";
		showModalFailed("Please enter the verification code");
	} else {
		var params = "code=" + verificationCodeInput.value + "&action=check_code"; 
		http.send(params);
		http.onload = function() {
			confirmBtn.innerHTML = " CONFIRM";
			var resp = JSON.parse(http.responseText);
			if (resp == "check_success"){
				hideModalSend();
				hideModalSent();
			} else {
				showModalFailed("The verification code you entered is incorrect. Please try again.");
			}
		};
	}
}

function event_for_resend_code() {
	resendBtn.addEventListener("click", () => {
		submit_send_code_change_pass();
	});
}

function validatePassword(password) {
	// Regular expression for validating the password
	const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
	
	// Test the password against the regex
	if (passwordRegex.test(password.value) == true){
		return 1;
	} else {
		return 0;
	}
}

function check_new_confirm(a, b) {
	if (a.value == b.value){
		return 1;
	} else {
		return 0;
	}
}

function submit_save_new_pass() {
	var http = new XMLHttpRequest();
	http.open("POST", "http://localhost:8080/Jewelry_web/servlet_account_receive_request", true);
	http.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
        
	var params = "email=" + send_to_email.textContent + "&password=" + new_pass.value + "&action=save_new_pass"; 
	http.send(params);
	http.onload = function() {
		var resp = JSON.parse(http.responseText);
		if (resp == "save_success"){
			showModalSuccess("New password saved successfully");   
		} else {
			showModalFailed("Failed to save new password");
		}		    
	};
}

function save_password() {
	var count = check_input_null(new_pass) +
				check_input_null(re_new_pass) + 
				validatePassword(new_pass) +
				validatePassword(re_new_pass) +
				check_new_confirm(new_pass, re_new_pass);
	if (count == 5) {
		submit_save_new_pass();
	} else {
		showModalFailed("Failed to save new password");
	}
}

var eyePassList = document.querySelectorAll("#pass_eye");

eyePassList.forEach(function(eyePass) {
  eyePass.addEventListener("click", function() {
    var input = this.previousElementSibling;
    var isPasswordType = input.type === "password";

    this.classList.toggle("fa-eye-slash");
    this.classList.toggle("fa-eye");

    input.type = isPasswordType ? "text" : "password";
  });
});
    
    
event_for_resend_code();
sendMailBtn.addEventListener('click', submit_send_code_change_pass);
confirmBtn.addEventListener('click', check_code);
saveNewPassBtn.addEventListener('click', save_password);