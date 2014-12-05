package com.onlinestore.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.ProductDao;
import com.onlinestore.model.Product;

@Repository
public class HbnProductDao extends AbstractHbnDao<Product> implements
		ProductDao {

	// select "new" and "hot" products
	@Override
	public List<Product> getHomeProducts() {
		String sql = "from Product where status.id = 1 or status.id = 2";
		Query query = getSession().createQuery(sql);
		return query.list();
	}
	

}
