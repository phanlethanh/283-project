package com.onlinestore.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.StatusDao;
import com.onlinestore.model.Status;

@Repository
public class HbnStatusDao extends AbstractHbnDao<Status> implements StatusDao {

	@Override
	public List<Status> getProductStatuses() {
		String sql = "from Status where statusType='product'";
		Query query = getSession().createQuery(sql);
		return query.list();
	}
}
