package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Product;

public interface ProductService {
	void createProduct(Product product);
	
	List<Product> getProducts();
	
	Product getProduct(Integer id);
	
	void updateProduct(Product product);
	
	void deleteProduct(Integer id);
}
