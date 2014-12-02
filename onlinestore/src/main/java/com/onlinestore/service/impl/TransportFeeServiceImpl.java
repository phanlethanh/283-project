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

	
	private TransportFeeDao tfDao;
	
	public void createTransportFee(TransportFee transportFee) {
		tfDao.create(transportFee);
	}

	public List<TransportFee> getTransportFees() {
		return tfDao.getAll();
	}

	public TransportFee getTransportFee(Long id) {
		return tfDao.get(id);
	}

	public void updateTransportFee(TransportFee transportFee) {
		tfDao.update(transportFee);
	}

	public void deleteTransportFee(Long id) {
		tfDao.deleteById(id);
	}

}
