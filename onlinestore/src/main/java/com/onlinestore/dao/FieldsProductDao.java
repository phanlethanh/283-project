package com.onlinestore.dao;

import com.onlinestore.model.FieldsProduct;

public interface FieldsProductDao extends Dao<FieldsProduct> {
	Integer getLastInsertId();
}
