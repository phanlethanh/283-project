package com.onlinestore.dao.impl;

import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.ProductDao;
import com.onlinestore.model.Product;

@Repository
public class HbnProductDao extends AbstractHbnDao<Product> implements
		ProductDao {

}
