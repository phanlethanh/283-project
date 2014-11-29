package com.onlinestore.dao.impl;

import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.PriceDao;
import com.onlinestore.model.Price;

@Repository
public class HbnPriceDao extends AbstractHbnDao<Price> implements PriceDao{
	
}
