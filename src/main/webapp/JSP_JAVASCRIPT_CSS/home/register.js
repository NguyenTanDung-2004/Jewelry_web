/**
 * 
 */
// get all input in register
	var input_email = document.querySelector("#register_email")
	var input_password = document.querySelector("#register_password")
	var input_code = document.querySelector("#register_code")
	var button_send_code = document.querySelector("#register_sendcode")
	var button_register = document.querySelector("#register_register");
	
// event for button register
	function event_for_button_register(){
		button_register.addEventListener("click", () => 
			{
				button_register.innerHTML = "Processing..."
				var count = 0;
				count = check_input_null(input_email) + 
					validateEmail(input_email) +
					check_input_null(input_password) +
					check_input_null(input_code) + 
					validatePassword(input_password)
				if (count == 5){
					submit_register();
				}
				else{
					button_register.innerHTML = "Register"
				}
			}
		)
	}
	
// event for button send code
	function event_for_button_send_code(){
		button_send_code.addEventListener("click", () => {
			button_send_code.innerHTML = "sending..."
			var count = 0;
			count = check_input_null(input_email) + validateEmail(input_email);
			if (count == 2){
				submit_send_code();
			}
			else{
				button_send_code.innerHTML = "Send Code"
			}
		})
	}
	
// function send request to server for send code
	function submit_send_code() {
        var http = new XMLHttpRequest();
        http.open("POST", "http://localhost:8080/Jewelry_web/servlet_home_receive_request", true);
        http.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
        var params = "email=" + input_email.value + "&action=send_code_in_register"; // probably use document.getElementById(...).value
        http.send(params);
        http.onload = function() {
			button_send_code.innerHTML = "Send Code"
        	var resp = JSON.parse(http.responseText);
            // Sử dụng dữ liệu từ mảng
           	if (resp == "send_successfully"){
				   
			   }
			   else{
				   set_error_for_input(input_email);
			   }
				   
		    
        }
    }
// function submit register
	function submit_register(){
		var http = new XMLHttpRequest();
        http.open("POST", "http://localhost:8080/Jewelry_web/servlet_home_receive_request", true);
        http.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
        var params = "email=" + input_email.value + "&password=" + input_password.value + "&code=" + input_code.value + "&action=register"; // probably use document.getElementById(...).value
        http.send(params);
        http.onload = function() {
			button_register.innerHTML = "Register";
        	var resp = JSON.parse(http.responseText);
        	console.log(resp);
            // Sử dụng dữ liệu từ mảng
           	if (resp == "email_exist"){
				set_error_for_input(input_email);
			}
			if (resp == "code_wrong"){
				set_error_for_input(input_code);
			}
			if (resp == "register_successfull"){
				turn_on_sucess("Congratulations, you have successfully registered an account!")
			}	 
        }
	}


	
	event_for_button_send_code();
	event_for_button_register();
	