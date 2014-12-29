package com.onlinestore.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.OsUserDao;
import com.onlinestore.model.OsUser;

@Repository
public class HbnOsUserDao extends AbstractHbnDao<OsUser> implements OsUserDao {

	public OsUser getOsUser(String userName) {
		return null;
	}

	@Override
	public boolean isAdminUser(Integer id) {
		String sql = "from OsUser where id=:uid and userGroup.id=1";
		Query query = getSession().createQuery(sql);
		query.setParameter("uid", id);
		if (query.list().size() > 0) {
			return true;
		}
		return false;
	}
}
