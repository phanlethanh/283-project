package com.onlinestore.dao;

import java.util.List;

import com.onlinestore.model.Category;
import com.onlinestore.model.Product;

public interface CategoryDao extends Dao<Category> {
	
	List<Category> getSubCategory(Integer parent_id);
	boolean findCategoryWithName(String name);
	List<Product> getProductOfCategory(Integer idCategory);
	
}
