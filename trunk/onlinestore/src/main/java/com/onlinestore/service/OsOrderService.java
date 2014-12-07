package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.OsOrder;

public interface OsOrderService {
	void createOsOrder(OsOrder osOrder);

	List<OsOrder> getOsOrders();

	OsOrder getOsOrder(Integer id);

	void updateOsOrder(OsOrder osOrder);

	void deleteOsOrder(Integer id);
	
	List<OsOrder> getOrderListByUserId(Integer userId);
}
