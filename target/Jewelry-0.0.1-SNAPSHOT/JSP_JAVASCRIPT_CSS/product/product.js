// xử lí hover vào avt
var user_img = document.querySelector("body header .header_child .user img")
    // lấy ra đối tượng user hover
var user_hover = document.querySelector("body header .header_child .user .user_hover");
user_img.addEventListener("mouseenter", () =>
    {
        user_hover.style.transformOrigin = "10px 30px";
        user_hover.style.scale = "1";
    }
)
    // lấy ra đối tượng user hover content
user_img.addEventListener("click", () =>
    {
        user_hover.style.scale = "0";
    }
)
// xử lí result
var result = document.querySelector("body main .search .result")
var close_result = document.querySelector("#close_result");
close_result.addEventListener("click", () => 
    {
        result.style.display = "none";
    }
)
// xử lí sự kiện vào trang collections
var collection_tab = document.querySelector("body .collections");
var collection_tab_button = document.querySelector("#collection_tab_button");
var main_child = document.querySelector("body main .main_child");
collection_tab_button.addEventListener("click", () =>
    {
        main_child.style.display = "none"
        collection_tab.style.display = "block";
    }
)