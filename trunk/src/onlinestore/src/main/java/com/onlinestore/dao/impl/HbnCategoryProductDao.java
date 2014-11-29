package com.onlinestore.dao.impl;

import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.CategoryProductDao;
import com.onlinestore.model.CategoryProduct;

@Repository
public class HbnCategoryProductDao extends AbstractHbnDao<CategoryProduct>
		implements CategoryProductDao {

}
