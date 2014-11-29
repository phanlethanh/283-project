package com.onlinestore.dao.impl;

import org.springframework.stereotype.Repository;

import com.onlinestore.dao.AbstractHbnDao;
import com.onlinestore.dao.OsOrderDetailDao;
import com.onlinestore.model.OsOrderDetail;

@Repository
public class HbnOsOrderDetailDao extends AbstractHbnDao<OsOrderDetail>
		implements OsOrderDetailDao {

}
