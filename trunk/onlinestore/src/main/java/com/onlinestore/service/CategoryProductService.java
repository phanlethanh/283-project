package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.CategoryProduct;

public interface CategoryProductService {
	void createCategoryProduct(CategoryProduct categoryProduct);
	
	List<CategoryProduct> getCategoryProducts();
	
	CategoryProduct getCategoryProduct(Integer id);
	
	void updateCategoryProduct(CategoryProduct categoryProduct);
	
	void deleteCategoryProduct(Integer id);
}
