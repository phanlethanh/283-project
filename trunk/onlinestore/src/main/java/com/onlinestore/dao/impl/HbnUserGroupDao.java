package com.onlinestore.dao.impl;

import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.UserGroupDao;
import com.onlinestore.model.UserGroup;

@Repository
public class HbnUserGroupDao extends AbstractHbnDao<UserGroup> implements
		UserGroupDao {

}
