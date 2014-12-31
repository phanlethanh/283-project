package com.onlinestore.dao.impl;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.GalleryDao;
import com.onlinestore.model.FieldsProduct;
import com.onlinestore.model.Gallery;
@Repository
@Transactional
public class HbnGalleryDao extends AbstractHbnDao<Gallery> implements GalleryDao{
	
	@Override
	public Gallery getLastInsertId() {
		// TODO Auto-generated method stub
		String sql = "from Gallery";
		Query query = getSession().createQuery(sql);   
		Gallery gallery = ((Gallery)query.list().get(query.list().size()-1));// this will convert it to a long value
		return gallery;
	}
}
