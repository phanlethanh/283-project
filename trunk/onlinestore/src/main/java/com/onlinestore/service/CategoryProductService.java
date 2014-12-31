package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.CategoryProduct;
import com.onlinestore.model.Product;

public interface CategoryProductService {
	Integer createCategoryProduct(CategoryProduct categoryProduct);
	
	List<CategoryProduct> getCategoryProducts();
	
	CategoryProduct getCategoryProduct(Integer id);
	
	void updateCategoryProduct(CategoryProduct categoryProduct);
	
	void deleteCategoryProduct(Integer id);
	CategoryProduct getLastInsertId();
}
