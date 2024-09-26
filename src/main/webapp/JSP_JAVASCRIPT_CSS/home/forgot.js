/**
 * 
 */

 var forgot_email = document.querySelector("#forgot_email");
 var forgot_new = document.querySelector("#forgot_new");
 var forgot_confirm = document.querySelector("#forgot_confirm");
 var forgot_code = document.querySelector("#forgot_code");
 var button_send_code_in_forgot = document.querySelector("#button_send_code_in_forgot");
 var button_reset_password = document.querySelector("#reset_password");
 
 // function for send code
 function event_for_send_code_in_forgot(){
	 button_send_code_in_forgot.addEventListener("click", () => 
	 	{
			button_send_code_in_forgot.innerHTML = "sending..."
			var count = check_input_null(forgot_email) + validateEmail(forgot_email);
			if (count == 2){
				submit_send_code_in_forgot();
			}
			else{
				button_send_code_in_forgot.innerHTML = "Send Code";
			}
		}
	 )
 }
// function send request to server for send code
	function submit_send_code_in_forgot() {
        var http = new XMLHttpRequest();
        http.open("POST", "http://localhost:8080/Jewelry_web/servlet_home_receive_request", true);
        http.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
        var params = "email=" + forgot_email.value + "&action=send_code_in_forgot"; // probably use document.getElementById(...).value
        http.send(params);
        http.onload = function() {
			button_send_code_in_forgot.innerHTML = "Send Code"
        	var resp = JSON.parse(http.responseText);
            // Sử dụng dữ liệu từ mảng
           	if (resp == "send_error"){
				   set_error_for_input(forgot_email);
			   }	  		    
        }
    }
    
// function check new and confirm 
	function check_new_confirm(new_pass, confirm_pass){
		if (new_pass.value == confirm_pass.value){
			return 1;
		}
		else{
			set_error_for_input(new_pass);
			set_error_for_input(confirm_pass);
			return 0;
		}
	}
// function for reset password
	function reset_password(){
		button_reset_password.addEventListener("click", () => 
			{
				button_reset_password.innerHTML = "Processing...";
				var count = check_input_null(forgot_code) + 
					check_input_null(forgot_confirm) + 
					check_input_null(forgot_new) + 
					check_input_null(forgot_email) + 
					validateEmail(forgot_email) + 
					validatePassword(forgot_new) + 
					validatePassword(forgot_confirm) + 
					check_new_confirm(forgot_new, forgot_confirm);
				if (count == 8){
					submit_resetpassword();
				}
				else{
					button_reset_password.innerHTML = "Reset Password";
				}
			}
		)
	}
// function send request to server for reset password
	function submit_resetpassword() {
        var http = new XMLHttpRequest();
        http.open("POST", "http://localhost:8080/Jewelry_web/servlet_home_receive_request", true);
        http.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
        var params = "email=" + forgot_email.value + "&password=" + forgot_confirm.value + "&code=" + forgot_code.value + "&action=reset_password"; // probably use document.getElementById(...).value
        http.send(params);
        http.onload = function() {
			button_reset_password.innerHTML = "Reset Password"
        	var resp = JSON.parse(http.responseText);
           	if (resp == "code_wrong"){
				set_error_for_input(forgot_code);	   
			}
			else{
				turn_on_sucess("Congratulations, you have successfully reseted your password")
			}
			
				  		    
        }
    }
    
   reset_password();
   event_for_send_code_in_forgot();