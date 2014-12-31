package com.onlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.CategoryProductDao;
import com.onlinestore.model.CategoryProduct;
import com.onlinestore.service.CategoryProductService;

@Service("categoryProductService")
@Transactional
public class CategoryProductServiceImpl implements CategoryProductService {

	@Autowired
	private CategoryProductDao cpDao;

	public Integer createCategoryProduct(CategoryProduct categoryProduct) {
		return (Integer) cpDao.create(categoryProduct);
	}

	public List<CategoryProduct> getCategoryProducts() {
		return cpDao.getAll();
	}

	public CategoryProduct getCategoryProduct(Integer id) {
		return cpDao.get(id);
	}

	public void updateCategoryProduct(CategoryProduct categoryProduct) {
		cpDao.update(categoryProduct);
	}

	public void deleteCategoryProduct(Integer id) {
		cpDao.deleteById(id);
	}

	@Override
	public CategoryProduct getLastInsertId() {
		// TODO Auto-generated method stub
		return cpDao.getLastInsertId();
	}

}
