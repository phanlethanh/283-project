package com.onlinestore.dao;

import java.util.List;

import com.onlinestore.model.CartProduct;

public interface CartProductDao extends Dao<CartProduct> {
	List<CartProduct> getCartProductsByCartId(Integer cartId);
}
