
var spring_collections = document.querySelector("#spring_collections")
var summer_collections = document.querySelector("#summer_collections")
var autumn_collections = document.querySelector("#autumn_collections")
var winter_collections = document.querySelector("#winter_collections")
var love_collections = document.querySelector("#love_collections")
spring_collections.addEventListener("click", () => 
	{
		localStorage.setItem("selectedFilter", "spring");
		window.location = "http://localhost:8080/Jewelry_web/product";
	}
)
summer_collections.addEventListener("click", () => 
	{
		localStorage.setItem("selectedFilter", "summer");
		window.location = "http://localhost:8080/Jewelry_web/product";
	}
)
autumn_collections.addEventListener("click", () => 
	{
		localStorage.setItem("selectedFilter", "autumn");
		window.location = "http://localhost:8080/Jewelry_web/product";
	}
)
winter_collections.addEventListener("click", () => 
	{
		localStorage.setItem("selectedFilter", "winter");
		window.location = "http://localhost:8080/Jewelry_web/product";
	}
)
love_collections.addEventListener("click", () => 
	{
		localStorage.setItem("selectedFilter", "love");
		window.location = "http://localhost:8080/Jewelry_web/product";
	}
)