package com.onlinestore.service;

import java.util.List;

import com.onlinestore.model.CartProduct;


public interface CartProductService {
	void createCartProduct(CartProduct cartProduct);

	List<CartProduct> getCategories();

	CartProduct getCartProduct(Integer id);

	void updateCartProduct(CartProduct cartProduct);

	void deleteCartProduct(Integer id);
}
