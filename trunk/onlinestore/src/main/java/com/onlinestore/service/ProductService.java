package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Product;

public interface ProductService {
	Integer createProduct(Product product);
	
	List<Product> getProducts();
	
	Product getProduct(Integer id);
	
	void updateProduct(Product product);
	
	void deleteProduct(Integer id);
	
	List<Product> getHomeProducts();
	
	List<Product> search(String keyword);
	
	List<Product> searchByCategory(String keyword, Integer categoryId);
	
	Product getLastInsertId();
	
	List<Product> getNewProducts();
	
	List<Product> getHotProducts();
	
	List<Product> getWaitingProducts();
	
	List<Product> getPromotionProducts();
}
