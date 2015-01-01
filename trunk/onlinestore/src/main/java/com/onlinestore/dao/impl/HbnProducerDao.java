package com.onlinestore.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.ProducerDao;
import com.onlinestore.model.Producer;

@Repository
public class HbnProducerDao extends AbstractHbnDao<Producer> implements ProducerDao{

	@Override
	public Producer findProducerWithName(String name) {
		// TODO Auto-generated method stub
		String sql ="from Producer where name=:name";
		Query query = getSession().createQuery(sql);
		query.setParameter("name", name);
		
		return (Producer) query.list().get(0);
	}

	

}
