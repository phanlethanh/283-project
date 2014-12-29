package com.onlinestore.service;

import com.onlinestore.model.FieldsProduct;

public interface FieldsProductService {
	
	Integer CreateFieldProduct(FieldsProduct field);
	int getLastInsertId();
	FieldsProduct getField(Integer id);
	void updateFieldsProduct(FieldsProduct fields);
}
