package com.onlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.CategoryDao;
import com.onlinestore.model.Category;
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

	public Category getCategory(Long id) {
		return categoryDao.get(id);
	}

	public void updateCategory(Category category) {
		categoryDao.update(category);
	}

	public void deleteCategory(Long id) {
		categoryDao.deleteById(id);		
	}
	
}
