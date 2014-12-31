package com.onlinestore.dao;

import com.onlinestore.model.CategoryProduct;
import com.onlinestore.model.Product;

public interface CategoryProductDao extends Dao<CategoryProduct> {
	CategoryProduct getLastInsertId();
}
