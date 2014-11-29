package com.onlinestore.dao.impl;

import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.CategoryDao;
import com.onlinestore.model.Category;

@Repository
public class HbnCategoryDao extends AbstractHbnDao<Category> implements
		CategoryDao {

}
