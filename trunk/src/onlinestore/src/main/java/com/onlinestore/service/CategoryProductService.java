package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.CategoryProduct;

public interface CategoryProductService {
	void createCategoryProduct(CategoryProduct categoryProduct);
	
	List<CategoryProduct> getCategoryProducts();
	
	CategoryProduct getCategoryProduct(Long id);
	
	void updateCategoryProduct(CategoryProduct categoryProduct);
	
	void deleteCategoryProduct(Long id);
}
