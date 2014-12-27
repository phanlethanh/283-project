package com.onlinestore.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.CategoryDao;
import com.onlinestore.dao.FieldsProductDao;
import com.onlinestore.model.FieldsProduct;
import com.onlinestore.service.FieldsProductService;

@Service("fieldsProductService")
@Transactional
public class FieldsProductServiceImpl implements FieldsProductService{

	@Autowired
	private FieldsProductDao fieldsProductDao;
	@Override
	public void CreateFieldProduct(FieldsProduct field) {
		// TODO Auto-generated method stub
		fieldsProductDao.create(field);
	}
	@Override
	public int getLastInsertId() {
		// TODO Auto-generated method stub
		return fieldsProductDao.getLastInsertId();
	}
	@Override
	public FieldsProduct getField(Integer id) {
		// TODO Auto-generated method stub
		return fieldsProductDao.get(id);
	}
	@Override
	public void updateFieldsProduct(FieldsProduct fields) {
		// TODO Auto-generated method stub
		fieldsProductDao.update(fields);
	}
	

}
