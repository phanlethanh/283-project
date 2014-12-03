package com.onlinestore.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.CategoryDao;
import com.onlinestore.model.Category;

@Repository
public class HbnCategoryDao extends AbstractHbnDao<Category> implements
		CategoryDao {

	

	@Override
	public List<Category> getSubCategory(Integer parent) {
		// TODO Auto-generated method stub
		return getAll();
	}
	
	
}
