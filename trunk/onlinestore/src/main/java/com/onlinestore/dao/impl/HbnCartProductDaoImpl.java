package com.onlinestore.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.CartProductDao;
import com.onlinestore.model.CartProduct;

@Repository
public class HbnCartProductDaoImpl extends AbstractHbnDao<CartProduct>
		implements CartProductDao {

	@Override
	public List<CartProduct> getCartProductsByCartId(Integer cartId) {
		String sql = "from CartProduct where cart.id=:cartId";
		Query query = getSession().createQuery(sql);
		query.setParameter("cartId", cartId);
		return query.list();
	}

}
