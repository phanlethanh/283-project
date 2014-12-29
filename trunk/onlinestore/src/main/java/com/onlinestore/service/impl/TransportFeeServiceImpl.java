package com.onlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.TransportFeeDao;
import com.onlinestore.model.TransportFee;
import com.onlinestore.service.TransportFeeService;

@Service("transportFeeService")
@Transactional
public class TransportFeeServiceImpl implements TransportFeeService {

	@Autowired
	private TransportFeeDao tfDao;
	
	public Integer createTransportFee(TransportFee transportFee) {
		return (Integer) tfDao.create(transportFee);
	}

	public List<TransportFee> getTransportFees() {
		return tfDao.getAll();
	}

	public TransportFee getTransportFee(Integer id) {
		return tfDao.get(id);
	}

	public void updateTransportFee(TransportFee transportFee) {
		tfDao.update(transportFee);
	}

	public void deleteTransportFee(Integer id) {
		tfDao.deleteById(id);
	}

}
