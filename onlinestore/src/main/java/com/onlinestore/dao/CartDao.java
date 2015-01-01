package com.onlinestore.dao;

import java.util.List;

import com.onlinestore.model.Cart;
import com.onlinestore.model.CartProduct;

public interface CartDao extends Dao<Cart> {
	List<CartProduct> getProductList(Integer userId);
	
	Integer getProductCount(Integer userId);
	
	Double getProductPriceSum(Integer userId);
}
