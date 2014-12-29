package com.onlinestore.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlinestore.dao.DatasFieldsProductDao;
import com.onlinestore.model.DatasFieldsProduct;
import com.onlinestore.service.DatasFieldsProductService;
@Service ("datasFieldsProductService")
@Transactional
public class DatasFieldsProductServiceImpl implements DatasFieldsProductService{
	@Autowired
	private DatasFieldsProductDao datasFields;
	@Override
	public DatasFieldsProduct getDatasFieldsProduct(Integer id) {
		// TODO Auto-generated method stub
		if(datasFields.get(id) != null)
			return datasFields.get(id);
		return null;
	}
	@Override
	public void createDatasFieldsProduct(DatasFieldsProduct datasField) {
		// TODO Auto-generated method stub
		datasFields.create(datasField);
	}
	@Override
	public void update(DatasFieldsProduct data) {
		// TODO Auto-generated method stub
		datasFields.update(data);
	}

}
