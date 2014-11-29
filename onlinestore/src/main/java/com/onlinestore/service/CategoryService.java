package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Category;

public interface CategoryService {
	void createCategory(Category category);

	List<Category> getCategories();

	Category getCategory(Long id);

	void updateCategory(Category category);

	void deleteCategory(Long id);
}
