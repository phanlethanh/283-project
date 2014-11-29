package com.onlinestore.dao.impl;

import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.OsUserDao;
import com.onlinestore.model.OsUser;

@Repository
public class HbnOsUserDao extends AbstractHbnDao<OsUser> implements OsUserDao {

}
