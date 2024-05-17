/**
 * 
 */
var spring_collections = document.querySelector("#spring_collections")
var summer_collections = document.querySelector("#summer_collections")
var autumn_collections = document.querySelector("#autumn_collections")
var winter_collections = document.querySelector("#winter_collections")
var love_collections = document.querySelector("#love_collections")
spring_collections.addEventListener("click", () => 
	{
		render_products_for_1_tab("spring")
		uncheck_checkbox()
	}
)
summer_collections.addEventListener("click", () => 
	{
		render_products_for_1_tab("summer")
		uncheck_checkbox()
	}
)
autumn_collections.addEventListener("click", () => 
	{
		render_products_for_1_tab("autumn")
		uncheck_checkbox()
	}
)
winter_collections.addEventListener("click", () => 
	{
		render_products_for_1_tab("winter")
		uncheck_checkbox()
	}
)
love_collections.addEventListener("click", () => 
	{
		render_products_for_1_tab("love")
		uncheck_checkbox()
	}
)