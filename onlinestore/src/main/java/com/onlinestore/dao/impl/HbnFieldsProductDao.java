package com.onlinestore.dao.impl;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.FieldsProductDao;
import com.onlinestore.model.FieldsProduct;
@Repository
public class HbnFieldsProductDao extends AbstractHbnDao<FieldsProduct> implements FieldsProductDao{

	@Override
	public Integer getLastInsertId() {
		// TODO Auto-generated method stub
		String sql = "from FieldsProduct";
		Query query = getSession().createQuery(sql);   
		int id = ((FieldsProduct)query.list().get(query.list().size()-1)).getId();// this will convert it to a long value
		return id;
	}

}
