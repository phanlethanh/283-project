package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Category;

public interface CategoryService {
	void createCategory(Category category);

	List<Category> getCategories();
	List<Category> getSubCategory(Integer parent_id);
	Category getCategory(Integer id);
	void updateCategory(Category category);

	void deleteCategory(Integer id);
}
