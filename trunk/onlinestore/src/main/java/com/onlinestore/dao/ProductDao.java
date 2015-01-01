package com.onlinestore.dao;

import java.util.List;

import com.onlinestore.model.Product;

public interface ProductDao extends Dao<Product>{
	List<Product> getHomeProducts();
	
	List<Product> search(String keyword);
	
	Product getLastInsertId();
	
	List<Product> searchByCategory(String keyword, Integer categoryId);
	
	List<Product> getNewProducts();
	
	List<Product> getHotProducts();
	
	List<Product> getWaitingProducts();
	
	List<Product> getPromotionProducts();
}
