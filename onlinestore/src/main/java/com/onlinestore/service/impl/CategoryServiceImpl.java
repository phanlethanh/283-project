package com.onlinestore.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.CategoryDao;
import com.onlinestore.model.Category;
import com.onlinestore.model.Product;
import com.onlinestore.service.CategoryService;

@Service("categoryService")
@Transactional
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao categoryDao;

	public void createCategory(Category category) {
		categoryDao.create(category);		
	}

	public List<Category> getCategories() {
		return categoryDao.getAll();
	}

	public Category getCategory(Integer id) {
		return categoryDao.get(id);
	}

	public void updateCategory(Category category) {
		categoryDao.update(category);
	}

	public void deleteCategory(Integer id) {
		categoryDao.deleteById(id);		
	}

	@Override
	public List<Category> getSubCategory(Integer parent_id) {
		// TODO Auto-generated method stub
		
		return categoryDao.getSubCategory(parent_id);
	}

	@Override
	public boolean findCategoryWithName(String name) {
		// TODO Auto-generated method stub
		return categoryDao.findCategoryWithName(name);
	}
	@Override
	public List<Product> getProductOfCategory(Integer idCategory, Integer pageNumber) {
		// TODO Auto-generated method stub
		return categoryDao.getProductOfCategory(idCategory, pageNumber);
	}

	@Override
	public Integer getTotalRow(Integer idCategory) {
		// TODO Auto-generated method stub
		return categoryDao.getTotalRow(idCategory);
	}

}
