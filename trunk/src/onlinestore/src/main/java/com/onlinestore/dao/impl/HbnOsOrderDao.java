package com.onlinestore.dao.impl;

import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.OsOrderDao;
import com.onlinestore.model.OsOrder;

@Repository
public class HbnOsOrderDao extends AbstractHbnDao<OsOrder> implements
		OsOrderDao {

}
