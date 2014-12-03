package com.onlinestore.dao;

import java.util.List;

import com.onlinestore.model.Category;

public interface CategoryDao extends Dao<Category> {
	
	List<Category> getSubCategory(Integer parent_id);
}
