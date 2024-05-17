/**
 * 
 */
	var input_email_login = document.querySelector("#login_email");
	var input_pass_login = document.querySelector("#login_pass");
	var button_login = document.querySelector("#button_login_in_login");
  	function event_for_button_dangnhap(){
		button_login.addEventListener("click", () => 
			{
				button_login.innerHTML = "Processing...";
				var count = check_input_null(input_email_login)	+ check_input_null(input_pass_login) +
					validateEmail(input_email_login) + validatePassword(input_pass_login);
				if (count == 4){
					submit_login();
				}  
				else{
					button_login.innerHTML = "Login";
				}
			}
		)
	}
	function submit_login() {
        var http = new XMLHttpRequest();
        http.open("POST", "http://localhost:8080/Jewelry_web/servlet_home_receive_request", true);
        http.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
        var params = "email=" + input_email_login.value + "&password=" + input_pass_login.value + "&action=login"; // probably use document.getElementById(...).value
        http.send(params);
        http.onload = function() {
			button_login.innerHTML = "Login"
        	var resp = JSON.parse(http.responseText);
        	console.log(resp);
            // Sử dụng dữ liệu từ mảng
           	if (resp == "email_not_exist"){
				   set_error_for_input(input_email_login);
			   }
			if (resp == "password_wrong"){
				set_error_for_input(input_pass_login);
			}
			if (resp == "login_successfull"){
				
				window.location = "http://localhost:8080/Jewelry_web/product";
			}
				   
		    
        }
    }
	
	event_for_button_dangnhap();