package com.onlinestore.dao;

import java.util.List;

import com.onlinestore.model.OsOrderDetail;

public interface OsOrderDetailDao extends Dao<OsOrderDetail>{
	List<OsOrderDetail> getOrderDetailListByOrderId(Integer orderId);
}
