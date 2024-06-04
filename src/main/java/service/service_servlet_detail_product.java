package service;

import java.util.ArrayList;

import Database.interact_with_cart;
import Database.interact_with_product;
import entry.Product;

public class service_servlet_detail_product {
	//Get detail product when knowing ID
	public static Product getProductByID(int id){
		interact_with_product obj = new interact_with_product();
		return interact_with_product.getProductByID(id);
	}
	
	//Get related products
	public static ArrayList<Product> related_productsArrayList(int id){
		interact_with_product obj = new interact_with_product();
		return interact_with_product.get_related_products(id);
	}
	
	//Get size
	public static ArrayList<String> getSize(int id){
		interact_with_product obj = new interact_with_product();
		return interact_with_product.get_size(id);
	}
	
	//Get cartList
	public static ArrayList<ArrayList<String>> getCart(int id_user){
		interact_with_cart obj= new interact_with_cart();
		return interact_with_cart.get_detail_product_cart(id_user);
	}
	
	//check product in cart
	public static boolean check_product_in_cart(int id_product, int id_user, float size)
	{
		interact_with_product obj = new interact_with_product();
		return interact_with_product.check_product_in_cart(id_product, id_user, size);
	}
	
	//Insert cart
	public static void insert_cart(int id_user, int id_product, float size, int quantity ) {
		interact_with_cart  obj = new interact_with_cart();
		interact_with_cart.insert_cart(id_user, id_product, size, quantity);
	}
}
