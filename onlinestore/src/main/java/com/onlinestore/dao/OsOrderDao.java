package com.onlinestore.dao;

import java.util.List;

import com.onlinestore.model.OsOrder;

public interface OsOrderDao extends Dao<OsOrder>{
	List<OsOrder> getOrderListByUserId(Integer userId);
}
