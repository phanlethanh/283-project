package com.onlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.OsOrderDetailDao;
import com.onlinestore.model.OsOrderDetail;
import com.onlinestore.service.OsOrderDetailService;

@Service("osOrderDetailService")
@Transactional
public class OsOrderDetailServiceImpl implements OsOrderDetailService {

	
	private OsOrderDetailDao orderDetailDao;
	
	public void createOsOrderDetail(OsOrderDetail osOrderDetail) {
		orderDetailDao.create(osOrderDetail);		
	}

	public List<OsOrderDetail> getOsOrderDetails() {
		return orderDetailDao.getAll();
	}

	public OsOrderDetail getOsOrderDetail(Long id) {
		return orderDetailDao.get(id);
	}

	public void updateOsOrderDetail(OsOrderDetail osOrderDetail) {
		orderDetailDao.update(osOrderDetail);
	}

	public void deleteOsOrderDetail(Long id) {
		orderDetailDao.deleteById(id);		
	}

}
