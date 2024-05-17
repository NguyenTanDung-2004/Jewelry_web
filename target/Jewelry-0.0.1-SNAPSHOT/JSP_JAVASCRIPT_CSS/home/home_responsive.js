var bar = document.querySelector("#bar");
var header = document.querySelector("body header");
bar.addEventListener("click", () => 
    {
        header.style.left = "0px"
        blur.style.display = "block"
    }
)

var close = document.querySelector("#close");
close.addEventListener("click", () =>
    {
        header.style.left = "-200px"
        blur.style.display = "none"
    }
)
