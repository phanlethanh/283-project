package com.onlinestore.service;

import com.onlinestore.model.DatasFieldsProduct;
import com.onlinestore.model.FieldsProduct;

public interface DatasFieldsProductService {
	
	DatasFieldsProduct getDatasFieldsProduct(Integer id);
	void createDatasFieldsProduct(DatasFieldsProduct datasField);
	void update(DatasFieldsProduct data);
}
