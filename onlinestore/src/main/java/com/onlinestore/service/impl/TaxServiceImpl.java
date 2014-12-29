package com.onlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.TaxDao;
import com.onlinestore.model.Tax;
import com.onlinestore.service.TaxService;

@Service("taxService")
@Transactional
public class TaxServiceImpl implements TaxService{

	@Autowired
	private TaxDao taxDao;
	
	public Integer createTax(Tax tax) {
		return (Integer) taxDao.create(tax);
	}

	public List<Tax> getTaxes() {
		return taxDao.getAll();
	}

	public Tax getTax(Integer id) {
		return taxDao.get(id);
	}

	public void updateTax(Tax tax) {
		taxDao.update(tax);
	}

	public void deleteTax(Integer id) {
		taxDao.deleteById(id);
	}

}
