/**
 * 
 */
function submitForm() {
    var http = new XMLHttpRequest();
    http.open("POST", "http://localhost:8080/communicate_between_js_and_jsp/html_css_javascript/receive_request.jsp", true);
    http.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
    var params = "input=" + input_value + "&input1=" + "12345"; // probably use document.getElementById(...).value
    http.send(params);
    //http.send(param1);
    http.onload = function() {
    	var arrayList = JSON.parse(http.responseText);

        // Sử dụng dữ liệu từ mảng
        for (var i = 0; i < arrayList.length; i++) {
            console.log(arrayList[i]);
        }
    }
}

// function check email using express regular
	function validateEmail(email) {
	    // Regular expression for validating an Email
	    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	
	    if (emailRegex.test(email.value) == true){
			return 1;
		}
		set_error_for_input(email);
		return 0;
	}

// function set error for input
	function set_error_for_input(input){
		input.style.border = "1px solid red";
        input.addEventListener("focus", function()
            {
                input.style.border = "1px solid black";
            }
        );
	}
function validatePassword(password) {
    // Regular expression for validating the password
    // At least one letter, one digit, and minimum 8 characters long (allows special characters)
    const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d).{8,}$/;

    // Test the password against the regex
    if (passwordRegex.test(password.value)) {
        return 1;
    } else {
        set_error_for_input(password);
        return 0;
    }
}
// function turn on success 
	function turn_on_sucess(text){
		var success = document.querySelector(".success");
		success.style.scale = '1';
		var p = success.querySelector("p");
		p.innerHTML = text;
        blur.style.display = "block";
	}
// turn of success
	var turn_of_success = document.querySelector(".success i");
	turn_of_success.addEventListener("click", () => 
		{
			var success = document.querySelector(".success");
		success.style.scale = '0';
		}
	)
// function to check input null.
function check_input_null(input){
		if (input.value == ""){
			input.style.border = "1px solid red";
	        input.addEventListener("focus", function()
	            {
	                input.style.border = "1px solid black";
	            }
	        );
	        return 0;
		}
		else{
			return 1;
		}
	}

