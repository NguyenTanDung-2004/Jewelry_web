package service;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.interact_with_collections;
import Database.interact_with_product;

public class service_servlet_product {
	public static ArrayList<ArrayList<Object>> get_all_product_orderby_random() {
		interact_with_product obj = new interact_with_product();
		return interact_with_product.get_all_product_orderby_random();
	}
	public static ArrayList<Integer> get_first_id(){
		interact_with_collections obj = new interact_with_collections();
		return interact_with_collections.get_first_id();
	}
	public static ArrayList<Integer> product_spring(){
		interact_with_collections obj = new interact_with_collections();
		return interact_with_collections.get_all_spring();
	}
	public static ArrayList<Integer> product_summner(){
		interact_with_collections obj = new interact_with_collections();
		return interact_with_collections.get_all_summer();
	}
	public static ArrayList<Integer> product_autumn(){
		interact_with_collections obj = new interact_with_collections();
		return interact_with_collections.get_all_autumn();
	}
	public static ArrayList<Integer> product_winter(){
		interact_with_collections obj = new interact_with_collections();
		return interact_with_collections.get_all_winter();
	}
	public static ArrayList<Integer> product_love(){
		interact_with_collections obj = new interact_with_collections();
		return interact_with_collections.get_all_love();
	}
	public static ArrayList<Integer> product_rings(){
		interact_with_product obj = new interact_with_product();
		return interact_with_product.get_all_rings();
	}
	public static ArrayList<Integer> product_bracelets(){
		interact_with_product obj = new interact_with_product();
		return interact_with_product.get_all_bracelets();
	}
	public static ArrayList<Integer> product_necklaces(){
		interact_with_product obj = new interact_with_product();
		return interact_with_product.get_all_necklaces();
	}
	public static ArrayList<Integer> product_earrings(){
		interact_with_product obj = new interact_with_product();
		return interact_with_product.get_all_earrings();
	}
}
