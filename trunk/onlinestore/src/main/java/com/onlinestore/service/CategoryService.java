package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.Category;
import com.onlinestore.model.Product;

public interface CategoryService {
	void createCategory(Category category);

	List<Category> getCategories();
	List<Category> getSubCategory(Integer parent_id);
	List<Product> getProductOfCategory(Integer idCategory,Integer pageNumber);
	Category getCategory(Integer id);
	void updateCategory(Category category);

	void deleteCategory(Integer id);
	boolean findCategoryWithName(String name);
	Integer getTotalRow(Integer idCategory);
}
