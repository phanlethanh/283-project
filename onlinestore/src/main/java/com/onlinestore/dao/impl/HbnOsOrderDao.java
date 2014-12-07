package com.onlinestore.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.OsOrderDao;
import com.onlinestore.model.OsOrder;

@Repository
public class HbnOsOrderDao extends AbstractHbnDao<OsOrder> implements
		OsOrderDao {
	@Override
	public List<OsOrder> getOrderListByUserId(Integer userId) {
		String sql = "from OsOrder where osUser.id = :uid";
		Query query = getSession().createQuery(sql);
		query.setParameter("uid", userId);
		return query.list();
	}
}
