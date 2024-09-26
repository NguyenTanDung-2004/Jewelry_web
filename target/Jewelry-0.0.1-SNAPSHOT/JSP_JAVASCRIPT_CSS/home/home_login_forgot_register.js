var close_box = document.querySelectorAll("#close_login");
// tắt Register;
    var blur = document.querySelector("body .blur");
    var forgot = document.querySelector("body .forgot")
    close_box[2].addEventListener("click", () =>
        {
            forgot.style.scale = "0";
            blur.style.display = "none";
        }
    )
// tắt Login
    var login = document.querySelector("body .login")
    close_box[0].addEventListener("click", () =>
        {
            login.style.top = "-500px";
            blur.style.display = "none";
        }
    )
// tắt register
    var register = document.querySelector("body .register")
    close_box[1].addEventListener("click", () =>
        {
            register.style.scale = "0";
            blur.style.display = "none";
        }
    )
// tắt toàn bộ các box.
    function turn_off_all_box(){
        forgot.style.scale = "0";
        register.style.scale = "0";
        login.style.top = "-500px";
    }
// button login hiển thị login box.
    var button_login1 = document.querySelector("#p_login_header");
    button_login1.addEventListener("click", () =>
        {
            login.style.top = "calc(50vh - 250px)"
            blur.style.display = "block";
        }
    )
// button hiển thị register.
    var display_register = document.querySelector("#p_display_register");
    display_register.addEventListener("click", () => 
        {
            turn_off_all_box();
            register.style.scale = "1";
            blur.style.display = "block";
        }
    )
// button quay lại login từ register.
    var back_to_login = document.querySelector("#back_to_login_from_register");
    back_to_login.addEventListener("click", () => 
        {
            turn_off_all_box();
            login.style.top = "calc(50vh - 250px)";
            blur.style.display = "block";
        }
    )
// button hiển thị forgot từ login.
    var display_forgot = document.querySelector("#p_display_forgot");
    display_forgot.addEventListener("click", () => 
        {
            turn_off_all_box();
            forgot.style.scale = "1";
        }
    )
// button back_to_login from forgot.
    var back_to_login_from_forgot = document.querySelector("#back_login_from_forgot");
    back_to_login_from_forgot.addEventListener("click", () =>
        {
            turn_off_all_box();
            login.style.top = "calc(50vh - 250px)"
        }
    )
// function error input
    function error_of_input(input){
        input.style.border = "1px solid red";
        input.addEventListener("focus", function()
            {
                input.style.border = "1px solid black";
            }
        );
    }
// lấy ra toàn bộ input của login
    var input_login = document.querySelectorAll("body .login .input input");
    for (i = 0; i < input_login.length; i++){
        error_of_input(input_login[i]);
    }
// lấy ra các eye.
    var eye_login = document.querySelectorAll("#login_eye");
// lấy ra các input.
    var input_eye = document.querySelectorAll(".input_eye");
// xử lí nhấn eye_login
    function change_eye_class(eye){
        
    }
    for (let i = 0; i < eye_login.length; i++) {
        eye_login[i].addEventListener("click", () => {
            eye_login[i].classList.toggle("fa-eye-slash");
            eye_login[i].classList.toggle("fa-eye");
            input_eye[i].type = input_eye[i].type === "password" ? "text" : "password";
        });
    }
    
    
// xử lí continue google 
//https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/Singer_Vote/login_google&response_type=code&client_id=340019636522-crdnrukiefhjooeipk8jfoht42k4ttji.apps.googleusercontent.com&approval_prompt=force
    var continue_google = document.querySelector("#continue_google");
    continue_google.addEventListener("click", () => 
    	{
			window.location="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/Jewelry_web/login_google&response_type=code&client_id=63763648763-n1d28887db4r2kn19bsauk9ut4nr2b9t.apps.googleusercontent.com&approval_prompt=force";
		}
    )
    