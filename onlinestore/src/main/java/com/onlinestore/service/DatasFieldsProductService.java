package com.onlinestore.service;

import com.onlinestore.model.DatasFieldsProduct;

public interface DatasFieldsProductService {
	
	DatasFieldsProduct getDatasFieldsProduct(Integer id);
	void createDatasFieldsProduct(DatasFieldsProduct datasField);
	void update(DatasFieldsProduct data);
}
