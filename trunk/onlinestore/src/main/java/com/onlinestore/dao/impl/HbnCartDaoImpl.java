package com.onlinestore.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.CartDao;
import com.onlinestore.model.Cart;
import com.onlinestore.model.CartProduct;

@Repository
public class HbnCartDaoImpl extends AbstractHbnDao<Cart> implements CartDao {

	@Override
	public List<CartProduct> getProductList(Integer userId) {
		String sql = "select cp from CartProduct cp, Cart c, OsUser u "
				+ " where u.cart.id = c.id and cp.cart.id = u.cart.id and u.id = :uid";
		Query query = getSession().createQuery(sql);
		query.setParameter("uid", userId);
		return query.list();
	}

	@Override
	public Integer getProductCount(Integer userId) {
		String sql = "select count(cp) from CartProduct cp, Cart c, OsUser u "
				+ " where u.cart.id = c.id and cp.cart.id = u.cart.id and u.id = :uid";
		Query query = getSession().createQuery(sql);
		query.setParameter("uid", userId);
		return Integer.valueOf(query.list().get(0).toString());
	}

}
