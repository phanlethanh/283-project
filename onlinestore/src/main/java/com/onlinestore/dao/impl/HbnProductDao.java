package com.onlinestore.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.ProductDao;
import com.onlinestore.model.FieldsProduct;
import com.onlinestore.model.Product;
import com.onlinestore.util.Variable;

@Repository
public class HbnProductDao extends AbstractHbnDao<Product> implements
		ProductDao {

	// select "new" and "hot" products
	@Override
	public List<Product> getHomeProducts() {
		String sql = "from Product where status.id = "
				+ Variable.ID_NEW_PRODUCT_STATUS + " or status.id = "
				+ Variable.ID_HOT_PRODUCT_STATUS;
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
		// this will convert it to a long value
		Product product = ((Product) query.list().get(query.list().size() - 1));
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

	@Override
	public List<Product> getNewProducts() {
		String sql = "from Product where status.id = "
				+ Variable.ID_NEW_PRODUCT_STATUS;
		Query query = getSession().createQuery(sql);
		return query.list();
	}

	@Override
	public List<Product> getHotProducts() {
		String sql = "from Product where status.id = "
				+ Variable.ID_HOT_PRODUCT_STATUS;
		Query query = getSession().createQuery(sql);
		return query.list();
	}

	@Override
	public List<Product> getWaitingProducts() {
		String sql = "from Product where status.id = "
				+ Variable.ID_WAITING_PRODUCT_STATUS;
		Query query = getSession().createQuery(sql);
		return query.list();
	}

	@Override
	public List<Product> getPromotionProducts() {
		String sql = "from Product where promotion.id is not null";
		Query query = getSession().createQuery(sql);
		return query.list();
	}

}
