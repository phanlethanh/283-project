package com.onlinestore.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.CategoryProductDao;
import com.onlinestore.model.CategoryProduct;
import com.onlinestore.model.Product;

@Repository
public class HbnCategoryProductDao extends AbstractHbnDao<CategoryProduct>
		implements CategoryProductDao {	
	
	@Override
	public CategoryProduct getLastInsertId() {
		// TODO Auto-generated method stub
		String sql = "from CategoryProduct";
		Query query = getSession().createQuery(sql);   
		CategoryProduct categoryProduct = ((CategoryProduct)query.list().get(query.list().size()-1));// this will convert it to a long value
		return categoryProduct;
	}
}
