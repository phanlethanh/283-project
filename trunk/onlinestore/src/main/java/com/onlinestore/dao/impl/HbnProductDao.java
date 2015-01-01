package com.onlinestore.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.ProductDao;
import com.onlinestore.model.FieldsProduct;
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
	@Override
	public Product getLastInsertId() {
		// TODO Auto-generated method stub
		String sql = "from Product";
		Query query = getSession().createQuery(sql);   
		Product product = ((Product)query.list().get(query.list().size()-1));// this will convert it to a long value
		return product;
	}

	@Override
	public List<Product> searchByCategory(String keyword, Integer categoryId) {
		String sql = "select p from Product p, CategoryProduct cp " 
				+ " where lower(name) like lower(:keyword) and p.id = cp.product.id" 
				+ " and cp.category.id = :cid";
		Query query = getSession().createQuery(sql);
		query.setParameter("keyword", "%" + keyword + "%");
		query.setParameter("cid", categoryId);
		return query.list();
	}

}
