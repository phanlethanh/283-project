package com.onlinestore.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.OsOrderDetailDao;
import com.onlinestore.model.OsOrderDetail;

@Repository
public class HbnOsOrderDetailDao extends AbstractHbnDao<OsOrderDetail>
		implements OsOrderDetailDao {
	@Override
	public List<OsOrderDetail> getOrderDetailListByOrderId(Integer orderId) {
		String sql = "from OsOrderDetail where osOrder.id = :oid";
		Query query = getSession().createQuery(sql);
		query.setParameter("oid", orderId);
		return query.list();
	}
}
