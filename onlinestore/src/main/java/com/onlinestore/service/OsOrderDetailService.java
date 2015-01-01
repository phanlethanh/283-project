package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.OsOrderDetail;

public interface OsOrderDetailService {
	Integer createOsOrderDetail(OsOrderDetail osOrderDetail);
	
	List<OsOrderDetail> getOsOrderDetails();
	
	OsOrderDetail getOsOrderDetail(Integer id);
	
	void updateOsOrderDetail(OsOrderDetail osOrderDetail);
	
	void deleteOsOrderDetail(Integer id);
	
	List<OsOrderDetail> getOrderDetailListByOrderId(Integer orderId);
	
	void deleteByOrderId(Integer orderId);
}
