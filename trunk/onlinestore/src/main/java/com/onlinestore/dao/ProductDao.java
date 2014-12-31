package com.onlinestore.dao;

import java.util.List;

import com.onlinestore.model.Product;

public interface ProductDao extends Dao<Product>{
	List<Product> getHomeProducts();
	
	List<Product> search(String keyword);
	Product getLastInsertId();
}
