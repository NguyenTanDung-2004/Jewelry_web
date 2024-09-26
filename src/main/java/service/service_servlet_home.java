package service;

import java.util.ArrayList;

import Database.get_data_in_home;
import Database.interact_with_product;

public class service_servlet_home {
	public static ArrayList<Integer> first_id_product(){
		get_data_in_home obj = new get_data_in_home();
		ArrayList<Integer> list = new ArrayList<Integer>();
		list.add(get_data_in_home.get_first_id_product_of_each_categories(3));
		list.add(get_data_in_home.get_first_id_product_of_each_categories(1));
		list.add(get_data_in_home.get_first_id_product_of_each_categories(4));
		return list;
	}
	public static ArrayList<Integer> new_arrivals(){
		interact_with_product obj = new interact_with_product();
		ArrayList<Integer> list = new ArrayList<Integer>();
		list.add(get_data_in_home.get_new_arrival_id_product_of_each_categories(1));
		list.add(get_data_in_home.get_new_arrival_id_product_of_each_categories(2));
		list.add(get_data_in_home.get_new_arrival_id_product_of_each_categories(3));
		list.add(get_data_in_home.get_new_arrival_id_product_of_each_categories(4));
		return list;
	}
	public static ArrayList<String> create_data_for_traditional(){
		get_data_in_home obj = new get_data_in_home();
		ArrayList<String> list = new ArrayList<String>();
		list = get_data_in_home.get_data_traditional();
		return list;
	}
	public static ArrayList<Float> prices(){
		interact_with_product obj = new interact_with_product();
		ArrayList<Float> list = new ArrayList<Float>();
		list.add(get_data_in_home.get_new_arrival_price_product_of_each_categories(1));
		list.add(get_data_in_home.get_new_arrival_price_product_of_each_categories(2));
		list.add(get_data_in_home.get_new_arrival_price_product_of_each_categories(3));
		list.add(get_data_in_home.get_new_arrival_price_product_of_each_categories(4));
		return list;
	}
}
