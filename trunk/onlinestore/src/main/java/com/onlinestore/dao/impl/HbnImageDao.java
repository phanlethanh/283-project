package com.onlinestore.dao.impl;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.ImageDao;
import com.onlinestore.model.FieldsProduct;
import com.onlinestore.model.Image;
@Repository
public class HbnImageDao  extends AbstractHbnDao<Image> implements ImageDao{

	@Override
	public Integer getLastInsertId() {
		// TODO Auto-generated method stub
		String sql = "from Image";
		Query query = getSession().createQuery(sql);   
		int id = ((Image)query.list().get(query.list().size()-1)).getId();// this will convert it to a long value
		return id;
	}
}
