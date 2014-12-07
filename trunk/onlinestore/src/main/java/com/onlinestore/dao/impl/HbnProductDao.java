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

	@Override
	public List<Product> search(String keyword) {
		String sql = "from Product where lower(name) like lower(:keyword)";
		Query query = getSession().createQuery(sql);
		query.setParameter("keyword", "%" + keyword + "%");
		return query.list();
	}
	

}
