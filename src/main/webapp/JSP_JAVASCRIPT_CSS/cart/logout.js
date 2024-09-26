var logout = document.querySelector("#logout");
logout.addEventListener("click", () => 
	{
		submit_logout();
	}
)
function submit_logout() {
    var http = new XMLHttpRequest();
    http.open("POST", "http://localhost:8080/Jewelry_web/servlet_account_receive_request", true);
    http.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
    var params = "action=logout"; // probably use document.getElementById(...).value
    http.send(params);
    http.onload = function() {
    	var resp = JSON.parse(http.responseText);
        // Sử dụng dữ liệu từ mảng
       	if (resp == "logout_successfully"){
			   window.location = "http://localhost:8080/Jewelry_web/account";
		   }
			  		    
    }
}