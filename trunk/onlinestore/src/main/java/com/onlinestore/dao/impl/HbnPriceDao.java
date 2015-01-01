package com.onlinestore.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.PriceDao;
import com.onlinestore.model.FieldsProduct;
import com.onlinestore.model.Price;

@Repository
public class HbnPriceDao extends AbstractHbnDao<Price> implements PriceDao{

	@Override
	public Price getLastPriceInsert() {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String sql = "from Price";
		Query query = getSession().createQuery(sql);   
		Price price = ((Price)query.list().get(query.list().size()-1));// this will convert it to a long value
		return price;
	}

	
	
}
